Received: from relay2.mail.timico.net ([62.121.20.90] helo=relay.timico.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oj7dr-00073A-J1
	for linux-mtd@lists.infradead.org; Wed, 11 Aug 2010 09:30:36 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Class: urn:content-classes:message
Date: Wed, 11 Aug 2010 10:30:28 +0100
Subject: How to stop mtd char device generating ECC on writes?
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE0903DC2323@Cloud.RL.local>
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

I am trying to write a binary image to NAND flash using nandwrite on TI DaV=
inci DM355. For historical reasons involving badly-written ROM bootloaders,=
 I want to write the "legacy" OOB format for one area of flash (the UBL, se=
cond-stage bootloader).

For reference the legacy layout of a 2KB flash page is
  4x (512B data followed by 16B OOB (6 spare then 10 ECC)).

The "new" format used by u-boot, MTD etc. is
  2KB data followed by 64B OOB (24 spare then 40 ECC).

I can get a bootloader image with the needed (legacy) OOB and ECC using
  nanddump -f ubl0.dump -s 0x20000 -l 0x8000 -n /dev/mtd0

But I can't seem to write it back properly using nandwrite.
Testing on another partition mtd6, If I do this:
  nandwrite -r -s 0x20000 /dev/mtd6 ubl0.dump
then it seems my 64 bytes of "OOB" are skipped and I get a generated 24 byt=
es of 0xFF spare and 40 bytes of generated ECC.

If I use --noecc --oob instead of -r, it looks like my 64 bytes of "OOB" do=
es get written, but then hardware ECC is getting written OVER THE TOP, i.e.=
 the last 40 bytes have various bits 0 that should be 1 (but no 1s that sho=
uld be 0)

I am looking through the nandwrite and drivers/mtd sources at the moment, b=
ut would love to get a clue if someone can tell me

- Does MTD support what I'm trying to do from userland?

- If yes, could this be a bug in the DaVinci NAND driver?

- Or, is nandwrite supposed to support this? or do I need to modify it?

Thanks folks,

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
