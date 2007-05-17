Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HonIL-0000bt-Pe
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 17:13:59 -0400
Date: Thu, 17 May 2007 23:15:11 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Ram <vshrirama@gmail.com>
Subject: Re: newbie queries
In-Reply-To: <8bf247760705170746q272b90a4m90feba2be822647e@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0705172308590.1882@lnxricardw.se.axis.com>
References: <8bf247760705170746q272b90a4m90feba2be822647e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 17 May 2007, Ram wrote:

>   Im using a JFFS2 filesystem.
>
>   Regarding bad block management - What kind of bad block management does
>   mtd and jffs2 use?.
>   What happens when the filesystem detects that a block is bad?.

AFAICT, jffs2 bad block management is limited to respecting bad block=20
markers already present on the chip, and marking blocks bad that fail to=20
erase properly. There doesn't seem to be any consideration of blocks=20
starting to go bad (ecc starts stepping in to correct errors, or fails=20
altogether).

Bit flips are supposed to be handled by checking the jffs2 node crc's, but=
=20
I can't really tell if this works seamlessly for the user, or you get I/O=
=20
errors on files which have bad bits in them.

>  Am using a large page. Each page is 2048 bytes. Does this include
> the 64 bytes for the ECC?

No, the 64 bytes are in a separate 'spare' area. BTW, the ecc algorithm=20
that mtd uses is 3 bytes ecc per 256 bytes, so it ends up as 6 bytes per=20
page for small-sector (512 bytes) chips, and consequently 48 bytes per=20
page for large-sector (2048 bytes) chips, unless I'm mistaken.

Of couse, you can supply your own ecc algorithm if you wish which can use=
=20
any number of bytes for ecc correction.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
