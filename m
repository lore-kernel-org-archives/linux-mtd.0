Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16GlnT-0006AV-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Dec 2001 18:50:31 +0000
Received: from ilatypov (helo=localhost)
	by infradead.org with local-esmtp (Exim 3.20 #2)
	id 16Glxu-0007MR-00
	for linux-mtd@lists.infradead.org; Wed, 19 Dec 2001 19:01:18 +0000
Date: Wed, 19 Dec 2001 19:01:18 +0000 (GMT)
From: <ilatypov@infradead.org>
To: Linux MTD list <linux-mtd@lists.infradead.org>
Message-ID: <Pine.LNX.4.33.0112191859560.27757-100000@infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: (no subject)
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

There are two concerns as I see:

1. I don't know too much about the FTL layer.  The patch to the GRUB boot
loader for booting off DiskOnChip will recognize NFTL block device access
layer only.  The corresponding format command is
   nftl_format /dev/mtd0 98304
provided that the bootloader itself takes the first 12 * 8K bytes.  Make
sure that the nftl drivers were not loaded or activated before issuing
this command.  The device names corresponding to the partitions of
DiskOnChip are /dev/nftla*, of course.

2. The GRUB firmware might not include the DiskOnChip patch.  I suppose
you copied the pre_stage2 file from the GRUB tree to the MTD tree and ran
the make command to generate the grub_firmawre file.  I also understand
that the firmware was stored onto DiskOnChip by launching this command:
    doc_loadbios /dev/mtd0 grub_firmware

Thank you,

Ilguiz

On Wed, 19 Dec 2001, dharmendra.t bavale wrote:

>   I tried all mke2fs /dev/flta1.
[..]
> grub>root (dc0,1)
> The selected disk does not exist
[..]
