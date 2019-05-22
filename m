Return-Path: <SRS0=Q6Kj=TW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D5EC282CE
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 21:35:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F29120863
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 21:35:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Izx/AfxW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VixhObCS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F29120863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ausv/oDlz/lHPNik0leIhjroo2yzojT+b/P25ucJfvA=; b=Izx/AfxWQP4TJq
	ZDkzWtI6xKRC6O0BDDy7PyLmNQBmupEJEPrp77io9V6neIBY5hBtGcxQi70EoDJcplYKbqQSYS30N
	W7n8qrw7Pha5qKenjBt0ylgSkBpgeLX0aPR3IDrrRaN0XbqAE2ik54ifvUGCvjVVzHCLE4LJJUi9b
	a7NBqk1EDSSy0JgISrxdUCUUhTsXPbs/OVLPlYeUO5wWWDfIW6y4ZgW6bwXBMiywqfXcoQ3WklYCn
	cpLqzQTNhkDX/9gLvygl7kDjO6zieqonGoIeyGqPpWHv68cfNCA2GF/7RAqv/asUy6KrcKYWMNe/3
	8jCiNuZ9Y0zXfpX8YqNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTYta-00034g-Iu; Wed, 22 May 2019 21:35:34 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTYtX-00033y-6U
 for linux-mtd@lists.infradead.org; Wed, 22 May 2019 21:35:32 +0000
Received: by mail-wr1-x444.google.com with SMTP id d9so3931140wrx.0
 for <linux-mtd@lists.infradead.org>; Wed, 22 May 2019 14:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CB47ddRrKNWzkvlQMhShBURKZepRSv/MUuWiHjNrhfA=;
 b=VixhObCSPbWyKqLO1CMmQvg2SVLU6ChlVUtMUAF1lP4n2Nn4PM/AAenNz1sRbSWpvi
 bCb3FHCGyTmwCRzy88Je5DbLF4WfH6xMTHIObnbLMTnY0OCIEz4PuVNiPtMAw9e2CeHZ
 7aksMNx3MDFrvNGSh9hjfNT4ouy9uLzmHR8VeRyU4JKylcuW2ByOpdBFyFQjn61sDc2R
 AozjR1dBbvnGfPrZBw2r6TmGy3oTutj/hfw1NgfoHA7sLvp5PUuCNqE7k93J407Tg/EW
 HKT2THdPzBPRkizuRovFB+O+D1w+Tjn8WT+A7RMt278syNd2ag7WFBPAmRKeGbrrGlU2
 fzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CB47ddRrKNWzkvlQMhShBURKZepRSv/MUuWiHjNrhfA=;
 b=qE9XBOnCAsYNBuqoEO9+7JZY6hluLDhmfTbRt4fJgBfyl5ws/HGep0hm6TInhTAwJ1
 F0gwycSgBiwdna5AfXU4/vg6wE17QtyG3jXsEbpR5c52CS0knijmlR3dP5UDy+bGQcIB
 n7v4VNWJ7ElKHuRzwXLwJlloj0/mcJ3qovTdIm7t4Onl3c7BwJ+ucmAZ6vJd6xzJ8PGq
 NkjvxuJyIfEpLaAVU/ZiToT+5UEfJXTrjwqR9XyWurYqFSxZYC0wsBPb8zGWdGvsN0Ji
 1qRsPFa7rheL7OUwjC5yAIpaaLNyHX1JFRMkbti8xygsrFBuRSjzpK8Mkf2cjjpxXRBF
 KnSQ==
X-Gm-Message-State: APjAAAWwC7wxau1M/BQ0A83JJl3xbuULZiVXJraZqjUancOVa6YAUO4b
 UDGJOzyF1v22Y2qARWPy90q/tLTqrFMtJNwN568=
