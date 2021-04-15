Return-Path: <SRS0=g3N+=JM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E7EC433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Apr 2021 08:29:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E02BF611AB
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Apr 2021 08:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E02BF611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OgqQknu30WEmEiS46e3+ng5pTt0pxvVkPbqYT45/s6o=; b=iKsOkYStqwE8zhwTX3wVauAqM
	2usCOxkyOGCquI0HLWYuipWFl0f3v5fkjXejFcH+d/mwdU6QbI2UfaSzHqrM9GQW95VSbr3jUEMPd
	7sp0onJZSAAS1tb7r0LGq8+VJ54U2wBwAassqeD7RPomr0tUwntYFRAit/8BCFApOgKhMB+a0J6/D
	v1T7C7u+GzGdJtv1Nlm4NEquGLzzlNrolESLyfXIyBxGfstKWBWxLAopB5FlciR1yvHs+C8xmO4s0
	T0CyOARiP6dOKL7ZU7vielY4Lpdix6yUDr6T4kZ1PeEE+YXcPe2w6oqOtJ79+uy7E7LcA1DDAr5wN
	SsbjFg2ZQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWxMN-00FLxN-S9; Thu, 15 Apr 2021 08:28:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWxMG-00FLv6-MM
 for linux-mtd@desiato.infradead.org; Thu, 15 Apr 2021 08:28:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7ThzKSBEscgyFL7BlDbMYI+gg7hmKU2tT8pbcfoQyHE=; b=HzEyMXABhMBDxFhhDqkkhtgpFz
 o7jAvNHLiCngLKaTQHFJuAXayAxmJwTgwT6XUBgY+vSnGlBeC0E9zG8UTBgXl6cmEmbWTmHPka7jP
 CU9lzNEKwwuEXc4mtVseBJ3g4aqsgml+wLhunwlDSGkIyQ4FQwDcQgkssnwzmC84H3tD4EXKGcfZl
 nrw3WIxhxl6rjMa1iakr8oFOIyy7yVp12fHSM9OcDOi/AaMbhr7VP77V0KZaYeS7iMCIGZ+x5vg1j
 pcjqFL/bkcbpmNYwRXSy2swR9ful57T2DDKH7bFa1LCNw4vffL5o7I010UxxVRvPo0bNonhChgi8a
 4zR5AZVg==;
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWxMD-008NIo-Cr
 for linux-mtd@lists.infradead.org; Thu, 15 Apr 2021 08:28:15 +0000
Received: by mail-pj1-x102f.google.com with SMTP id r13so7898645pjf.2
 for <linux-mtd@lists.infradead.org>; Thu, 15 Apr 2021 01:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7ThzKSBEscgyFL7BlDbMYI+gg7hmKU2tT8pbcfoQyHE=;
 b=EB5WyVh3ix9MZzij/IEz32LodRm5xEeK1ENaqom08i0kh1rewHwF9z0A4vVWYKymsi
 Glu4QXTEQN7vsCAVg01IngTM16ug60XF23mWdwSoX6iJLOti5trgUScCu+4NVS8ojABx
 KA2xohhZB06umkc1nu7I/1VyoibgwsaNaiZAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7ThzKSBEscgyFL7BlDbMYI+gg7hmKU2tT8pbcfoQyHE=;
 b=r1AdoiDN2UeoReBmSp6lsxHgzHjXqstLwnF0g/jKii6k1cncZwhPbLyj7AZncWoThs
 PWn2T002woQcmc18xaaBOHb5lBaf5VwOsa1vlFm28VtEH/07qUYYImG+2pXEYoB20KeC
 txS1sUXgeiwmLJ0soQTzV9r1eWYakGZrCvORdsNgTl2WnnTfj2y2IsgRtdclXLTHkjeC
 tig9MV/Tc0fIUtEw5o4gRAQH1RtvdzF3dFOCSHaBaZKlmXt3qi0wHC2dzod0+py3lhhL
 VGDWSXru47yd0dJvKbpTE4Tzkxx3G/SBQ6JhvgEw3/sw3MkUkEbk50m/RgGYPE3GshQu
 2K9w==
X-Gm-Message-State: AOAM531/9/hIQJEUgXe2pHPa5myLbKSzVCuzceQqJk6PyxFmA6z1N+XN
 qvu3aer8Vjy8Fr2gqblbsC36grGXUZmoRg==
X-Google-Smtp-Source: ABdhPJwufUFdH4CFK3f70UqzTpWzE+7CBPJ5GDsyRhkc++wi+UfbZRth4dUQsR/nEMP9EhXM9/e4lA==
X-Received: by 2002:a17:90a:7e8f:: with SMTP id
 j15mr2618938pjl.71.1618475291856; 
 Thu, 15 Apr 2021 01:28:11 -0700 (PDT)
Received: from chromium.org
 (2001-b011-30d0-100d-4ff9-30de-85ee-71cc.dynamic-ip6.hinet.net.
 [2001:b011:30d0:100d:4ff9:30de:85ee:71cc])
 by smtp.gmail.com with ESMTPSA id x30sm1675798pgl.39.2021.04.15.01.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 01:28:11 -0700 (PDT)
Date: Thu, 15 Apr 2021 16:28:08 +0800
From: Ikjoon Jang <ikjn@chromium.org>
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <p.yadav@ti.com>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: macronix: Add block protection support to
 mx25u6435f
Message-ID: <YHf5GBE+HAFoTDBo@chromium.org>
References: <20210413120210.3671536-1-ikjn@chromium.org>
 <51761f1db840c51bad17f5f275b4ce1a@walle.cc>
 <CAATdQgCYoeEKfvQPNUxzMA+o4Xwtt80SoMmfweTAB1MCijyC6A@mail.gmail.com>
 <a74478aa6fa248f6b6243366055ddd52@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a74478aa6fa248f6b6243366055ddd52@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_012813_480077_054FF275 
