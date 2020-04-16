Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E36C2BB55
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 12:27:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C637820786
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 12:27:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="krHuVCdx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rrikCjo6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C637820786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SrI32RQNVxjun43xStMdVVj3cN8wkxLIFmo5VrtCBkU=; b=krHuVCdxp5JaeS
	wA+kcbkZxb0TPjXhmiaNxpVj6abFXXEqBSvr5l9mG+IwxrvIpkp77I+7PBEpeSztF9Zk4naTfTlmk
	WNOyG4J4eyjlGea/HaLpf1EPkB6MkINZ9FvaIf9eoiaKWPUcjBoJIWm59E4h2nDY/So4Fig7UPfqx
	zGEsyOEvj8vbBkBu4c/EhJ/dkDfleDRcpEBgkDlBHGqvYBa5OpNDsLLuBVyGdOjz1GGrFpcKUtEBq
	6nQ+WJC+0bUesOEpWjXPja2ede3ChNJbDnsL0GW/uSK2eLVtUO+BGPw0dsipWk0UBNh9M08S6A7gW
	QxwEMj0NyMVLzGNqDMjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP3bp-00065o-GL; Thu, 16 Apr 2020 12:27:09 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP3bm-00064j-65
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2020 12:27:07 +0000
Received: by mail-pj1-x1041.google.com with SMTP id np9so1317767pjb.4
 for <linux-mtd@lists.infradead.org>; Thu, 16 Apr 2020 05:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6+zoPumabDR7wfNBhA607mfTPqFnvtYyNRR6pkJeNRc=;
 b=rrikCjo6OmPHVrOCaLm+Gva1H4yWEszY4mga/U1BhLvHHvvxk+RJGnSk8pXyWGDTgr
 ArZtQrXxCKbrMHwqCytmTWKdLrkD+mr9kWeBopESSnNTEUA6HwR18Bkpdg4+3EWHk+o/
 xOXwi90aVScXBzuqmuuquFT7mOyKeS0eAKYQRF3N6HM6P81Dl89CnOdCI2PIDo3bfAVb
 OL48EkapNSlDBThy5XhtEXvkOG6atbCLx2m23ifH//EO8ch2NKiuNU4hxZz9z2o/UrzZ
 AKN/dhyxPRoqSMtcHzhsflPexM1QwhfQXOejLz7kBkK1fSV5DIkhjRUBs9AltBnBTIsS
 aGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6+zoPumabDR7wfNBhA607mfTPqFnvtYyNRR6pkJeNRc=;
 b=ANUpchIUYPuXces9qnIzPltUzA5TQtDA/SPTFAlEOMNk/LiogKJOP0XCUhJQgiDPvI
 Hj22CwnChiSs0BpcdG8Ye+VIeNosAGz4pm4l7+ntKRFZin4+hw/ZHy/tcFHq2X5q+OQA
 vBoX/QqFhQwkSrgmitrfmPhjYXbAqd5U8rkUOpoWCMfmHdPS1XVmGNgGZEQ9jE+UMOTZ
 QJ8kPpoIpVsWgwJjlG5zEUXoTcB4WiL5qVCmbzw7qfTEyvtXQ6TI6r1VKfbceTSoVF3L
 U3CC3io8OqB0jgcWU9LT29xaidDI3SxTwKiwplo2cH+iSrq/2Bqas5nn2Isn/TMpnpya
 98jQ==
X-Gm-Message-State: AGi0PuaRPDeW/bd4P3DirT+5zcu2sWVs6jhy1GRYAaLojoxLp/z0pxWZ
 Du1eBWxXVPOiVZ67nLdlNtfoTqXgv3+ArM+7/80=
X-Google-Smtp-Source: APiQypJvkQh5+ugyct9yZGir74K1nYeyAEbWt+sAtjy2EG/owrAN5ZW/CfDb6rC12X8DVkuLLWoZMoJZIEJSmzjKy0U=
X-Received: by 2002:a17:902:854a:: with SMTP id
 d10mr8026966plo.262.1587040022687; 
 Thu, 16 Apr 2020 05:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200414022433.36622-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200415220533.733834-1-martin.blumenstingl@googlemail.com>
 <c33c8653-16a2-5bcd-97a9-511d958b755a@linux.intel.com>
 <20200416113822.2ef326cb@collabora.com>
 <18568cf6-2955-472e-7b68-eb35e654a906@linux.intel.com>
 <20200416122619.2c481792@collabora.com>
 <d3e137fa-54a0-b4ec-eb24-3984eab2a247@linux.intel.com>
 <20200416131725.51259573@collabora.com>
 <de9f50b8-9215-d294-9914-e49701552185@linux.intel.com>
 <20200416135711.039ba85c@collabora.com>
In-Reply-To: <20200416135711.039ba85c@collabora.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 16 Apr 2020 15:26:51 +0300
Message-ID: <CAHp75Vcpb-556imBuhsY-asrKqx7LjvQbq+P-ysK-+ii91YpWQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_052706_229765_906A9895 
X-CRM114-Status: GOOD (  19.56  )
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
Cc: cheol.yong.kim@intel.com, devicetree <devicetree@vger.kernel.org>,
 qi-ming.wu@intel.com, Anders Roxell <anders.roxell@linaro.org>,
 Andriy Shevchenko <andriy.shevchenko@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Richard Weinberger <richard@nod.at>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vignesh R <vigneshr@ti.com>, "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Gleixner <tglx@linutronix.de>, masonccyang@mxic.com.tw,
 piotrs@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Apr 16, 2020 at 3:03 PM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
> On Thu, 16 Apr 2020 19:38:03 +0800
> "Ramuthevar, Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> > On 16/4/2020 7:17 pm, Boris Brezillon wrote:
> > > On Thu, 16 Apr 2020 18:40:53 +0800
> > > "Ramuthevar, Vadivel MuruganX"
> > > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:

...

> > There are different features involved and lines of code is more, if we
> > add new driver patches over xway-nand driver
>
> How about retro-fitting the xway logic into your driver then? I mean,
> adding a 100 lines of code to your driver to get rid of the 500+ lines
> we have in xway_nand.c is still a win.
>
> >
> > is completely looks ugly and it may disturb the existing functionality
> > as well since we don't have platform to validate:'(.
>
> How ugly? Can you show us? Maybe we can come with a solution to make it
> less ugly.
>
> As for the testing part, there are 4 scenarios:
>
> 1/ Your changes work perfectly fine on older platforms. Yay \o/!
> 2/ You break the xway driver and existing users notice it before this
>    series gets merged. Now you found someone to validate your changes.
> 3/ You break the xway driver and none of the existing users notice it
>    before the driver is merged, but they notice it afterwards. Too bad
>    this happened after we've merged the driver, but now you've found
>    someone to help you fix the problem :P.
> 4/ You break things for old platforms but no one ever complains about
>    it, either because there's no users left or because they never
>    update their kernels. In any case, that's no longer your problem.
>    Someone will remove those old platforms one day and get rid of the
>    unneeded code in the NAND driver.
>
> What's more likely to happen is #3 or #4, and I think the NAND
> maintainer would be fine with both.
>
> Note that the NAND subsystem is full of unmaintained legacy drivers, so
> every time we see someone who could help us get rid or update one of
> them we have to take this opportunity.

Don't we rather insist to have a MAINTAINERS record for new code to
avoid (or delay at least) the fate of the legacy drivers?

-- 
With Best Regards,
Andy Shevchenko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
