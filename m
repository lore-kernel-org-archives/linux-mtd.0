Return-Path: <SRS0=xunr=65=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0EB0C433E1
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 14:25:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FEAA2076A
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 14:25:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m95Zg9iZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fz2bWsiq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FEAA2076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uI8P+xJlInZ3agGAIaseySaH1a5Y580PaKVX2JO+zqo=; b=m95Zg9iZS7kd5e
	VOQbAaFudDuj0nL3fuXTmUbNuz9bNVrAVLcxjoQXXRslSxt2XY5vUACdYoxmcYiPm+3iy3U1gL7iK
	plGH6j8lXE8549wmFXZ0mipeAT0+OdUAxAHpvlkDfcDgWmqxY+M12SzL936ETfpeb2ut6l0O+JJ8D
	AvGTZgI7rJgsyo68RzSK1P1g+lIimNj40iqT+4cnXXO/24l71HsJ30k0p6pxRZxunCT/4l/cDod8x
	St2rVCLDQEwBCoxltWfZEanRvsep5z12J0kuAj8DRvzqvuNskAFYTAu/g2saF3XvA9DKSVvhClwxZ
	IyTbiTBSBSzjhex4GktA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZbHS-0005Ee-JF; Fri, 15 May 2020 14:25:42 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbHQ-0005E5-Eu
 for linux-mtd@lists.infradead.org; Fri, 15 May 2020 14:25:41 +0000
Received: by mail-pl1-x643.google.com with SMTP id x10so943819plr.4
 for <linux-mtd@lists.infradead.org>; Fri, 15 May 2020 07:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=49t3MoXqM17BH4PLPJ14eJW4i3hdwXhMbbVc4qSxdOU=;
 b=Fz2bWsiqdptvWYwhZebHUhc7rMuBMDCX4uTwcs5ceuql0+cViaytGDFp/j9mBgjdWW
 lRJNX/naOqb3ZSYr1mWFWT1wdMxJ1lWqpcAbqnSYBcvtRmGFn6y8lcWtwVEkiAXYdyvT
 eGUh577Y3lREjPqwr3l7usDOHyyeGQcktBjQTwlXiHUrLG4F4cy5pMupnxw9sGvFjrWF
 8MO8KYjxjVcKlnpXq64N9CTY4TGlRdnHlAzQ9V2z87BDaWh4Q1W4/9Pl1bRZifXrVcab
 YPLygDao+UrsS7bgmi26QPlbVm7Ux5yHOo5vG4WuKwwjsoz/Tt6Ll7sPAAHd1LMnoIBb
 mD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=49t3MoXqM17BH4PLPJ14eJW4i3hdwXhMbbVc4qSxdOU=;
 b=Q/GbTtP/Qe8/bl/JWP9OrapX9+brANEca+rndrsUtLKcNaX2pcnbuE/ugRKwxH05U7
 q09Q9EDzd5yNnA/WqtOu0u5/zUD6ahhbIDBkWQ9MEIlgASkcBkhAOj21NY0sMdpnmsZh
 hzOmkJ+qH4HDasnEBkxCXWYlw9PCHVjHwdFR0/oCE5NOr32O/XyHEy0tyb9jsZAyXylC
 YF48q2NP8txBXscqfsjFqM6YPKERLpi48JkXXw1DcRpzhmm53kskItRbe1Diad9hOAZe
 v38QfLOjrY1Zm2NmzQDqtVXYqfynOzmKxU4kqvOHcF19eZQm/8epV93cD5RyycF00zxN
 HwJQ==
X-Gm-Message-State: AOAM531ytGlXB6eUZJnI33HjI3BDY2Be2WMOpORUzRecpgkDtJExnEu5
 W3RobIrVxqzWH4ZY+6661WaROUFzHsCVI9FRMpw=
X-Google-Smtp-Source: ABdhPJx9WsseUUaDU5aQqbAWqexIuw50ii00Xe8pgIuJOUKQiPtL7+0zN6dlHyzFIKqHVICZ6VuV7lnKAhfkRv72a4M=
X-Received: by 2002:a17:90b:3717:: with SMTP id
 mg23mr3921780pjb.129.1589552738686; 
 Fri, 15 May 2020 07:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200515105537.4876-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <202005152142.AWvx4xc5%lkp@intel.com>
In-Reply-To: <202005152142.AWvx4xc5%lkp@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 15 May 2020 17:25:32 +0300
Message-ID: <CAHp75Ven9q-6dDYtP_uXigeS_r2uvpUZVR5Mh0RdEd36MbTG+Q@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: kbuild test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_072540_503962_C876F6AC 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree <devicetree@vger.kernel.org>, kbuild-all@lists.01.org,
 Vignesh R <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Anders Roxell <anders.roxell@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 masonccyang@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, May 15, 2020 at 4:48 PM kbuild test robot <lkp@intel.com> wrote:

> sparse warnings: (new ones prefixed by >>)
>
> >> drivers/mtd/nand/raw/intel-nand-controller.c:441:24: sparse: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int val @@    got restricted __be32 [assignedunsigned int val @@
> >> drivers/mtd/nand/raw/intel-nand-controller.c:441:24: sparse:    expected unsigned int val
> >> drivers/mtd/nand/raw/intel-nand-controller.c:441:24: sparse:    got restricted __be32 [assigned] [usertype] reg
>    drivers/mtd/nand/raw/intel-nand-controller.c:444:24: sparse: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int val @@    got restricted __be32 [assignedunsigned int val @@
>    drivers/mtd/nand/raw/intel-nand-controller.c:444:24: sparse:    expected unsigned int val
>    drivers/mtd/nand/raw/intel-nand-controller.c:444:24: sparse:    got restricted __be32 [assigned] [usertype] reg
>
>    440                  reg = cpu_to_be32(*pdata++);
>  > 441                  writel(reg, ebu_host->hsnand + HSNAND_CMSG_0);
>    442
>    443                  reg = cpu_to_be32(*pdata);
>    444                  writel(reg, ebu_host->hsnand + HSNAND_CMSG_1);

On BE:
cpu_to_be32 -> no-op
writel() -> converts reg to LE

On LE:
cpu_to_be32 -> converts to BE
writel() -> no-op (in terms of conversion)

Seems to me that the proper API (if above is intended) should be swab32().
But something tells me that above is broken (or my understanding is wrong).

-- 
With Best Regards,
Andy Shevchenko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
