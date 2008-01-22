Received: from py-out-1112.google.com ([64.233.166.178])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JHNrK-0006sY-5j
	for linux-mtd@lists.infradead.org; Tue, 22 Jan 2008 18:28:36 +0000
Received: by py-out-1112.google.com with SMTP id p76so4572231pyb.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Jan 2008 10:28:28 -0800 (PST)
Message-ID: <5e088bd90801221028q5f6578d2i70a61b1dc333c03a@mail.gmail.com>
Date: Tue, 22 Jan 2008 10:28:28 -0800
From: "Steve Sakoman" <sakoman@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: CRC errors at linux boot
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The hardware:

PXA270 @ 600 Mhz
256 Mb Strataflash (P30)

The software:

u-boot 1.20
Linux 2.6.21

The issue:

During boot large numbers of CRC error messages are sent to the
console.  They typically are of the form:

   JFFS2 notice: (213) jffs2_get_inode_nodes: Node header CRC failed
at 0x9199dc. {0080,0080,00800080,00800080}

What I think I know:

 Errors have only shown up on a small subset of motherboards, the rest
work flawlessly
 The issue shows up with both buildroot and OpenEmbedded rootfs images
 Reflashing a new image does not cure the problem
 There is no difference in board revision between working and non-working units
 There are no part mis-loads on the failing boards
 Extensive r/w testing with u-boot shows no issues, only linux accesses show it
 Downgrading the cpu clock to 400Mhz does not cure the problem
 Downgrading ram and flash access timings to the most conservative
values does not cure the problem
 The data pattern in the CRC error message is always the same
 The data pattern seems to suggest that the flash part is stuck in
Read Status Register mode
 In Read Status Register mode this bit pattern indicates: "Device is ready"

I saw an old report of exactly this symptom in this thread:

http://lists.infradead.org/pipermail/linux-mtd/2006-May/015429.html

Does anyone have any ideas on how to resolve this?

Thanks!

Steve
