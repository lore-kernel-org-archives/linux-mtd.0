Subject: Re: [PATCH v3] mtd: Do not corrupt backing device of device node inode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
In-Reply-To: <1273047688-20947-1-git-send-email-kirill@shutemov.name>
References: <1273047688-20947-1-git-send-email-kirill@shutemov.name>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 05 May 2010 17:17:19 +0300
Message-ID: <1273069039.3702.188.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	Alexander Shishkin <virtuoso@slind.org>, linux-mtd@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-05-05 at 11:21 +0300, Kirill A. Shutemov wrote:
> We cannot modify file->f_mapping->backing_dev_info, because it will corrupt
> backing device of device node inode, since file->f_mapping is equal to
> inode->i_mapping (see __dentry_open() in fs/open.c).
> 
> Let's introduce separate inode for MTD device with appropriate backing
> device.
> 
> Signed-off-by: Kirill A. Shutemov <kirill@shutemov.name>
> Acked-by: Jan Kara <jack@suse.cz>

I get the following build error:

[dedekind@eru l2-mtd-2.6]$ make -j8
O=/home/dedekind/tmp/l2-mtd-2.6-x86_64/
  GEN     /home/dedekind/tmp/l2-mtd-2.6-x86_64/Makefile
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
  Using /home/dedekind/git/l2-mtd-2.6 as source for kernel
  CALL    /home/dedekind/git/l2-mtd-2.6/scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CHK     include/linux/version.h
make[3]: `scripts/unifdef' is up to date.
  Building modules, stage 2.
Kernel: arch/x86/boot/bzImage is ready  (#2)
  MODPOST 146 modules
ERROR: "__iget" [drivers/mtd/mtdchar.ko] undefined!
ERROR: "inode_lock" [drivers/mtd/mtdchar.ko] undefined!
make[2]: *** [__modpost] Error 1
make[1]: *** [modules] Error 2
make: *** [sub-make] Error 2

__iget and inode_lock are not exported...

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
