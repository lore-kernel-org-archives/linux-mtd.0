Received: from lion-s12.seas.upenn.edu ([158.130.12.194] helo=lion.seas.upenn.edu)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18E9fP-0003Gk-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Nov 2002 14:47:56 +0000
Message-ID: <002501c28fde$e38d38b0$c3c8320a@langostino>
From: "Adam Lee" <alee@ttcdas.com>
To: "linux-mtd list" <linux-mtd@lists.infradead.org>
Cc: <alee@ttcdas.com>
Subject: 128MB DOC 2000 not working (possible bug)
Date: Tue, 19 Nov 2002 10:17:58 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Hi,

We just upgrade a 96 MB DOC 2000 to 128 MB DOC 2000 but the 128MB chip is
not functioning.  I compiled the driver into the kernel, and it worked with
the 96 MB.  In kernel boot up, the 128MB DOC2000 is recognized as DOC
Millennium.  The kernel boot up message is as followed:

.
.
Using configured DiskOnChip probe address 0xd0000
DiskOnChip Millennium found at address 0xD0000
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
.
.
No flash chips recognised.
NFTL driver: nftlcore.c $Revision: 1.87 $, nftlmount.c $Revision: 1.30 $
.
.
After boot, /proc/mtd is empty.

The part number for the 128 MB DOC 2000 is
MD2202-D128-V3-X
23205010089 5.1

And we are using RedHat dist. kernel version 2.4.18-3

Thank you,
Adam
