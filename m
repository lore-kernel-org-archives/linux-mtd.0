Received: from mail01.prevas.se ([62.119.151.131])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IsHHL-0008KV-I8
	for linux-mtd@lists.infradead.org; Wed, 14 Nov 2007 07:23:42 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Wrong data CRC in data node
Date: Wed, 14 Nov 2007 13:23:32 +0100
Message-ID: <F0D565FB8733054DAF4888820C74C98D234AE3@prevas1.prevas.se>
From: "Jesper Saxtorph" <Jesper.Saxtorph@prevas.dk>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

We have embedded systems where we get errors if the system is not =
allowed to
make a clean shutdown (that is taking the power or letting the watchdog =
make
a reset).
The full message we get is:
JFFS2 notice: (683) check_node_data: wrong data CRC in data node at =
0x0016abe0:=20
read 0x8d31ae61, calculated 0x46201a37
The addresses is not fixed, they change.
The 683 process is jffs2_gcd_mtd2.

We have the following setup:
Atmel at91
Dataflash memory
Kernel 2.6.19 with patches from http://maxim.org.za/at91_26.html

We have used kernel 2.6.12 earlier with no problems.

The errors are at our root partition, our only mounted flash.
If we mount root as read-only, the errors will not come.

I have search the net for related problems but not been able to find =
anything
usefull.

To get debug information I did the following:
I have added debug level 2 (noisy) in jffs2.
I have commented out #undef DEBUG_DATAFLASH in at91_dataflash.c
I have commented out #undef DEBUG_SPI in at91_spi.c

This did not give me any further information.

I wonder if there can be some kind of cache active (in 2.6.19 contra =
2.6.12) we
are not aware of, that we should deactivate.

Is this a know this issue?

Any suggestions to what I could try?

With hope for suggestions,
Jesper Saxtorph
_____________________________________

Jesper Saxtorph
Software Developer

Prevas A/S
Frederikskaj 6
DK-2450 K=F8benhavn SV

Phone +45 33159090

jesper.saxtorph@prevas.dk
www.prevas.dk
