Received: from [208.178.55.66] (helo=server.activmedia.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17HoHp-000841-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2002 17:14:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by server.activmedia.com (Postfix) with ESMTP id A21AD117
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2002 12:13:54 -0400 (EDT)
Date: Tue, 11 Jun 2002 12:13:54 -0400 (EDT)
From: Matt Vestal <vestal@activmedia.com>
To: linux-mtd@lists.infradead.org
Subject: DOC2000 and Grub
Message-ID: <Pine.LNX.4.21.0206111201030.31856-100000@server.activmedia.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I 'm having the same problem as others who have posted, in getting the
"Selected disk does not exist" error.  I'm using a 96MB DOC with a
VersaLogic VSBC-8 motherboard.

-using Grub 0.92
-patched with grub-2002-02-19-doc.patch
-ran "aclocal && automake && autoconf"   (needed automake-1.5-8)
-./configure --enable-diskonchip-2000 --enable-ext2fs
-../util/doc_loadbios /dev/mtd0 grub_firmware
-./nftl_format /dev/mtd0 98304
-fdisk /dev/nftla into multiple portions.  also tried leaving it full
-mke2fs
-copy over necessary files (kernel and such)
-reboot

The DOC loads Grub with no problem.  However, Grub has never been able to
see the DOC filesystem(s).  I've tried root (dc0), root (dc0,0), root
(dc0,1), etc, but nothing works.  I always get the "Selected disk does not
exist, error"

Any help would be greatly appreciated, as I've been pouring over this for
days, now.

Thanks,

Matt
