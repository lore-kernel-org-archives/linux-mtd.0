Return-Path: <SRS0=s9Jc=V2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AE8C7618B
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 11:23:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C19E2067D
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 11:23:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gMrx+320";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVgt5oMZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C19E2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zfT1COATHJWJHJhRZj2J4pGboqU3MPheWYmZAYarJOg=; b=gMrx+320a2v7j6
	N16B2hFfuHeu+T1Uke5p6iMsnDTmB64TyainDwUy2UUUzks8DFclZr3EM3ufeTDixVkFbNIlSBb7B
	TQjug9opRAqm8oKrLdqQXsASHY5iayKOLLZnYKUwowERVvE18pNeVk/TXlymyVXywlo8k59Y3auEe
	1flIPL/j5qsOH1nSNjVZ0XMl4IXmAImxz+FxATAhv5BnB4AB0dKgFu25Srm5q70DZyDssMGv8qwsm
	3zVuS+KZqEN0gmBYKYWQq8S5csYceujpmGMKSYrTNGgOhQUFRnag2LsE223dVcV3h10wB7eakFRTT
	UA46hJNrCnWRkZflYd0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs3kV-0003O5-O4; Mon, 29 Jul 2019 11:23:27 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs3kT-0003Nc-9E
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2019 11:23:26 +0000
Received: by mail-wr1-x444.google.com with SMTP id g17so61409394wrr.5
 for <linux-mtd@lists.infradead.org>; Mon, 29 Jul 2019 04:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7FSTYRCDuN8ugCkUACc2sS4c/sxO9MPaWoEgh7iEEsE=;
 b=bVgt5oMZu9vka1vXyxfezj5eUPF8tafHtuB8RDF5PL5XefOI5mn84bdcGgEYFQWdBD
 v3/RzVElyj8HrIjajPHz9JfYqtYa1a1yA8hfjYuu81uuZW+L4M6UDlbC+97IeFIaW79S
 VyfhVHIyNKEDN8aDRs1lSXylanKCL5tamDdd0LGZFSuGIdZhIA5YtQMSnnlPGOXYI+uB
 otASFE6nLMIXfBJnLYqx5jtskcjMG1v7YFrGQrTtLxogh4D9ruZUok7QnLA9zT0nF3y9
 Mad/lcbjmcAfGQ+6KgMGFjkt1CTbHPYd7gc6HCKZGD+kgkTJ+bsGFjbvG/audBf5AYAL
 O2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7FSTYRCDuN8ugCkUACc2sS4c/sxO9MPaWoEgh7iEEsE=;
 b=pbflqaVVNRyXXLtmN0OBNB958/+y/kex1xlqtdx4EaJ1TZu4PtsluYo2Aiw2UAJDuo
 w0iyH/G6LfoJ/lrYqTv87Im4eP7sstMYJjm4P5SjTVmFIcX8R4Jodr6W1DcQI5UQ7SqO
 nZ0tRt2nrsavXmRk6mE+qzGWxZINeA8z8Xt/0R5uCcsPB5bpx4wDWeHmA5Mxn3HWQ/tA
 UMnWhIrJUKRr8GDx2OsT2SWEXP6PwA97WaAHMpfhsLHf9f0WOLbV/VZwWvhp+2vZlgp9
 hCgr+rHs6abcCN7W49nbA5Y4i+hqLgICuTFQL5fEgMMOlTbQY6NN3JZHHIBLsq9OIyfV
 f7FA==
X-Gm-Message-State: APjAAAXXO5NaZbe92Ns0RiCRrEz3SPksL5D48QtE24ysdNtUkZzzw+P2
 VEpro9xYbiykZGD3Z2Eq8i7pvIH09ejHPc85NdlHKaXHV1w=
X-Google-Smtp-Source: APXvYqyKS6i0fcHmOYx363DJnPTuu/xw0bA5xIlQXAB08qPtFUJYujyOTv9lxMWA//8NpJVOebpAE1xkHqBFV70jCHw=
X-Received: by 2002:a5d:514f:: with SMTP id u15mr21122702wrt.183.1564399401730; 
 Mon, 29 Jul 2019 04:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190725220215.460-1-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-1-paul@crapouillou.net>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 29 Jul 2019 13:23:10 +0200
Message-ID: <CAFLxGvyi0+0E3M12A7cRoHfEKd8-7Yr8EMG9J=2XcjCxPWY5pA@mail.gmail.com>
Subject: Re: [PATCH 00/11] JZ4740 SoC cleanup
To: Paul Cercueil <paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_042325_372866_4AA5F8AB 
X-CRM114-Status: GOOD (  12.77  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, alsa-devel <alsa-devel@alsa-project.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>, linux-mips@vger.kernel.org,
 od@zcrc.me, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 Richard Weinberger <richard@nod.at>, linux-pm@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 dmaengine@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jul 26, 2019 at 12:02 AM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Hi,
>
> This patchset converts the Qi LB60 MIPS board to devicetree and makes it
> use all the shiny new drivers that have been developed or updated
> recently.
>
> All the crappy old drivers and custom code can be dropped since they
> have been replaced by better alternatives.
>
> Some of these alternatives are not yet in 5.3-rc1 but have already been
> accepted by their respective maintainer for inclusion in 5.4-rc1.
>
> To upstream this patchset, I think that as soon as MIPS maintainers
> agree to take patches 01-03/11 and 11/11, the other patches can go
> through their respective maintainer's tree.

Was this series tested with the Ben Nanonote device?
I have one of these and from time to time I upgrade the kernel on it.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