X-Google-Smtp-Source: APXvYqz/54mDVZbKDP50tur8ClqpWHv3gxaKzRHbKKYmLEG/GgnlwoERxevEQsbttDHewjRiEY6hB88Em886jLOpcck=
X-Received: by 2002:a5d:69cf:: with SMTP id s15mr44438901wrw.75.1558560929456; 
 Wed, 22 May 2019 14:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190522000753.13300-1-chris.packham@alliedtelesis.co.nz>
 <20190522000753.13300-2-chris.packham@alliedtelesis.co.nz>
 <CAFLxGvy2c9KV1CyoFaD76jvThfPiotqfoeNchqjGcDp+uHie7Q@mail.gmail.com>
 <0c59bcd6c866429cb9727f787b7f61ce@svr-chch-ex1.atlnz.lc>
 <CAFLxGvwRnBtscaJDQ4qYGpQt87+amKYb4vBJvtt-3BmsOorL_g@mail.gmail.com>
In-Reply-To: <CAFLxGvwRnBtscaJDQ4qYGpQt87+amKYb4vBJvtt-3BmsOorL_g@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 22 May 2019 23:35:18 +0200
Message-ID: <CAFLxGvxGCKi1HH_7tit4ykQDJGm9t6Gt8pz7LTCZZ8G4J8sOhw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: concat: implement _is_locked mtd operation
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_143531_244030_4AC3F4A3 
X-CRM114-Status: GOOD (  27.15  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, May 22, 2019 at 11:26 PM Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> On Wed, May 22, 2019 at 11:06 PM Chris Packham
> <Chris.Packham@alliedtelesis.co.nz> wrote:
> >
> > On 23/05/19 8:44 AM, Richard Weinberger wrote:
> > > On Wed, May 22, 2019 at 2:08 AM Chris Packham
> > > <chris.packham@alliedtelesis.co.nz> wrote:
> > >>
> > >> Add an implementation of the _is_locked operation for concatenated mtd
> > >> devices. As with concat_lock/concat_unlock this can simply use the
> > >> common helper and pass mtd_is_locked as the operation.
> > >>
> > >> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > >> ---
> > >>   drivers/mtd/mtdconcat.c | 6 ++++++
> > >>   1 file changed, 6 insertions(+)
> > >>
> > >> diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
> > >> index 9514cd2db63c..0e919f3423af 100644
> > >> --- a/drivers/mtd/mtdconcat.c
> > >> +++ b/drivers/mtd/mtdconcat.c
> > >> @@ -496,6 +496,11 @@ static int concat_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> > >>          return __concat_xxlock(mtd, ofs, len, mtd_unlock);
> > >>   }
> > >>
> > >> +static int concat_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> > >> +{
> > >> +       return __concat_xxlock(mtd, ofs, len, mtd_is_locked);
> > >> +}
> > >
> > > Hmm, here you start abusing your own new API. :(
> >
> > Abusing because xxlock is a poor choice of name? I initially had a third
> > copy of the logic from lock/unlock which is what lead me to do the
> > cleanup first. mtd_lock(), mtd_unlock() and mtd_is_locked() all work the
> > same way namely given an offset and a length either lock, unlock or
> > return the status of the len/erasesz blocks at ofs.
>
> Well, for unlock/lock it is just a loop which applies an operation to
> a given range on all submtds.
> But as soon an operation returns non-zero, the loop stops and returns
> that error.
> This makes sense for unlock/lock.
>
> Now you abuse this as "apply a random mtd operation to a given range".
> So, giving it a proper name is the first step. Step two is figuring
> for what kind
> of mtd operations it makes sense and is correct.
>
> > >
> > > Did you verify that the unlock/lock-functions deal correctly with all
> > > semantics from mtd_is_locked?
> > > i.e. mtd_is_locked() with len = 0 returns 1 for spi-nor.
> > >
> >
> > I believe so. I've only got access to a parallel NOR flash system that
> > uses concatenation and that seems sane  (is mtdconcat able to work with
> > spi memories?). The concat_is_locked() should just reflect what the
> > underlying mtd device driver returns.
>
> mtdconcat *should* work with any mtd. But I never used it much, I see
> it more as legacy
> code.
>
> What happens if one submtd is locked and another not?
> Does concat_is_locked() return something sane then?
> I'd expect it to return true if at least one submtd is locked and 0
> of no submtd is locked.

BTW: Meant overlapping requests. If it targets always only one submtd,
it is easy.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
