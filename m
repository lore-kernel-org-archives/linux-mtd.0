Received: from palrel13.hp.com ([156.153.255.238])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FvgLz-0004LA-5z
	for linux-mtd@lists.infradead.org; Wed, 28 Jun 2006 16:09:46 -0400
Received: from cacexg12.americas.cpqcorp.net (cacexg12.americas.cpqcorp.net
	[16.92.1.72]) by palrel13.hp.com (Postfix) with ESMTP id 9F3DC342DE
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Jun 2006 13:09:32 -0700 (PDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: NAND driver question
Date: Wed, 28 Jun 2006 13:09:31 -0700
Message-ID: <434C0230237FE94499EB9C6582CBA342048B3618@cacexc07.americas.cpqcorp.net>
From: "Ramesh, Subramanian (HPSL-Firmware)" <s.ramesh@hp.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


	I don't know if this is the right forum, but I have a question.
What we have is a powerpc board running 2.6.11 kernel (curently using a
NOR flash) and the HW guys are proposing putting a ST micro 512MB NAND
on the board, but behind an FPGA. They are also proposing to have a
separate chip select for the NAND's address range so that the accesses
to that range will be a straight "pass through" for the FPGA. My concern
is that what impact will this have on the driver. Ideally, it should
work as is, but I am not sure. Any pointers?=20

Thanks.
--Ramesh