X-CRM114-Status: GOOD (  50.25  )
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

On Wed, Apr 14, 2021 at 12:53:24PM +0200, Michael Walle wrote:
> Hi,
> 
> Am 2021-04-14 08:53, schrieb Ikjoon Jang:
> > On Tue, Apr 13, 2021 at 8:26 PM Michael Walle <michael@walle.cc> wrote:
> > > Am 2021-04-13 14:02, schrieb Ikjoon Jang:
> > > > This patch adds block protection support to Macronix mx25u6432f and
> > > > mx25u6435f. Two different chips share the same JEDEC ID while only
> > > > mx25u6423f support section protections. And two chips have slightly
> > > > different definitions of BP bits than generic (ST Micro)
> > > > implementation.
> > > 
> > > What is different compared to the current implementation? Could you
> > > give
> > > an example?
> > 
> > Two chips have different definitions on BP and  T/B bits.
> > - 35f has 4 BPs without T/B, BP3 behaves like T/B bit.
> 
> See below.
> 
> > - 32f has 4 BPs plus T/B on CR.
> 
> Ok, so this scheme looks like what we have right now, only that the
> TB bit is OTP and at a different place, right?

yes, right.

> 
> > 
> > # MX25U6435F
> > 
> >  BPs | BP3=0 | BP3=1
> > ---------------------
> >  000 | None  | 1/2
> >  001 | 1/128 | 3/4
> >  010 | 1/64  | 7/8
> >  011 | 1/32  | 15/16
> >  100 | 1/16  | 31/32
> >  101 | 1/8   | 63/64
> >  110 | 1/4   | 127/128
> >  111 | 1/2   | All
> > 
> > # MX25U6432F
> > 
> >   BPs | T/B=0 | T/B=1
> > ---------------------
> >  0000 | None  | None
> >  0001 | 1/128 | 1/128
> >  0010 | 1/64  | 1/64
> >  0011 | 1/32  | 1/32
> >  0100 | 1/16  | 1/16
> >  0101 | 1/8   | 1/8
> >  0110 | 1/4   | 1/4
> >  0111 | 1/2   | 1/2
> >  1xxx | All   | All
> > 
> > It seems that 35f has a unique definition on bottom protections than
> > others.
> 
> Oh my.. That looks more like an invert and the top protection is also
> different. That is, if you'd treat BP3 as T/B, then BP[2:0] = 111
> should be "lock all", but it is rather lock half.. I just looked at
> the mx25u3235f back then. There it looked correct. But now it looks
> like the top protection scheme clips on the lower end (i.e. always
> starts with 1 block), where on the current supported scheme, we clip
> on the upper end (i.e. we start with protect all and walk backwards).
> 

Yes, indeed, but it's still confusing. :)

Now I'm thinking of adding a 'table' which maps between BP mask
and lock_len in swp.c, instead of ilog2() calculations.

> > Assuming there's no way to distinguish between mx25u6435f and 32f,
> > This patch simply takes the common parts only - BP[2:0]
> > without using T/B or BP3 at all.
> 
> You could look for differences in the SFDP and then distiguish them
> during probe and set the corresponding flags. Where the flags would
> need to be implemented first. I wouldn't have a problem with saying
> we just support top protection for the MX25U6435F but then we'd need
> to make sure the BP3 is set to 0.
> 
> If you want to read out the SFDP, see here:
> https://patchwork.ozlabs.org/project/linux-mtd/list/?series=235475

you're right, those chips have different values - JESD216 and JESD216B.

> 
> > But the current swp implementation implies that "BP with all ones"
> > is to be 'all' protection while in this approach it's 1/2,
> > A hidden BP3 should be involved for 'all' protection.
> 
> Yes, so the MX25U6432F needs to have the 4bit BP flag set and the
> MX25U6435F seems to be completely different. Doh..
> 
> > > > So this patch defines a new spi_nor_locking_ops only for macronix
> > > > until this could be merged into a generic swp implementation.
> > > 
> > > TBH, I don't really like the code duplication and I'd presume that it
> > > won't ever be merged with the generic code.
> > 
> > Agree, I hope I could make a more generalized version into swp.c.
> > 
> > Honestly I expected that I just needed to add one line of
> > SPI_NOR_HAS_LOCK
> > to flash_info to support mx256432f (this was the main purpose of my
> > patch)
> > before I read the datasheets. :)
> > 
> > > 
> > > You also assume that both the WPSEL and T/B bit are 0, which might not
> > > be true. Please note that both are write-once, thus should only be
> > > read.
> > 
> > yep, that also should be considered,
> > I'm thinking just not to support WPSEL=1 case for now.
> 
> which is ok, but we should make sure it is not set at all. Now the
> question is what do we do if it is set? I'd say just don't register the
> locking ops and log a message.
> 

So the my current rough plan to support macronix's HAS_LOCK is:

a. respin your patches supporting macronix TB (OTP + CR)
b. fix swp.c to have a mapping between BP_mask and lock_len
   (or similar approach) to support unlinear/assymetric protection levels of
   MX25U35F, instead of calling ilog2()
c. Distinguish MX25U35F and MX25U32F at runtime and apply flags
   only when WPSEL==0 && SFDP==MX25U32F
   set HAS_LOCK | OTP_TB | CR_TB | HAS_4BIT_BP.
   (it's the only MX25U32F I can test the new features for now).

I'm not so sure on b part although..

> -michael

Super thanks for the review!


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
