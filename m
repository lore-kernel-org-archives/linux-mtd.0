Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F90CF9C71
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 19:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+9w9GUF3Co6wnlea8Q722+KiZi+JDecK1W/+VZD2ZU=; b=XFQz3L1Pcg2KH3
	2FhD/4uojHABLEY06XLj5kTxeLSgrWZ3qlcXIDnGna3SgWVEgA98/0/KrDOusJtXkLSLiSLJZw1xr
	anFCI2iqtidlTIJQ+sJ2fCSIbY6OvUVllg07TlOTIKxYerVMtgLS68pjpKQoLj8BOClKNo1/+WdSr
	C911Gr1lXUvyougU1JykuBqtU3ZBeCW40Kyvk1Yt4pjnKbNmGt19li5aK+u0eOMWTYcv1c0pLyJfh
	MDmV5f9C2v39/HMm6ERPavvyrxCFPp9x9IRgCUipp/qtQGa+PH0iNBOCd62URQhuHCtc9FFLm7ypR
	7JhBHhaqUjzVmlkGBgHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssomJ-00000000MxG-35pL;
	Mon, 23 Sep 2024 19:31:23 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssomG-00000000MwW-46xp
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 19:31:22 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a83562f9be9so557506966b.0
        for <linux-mtd@lists.infradead.org>; Mon, 23 Sep 2024 12:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727119879; x=1727724679; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JvFm2ki9nIUnp2WwBMamty9rjZzUB1dJpgqUpdQxORc=;
        b=l0CZHl5KMz1uyYxB/C0Pmrz6t813+O3EWKeuk8VTaNoN1P832YM4MAVVcbvsa4aRlN
         01BCFoFXXS1NZFwhnsTJk8ZTQMDK+vcP99G3DCPJNFrr+4Apregzc3qkoXDchxHVF3Mt
         nLU/yzt1FFmtc2wDIIlnFfP01dCc1sUCtH+Iz4921xwSpLC6jsJJ9GzzI+EP0UwxkU8N
         HNvmRkefamqrvAUfAve6hNjKfaeG/io0qFqi3yi/Yh0PY49s65ACyyQN5kqR3q5X9T7U
         JFDt+4L6wl2lOuDr6G7+AhxOktNFsBMFMs/YRqoXoxpGyW/vcniy9/R3zltO8yr+v/7T
         sxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727119879; x=1727724679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvFm2ki9nIUnp2WwBMamty9rjZzUB1dJpgqUpdQxORc=;
        b=O8Jne3isOqZsJaFIv6Bgm6Y3OHc0vlZH8GBVftVrbXzBNIMKgtd5xXiRLOF+HlFPWB
         thJ5zE+V9GE0Zq3k08BLIfA5X0qVe3AT8KF370wuf+lIczGxoGeTtkIkppYPvHBb83f4
         1TAqp6brXWrxQ5+Xxes1bsCRyzd1NwKmFsynXdqn+T6uALOI5mBnll3bJ0xOigepXNBw
         RBeZcx01BZqaRGO90uDWvfdRAr6Y86xrSG0Zvgv0kLOLDpI1woCDky3OWuALz4OmnZoU
         82vrkzN9bX2jZEJoYxrM/tsfxkOFIbm0J3P+pCch0NmgHS2mzeA318kqO7MLvzik2a99
         V1qw==
X-Forwarded-Encrypted: i=1; AJvYcCV/Msg+iq1BGmER2BayeMnToG/pskrBEAsVwwi0z6+VMkszuMRfDw2EuMZXIVTqPlN+DApSir70XXU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw5Jo9BeLihiqkD0jSGANcjrEE5ZMvwoGYROp0kmfD1rGtbnPq
	npa55gRTS+GZNpFvuiYH5S1WefC/4rnzsC7i1LboN/KUmqPryJEJsQzTXwUUzWdxGPBQ3sM8DdM
	N4D1BemEb8f2RO40qRMmBoooJrw==
X-Google-Smtp-Source: AGHT+IGA1KOj/IV5yTLC+zun0hxtguIwmadLjnWwJCk7oStoobj3oho5giIf2no/+J9EZG8GSFPd3aUhBxXgkYbjke8=
X-Received: by 2002:a17:907:e25a:b0:a86:8832:2fb7 with SMTP id
 a640c23a62f3a-a90d4fe825bmr1174850166b.20.1727119878575; Mon, 23 Sep 2024
 12:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240920181231.20542-1-erezgeva@nwtime.org> <20240920181231.20542-2-erezgeva@nwtime.org>
 <4e0cf43c-4843-451c-ac6f-86775dbccb2b@linaro.org> <CANeKEMOmhAPM1j1_ihzcC2wL6jKsWXPCGfZs+euS8mRvtqgE5A@mail.gmail.com>
 <2c87568d-3caa-4162-91de-094684f1b268@linaro.org> <CANeKEMO4ckeJZHKEOKHVeamPzR045jpwkXWfJS9S6rBiMTayuQ@mail.gmail.com>
 <688d3e68-c339-4a44-b6b5-366dd5f12965@linaro.org> <CANeKEMNKF5WtVgzxbMnLFsqRHNOz=+gD-if8aBqsWwjgDvz3GA@mail.gmail.com>
 <ca2c03f7-0769-4b2a-b743-3ebda9e29755@linaro.org>
