Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A75C61DB9
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2026 09:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDAxvT8oQqbiM7YaC+88bDmyTM//wJihZQeoD3O4JTo=; b=p//VSljLPg2ENiKmh1mzGLgZw0
	aVtnBKeX4a8FnMIRnXzxEIhHMjRc+e38T9CU7G7RNSqgRT0L7bIvYXmOMitRGOapuL0GRxV+5/K8J
	Gc8zdW4fhptrjkFvyluOYhNrg31M9BLDZh+7NjfqqlHyM8EX5ugoOqsgbqCmwY699O9ruuBV1Z7+N
	mEWe3kmXHvIVLAR+IkKfyevm7FVnb9yvTZ1s04j3X1loMjxoSZmm1Ko6owFjc+w/GI6wX8zfM115h
	V9nuvUMUE4HRdzXbOLKItakgvjg8sPSdoZXQIYWHPp9rAZ4KzYU5HcmtWLoP0IeT1wbTtsfUfi8YC
	AxxNS3Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzt7K-00000005V5Z-0Kzc;
	Fri, 28 Aug 2026 09:43:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzt7H-00000005V4l-3150;
	Fri, 28 Aug 2026 09:43:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id BE34D601F7;
	Fri, 28 Aug 2026 09:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id EBA021F000E9;
	Fri, 28 Aug 2026 09:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787910198;
	bh=qogLoGmFv6tocje82oJkKxbcnqoMjaxJY9c0i9BIqcw=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To;
	b=I2Gu/qWkkcR2RoJOMgYzU6XubSEm4wIrBa66HVtZRCym/wT146j8xOX+m0m57WK/y
	 bww1u0lwJLyktD6OZ7vGtcRDIvfxf2YlTRxCuKGV+1TkShICPw9Wz8o0sws7Yqx8fD
	 Bg16vCYDqtDgiGMIf7QnvHNHbMCqCdxonoKiZokZimHbyAtcNPCRPHea75Vyf3gHOl
	 KDKAw3LtRd+Lyj/3o0n1yTJhLRkdLRCpxBCD/90QdB2WWUU/SfkSWv684ubmAMLZQV
	 pU9k0ah43VnBCNUju1aod2vk2Z6BGKDt/8Tfg9+61HobCikXMXlYgFY/7wlAbPjsZ7
	 uF2fuxxT4j8nQ==
Mime-Version: 1.0
Date: Fri, 28 Aug 2026 11:43:06 +0200
Message-Id: <DL0H9KX4K3UI.145TKS5XKPFEI@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "Steam Lin" <STLin2@winbond.com>,
 "Hsin-Yi Wang" <hsinyi@chromium.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 05/23] mtd: spi-nor: Create the concept of fixup
 table with match function
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-5-b637cf120d5c@bootlin.com> <DKOKFU8AD2U6.151AX0VOBX67H@kernel.org> <87cxv3cy5j.fsf@bootlin.com>
In-Reply-To: <87cxv3cy5j.fsf@bootlin.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4236554437032926818=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4236554437032926818==
Content-Type: multipart/signed;
 boundary=62e2f0f3f151d5d11bc87179aee71813d79cf26cb4ac240fd7ceef9cc952;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--62e2f0f3f151d5d11bc87179aee71813d79cf26cb4ac240fd7ceef9cc952
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Aug 27, 2026 at 6:43 PM CEST, Miquel Raynal wrote:
> I took me a lot of time to go through all your requests, in the end I
> will not implement most of your feedback because either I do not
> understand what is the gain, or because the result is not better at all
> from my point of view. I try to explain that in my feedback
> below. Nevertheless, I truly appreciate the deep review you made. I
> think I mostly agree with the comments in the other messages.
>
> On 14/08/2026 at 11:40:21 +02, "Michael Walle" <mwalle@kernel.org> wrote:
>
>> On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
>>> Manufacturer ID tables increase and fixup() hooks proliferate. Having
>>> one possible structure per chip was fine until the fixups started being
>>> more and more common and needed, to some extend due to ID reuses. Mixin=
g
>>> fixups and chips becomes hard and requires extra helpers to sort which
>>> ones are needed for a given chip, which every time this happens require=
s
>>> a lot of rework.
>>
>> Thanks, this patch looks really promising!
>>
>>> Replace the two-level fixup association (a manufacturer wide hook and a
>>> per flash_info hook) with a per-manufacturer list of fixups that can be
>>> looked up by flash ID and/or match function.
>>>
>>> The match logic works as follows:
>>> - If there is an ID, it must match
>>> - If there is a match function, it must match (cumulative)
>>> - If there is no identifier (no ID nor any match function), it's a
>>>   catch-all entry typically used for flagging manufacturer fixups.

