Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KDyH5-0003rq-MW
	for linux-mtd@lists.infradead.org; Wed, 02 Jul 2008 09:05:16 +0000
Subject: Re: Bootloader support for UBI images
From: Artem Bityutskiy <dedekind@infradead.org>
To: Richard Titmuss <richard_titmuss@logitech.com>
In-Reply-To: <486B34D9.2070009@logitech.com>
References: <486A184B.3080708@logitech.com>
	<1214915164.6573.75.camel@sauron>  <486B34D9.2070009@logitech.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 02 Jul 2008 12:02:58 +0300
Message-Id: <1214989379.6573.85.camel@sauron>
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

On Wed, 2008-07-02 at 08:57 +0100, Richard Titmuss wrote:
> Right, I was thinking that it would allow any number of volumes for=20
> renaming. I am also not sure about the interface, and was hoping to get=20
> some suggestions here. I will think about it and propose something in a=20
> few days.

Do you absolutely need multiple renames? Could you live with one at
a time?

> > So you use the sub-page read patch BTW?
> No, I'd missed that. Where is it?

Here is the relevant thread. Some people already use that patch. dwmw2
was positive about it and told he would accept it.

http://lists.infradead.org/pipermail/linux-mtd/2008-April/021412.html

> Ok, that is possible. This would also have to include the bad block and=20
> bit flip status for each PEB. At the moment the Redboot flash api does=20
> not make this available, so it would mean extending Redboot or writing=20
> custom flash drivers to access this information.

Well, bit-flip information is not mandatory and may be done later as
an improvement. Bad-block information have to be available.

> > I did not actually catch the second part (LER and PER) tables - this is
> > something I am not aware of. UBI has only volume table on flash, the
> > other things are in-memory and build by scanning.
> >  =20
> It was a proposal to _add_ an addition table, that provided a LER to PER=20
> mapping for static volumes.

Ah, this is s/LER/LEB/, s/PER/PEB/.

>  If this table was stored near the beginning=20
> of the flash, then it could be accessed without a full scan. This could=20
> only be used if the UBI volume was mounted read-only, any write=20
> operations would require scanning all the flash blocks. This is an=20
> alternative approach to passing data from the bootloader to the kernel.

Well, may be done, but the R/O limitation seems to be too hard.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
