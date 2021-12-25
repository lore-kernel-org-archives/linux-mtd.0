Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B90C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Dec 2021 17:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fexK7eTrASJOTJ5rcmDQkvuKwCRwkcPPG7YBq0lIpRc=; b=fq8GfPvfotVY51
	1NtBNRRpDnlWVmfsbNC/5NPjMHmAEQ0Ps/u+z0xIBbbeUehfuRKFUeEIEGetjue47sM1A6gMacDBu
	QXeK33C/wgLEdrg/eFZhBHh14pEyB6KcY2sEhXZw7VQ4a3wn2TeWcBepGX/WPEzsOxFgc7nvwVRjy
	mZxxMnxWxEps8zJsPFnsYnwHnID4Sz9c2tWBQvxkfJ6+4wF6qNjB6zQnMDyU5VjPV4LjxN0Mi4ikT
	nLyGTOJsdaj7S4ro1EH2FujbggU6Sb/qaDeo3FC9QSnPxCloiGnaMbn0EF7Gxivy2EdEz8KSUgL4S
	56RBr1Uk9jU1g8PQyn/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1B7g-00F1GZ-HF; Sat, 25 Dec 2021 17:46:24 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1B7b-00F1Fv-Bl
 for linux-mtd@lists.infradead.org; Sat, 25 Dec 2021 17:46:20 +0000
Received: by mail-ed1-x533.google.com with SMTP id x15so44908208edv.1
 for <linux-mtd@lists.infradead.org>; Sat, 25 Dec 2021 09:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NXb9uQGaBtKvbUMdmPuJokNHrFa4LJfUh42PbPdY2O0=;
 b=m2+AcCualK7LXu4tDURUtUBF5v2codGDVRlKX9kp0wQ9/h7Bkjk/tRqiIUPyjcYCfp
 3X4EmNvokdC3x2jFzo1kcKFMt3WORIxJHm0M+nCvwNwSpKF8TinpKsbpvWeIHNVqsh11
 trRqYXsitm2Xyyaqw3GANaaehNAVQgHADFVoKpniZdGqFUa4ic2iBB0a1Iz38+CAzOKL
 O7AO3nmqk5R7pi+4B+xBk0xtCEvgM3sBOtF0wWZviuOTemG5wIrn71vMmd1jRIXwKTFF
 zTHlqtNGQbM5wn+u7eLXTKagMaOjAXk2a1gVE+qLqyQ63KXpP7hIcWoJRNO3wJDrTwy4
 GEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NXb9uQGaBtKvbUMdmPuJokNHrFa4LJfUh42PbPdY2O0=;
 b=npNXRO1EfyZmMaUHudzod1ID0RPXNvNKv3G7xQfWerT/F/tPqQxOjkOstCgdcXEwXe
 dmq2MSpM+rbSvHQQYWeb/lOAshP17eGwBSYtUoiQ8tfQLJav6BEBjziOZt+u5whATpZH
 KaFZAhxSLdB114dnb8hVHnNT6raJAe3SyKD2qkO86UlFQF1+SsX23GAttMoACCvPYRIv
 UBILkg0ymhDXytqVDwGwbALWRMm5D1u1pebXuKqVFJMikm7VhzSQhJLHfPNJl1IH5fpc
 3VOBVNIxSZPVn7061Ion8t6zvcUPRW7VBiBsMjPq80TBl8Fntf7SuuG5XgjX4MlO+8Jg
 UlZg==
X-Gm-Message-State: AOAM531MwjKuWRHQ1ZGldlN90N+IWVhDkvpl1dj7dPzTZZ7yQTOXNaOV
 akujo2FRTgU1UFv0Fb60E8IXa5noZhLanbTMRN4eU6dAqlS0Fg==
X-Google-Smtp-Source: ABdhPJzFNqtcTmeGAERJ2OocFZXaP5GIk96d2ImLGhcYfpgRxVghQdn5+Y0P7jDmGNN7swGGetBiSan5jGNfi97Fc0w=
X-Received: by 2002:a17:906:3ed0:: with SMTP id
 d16mr8497390ejj.636.1640454376658; 
 Sat, 25 Dec 2021 09:46:16 -0800 (PST)
MIME-Version: 1.0
References: <20211223002225.3738385-1-f.fainelli@gmail.com>
 <20211223002225.3738385-6-f.fainelli@gmail.com>
In-Reply-To: <20211223002225.3738385-6-f.fainelli@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 25 Dec 2021 19:45:40 +0200
Message-ID: <CAHp75VeLAuGbeh+DJ=Oox5o8vdt=iLxr80sS3RrZbdJ9smh4OA@mail.gmail.com>
Subject: Re: [PATCH 5/9] mtd: rawnand: brcmnand: Allow working without
 interrupts
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kdasu.kdev@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Cai Huoqing <caihuoqing@baidu.com>, 
 Colin Ian King <colin.king@intel.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM SPECIFIC AMBA DRIVER (BCMA)"
 <linux-wireless@vger.kernel.org>, 
 "open list:BROADCOM STB NAND FLASH DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211225_094619_428286_A9885E43 
X-CRM114-Status: GOOD (  10.68  )
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

On Sat, Dec 25, 2021 at 1:41 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> The BCMA devices include the brcmnand controller but they do not wire up
> any interrupt line, allow the main interrupt to be optional and update
> the completion path to also check for the lack of an interrupt line.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

> -       unsigned int            irq;
> +       int                     irq;

instead.,,

> +       ctrl->irq = platform_get_irq_optional(pdev, 0);
> +       if (ctrl->irq >= 0) {

ret = ...
if (ret > 0) {

And drop 0 from the equation, OF never uses 0 as valid vIRQ.

-- 
With Best Regards,
Andy Shevchenko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
