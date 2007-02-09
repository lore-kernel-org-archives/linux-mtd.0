Received: from cpe.atm2-0-71355.0x535a1b8e.virnxx16.customer.tele.dk
	([83.90.27.142] helo=bes01.blokken.lan)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HFYHq-0006Nh-Rh
	for linux-mtd@lists.infradead.org; Fri, 09 Feb 2007 11:07:49 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Chip_ready for SST39VF640xB flash
Date: Fri, 9 Feb 2007 17:09:20 +0100
Message-ID: <4F576438CB468649B9FD55650B93FA238DB4B5@bes01.blokken.lan>
From: "Niels Gram Jeppesen" <ngj@danelec-marine.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am trying to get the chip_ready function in cfi_cmdset_0002.c to work =
with the SST39VF640xB flash. What I see is that the current chip_ready =
report that the chip is ready before it is ready during block erase. =
Last week I thought that I had fixed the problem but it turned out that =
the fix did not reliably solve the problem. I have modified chip_ready =
to gain more knowledge about what is going wrong and call chip_ready =
right after the block erase command has been issued. The modified =
chip_ready does a busy wait polling DQ 10000000 times. If DQ change from =
last poll, the new value and the poll number is stored. At the end of =
the busy wait, the stored data is printed out. This is a typical =
printout (i is poll number and "data" is DQ):

i =3D 0, read: 0000FF5F
i =3D 1, read: 0000FF1B
i =3D 2, read: 0000FF5F
i =3D 3295, read: 0000FF1B
i =3D 8782, read: 0000FF5F
i =3D 14332, read: 0000FF1B
i =3D 19884, read: 0000FF5F
i =3D 25168, read: 0000FF1B
i =3D 25170, read: 0000FF5F
i =3D 25431, read: 0000FF1B
i =3D 30968, read: 0000FF5F
i =3D 42071, read: 0000FF1B
i =3D 47623, read: 0000FF5F
i =3D 65067, read: 0000FF1B
i =3D 105299, read: 0000FFFF
i =3D 9999999, read: 0000FFFF

So contrary to what is documented in the SST data sheet and also to what =
appear to be the normal operation of an AMD compatible flash, the toggle =
bits only toggle on consecutive reads a few times and then toggle far =
less frequently. Does anyone know what is going on ? Is this a faulty =
chip ? Any help would be appreciated.

Best regards,

Niels Gram