In-Reply-To: <ca2c03f7-0769-4b2a-b743-3ebda9e29755@linaro.org>
From: Erez <erezgeva2@gmail.com>
Date: Mon, 23 Sep 2024 21:30:41 +0200
Message-ID: <CANeKEMNdGvteumpvLHhDoiVoZwPJ4iOs+Ej8KDoXR9-Vz0-rvQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] mtd: spi-nor: core: add manufacturer flags
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Esben Haabendal <esben@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_123121_052176_E414F141 
X-CRM114-Status: GOOD (  62.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 23 Sept 2024 at 19:53, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
>
>
> On 9/23/24 3:51 PM, Erez wrote:
> > On Mon, 23 Sept 2024 at 16:18, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> cut
>
> >>> After reading a lot of Mactronix datasheets, I suggest also reading
> >>> all SFDP to all  Mactronix chips.
> >>
> >> Why? It seems too invasive. Generally it is not recommended to issue
> >> unsupported commands to flashes. Change just the flash that you use and
> >> can test.
> >
> > It is not, All Mactronix chips in the last 15 years have SFDP.
>
> This is false. I worked with an octal macronix flash that didn't define
> SFDP tables, mx66something.

I did not use the mx66XXX. Is it an SPI-NOR?
I would guess that mx66something you use is already obsolete.
Or marked by Mactronix as 'not recommended for new HW'.
It might be used by a big customer using the HW for a long time.


>
> > The chips in the manufacturer compatibility table are all obsolete.
> > Mactronix reuse the JEDEC IDs. There is no point pretending these are
> > the same chips.
> >
>
> If macronix doesn't care about backward compatibility, we/I do, and we
> can't break it.

As I said, I do not ask you to do that.

I do not represent Macronix, so I can not speak in their name.
My conclusions are based on examining their datasheet.
I did ask their technical representor.
The only straight answer I got from the technical support is
that you can not derive OTP configuration based on JEDEC ID/SFDP,
and you must know what chip you use.

>
> >> cut
> >>
> >>>> Which flash do you have at hand, both, none, just one of them?
> >>>
> >>> When I started working on the OTP code, I used MX25L12833F.
> >>> But later I left the company.
> >>> So I use my beaglebone black and connect it to a MX25L3233F.
> >>
> >> I understand mx25l12805d and mx25l12833f share the same ID. How is
> >> mx25l3233f related, does it share the same ID as the previous two?
> >
> > They are not. I just replaced the company hardware with a different one.
> > You ask me to report the hardware I use for testing.
>
> So MX25L3233F does not share the same ID as MX25L12833F and mx25l12805d?
> Then why do we talk about ID reuse?

I replaced the hardware I use.
Most of the reused IDs are of old chips, usually obsolete, not selled
or not recommended for new HW.
So the chance to use 2 new chips with the same ID is limited.

I respect the fact you want to keep backward compatibility.
I just extend the approach to OTP parameters.
If an old chip with the same JEDEC ID uses different OTP parameters.
We will break backward compatibility with this old chip.

> >
> > The patch covers the one I use with beaglebone black.
> > I just mentioned the OTP callbacks are per manufacturer.
> > But if a new chip in the future would require different callbacks,
> > then just add them.
> > My patch is using a single chip, the one I send the testing with.
> > beaglebone black + MX25L3233F.
>
> Sounds good.

+

>
> cut
>
> >> I said new compatibility will be introduced as a last resort only if we
> >> can't differentiate the flashes at run-time. You haven't proved me yet
> >> that this is the case.
> >
> > Then you do not read my explanation.
>
> What explanation? I've read your cover letter, commit message and I
> didn't understood what you're trying to achieve.

This is on me.
I'll try harder with the cover letter.
I apologize.

>
> > Do you wish me to send the Macronix datasheet of the 4 chips?
>
> No, I need just a paragraph where you explain what are the challenges
> and how you want to address them.

+

I try to explain that we can not based on JEDEC ID + SFDP to figure
out the correct OTP parameters.
This is also the only straight answer from Maxtronix I got.



> >
> >>
> >>> You ask if it is possible to deduce it from JEDEC ID and SFDP,
> >>> I answer that this is not possible, at least in some cases..
> >>
> >> I'm interested just about your case, not all the possible cases.
> >
> > Actually it is the MX25L3233F and its previous chips.
>
> Which previous chips? Do you have any such chip at hand? If not, why are
> we talking about collisions?

JEDEC ID 0xc22016
MX25L3205D - No SFDP, 2 OTP  regions of 128-bit, 384-bit, Status:End of Life,
Recommended Product MX25L3206E
MX25L3206E - support SFDP, 2 OTP  regions of 128-bit, 384-bit, Status:
Not recommend for new design Recommended Product MX25L3233F
MX25L3233F - support SFDP, 1 OTP region of 4096-bit, Status Production

JEDEC ID 0xc22017
MX25L6405D - No SFDP,  2 OTP  regions of 128-bit, 384-bit, Status: End
of Life, recommend Product MX25L6406E.
MX25L6406E - support SFDP, 2 OTP  regions of 128-bit, 384-bit,
Status:Not recommended for new design,
Recommended Product MX25L6433F.
MX25L6433F - support SFDP, 2 OTP regions of 4096-bit, 4096-bit, Status
Production.

JEDEC ID 0xc22015
MX25L1606E - support SFDP, 2 OTP  regions of 128-bit, 384-bit,Status:
Not recommend for new design,
Recommended Product MX25V16066
MX25V16066 - support SFDP, No OTP. Status Production.

The older chips with the same JEDEC IDs are at end of life or not
commended for new design.
But if we talk about backward compatibility, we can have them on old Hardware.

I think that I miss a chip in the list, I remember finding 4 chips
with the same JEDEC ID.

>
> > Anyway, I will not submit a broken solution.
> > Whether you like the idea or not.
> >
>
> Fine by me.

+

>
> cut
>
> >>>>> I told you we can not "guess" OTP settings based on JEDEC ID and SFDP existence.
> >>>>
> >>>> When? And more importantly, why?
> >>>
> >>> I send you example of 3/4 chips that using JEDEC ID and SFDP existence
> >>> is not enough.
> >>
> >> Why? Do they have the exact SFDP tables? Prove me, drop them all.
> >> Any bit that differs in the SFDP tables is enough to differentiate the
> >> flavors of flashes. Vendor tables included ;)
> >
> > Because the SFDP is not related to OTP in any way.
> > You are planning to decide OTP parameters on non relevant information.
> > If you wish to implement such a broken feature, you are welcomed.
> > I'll pass.
>
> Ideally we have a single jedec,spi-nor compatible. If there are flash ID
> collisions we try very hard to differentiate the flashes at run-time.
> New compatibles are introduced only if we can't differentiate the flavor
> at runtime (be it by parsing SFDP or some other way).
>

