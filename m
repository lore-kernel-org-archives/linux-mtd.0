Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFLkV-0004pj-7K
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 14:34:25 +0000
Date: Mon, 29 May 2017 16:33:58 +0200
From: Rabin Vincent <rabin.vincent@axis.com>
To: Al Viro <viro@ZenIV.linux.org.uk>, Richard Weinberger <richard@nod.at>
Cc: dedekind1@gmail.com, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>
Subject: Re: Setting ->s_dev to a char device (Was: Re: [PATCH v2] ubifs:
 allow userspace to map mounts to volumes)
Message-ID: <20170529143358.GA27938@axis.com>
References: <1496042533-17024-1-git-send-email-rabin.vincent@axis.com>
 <6737a526-18ba-6d8c-f6c8-03f03d74b90a@nod.at>
 <20170529120818.GA6365@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170529120818.GA6365@ZenIV.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 29, 2017 at 01:08:25PM +0100, Al Viro wrote:
> Userspace sure as hell does.  st_dev in stat(2) is a block device number;
> moreover, there might _be_ a block device with the same number at the same
> time - even mounted.  Why not make ->show_options() print the currently
> valid volume name, anyway?  That would seem to be the obvious approach...

The following patch works for me, if it's OK to show options that can't
actually be used when mounting:

8<-----------------------
>From 19797334f9c87a2e0c90fe2c93f29cce397b6230 Mon Sep 17 00:00:00 2001
From: Rabin Vincent <rabinv@axis.com>
Date: Mon, 29 May 2017 16:08:44 +0200
Subject: [PATCH v3] ubifs: allow userspace to map mounts to volumes

There currently appears to be no way for userspace to find out the
underlying volume number for a mounted ubifs file system, since ubifs
uses anonymous block devices.  The volume name is present in
/proc/mounts but UBI volumes can be renamed after the volume has been
mounted.

To remedy this, show the UBI number and UBI volume number as part of the
options visible under /proc/mounts.

 # mount -t ubifs ubi:baz x
 # mount
 ubi:baz on /root/x type ubifs (rw,relatime,ubi=0,vol=2)
 # ubirename /dev/ubi0 baz bazz
 # mount
 ubi:baz on /root/x type ubifs (rw,relatime,ubi=0,vol=2)
 # ubinfo -d 0 -n 2
 Volume ID:   2 (on ubi0)
 Type:        dynamic
 Alignment:   1
 Size:        67 LEBs (1063424 bytes, 1.0 MiB)
 State:       OK
 Name:        bazz
 Character device major/minor: 254:3

Signed-off-by: Rabin Vincent <rabinv@axis.com>
---
 fs/ubifs/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index cf4cc99..4b54186 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -446,6 +446,8 @@ static int ubifs_show_options(struct seq_file *s, struct dentry *root)
 			   ubifs_compr_name(c->mount_opts.compr_type));
 	}
 
+	seq_printf(s, ",ubi=%d,vol=%d", c->vi.ubi_num, c->vi.vol_id);
+
 	return 0;
 }
 
-- 
2.1.4
