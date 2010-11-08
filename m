Received: from smtp-4.concepts.nl ([2001:838:2:1::30:111])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PFa2p-00074f-Jk
	for linux-mtd@lists.infradead.org; Mon, 08 Nov 2010 22:18:32 +0000
From: pieterg <pieterg@gmx.com>
To: openpxa-users@lists.sourceforge.net
Subject: Re: [Openpxa-users] PXA310: double bit errors on NAND
Date: Mon, 8 Nov 2010 23:18:21 +0100
References: <AANLkTin86UQe8Q4PNqSnU7M0x4kVPUehcBRpS0HhHKRh@mail.gmail.com>
In-Reply-To: <AANLkTin86UQe8Q4PNqSnU7M0x4kVPUehcBRpS0HhHKRh@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201011082318.21748.pieterg@gmx.com>
Cc: =?utf-8?q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, November 08, 2010 15:54:43 Bj=C3=B8rn Forsman wrote:
> I get "double bit error @ page" messages while working with NAND on a
> Colibri PXA310 module. Basically, when I write an UBI image to NAND,
> either with U-Boot "nand write" or "nandwrite" from mtd-utils,
> everything is OK on the *first* mount. But on the second mount I get
> several "double bit error @ page" messages and mount fails.

You are not erase-block padding your image, when you write it?
That's the mistake I made (with jffs2 in my case), in that openpxa-users
thread you mention.
As soon as I found out my image was eraseblock padded, and fixed that,
the number of single/double bit errors was reduced dramatically,=20
but some errors remained.

I haven't yet had the time to further investigate this, my preliminary=20
conclusion is that the Samsung K9K's, though advertised as SLC,=20
are very poor quality, and they probably need a better ecc than=20
Hamming (as the pxa nand controller implements).
And also that jffs2 seems to care less than ubi(fs) when double bit errors=
=20
do happen.(ubifs often refused to even mount when biterrors occurred,=20
jffs2 so far always continued with what remained)
That's the reason why I'm using jffs2 for the time being, a non-booting=20
device is worse than a device with a corrupted file.
(from a theoretical point of view however both are equally bad of course,=20
this issue does need to be resolved)

Rgds, Pieter
