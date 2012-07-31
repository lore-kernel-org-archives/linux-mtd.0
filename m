Received: from webbox1416.server-home.net ([77.236.96.61])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SwAYy-000325-Tj
 for linux-mtd@lists.infradead.org; Tue, 31 Jul 2012 11:24:34 +0000
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: UBIFS is not remounted read-only from within do_emergency_remount
Date: Tue, 31 Jul 2012 13:24:19 +0200
Message-ID: <16202485.ui8ZXcNIqe@ws-stein>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

upon testing do_emergency_remount from a power fail interrupt (using the 
workqueue of course), we noticed UBIFS is not remounted read-only afterwards.
The current code in do_emergency_remount checks if the kernel actually needs 
to remount a filesystem using the following code:
> if (sb->s_root && sb->s_bdev && (sb->s_flags & MS_BORN) &&
>     !(sb->s_flags & MS_RDONLY)) {
>         /*
>          * What lock protects sb->s_flags??
>          */
>         do_remount_sb(sb, MS_RDONLY, NULL, 1);
> }

I'm not in the details of this part of the kernel, but I suspect that sb-
>s_bdev is NULL for UBIFS as it has no block device, but the character device 
/dev/ubiX_Y instead. I have the information from a collegue that removing the 
check for testing purposes for sb->s_bdev mounts UBIFS read-only.
Any comments/ideas how to remount UBIFS as read-only from 
do_emergency_remount?

Best regards,
Alexander
