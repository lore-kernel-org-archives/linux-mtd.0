Received: from mail-yw0-x229.google.com ([2607:f8b0:4002:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aieoZ-0000jf-0U
 for linux-mtd@lists.infradead.org; Wed, 23 Mar 2016 09:10:55 +0000
Received: by mail-yw0-x229.google.com with SMTP id g3so10851026ywa.3
 for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2016 02:10:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160323100059.64ad9bb3@bbrezillon>
References: <1458687254-26181-1-git-send-email-zajec5@gmail.com>
 <20160323100059.64ad9bb3@bbrezillon>
Date: Wed, 23 Mar 2016 10:10:33 +0100
Message-ID: <CACna6rywp2ONxNQ3a+rw-2tujQAqZePq=Z6grDDqCX1dNjm+5A@mail.gmail.com>
Subject: Re: [PATCH 0/3] mtd: nand: add enum nand_ecc_algo
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 23 March 2016 at 10:00, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Tue, 22 Mar 2016 23:54:11 +0100
> Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
>
>> Some time ago I started working on a new "nand-ecc-algo" property to all=
ow
>> specifying ECC algorithm for hardware ECC mode as well.
>> Boris pointed out it's becoming a bit messy that way as we already have =
value
>> NAND_ECC_SOFT_BCH.
>> I suggested deprecating "soft_bch" value from nand-ecc-mode property and=
 got
>> Boris agreed and no objections from others. So there is how I want to im=
plement
>> this.
>> If you agree on this way & apply my patches, I'll start modifying NAND d=
rivers
>> (similarly to the nandsim) and then will try to drop NAND_ECC_SOFT_BCH e=
xcept
>> for handling backward compatibility.
>> Then finally we should be able to add "nand-ecc-algo" property support p=
roperly.
>
> I agree with patch 1 and 3, but I think we should create an
> of_get_nand_ecc_algo() helper right now instead of relying on the
> ecc->mode value to set ecc->algo (I'm referring to patch 2).

Thanks for the review!

I wanted to avoid adding support for "nand-ecc-algo" at this point.
This would result with setting ecc.algo which isn't used yet, so this
could be confusing.
However I agree with your point that adding this magic code to
nand_dt_init, just to replace it with of_get_nand_ecc_algo in the
future isn't too clever.

I'll send V2 soon, let's see if will agree on its implementation.


> This way you'll be able to completely drop NAND_ECC_SOFT_BCH value when
> all drivers have been patched.
> BTW, even if we deprecate the DT property, we still have to support the
> old format, so this extra "nand-ecc-mode" parsing will remain anyway.

This is what I mainly meant in "then will try to drop
NAND_ECC_SOFT_BCH except for handling backward compatibility" :)


> And has already said ealier, I think we should also move the ecc layout
> info somewhere else, and only leave ECC_NONE, ECC_HW and ECC_SOFT in
> nand_ecc_modes_t enum. I'm not asking you to do that though, just
> clarifying the separation I'd like to see ;).

Ack, hopefully I'll find time for this later.

--=20
Rafa=C5=82