I think this one is the crux. See more below.

>> This mimics, how it's currently handled. But since the fixups are
>> now treated as a separate list, i.e. it has it's own SNOR_ID, we
>> shall move away from this manufacturer thingy too.
>
> Why shall we? See below, I don't get the point. I drafted something it
> took me two full days to work on that, to eventually realize I did not
> see *any* benefit.

Then let me ask the other way around, what is the benefit of having
the manufacturer?=20

There is now one central place for the fixups. Good. But now there
is that catch-all thing, which is the replacement for the former
manufacturer fixup if I read your code correctly.

BUT. We don't have a concept of a 'manufacturer'. We don't match the
manufacturer id. The manufacturer is just set as an additional
information if there is already  matching entry for a specific
flash, so we already know the exact part. Before the generic driver,
this might have made sense. The intention was to have a common place
for the default flags for all *known* flashes of a manufacturer
(which probably also was the result of the core rewrite). But now,
we might have flashes we do not know, that is, aren't in the
database. At least I would assume, that the manufacturer fixups are
still applied though. There were already a few different times I
proposed to have fixups for SNOR_ID(vendor_id).

I mean, even you fell into the trap that you'll have to have that
catch-all/fallback entry in the flash db (can't find the mail
anymore though, so please correct me if I'm wrong).

Also, having the fixups separate from the flash db, we can use the
generic flash driver and still have some fixups for given flashes.
If - for example - one would be adding locking support later,
nothing but the new flashdb entry has to be added as the fixups are
still applied.

>> IMHO that really
>> clutters the code.
>
> Clearly an opinion I do not share. Maybe I am missing something.
>
>> As a fun fact, spi_nor_match_id() will have the
>> unexpected side effect of setting nor->manufacturer.
>
> Not sure I get why this is unexpected?

The signature of the function is:
static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
						 const u8 *id)

Clearly it will return a pointer to the flash_info entry for a given
id. But as a side effect it also sets nor->manufacturer. What if I'd
call that twice with different ids? Maybe it's just me, but it looks
like a pure function but isn't. I probably got burnt by the generic
nor driver which hit that in the first place.

>> So here's how I'd do it:=20
>> (1) remove spi_nor_manufacturer.
>> (2) have a list of initcalls in the core to call into the individual
>>     vendor modules (that could later be replaced by something more
>>     sophiticated)
>> (3) that initcall will then call spi_nor_register_parts(const struct
>>     flash_info *parts, int nparts)
>> (4) (optionally) calls spi_nor_register_fixups(const struct
>>     spi_nor_fixup *fixups, int nfixups)
>
> I've been trying hard to follow your approach, but really, I don't get
> the point. Initcalls are not possible here, or it would prevent
> CONIFG_MTD_SPI_NOR=3Dm so I went for an alternative approach with an init
> registration which I believe matches your expectations. This is not
> an actual problem.
>
> But registering parts and fixups independently, maybe, but again, why?
> What is the intended benefit? We now need to go through 96 (spi-nor
> wide) fixups. But what do we get in exchange?

I don't get that. You already have a (new) winbond_fixups[] for
example. What is the difference between having that set in
spi_nor_manufacturer vs having that in a

winbond_init() {
	spi_nor_register_flash_devices(&winbond_nor_parts);
	spi_nor_register_fixups(&winbond_fixups);
}

