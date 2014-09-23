Received: from email.rugged.com ([64.60.45.211])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWExs-0006J3-PA
 for linux-mtd@lists.infradead.org; Tue, 23 Sep 2014 01:32:25 +0000
From: Robert Hurdle <RHurdle@Rugged.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Mon, 22 Sep 2014 18:32:06 -0700
Subject: MTD Commands
Message-ID: <5498E86A4A68B14A8A06D0380640D04A01FA685FE455@atca01em01.adsi.aitech.ent>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

	I am trying to port a NAND flash driver for a board that has an FPGA betwe=
en the software and the
	NAND flash.  I have made some progress, but now I am stuck because I don't=
 know how the
	command NAND_CMD_RNDOUT should be implemented. So far I have not found any=
 detailed
	documentation on any of the commands (NAND_CMD_ERASE1, NAND_CMD_ERASE2, et=
c.)
	processed by cmdfunc() in the hardware specific driver files.  The driver =
file I chose to copy did
	not support NAND_CMD_RNDOUT, but even examining other driver files in the =
drivers/mtd/nand
	directory, it looks sort of cryptic.

	What does MTD expect the command NAND_CMD_RNDOUT to accomplish?

	Is there a reference on-line that describes the what these various NAND co=
mmands are expected
	to accomplish, how data is provided to MTD, inputs and outputs, etc. ?

	Thanks for any advice.
=09
	Robert Hurdle
