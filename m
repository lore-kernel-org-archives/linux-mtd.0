Return-Path: <SRS0=Zu/5=NR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C3BC432BE
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Aug 2021 02:55:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4AEA60FE6
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Aug 2021 02:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4AEA60FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WR5UBgXViBesMQnbc7mkovXnJFlkMl/0F+WNeMnnjGg=; b=2CW1ECTFwC5H9M
	Dsxsq1V2Ng3LhLJfFFcFXmxMNgKtOTqqZoH7e4eaBKhLvFtbbZ/u2PCuXfk6L7r1qNvun7VxwumR1
	sURxwkbv9eyr3I8nMrFtJSc/RFcIaBjBoDisNswX9YhmeXwg0w3FdhuUQjaS69DBQbsnrJFpNVMEP
	+t/w+CYikM+5ETiWvN7FFc4DNsWfZdS+rchLf8YoLKh7rRl2JycCVLGkgCAqx+sGOplQo8v6amyHR
	QNO9FbZyfGNLCLtAYNqEe1LkS8/fzLoXOSTppw5cWeCYxqZLXiGLY28ARWz5hNt/zGakLeQhvnE6S
	edRpLIw2/HP+U/NCMNEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJ5XN-008ydK-9i; Thu, 26 Aug 2021 02:54:41 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJ5XF-008yYr-IF
 for linux-mtd@lists.infradead.org; Thu, 26 Aug 2021 02:54:39 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso5532922pjh.5
 for <linux-mtd@lists.infradead.org>; Wed, 25 Aug 2021 19:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zY5JqCFiL9ajwRDJE9ra9rr5h/8lLdU1bpaSqHW2cUY=;
 b=zBbl6+vdhsHvJNmzRzPXjUjbZjS1JrIbTs8BWJQyR5yrjQ0NIdbYJbf6GP5pApFCVp
 QwHpr9xoOjbWOHQbf9w84qKF6hnSDYRTcKs92IQ4JEXvC49dJwGf73JNm9e6WL0CaiJ3
 5m6NOPRUdzpMEkdzaTnJgAib8c7/I1cWyzCPMW9eSlXIY9pGdD3717L7Hz3AuL6VwDK4
 N4OzVhpVgELJBvWYnrW5vu5o6L3KYwE3MnqcLvfRQ8BGGYt0siZaxfeUknn6gUpgr0d+
 DOZnGFD+Kfi4FkVDiCh75RoA6R1huFUJmi6KO1t34IILBc+ygQJ2sBcVh+9gAmmY5SNn
 0pYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zY5JqCFiL9ajwRDJE9ra9rr5h/8lLdU1bpaSqHW2cUY=;
 b=I1h1rR3m7Xck1WH6P65utpHB3lUD2BnL5uSKvBm0WDxKgmAjlxrR9Cim0Qo0p0AR8o
 4lHnuQNjrwrn/D7qekHuWjhl8X0XPC6wP9qbJKz4vHMbQvae6zWRw6jWNOU6GK6xAqFc
 cZDsJo1k4Lmurq5dD40qILu7KM4ilb6PcGbpIwe+vN8x0GoNFr/DQk32xGIMzIri/xWL
 hyJ2bIUFZFy6dZKdkiKf2izQIv9HoGR2/toR0BKIbHm/osVwnShHLHyHpbhDI3SPonu8
 Fa+xINjVT3LDR/j6FPalVV0he2dvSr9uMP8v5m9GgxHjraw3kPnGm7Lm0EDM99Kzh2xO
 rvXA==
X-Gm-Message-State: AOAM532QsAzuziua+RWCyrbWSFvymwoO52zkCne1cOO/wYLOkktmb/E1
 X9uAZk3aGdHJokThFwfzSvsxxw==
X-Google-Smtp-Source: ABdhPJwJ9pkRHq/CTCcQjTYNpLDk2RhglIYRZ3ZolL1qTMxvdQiuO7bqSMhmqzPibKf11tEWAM5bLQ==
X-Received: by 2002:a17:903:31d6:b0:133:9932:6998 with SMTP id
 v22-20020a17090331d600b0013399326998mr1459044ple.45.1629946472125; 
 Wed, 25 Aug 2021 19:54:32 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id nl9sm7142139pjb.33.2021.08.25.19.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 19:54:31 -0700 (PDT)
Date: Thu, 26 Aug 2021 08:24:27 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
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
Message-ID: <20210826025427.exdinwkuavyfcp3f@vireshk-i7>
References: <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <f1314a47-9e8b-58e1-7c3f-0afb1ec8e70a@gmail.com>
 <20210819061617.r4kuqxafjstrv3kt@vireshk-i7>
 <CAPDyKFpg8ixT4AEjzVLTwQR7Nn9CctjnLCDS5GwkOrAERquyxw@mail.gmail.com>
 <20210820051843.5mueqpnjbqt3zdzc@vireshk-i7>
 <b887de8c-a40b-a62e-8abf-698e67cdb70c@gmail.com>
 <ed70e422-e0e9-8c2a-7ce6-e39cb6fd8108@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ed70e422-e0e9-8c2a-7ce6-e39cb6fd8108@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_195433_677014_C04C9C3C 
X-CRM114-Status: GOOD (  13.83  )
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

On 25-08-21, 18:41, Dmitry Osipenko wrote:
> Thinking a bit more about this, I got a nicer variant which actually works in all cases for Tegra.
> 
> Viresh / Ulf, what do you think about this:

This is what I have been suggesting from day 1 :)

https://lore.kernel.org/linux-staging/20210818055849.ybfajzu75ecpdrbn@vireshk-i7/

 "
  And if it is all about just syncing the genpd core, then can the
  genpd core do something like what clk framework does? i.e. allow a
  new optional genpd callback, get_performance_state() (just like
  set_performance_state()), which can be called initially by the core
  to get the performance to something other than zero.
 "

Looks good to me :)

-- 
viresh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
