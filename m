Received: from cf-82.precidata.com ([157.26.64.82] helo=smtp1.berger.to)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NDL0T-0008V0-9k
	for linux-mtd@lists.infradead.org; Wed, 25 Nov 2009 16:46:21 +0000
Received: from samba-1.cf.berger.to (unknown [192.168.5.38])
	by smtp1.berger.to (Postfix) with ESMTPS id 30E6F2F2
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 Nov 2009 17:40:55 +0100 (CET)
Received: from [192.168.6.150] (unknown [192.168.6.150])
	by samba-1.cf.berger.to (Postfix) with ESMTPSA id F37152BE24
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 Nov 2009 17:40:54 +0100 (CET)
From: Gabriele Mondada <gabriele@precidata.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Subject: MLC controller embedded in the NXP LPC32xx ARM CPU
Date: Wed, 25 Nov 2009 17:46:09 +0100
Message-Id: <DB52D0BE-D5A4-4A3D-8C6B-C84530CF7C9C@precidata.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0 (Apple Message framework v1077)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm starting to write the mtd driver for the MLC controller embedded in =
the NXP LPC32x0 ARM CPU. To prevent redoing existing code and to test my =
understanding, here are my "specs":

This controller has an hardware ECC. The ECC is performed on 512 bytes =
(user) + 6 bytes (oob) and produces 10 bytes code. The OOB data is =
covered by the ECC and cannot be handled separately from the user data. =
When using 2048 + 64 bytes pages (it's my case), the ECC must be =
performed 4 times. ECC codes will be inserted each 518 bytes, and not at =
the end of the page as usual.

The controller is described at page 158 of =
http://www.nxp.com/documents/user_manual/UM10326.pdf

The driver should not support OOB because it cannot do that in the =
standard mtd way. I can define the 6 bytes of OOB as part of the user =
data. This results in pages of 518 or 2072 bytes. Is there any problem =
with UBIFS or whatever else ?

For 2048 + 16 bytes pages, I plan to set ecc.steps=3D4, ecc.bytes=3D512, =
ecc.bytes=3D10 and mtd->oobsize=3D0 (maybe 40 ?) but I'm not sure that =
this combinaiton works (especially because mtd->oobsize=3D0). The =
ecc.calculate() method will read/write the discarded OOB bytes (6) and =
the ECC bytes (10). It also asks to the ECC hardware controller if data =
is correct and retrieves the corrected data if needed. The function =
ecc.correct() does nothing.

Do you think is the right way ? Any suggestion ?
Thanks a lot,
Gabriele=
