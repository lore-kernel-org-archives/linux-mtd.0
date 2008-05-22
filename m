Received: from smtp5.centerbeam.com ([63.120.115.249])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JzHRD-0001YJ-2T
	for linux-mtd@lists.infradead.org; Thu, 22 May 2008 20:31:01 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Bug in nand_base.c , in handling of K9F1208U0B ?
Date: Thu, 22 May 2008 13:30:52 -0700
Message-ID: <32C4C619DF66B945B608E59A6791C8C30276C31A@CBA0E2K11.CBA0.centerbeam.com>
From: "Manu Rao" <MRao@AlienTechnology.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,=20
I have an Atmel AT91SAM9260 processor interfaced to a K9F1208U0B (
Samsung 64Mbytes Small Block flash device).

The code in nand_base.c and at91_nand.c leads me to believe that the
flash is getting enabled once and then does not get disabled at all( My
scope traces confirm that the CE never goes high) . This seems like it
would work with a CE don't care flash.

However, in the datasheet of the K9F1208U0B( page 31) , it is explicitly
mentioned that the CE has to be driven HIGH at the end of a block read
for greater than 100ns.

Do all flashes that support sequential row read have a requirement that
the CE line should be taken high and then brought low? If yes, then the
current implementation in kernel 2.6.22.2 would violate the requirement.

What implications would this have, if any? I have a situation where I
occasionally get corrupt data from the flash - can this be the cause?
Thanks
Manu Rao
