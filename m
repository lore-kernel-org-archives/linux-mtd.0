Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IY0rQ-0000bO-7R
	for linux-mtd@lists.infradead.org; Wed, 19 Sep 2007 10:49:07 -0400
Subject: Re: mkfs.jffs2 and mksum
From: Artem Bityutskiy <dedekind@infradead.org>
To: Timo Piiroinen <timo.piiroinen@tut.fi>
In-Reply-To: <46F13100.9020705@tut.fi>
References: <Pine.LNX.4.64.0709191538050.1701@assari.cc.tut.fi>
	<1190206217.14370.155.camel@sauron>  <46F12C4D.9060204@tut.fi>
	<1190211192.14370.166.camel@sauron>  <46F13100.9020705@tut.fi>
Content-Type: text/plain; charset=utf-8
Date: Wed, 19 Sep 2007 17:47:40 +0300
Message-Id: <1190213260.14370.188.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-09-19 at 17:24 +0300, Timo Piiroinen wrote:
> I use the redboot bootloader to flash image (using fis create), if I=20
> flash with lenght parameter same as image size it won't work, cause=20
> after that there is mtd/2 which is length of image and mtd/3 which=20
> contains rest of free flash (and I want mtd/2 to use all available flash)=
.
> I'll try to create image using legth of free flash and write rest of it=20
> after jffs2 image (unused part) with 0xFF.

I never used redboot so I cannot help here, may be others.

But what I just want to inform you about pitfalls you may hit.

When you flash a padded image, you basically write 0xFFs to unused
space. Writing 0xFFs may have side-effects - e.g., ECC of all 0xFF bytes
may by 0x0 (I saw this in practice). It will be stored in OOB and the
NAND page won't be re-writable. E.g., JFFS2 may think: "oh cool, I have
empty flash space here (all 0xFF bytes), I'll write my data there". But
it ends up with an error.

You may argue that in your case ECC of 0xFFs is 0xFFFFFFFF, but anyway,
data sheets usually say that you may do only one write per NAND page (or
sub-page), and you've already done one when wrote 0xFFs, and it _might_
cause some problems, side-effects, or heisenbugs.

I'm not sure how mkfs.jffs2 pads - whether it writes clean markers to
beginnings of padded eraseblocks or not. If yes, you may hit the
problems described above. If not, it is fine, JFFS2 will re-erase them
on the first mount.

But there is the last eraseblock of the image which may be partially
filled. JFFS2 interprets the 0xFFed part of it as empty space and this
may cause problems described above.

Just beware of this. Depending on the system, this might not be relevant
for you, but you might want to play safe.

So one thing to do is to flash exactly the amount of NAND pages the FS
image contains, not more. And erase the flash beforehand.

The other thing to do is to check/teach the program which flashes data
(redboot?) and make sure it just skips NAND pages containing all 0xFFs
if they span up to the end of the eraseblock.

HTH.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