All I say is that it is a dangerous approach to deduce in this way.
Macronix does not care about breaking, they might introduce new chips
with different SFDP.
They usually do not sell new chips with the same JEDEC IDs. but apart
from that, we can not rely on any assumption.

I can understand if you say that you do not wish to go into this mess.
But indirect probing based on JEDEC ID + SFDP is a risk, I don't think
we should take with Macronix.


> cut
>
> >>>> And I think I already said that you can differentiate between the two
> >>>> based on SFDP presence. mx25l12833f has SFDP, thus when SFDP present use
> >>>> the mx25l12833f-OTP configuration. When SFDP is not presence one may add
> >>>> support for the mx25l12805d-OTP configuration.
> >>>
> >>> No, we have 3 chips.
> >>> 2 are using the same JEDEC ID and both using SFDP, yet they use a different OTP.
> >>
> >> Which ones are these?
> >>
> >> I guess mx25l12805d is non-SFDP. Then mx25l12833f and mx25l3233f define
> >> some SFDP tables. Do mx25l12833f and mx25l3233f have the same OTP
> >> organization?
> >
> > No, that is the point.
> >
> ? Do you care to explain?

The point is that you can not predict OTP based on JEDEC ID + SFDP.
It seems as if Macronix does the OTP in parallel.
See the list above.

>
> cut
>
> >
> >>>
> >>>>
> >>>> Is there any case that I miss?
> >>>
> >>> According to your reply, I would say pretty much most.
> >>
> >> This is again inappropriate ... I will read your next email as well, but
> >> I'm not going to tolerate such replies anymore.
> >
> > I agree on this one.
> > Seems you are looking for something I do not agree on.
>
> Michael disagrees with OTP being specified in DT too. We both already
> suggested how to deal with flash ID collisions but you keep ignoring us ...

I apologize, but I do not insist on DT.
Any solution that configures OTP regardless of JEDEC ID + SFDP is OK by me,
I am open to testing and submit a patch accordingly.


>
> > This is not because I oppose probing,
> >  this is because you ask for indirect probing, against Macronix own
> > recommendation.
>
> What did macronix exactly recommend? Did they say that we shouldn't
> interrogate the SFDP data in order to differentiate the flashes at
> run-time? If yes, why is that?


I forward the reply from Holger Schulze, Field Application Engineer,
Macronix Europe N.V. I received on the 3 Jul.

I ask:
"But the OTP setting is not in the SFDP.
How can we know which OTP size and number of regions to set?"

And the reply:
"You are correct, the OTP setting is not defined in the JEDEC spec for
the SFDP table. The only way is to refer to the data sheet."

Thanks for your feedback
Erez Geva

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
