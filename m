Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JjopL-0005qk-8o
	for linux-mtd@lists.infradead.org; Thu, 10 Apr 2008 04:56:00 +0000
Subject: Re: mtd->size revisited
From: Artem Bityutskiy <dedekind@infradead.org>
To: Bruce_Leonard@selinc.com
In-Reply-To: <OF1E779C97.22C47CCA-ON88257426.007A4C73-88257426.007C6F5B@selinc.com>
References: <OF1E779C97.22C47CCA-ON88257426.007A4C73-88257426.007C6F5B@selinc.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 10 Apr 2008 07:53:57 +0300
Message-Id: <1207803237.5965.13.camel@sauron>
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

Hi,

On Wed, 2008-04-09 at 15:39 -0700, Bruce_Leonard@selinc.com wrote:
> I asked about this a few weeks ago, came up with an alternative solution,=
=20
> but that solution came up against a 30% performance hit on accessing my=20
> flash, so we're back to a kernel change.  Let me recap a bit.  The issue =
I=20
> have is that I'm trying to put together a NAND flash driver for an 8GiB=20
> part.  The struct mtd_info->size field is a u_int32_t, which is not big=20
> enough to hold 0x200000000 (i.e., 8GiB).  The question I originally asked=
=20
> was "am I understanding this correctly and is it an issue for anyone else=
"=20
> and got the answer "it's either a bug or an enhancement depending on your=
=20
> viewpoint, patches welcome".

It is actually issue, just nobody was really eager to solve this.

> I know that just changing it isn't all that's involved.  I've alredy gone=
=20
> through some of the pain of changing 32-bit division to 64-bit shifts and=
=20
> masks.  A larger concern of mine is ripple effects.  I know that this=20
> field is referenced in a lot of places, most of which are pretty benign,=20
> and others that are less so.  A good example is in .../mtd/mtdblock.c=20
> where this happens: dev->size =3D mtd->size >> 9.  I don't know right off=
=20
> the top of my head what struct mtd_blktrans_dev->size is used for, but I=20
> can pretty well bet that a 64-bit value shifted right by nine ain't gonna=
=20
> fit.  So then this ripples into making changes to mtd_blktrans_dev.  Wow.=
=20
> This could end up going a long way.  Plus, I know there are a couple of=20
> drivers that make use of this field and I expect that if I make this=20
> change, I'll be responsible for makeing the changes to the drivers.=20
> However, I can't test those changes since I don't have the HW.  How is=20
> that going to be received by the community and the maintainers of those=20
> drivers?

What you should do is to talk to dwmw2, who is the original author of
this. I have not seen him in the mailing list for long time, but you
might talk to him at #mtd IRC channel at OFTC.

Vs.struct mtd_blktrans_dev->size, I am sure this is just size of block
device in 512-byte sectors. You may quite safely assume it should fit
32-bits I think. You may add a check even.

> So, as I said, I'm willing to tackle this, but I need to get a sense of=20
> how long it's going to take me.  I need an idea of how long it would take=
=20
> someone with experiance with MTD and I can then translate that (roughly :=
)=20
>  ) into how long it should take me.  I also need guidence on how to deal=20
> with things that I can't test.

My opinion on this is that the best way to address flash is
eraseblock:offset pair, not a 64-bit offset. Indeed, it is natural for
flash to consist of eraseblocks. And in opposite, it is not natural to
address as a 64-bit address. I mead, flash _does_ consist of
eraseblocks, why not to reflect this in the MTD interface?

What I would do is I'd invent a new interface with EB:offset addressing.
I'd preserve the old interface for the older stuff and wouldn't even try
to change them. I'd just turn the stuff I need to use the new interface.

Something like:

ret =3D mtd->read64(mtd, eraseblock, offset, buf, len).

But anyway, better talk to dwmw2, because he will accept/reject your
work :-)

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
