Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CJWRM-0006pw-8U
	for linux-mtd@lists.infradead.org; Mon, 18 Oct 2004 08:16:41 -0400
Message-ID: <4173B404.6040100@yandex.ru>
Date: Mon, 18 Oct 2004 16:16:04 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <417156E1.9000009@yandex.ru> <4173AFAE.6060303@inf.u-szeged.hu>
In-Reply-To: <4173AFAE.6060303@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 bugfix
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Ferenc,

Ferenc Havasi wrote:
> Hi Artem,
> 
> I tried reproduce your bug:
> 
>  > I've found bug in JFFS2. When there is no free space left on JFFS2
>  > file system, and somebody for example tries to creade new directory,
>  > JFFS2 frees memory twice.
>  >
>  > See dir.c, jffs2_create(), line 216.
>  >
>  > jffs2_do_create returns error.
>  > jffs2_clear_inode(inode) is called and frees the jffs2_sb_info,
>  > jffs2_full_dnode, etc.
>  > iput(inode) is called, calling in turn the jffs2_clear_inode, and the
>  > same structures are freed for the second time. This leads to the slab
>  > cache corruption.
> 
> I was not successful. I write JFFS2 to full (there was no left space),
> than I tried to mkdir, but there was no slab cache corruption.
Did you see system message "No space left on device"?

How did you see that slab is OK? I've found this when I've enabled the 
correspondent option in "Linux Hacking" (no sure, possibly 
CONFIG_DEBUG_SLAB).

> 
>  > --- dir.c       2004-10-16 21:02:22.886276648 +0400
>  > +++ dir_corrected.c     2004-10-16 21:03:10.843766654 +0400
>  > @@ -217,7 +217,6 @@
>  >                               dentry->d_name.name, dentry->d_name.len);
>  >
>  >         if (ret) {
>  > -               jffs2_clear_inode(inode);
>  >                 make_bad_inode(inode);
>  >                 iput(inode);
>  >                 jffs2_free_raw_inode(ri);
> 
> If I know well now jffs2_clear_inode only try to free only the fragtree,
> its dirents... but the inode is still present, and need to handle.
Yes, it does. But after this the iput() function is called. The iput() 
calls jffs2_clear_inode too. And the same data structures (fragtrees 
with full_dnodes, direntries) are freed one more time. This is not good :-)
> 
> Maybe I am wrong. I am not very familiar with this part of JFFS2.
> Are you sure that this is really a bug?
Hmm. Yes, I think so... May be small one :-)

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
