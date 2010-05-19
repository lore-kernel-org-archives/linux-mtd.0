Received: from moutng.kundenserver.de ([212.227.126.171])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OEdxx-00036j-Ko
	for linux-mtd@lists.infradead.org; Wed, 19 May 2010 07:45:23 +0000
From: Thorsten =?iso-8859-1?q?M=FChlfelder?= <muehlfelder@enertex.de>
To: linux-mtd@lists.infradead.org
Subject: Re: Some questions on bit-flips and JFFS2
Date: Wed, 19 May 2010 09:45:13 +0200
References: <201005031505.18604.muehlfelder@enertex.de>
	<201005121321.07822.muehlfelder@enertex.de>
	<Pine.LNX.4.64.1005121416040.9058@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.1005121416040.9058@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <201005190945.13505.muehlfelder@enertex.de>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Wednesday 12 May 2010 14:22:19 schrieb Ricard Wanderlof:
> > - Or write some tool, that can distinguish between real bad blocks and
> > the Sam-ba 2.5 created bad blocks, unmark the false bad blocks. But
> > perhaps this is not possible at all.
>
> It depends on how exactly Sam-ba 2.5 overwrites the existing bad block
> markers.

As you can see here the Sam-Ba 2.5 tool writes some ECC code to the first 4=
=20
bytes of each erase block's OOB while in the first byte the bad block=20
information usually is stored. Therefore it is impossible to restore factor=
y=20
set bad blocks. IMHO this is a mature bug in Atmel's Sam-Ba tool, but it is=
=20
fixed in newer versions.
I'm quite sure this behaviour is the source of my problem. Probably factory=
=20
set bad blocks have been overwritten by Sam-Ba and I guess in these blocks=
=20
occur the bit flips:

nand dump 0x100000=0D
Page 00100000 dump:
=2E..
OOB:
	b1 20 46 df ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
U-Boot> nand dump 0x100800=0D
Page 00100800 dump:
=2E..
OOB:
	71 31 86 ce ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
U-Boot> nand dump 101800=0D
Page 00101800 dump:
=2E..
OOB:
	16 4b 16 4b ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
U-Boot> nand dump 102000=0D
Page 00102000 dump:
=2E..
OOB:
	06 47 f1 b8 ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
U-Boot> nand dump 102800=0D
Page 00102800 dump:
=2E..
OOB:
	24 5c d3 a3 ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
U-Boot> nand dump 103000=0D
Page 00103000 dump:
=2E..
OOB:
	c3 37 c3 37 ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
U-Boot> nand dump 103800=0D
Page 00103800 dump:
=2E..
OOB:
	81 0c 81 0c ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
	ff ff ff ff ff ff ff ff
