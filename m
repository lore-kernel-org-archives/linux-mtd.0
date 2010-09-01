Received: from relay2.mail.timico.net ([62.121.20.90] helo=relay.timico.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oqhvo-0001PJ-RZ
	for linux-mtd@lists.infradead.org; Wed, 01 Sep 2010 07:40:33 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Class: urn:content-classes:message
Date: Wed, 1 Sep 2010 08:40:23 +0100
Subject: UBI crashes / fixing NAND subpage writes
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE0903E02F56@Cloud.RL.local>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have been playing with UBI/UBIFS on 2KB page NAND, on TI DaVinci DM355 an=
d having crashes due to subpage write problems.

ubiattach with -O 2048 avoids the problem, but I want to fix it, and use th=
e flash more efficiently in space and time.

The DaVinci family generate 10 bytes of ECC in hardware for each 512 bytes =
of data; on 2KB page NAND the 4x10 bytes of ECC are concatenated together a=
t the end of a page.

The problem is that the ECC generated for an all-FFs page is not all-FFs, a=
nd subpage writes are handled by nand_do_write_ops() by writing a full page=
 with FFs in the unset data areas.

When UBI attaches it detects the subpage size as 512 bytes and tries to do =
two subpage writes, which results in two writes of (different) non-FF ECC d=
ata, causing corrupt ECC. An ubiattach, ubidetach, ubiattach sequence puts =
the kernel into a loop torturing the same block over and over, repeating th=
ese lines:

UBI error: ubi_io_read: error -74 while reading 512 bytes from PEB 2:512, r=
ead 512 bytes
UBI error: ubi_io_read: error -74 while reading 512 bytes from PEB 263:512,=
 read 512 bytes
UBI: run torture test for PEB 263
UBI: PEB 263 passed torture test, do not mark it a bad

I hacked around this as a proof-of-concept by checking for an all-FF subpag=
e in nand_write_page_hwecc() and setting that subpage's ECC to all-FFs, whi=
ch works - I can attach, detatch, reattach, mount, write files, etc.

Of course this is not a very good solution. The right thing to do would see=
m to be make nand_do_write_ops() properly subpage aware and either add star=
t and end offsets to the nand_write_page* family of functions, or add a nan=
d_write_subpage* family of functions.

I don't mind having a go at some of this but am not confident to start such=
 major overhaul of nand_base.c without at least seeking comment from others=
, so: This email. Maybe there's already something being worked on?

Comments welcome...

--
Jon Povey
jon.povey@racelogic.co.uk

Racelogic is a limited company registered in England. Registered number 274=
3719 .
Registered Office Unit 10, Swan Business Centre, Osier Way, Buckingham, Buc=
ks, MK18 1TB .

The information contained in this electronic mail transmission is intended =
by Racelogic Ltd for the use of the named individual or entity to which it =
is directed and may contain information that is confidential or privileged.=
 If you have received this electronic mail transmission in error, please de=
lete it from your system without copying or forwarding it, and notify the s=
ender of the error by reply email so that the sender's address records can =
be corrected. The views expressed by the sender of this communication do no=
t necessarily represent those of Racelogic Ltd. Please note that Racelogic =
reserves the right to monitor e-mail communications passing through its net=
work
