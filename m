Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QEcqA-0007Cf-EO
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 07:37:47 +0000
Date: Tue, 26 Apr 2011 09:37:44 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
Subject: Re: Programming ubinized images
In-Reply-To: <BANLkTi=CNSd8JrWPL-o-WHe-kS-L7pFNqg@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1104260932320.30071@lnxricardw.se.axis.com>
References: <BANLkTi=CNSd8JrWPL-o-WHe-kS-L7pFNqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 25 Apr 2011, Matthew L. Creech wrote:

> Hi,
>
> I'm curious about the implications of these notes in the UBI documentatio=
n:
>
> http://www.linux-mtd.infradead.org/faq/ubi.html#L_ecc_error
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_why_ubiformat
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_mkfubifs
> http://www.linux-mtd.infradead.org/doc/ubi.html#L_flasher_algo
>
> which seem to be saying that:
>
> 1. A ubinized image can contain empty (all-0xff) pages at the end
> 2. At run-time, it will assume that these pages are completely erased
> (including corresponding OOB areas)
> 3. Standard NAND flashing utilities will view the 0xff pages as normal
> data and program their OOB areas

Yes,

> 4. This will cause errors when UBIFS tries to use these areas, because
> it double-programs OOB/ECC (presumably resulting in some sort of
> ANDing of bits)

Not quite, the problem is that NAND flash doesn't allow programming the=20
same area more than a couple of times (before it is erased again), even if=
=20
it was 'programmed' to all-ones the first time. It's not that the bits get=
=20
ANDed, it's that the bit cells aren't designed to be programmed more than=
=20
two or three times, and mtd/UBI uses all those times for its own use. So=20
you end up operating the device out of spec, which turns out to fail for=20
certain devices.

> Does this mean that an off-the-shelf NAND programmer can't be used to
> program UBIFS images onto a flash device?

That is my understanding, allthough 'off-the-shelf' is a pretty wide=20
generalization, it would be conceivable that some programmers can handle=20
this, although I have no idea if this in fact is the case.

> Or perhaps that I need to be post-processing the ubinized images to=20
> strip out empty pages from the end of the image before giving it to the=
=20
> production line?

That should work too.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
