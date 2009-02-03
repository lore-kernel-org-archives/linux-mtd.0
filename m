Received: from webmail.ikanos.com ([199.239.167.175] helo=ikfreex1.ikanos.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LU8r4-0004Lp-FZ
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2009 00:09:33 +0000
From: "Darren B. Hutchinson" <dhutchin@ikanos.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Mon, 2 Feb 2009 16:09:14 -0800
Subject: Help requested with Eureka EP501 NAND flash controller.
Message-ID: <E9E3B381C946A64D924F8A6C7A6115E5CEEBEA3D@ikfreex1.ikanos.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I'm looking to interface a device containing the Eureka EP501 NAND flash co=
ntroller ( http://www.eurekatech.com/products/memory/ep501.htm )

I've looked through the last twelve months of archives. I found lot of answ=
ers to questions I'll get to later, but no mention of the Eureka controller=
.

So first question - has anybody ported for the EP501 and can they share it?

Unless I'm the luckiest person on earth I guess I still have a driver to wr=
ite. I've looked through the code & documentation for a few days and I thin=
k I know how to write a suitable driver based on the existing NAND code - b=
ut I'd really appreciate any knowledgeable opinions you could share.

The EP501 is fairly, well, controlling. It wants to generate and write the =
ECC/BCH by itself at the end of write and read operation. It also wants to =
issue the commands to the flash itself and often routes the data to/from re=
gisters it keeps for specific purposes. There is no direct access to the NA=
ND flash control signals (CLE/ALE/etc)

For example if you tell it to read the device ID the data goes to special r=
egisters on the device and must be read from there. Page data goes to a dif=
ferent set of access register.

Based on my examination of the code it looks like the right approach would =
be:

- set ecc.type to NAND_ECC_HW_SYNDROME

- provide functions for ecc.correct()/ecc.calculate()/ecc.read_page()/ecc.w=
rite_page()/ecc.read_oob()/ecc.write_oob() to access the page via the EP501=
 using its ECC/BCH engines

- provide chip.cmd_ctrl() to catch the flash commands and forward them to t=
he EP501

- provide chip.read_byte()/chip.write_byte() to fetch non-page access comma=
nds (ie read device ID) from the command-dependent register on the EP501

Does this sound right? Is there a better way to solve the problem?

Thanks in advance for any guidance you can give,

Darren Hutchinson (Ikanos Communications)