And probably setting the manufacturer name in winbond_nor_fixups().

I guess that all falls apart because of the empty match entry. That
could be replaced with the SNOR_ID(winbond_id), though. Then we have
*real* per manufacturer fixups.

That is basically what commit afe1ea1344bb ("mtd: spi-nor: add
support for Macronix Octal flash") made.

> From my point of view:
> extra churn and boilerplate, nothing particularly better than before. I
> must admit, I do not understand your aversion for the manufacturer
> structure. So while I like the idea of a flash-info independent fixup
> list (which I implemented in v3), I do not understand the need for this
> extra step.

See above.

> Since I do not get the point of this request, I prefer to not implement
> it, because I will anyway do it the wrong way. If someone wants to make
> a proposal, I will have a look, but at this point I need to back
> off.

I can do that myself, but I'd like to avoid any code churn. So I
don't know what you've already tried to come up with, but if there
is something which somewhat goes in the right direction of moving the
registration to a function inside of the vendor modules. That would
really be appreciated.

> There are already ~70 patches pending which I hope will be applied
> ASAP after -rc1 gets tagged and we agree on the remaining points (there
> are other comments from you and Takahiro which I need to address).

Looks like I need to apply the patches to the tree, too. Honestly,
I've never done that, so I first need to actually see how it's done
and if I even have access to the tree.

>> Also both could be a macro, then we can get rid of the size
>> argument.
>>
>> The current manufacturer fixups gets registered with a
>> "SNOR_ID(vendor)".=20
>>
>> That leaves us with the manufacturer name, which should be set by
>> that vendor catch all fixup.
>>
>> Btw, I'm fine with deprecating the name as well as the manufacturer
>> sysfs entry, but it shouldn't be as in "it just goes away".
>
> I have no strong wish to get rid of those, especially the manufacturer
> name which is not particularly problematic today.
>
> [...]
>
>>> +	for (i =3D 0; i < nor->manufacturer->nfixups; i++) {
>>> +		if (fixups[i].fixups->post_bfpt &&
>>> +		    spi_nor_fixup_match(nor, &fixups[i])) {
>>> +			ret =3D fixups[i].fixups->post_bfpt(nor, bfpt_header, bfpt);
>>> +			if (ret)
>>> +				return ret;
>>> +		}
>>
>> This is repeated several times, can we have something like
>>
>> spi_nor_apply_fixups(struct spi_nor *nor, int (*fixup_fn), void *fixup_a=
rgs);
>>
>> int spi_nor_post_bfpt_fixup(struct spi_nor *nor, const struct spi_nor_fi=
xup *fixup, void *_args)
>> {
>> 	struct post_bfpt_fixup_args *args =3D _args;
>>
>> 	if (!fixup->post_bfpt)
>> 		return 0;
>>
>> 	return fixup->post_bfpt(nor, args->bfpt_header, args->bfpt);
>> }
>>
>> which then will be called with
>> spi_nor_apply_fixups(nor, spi_nor_post_bfpt_fixup, args);
>
> I drafted it, but arguments are different, argument numbers are
> different, return values are different, we need stubs for each
> fixup... Nothing is identical, we just save a couple of simple checks
> and a for loop. On the other hand, code just grows, complexity is
> higher, readability is definitely lower. Sorry, but again, I do not see
> the gain with this attempt, it just darkens what the core does. It would
> definitely work with another -more advanced- language than C, though.
>
>>> +	for (i =3D 0; i < nor->manufacturer->nfixups; i++) {
>>> +		if (fixups[i].fixups->post_bfpt &&
>>> +		    spi_nor_fixup_match(nor, &fixups[i])) {
>>> +			ret =3D fixups[i].fixups->post_bfpt(nor, bfpt_header, bfpt);
>>> +			if (ret)
>>> +				return ret;
>>>  	}
>>> =20
>
> [...]
>
>>> --- a/drivers/mtd/spi-nor/gigadevice.c
>>> +++ b/drivers/mtd/spi-nor/gigadevice.c
>>> @@ -64,7 +64,6 @@ static const struct flash_info gigadevice_nor_parts[]=
 =3D {
>>>  		.id =3D SNOR_ID(0xc8, 0x40, 0x19),
>>>  		.name =3D "gd25q256",
>>>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
>>> -		.fixups =3D &gd25q256_fixups,
>>>  		.fixup_flags =3D SPI_NOR_4B_OPCODES,
>>
>> The fixup_flags should also go into the fixups list.
>
> Yes, we can use a similar logic here. Actually if at some point we want
> to get rid of those flags, we could transform the flags into proper
> fixup functions, but I'm not going to do that now.

The flags actually serve the purpose of *not* having a huge amount
of different fixup functions. So these should be kept for now. As an
alternative, with the new list it might be possible to have multiple
fixups for the same flash part. In any case, the fixup_flags have to
be removed from the flash_info struct.

>
> [...]
>
>>> +/* PM25LV parts have no JEDEC ID and are likely matched by name */
>>> +static bool issi_pm25lv_match(const struct spi_nor *nor)
>>> +{
>>> +	const char *name =3D nor->info ? nor->info->name : NULL;
>>> +
>>> +	return name && !strncmp(name, "pm25lv", 6);
>>
>> Won't just strcmp("pm25lv", name) do it? Both arguments are
>> guaranteed to be NUL terminated. The above would also match
>> "pm25lvextrabytes", no, and we get rid of that redundant size
>> argument.
>
> No it won't, because that would no longer be a match, you would compare
> pm25lv against pm25lv010 or pm25lv512 -> no match if you don't limit to
> the first 6 bytes. Since names are part of the sysfs ABI, we cannot just
> modify the names for that. We also need two different entries (two
> different sizes) since we do not even match with an ID.

Ah I see, you actually *want* that extra bytes, in that case, please
use strstarts().


> [...]
>
>>> @@ -233,6 +230,17 @@ static int mt25qu512a_post_bfpt_fixup(struct spi_n=
or *nor,
>>>  	return 0;
>>>  }
>>> =20
>>> +/*
>>> + * n25q00a parts share the first same 3 ID bytes with mt25qu01g.
>>> + * In order to not mix the fixups, further filter out using the part n=
ame.
>>
>> How would that work? The part name is also set by the duplicated ID,
>> so the first one wins, no?
>
> - First part (mt25qu01g) is checked
>   -> ID match
> - There is a match function where we compare the name with n25q00a
>   -> no match, not applying the fixup
>
> - Second part (n25q00a) is checked
>   -> ID match
> - There is a match function where we compare the name with n25q00a
>   -> name match
>
> The fixup is only applied for n25q00a.

Ah, I now get what you want to try to achieve. Only the first three
bytes (I missed that in the function doc) are shared. So no actual ID
collision.

> For the other chip we can just give more ID bytes for the match.

Giving there are more IDs for the n25q00a.

> So I believe there is no problem here?

Yes, no problem. But use strncmp() here, because this actually
matches just one particular flash.

FWIW I don't think this is sustainable, though. It's basically a
workaround for the different matching in spi_nor_match_id() (first
entry wins) and the fixups ID matching (any matching entry is
applied). Though, I can't think of a more generic solution for now.

-michael

--62e2f0f3f151d5d11bc87179aee71813d79cf26cb4ac240fd7ceef9cc952
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCapFYKxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/i25QF/c4P4bWZypw8ZyqO3HWcEDjUwnnnWq0Jg
sb2Fz/Dmz2n+gqkV4LwzRiolzzQXCEGsAX96v2xv0jhKb7+rRP0EcjoZl0odZZ1z
Bdx5NsrBdpU8oTZcZrVlexWNut37ldohD7Q=
=Bs1E
-----END PGP SIGNATURE-----

--62e2f0f3f151d5d11bc87179aee71813d79cf26cb4ac240fd7ceef9cc952--


--===============4236554437032926818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4236554437032926818==--

