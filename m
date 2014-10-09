Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XcAwX-0003pE-2i
 for linux-mtd@lists.infradead.org; Thu, 09 Oct 2014 10:27:33 +0000
Date: Thu, 9 Oct 2014 07:25:46 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Andrew Murray <amurray@embedded-bits.co.uk>
Subject: Re: UBI_READWRITE constraint when opening volumes to rename
Message-ID: <20141009102546.GA2755@arch.hh.imgtec.org>
References: <CAPcvp5E=MgV0-f8q9SFuMCzCEt-WVQiEu4XGJXj2QLyf5L1ohw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPcvp5E=MgV0-f8q9SFuMCzCEt-WVQiEu4XGJXj2QLyf5L1ohw@mail.gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07 Oct 03:31 PM, Andrew Murray wrote:
> Hello,
> 
> I'd like to be able to safely rename a UBI volume that contains a
> mounted UBIFS volume.
> 
> This allows for firmware upgrade via the following steps:
> 
> - ubimkvol rootfs_new
> - ubiupdatevol rootfs_new
> - ubirename rootfs rootfs_old rootfs_new rootfs
> - reboot
> - ubirmvol rootfs_old
> 
> Such an approach makes upgrade of a root filesystem simple as there is
> no need to unmount the root filesystem. I believe this question has
> been asked before on this mailing list
> (http://lists.infradead.org/pipermail/linux-mtd/2012-February/039743.html).
> 
> This process isn't possible at the moment as 'rename_volumes' opens
> the UBI volume with UBI_READWRITE. Unfortunately UBIFS always opens
> UBI with UBI_READWRITE regardless to if the user mounts as read-only.

How about making UBIFS honour the read-only mount flag?

A quick look to fs/ubifs/io.c shows that UBIFS will show an error message
if a LEB erase/write operation is attempted on a read-only mounted or
read-only media. So, hopefully, this is reasonable (the patch is completely
untested!):

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 106bf20..ce445ce 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1998,11 +1998,16 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 {
        struct ubifs_info *c = sb->s_fs_info;
        struct inode *root;
-       int err;
+       int err, mode;
+
+       /*
+        * Re-open the UBI device in read-write mode, or keep it read-only if
+        * explicitly requested.
+        */
+       mode = (sb->s_flags & MS_RDONLY) ? UBI_READONLY : UBI_READWRITE;
 
        c->vfs_sb = sb;
-       /* Re-open the UBI device in read-write mode */
-       c->ubi = ubi_open_volume(c->vi.ubi_num, c->vi.vol_id, UBI_READWRITE);
+       c->ubi = ubi_open_volume(c->vi.ubi_num, c->vi.vol_id, mode);
        if (IS_ERR(c->ubi)) {
                err = PTR_ERR(c->ubi);
                goto out;

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
