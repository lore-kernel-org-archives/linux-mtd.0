Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68533C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 09:15:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C58B60FDA
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 09:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C58B60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HqZskO1TQsHMST/2LBId9NWpOm+ATepJcuRXnZejTJw=; b=R/KQ/f4CSg/8ZD
	cwYAQyT4AeFF542BSghmU+PVufca3xThnquNAECKMlm+4gcAkgeSXN0DUVeq7RZfAZqFtLcnPjyEN
	AEdbzp1uOFY+3yTe7EjHGOGIAMY1X+0ry1q6MERpt2QgizaEIN8XNVFXCChy/r5mf+RoavHCZFjtz
	Fpc4G3YBXd89Nk2IFrzn83ofGAofBoPeDwoQeOl2YH1T45vmlKbkRb76fiPiVYkJzanSH4FBa1AIu
	E2y6jH9Ce9k05MZ/bNZ7P0fingNZHq/2wghfCZ46lA45mrOmLw6UpQOpjZLhYFSCqLURoEmKugtv6
	fBkORHNGMXWuydatg2TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGHeU-004om4-Bs; Wed, 18 Aug 2021 09:14:26 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGHeP-004okN-0Y
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 09:14:24 +0000
Received: by mail-pl1-x62f.google.com with SMTP id w6so1386798plg.9
 for <linux-mtd@lists.infradead.org>; Wed, 18 Aug 2021 02:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tDuCq4cpa/FhfVLg3d4eOXI0t92SH+lRUdr1ZBj+304=;
 b=quAhTr+R/08xh/ignvyvF/El1dD/NQftWfiNTcAu87cJhuBhgI+As0zoEiydqeW6PP
 Ex/zHp4EDoA27CiqypV1XRJjyjppnIr9cuHPeEqT4Jz0u4Gd7rGoODV0vOYF2r+fXVrC
 O9YNeAY5lMNde/fcVIInzFs4EQNgUzhxxcNX6YMHjHSIPhU1rXEQOl9Aq3E25JLQ/9fv
 VxP/TlWw72/n6skEH8miH2qbrmh27V7jR6dmqc1oF+jbwQP/bhXkGIrzGuJgVHwfQUpg
 jLxJj1fuqBdXtzbuG0/ZFv6pjltmBS+1GsQZASCe+7q/ocD5Ye+29smqIZ7DN+BRR4O7
 VT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tDuCq4cpa/FhfVLg3d4eOXI0t92SH+lRUdr1ZBj+304=;
 b=fZs/JzST94fJuVsYJv3X0tH+mhMP9R2a5o6QxvaRik1fcXYB46mhHBc+WTV3ROZFea
 JCryd/YhdRVJ/4FtpR98khLNLZEN67f6SiDsuHO1tD67c5/zIhx6EriI6LSxbZEUCbds
 kV0ztsFIP4mASn6vAeK47X5nj34TktYZWh2chIDDbMsHtw2zr6FfLGm8qbxHyxUASEy3
 9iNorBytF0JcCeSPS02gxtnf16AdB+FxYPfy1pVu3yh1HpnUDEZUWFvtOTqvG/bDKxyt
 JyvvAoUc1TebOCWS1j5FNZX86vAPCMlhcBuKU5PO9GTMncevdQTLGiaXLnAY+PMNn3Sp
 U7HA==
X-Gm-Message-State: AOAM5336kkmRj5khbhcxrPIJ51eQQ39LDTkV5cijt/nKqpdLmyqB2EFR
 bnri+XPDaLYzSc5TkSSfBY/q9Q==
X-Google-Smtp-Source: ABdhPJz4yEie/eMLpBAmymSzx5jt3Od7muuoKSX0aK0QfqCy9SYA7S2Wvgljmd2wM1mkIsijUEW0lQ==
X-Received: by 2002:a17:90a:d791:: with SMTP id
 z17mr8231461pju.203.1629278059957; 
 Wed, 18 Aug 2021 02:14:19 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id a8sm1540816pfo.79.2021.08.18.02.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 02:14:19 -0700 (PDT)
Date: Wed, 18 Aug 2021 14:44:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
Message-ID: <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
References: <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
 <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
 <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_021421_132489_B6CC7609 
X-CRM114-Status: GOOD (  17.36  )
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

On 18-08-21, 10:29, Ulf Hansson wrote:
> Me and Dmitry discussed adding a new genpd callback for this. I agreed
> that it seems like a reasonable thing to add, if he insists.
> 
> The intent was to invoke the new callback from __genpd_dev_pm_attach()
> when the device has been attached to its genpd. This allows the
> callback, to invoke clk_get_rate() and then dev_pm_opp_set_rate(), to
> update the vote according to the current state of the HW.

I wouldn't call dev_pm_opp_set_rate() from there, since it means
configure and enable (both) for different resources, clk, regulator,
genpd, etc..

What we need here is just configure. So something like this then:

- genpd->get_performance_state()
  -> dev_pm_opp_get_current_opp() //New API
  -> dev_pm_genpd_set_performance_state(dev, current_opp->pstate);

This can be done just once from probe() then.

> I am not sure if/why that approach seemed insufficient?
> 
> Another option to solve the problem, I think, is simply to patch
> drivers to let them call dev_pm_opp_set_rate() during ->probe(), this
> should synchronize the HW state too.

Dmitry already mentioned that this will make the device start
consuming power, and he doesn't want that, else we need an explicit
disble call as well.

-- 
viresh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
