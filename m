Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctT24-0004Iw-P3
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 05:54:06 +0000
Received: by mail-wr0-x243.google.com with SMTP id u18so8816772wrc.0
 for <linux-mtd@lists.infradead.org>; Wed, 29 Mar 2017 22:53:41 -0700 (PDT)
Date: Thu, 30 Mar 2017 07:53:37 +0200
From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Amir Goldstein <amir73il@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 linux-unionfs@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, regressions@leemhuis.info, Artem Bityutskiy
 <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, David
 Oberhollenzer <goliath@sigma-star.at>
Subject: Re: [REGRESSION 4.11] Commit d8514d8edb5b ("ovl: copy up regular
 file using O_TMPFILE") breaks ubifs
Message-ID: <20170330075337.2ab52f3d@gmail.com>
In-Reply-To: <33155efb-2c42-a7e9-b867-06760b1e1495@nod.at>
References: <20170328100107.25095af6@gmail.com>
 <CAOQ4uxisw5vWYsdMTNemw=MqNyS2nxfAUkg+UfoGmbE3-he1Ug@mail.gmail.com>
 <20170328124545.3c4b87ff@gmail.com>
 <CAOQ4uxgNfuLN93owdCUJ=9VcU4DKGVEKkEGT7siiem8quVwCsQ@mail.gmail.com>
 <20170328132818.05871b73@gmail.com>
 <CAOQ4uxiC=RXPwSy7NGt+Ri=Eie4-_WsUPk7Sy-sh9RdrGQuesw@mail.gmail.com>
 <20170328141621.6bb2d639@gmail.com>
 <CAOQ4uxg0xRchsNOh1jtbyEdyDDqV3ToCvo=+QuCsD6duGJU_ZQ@mail.gmail.com>
 <20170329232648.0b5bc1e9@gmail.com>
 <33155efb-2c42-a7e9-b867-06760b1e1495@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Thu, 30 Mar 2017 00:15:31 +0200
Richard Weinberger <richard@nod.at> wrote:

> Ralph,
> 
> Am 29.03.2017 um 23:26 schrieb Ralph Sennhauser:
> >> # create and link a tmpfile - then remove it
> >> sudo rm -rf foo; sudo xfs_io -T -c "flink foo" . ; ls -l foo; sudo
> >> rm foo  
> > 
> > next-20170328, obviously without your patch:
> > 
> >   # xfs_io -T -c "flink foo" .
> >   .: Not supported  
> 
> -T tells xfs_io to create a tmpfile but you have it disabled in UBIFS.

Bash history says I booted the other partition than I flashed (uname
just happened to match), the downside of the dual boot layout. :)

  # rm -rf foo
  # xfs_io -T -c "flink foo" .
  # ls -l foo
  -rw-------    1 root     root             0 Mar 30 02:00 foo
  # rm foo
  [  305.001436] UBIFS error (ubi0:0 pid 2493): ubifs_add_orphan: orphaned twice

However, unlike with the overlay setup the filesystem can be mounted
just fine without imediatly visible side effects.

> 
> Anyway, can you please test the attached patch?
> Amir was right, UBIFS misses a corner case in ubifs_link(). ;-\
> 
> I think I understand also why we never noticed this in xfstests,
> UBIFS prints only a non-fatal error while umounting the filesystem in
> this case. But will test tomorrow in more detail, need some sleep now.
> 
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index 30825d882aa9..95e348a2da29 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -748,6 +748,9 @@ static int ubifs_link(struct dentry *old_dentry,
> struct inode *dir, goto out_fname;
> 
>  	lock_2_inodes(dir, inode);
> +	if (inode->i_nlink == 0)
> +		ubifs_delete_orphan(c, inode->i_ino);
> +
>  	inc_nlink(inode);
>  	ihold(inode);
>  	inode->i_ctime = ubifs_current_time(inode);
> 
> Thanks,
> //richard

With this patch I'm no longer able to reproduce _this_ issue, however,
rename no longer works either:

  # mv /etc/config/wireless /etc/config/wireless.back
  mv: can't rename '/etc/config/wireless': Invalid argument
  # ls /etc/config/wireless
  /etc/config/wireless
  # rm /etc/config/wireless
  # ls /etc/config/wireless
  ls: /etc/config/wireless: No such file or directory


Thanks
Ralph
