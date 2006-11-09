Received: from web26613.mail.ukl.yahoo.com ([217.146.177.65])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gi6f8-0005tk-PB
	for linux-mtd@lists.infradead.org; Thu, 09 Nov 2006 04:57:40 -0500
Message-ID: <20061109095052.62796.qmail@web26613.mail.ukl.yahoo.com>
Date: Thu, 9 Nov 2006 09:50:51 +0000 (GMT)
From: ayoub zaki <ayoub_zaki@yahoo.fr>
Subject: Mtd driver for P30 flash
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=0Ahello all,=0A=0A=0A=0AI'm using a montavista linux kernel based on linux=
-2.4.20, unfortunatelly my Intel P30 flash is not recognised by the mtd dri=
ver.=0A=0A=0A=0Ahere is my kernel startup log :=0A=0A=0A=0ARAMDISK driver i=
nitialized: 16 RAM disks of 32768K size 1024 blocksize=0A=0AIntel(R) PRO/10=
00 Network Driver - version 5.0.43=0A=0ACopyright (c) 1999-2003 Intel Corpo=
ration.=0A=0AIXP23XX-Flash: Found 1 x16 devices at 0x0 in 16-bit bank=0A=0A=
 Intel/Sharp Extended Query Table at 0x010A=0A=0A  Unknown Intel/Sharp Exte=
nded Query version 1.4.=0A=0Agen_probe: No supported Vendor Command Set fou=
nd=0A=0A=0A=0A=0A=0AIs there any patch available for the Mtd driver for thi=
s linux version?=0A=0A=0A=0A( We don't plan to upgrade to linux-2.6 which d=
oes not support our processor ixp2351)=0A=0A=0A=0A=0A=0AThanks,=0A=0A=0A=0A=
=0A=0AZak=0A=0A=0A=0A=0A=0A=09=0A=0A=09=0A=09=09=0A________________________=
___________________________________________________ =0AD=E9couvrez une nouv=
elle fa=E7on d'obtenir des r=E9ponses =E0 toutes vos questions ! =0AProfite=
z des connaissances, des opinions et des exp=E9riences des internautes sur =
Yahoo! Questions/R=E9ponses =0Ahttp://fr.answers.yahoo.com
