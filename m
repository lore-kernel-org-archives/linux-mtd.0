Received: from smail5.alcatel.fr ([64.208.49.27])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOocX-0006qh-BF
	for linux-mtd@lists.infradead.org; Tue, 24 May 2011 10:13:51 +0000
Received: from FRMRSSXCHHUB01.dc-m.alcatel-lucent.com
	(FRMRSSXCHHUB01.dc-m.alcatel-lucent.com [135.120.45.61])
	by smail5.alcatel.fr (8.14.3/8.14.3/ICT) with ESMTP id p4OADcev001334
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Tue, 24 May 2011 12:13:46 +0200
From: "THOMSON, Adam (Adam)" <adam.thomson@alcatel-lucent.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Tue, 24 May 2011 12:13:43 +0200
Subject: nand_do_write_ops issue with writing OOB data
Message-ID: <E14CAA9D00C5044EACE0C59FC2A1C7F5059A8DF167@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
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

Hi,
=20
I have recently come across an issue in the NAND generic driver code (Kerne=
l & U-Boot),
in particular to do with 'nand_do_write_ops' method in nand_base.c, when wr=
iting OOB data
(the problem is noted from at least from 2.6.31 to current latest version o=
f the linux kernel,
and from 1.3.4 of U-Boot to current).

The issue I observed happened in the following scenario using YAFFS2:
=20
1) Scan is performed on NAND to identify bad blocks, and last block in NAND=
 is marked bad.
This is the last block read in by the scan, so chip->oob_poi buffer contain=
s contents of this blocks OOB.

2) YAFFS calls on nand_do_write_ops and provides both ops->oobbuf,
and ops->mode =3D=3D MTD_OOB_AUTO to write it's tags to OOB area.
=20
3) nand_do_write_ops code doesn't initialise chip->oob_poi buffer to all 0x=
ff because YAFFS provided
the ops.oobbuf buffer.

4) Later in this method nand_fill_oob is called, and drops into the case MT=
D_OOB_AUTO.
This skips the first two bad block marker bytes in chip->oob_poi buffer lea=
ving them as they
were from the previously read block (in this case a bad block with markers =
0x00), and
then it copies over the YAFFS tag data that was provided to be written to t=
he OOB.

Without knowing it YAFFS has now marked the block as bad, but is unaware of=
 this
and it's checkpointing data is incorrect. This causes a world of pain for Y=
AFFS.

Interestingly this issue was seen in 2007 on the following message thread:
=20
http://www.aleph1.co.uk/lurker/message/20070702.153055.030a8b94.en.html

It's a very corner case scenario but shouldn't the chip->oob_poi buffer alw=
ays be memset to all 0xff
even when ops.oobbuf is populated just so we don't write data to the OOB wh=
ich is from a previously
read block? This scenario has been seen with YAFFS but given this could hap=
pen for other code that
uses the OOB area in a similar way using nand_do_write_ops, I believe the p=
roblem is with MTD NAND
code and not YAFFS.

Thoughts on this would be greatly appreciated. Apologies if I've rambled a =
little.

Thanks

Adam=
