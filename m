Received: from cantor.suse.de ([195.135.220.2] helo=mx1.suse.de)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9fZC-00045c-Nc
	for linux-mtd@lists.infradead.org; Wed, 05 May 2010 14:27:15 +0000
Date: Wed, 5 May 2010 16:27:07 +0200
From: Jan Kara <jack@suse.cz>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v3] mtd: Do not corrupt backing device of device node inode
Message-ID: <20100505142707.GA3938@quack.suse.cz>
References: <1273047688-20947-1-git-send-email-kirill@shutemov.name>
	<1273069039.3702.188.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1273069039.3702.188.camel@localhost>
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	Alexander Shishkin <virtuoso@slind.org>, linux-mtd@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed 05-05-10 17:17:19, Artem Bityutskiy wrote:
> On Wed, 2010-05-05 at 11:21 +0300, Kirill A. Shutemov wrote:
> > We cannot modify file->f_mapping->backing_dev_info, because it will corrupt
> > backing device of device node inode, since file->f_mapping is equal to
> > inode->i_mapping (see __dentry_open() in fs/open.c).
> > 
> > Let's introduce separate inode for MTD device with appropriate backing
> > device.
> > 
> > Signed-off-by: Kirill A. Shutemov <kirill@shutemov.name>
> > Acked-by: Jan Kara <jack@suse.cz>
> 
> I get the following build error:
> 
> [dedekind@eru l2-mtd-2.6]$ make -j8
> O=/home/dedekind/tmp/l2-mtd-2.6-x86_64/
>   GEN     /home/dedekind/tmp/l2-mtd-2.6-x86_64/Makefile
>   CHK     include/linux/version.h
>   CHK     include/generated/utsrelease.h
>   Using /home/dedekind/git/l2-mtd-2.6 as source for kernel
>   CALL    /home/dedekind/git/l2-mtd-2.6/scripts/checksyscalls.sh
>   CHK     include/generated/compile.h
>   CHK     include/linux/version.h
> make[3]: `scripts/unifdef' is up to date.
>   Building modules, stage 2.
> Kernel: arch/x86/boot/bzImage is ready  (#2)
>   MODPOST 146 modules
> ERROR: "__iget" [drivers/mtd/mtdchar.ko] undefined!
> ERROR: "inode_lock" [drivers/mtd/mtdchar.ko] undefined!
> make[2]: *** [__modpost] Error 1
> make[1]: *** [modules] Error 2
> make: *** [sub-make] Error 2
> 
> __iget and inode_lock are not exported...
  Ah, right. igrab() should be used instead of __iget inside the
inode_lock.

								Honza

-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
