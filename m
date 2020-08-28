Return-Path: <SRS0=a+HT=CG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACF9C433E2
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 13:09:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12B4C20872
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 13:09:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Og1KdNq5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12B4C20872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zbedujY8JmJfwW7+tXbtGI3GyPAFq9LWFBrUels02Qw=; b=Og1KdNq5RHAVQD1Y6WZ//MAZg
	hdGxmbBF5M6h4nUpN3E7gvy7r1ogHymUVgB/4zcxOdRXbI5vS5cuSyMXw3ubApjOJY3e9+mbViL/o
	R1o65Tp24BhdmkJqqKarM3i4b0ZekQRdFNLwjfr4TaprHaI/jXOoUVEkOroCPzqoRyKfnKT9gI4Uk
	TgyiBbfPaezXrwhfiKp+HcO2uvu9t/20v2P+rdYArEaCjYY/5K2s5Ek1B5d/E5X1xfZ0szsqRKeMK
	Bkw9C45j4Xw9o6GETOn9F57K7Z1EOq6SMdk5XuxBJYakFFJ32w3u3ar56kHL0gmIJ9YHj+KkMjuuM
	qoFL1qcuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBe7g-000213-3b; Fri, 28 Aug 2020 13:08:52 +0000
Received: from mail-ed1-f67.google.com ([209.85.208.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBe7W-0001yP-DQ; Fri, 28 Aug 2020 13:08:45 +0000
Received: by mail-ed1-f67.google.com with SMTP id q21so1122530edv.1;
 Fri, 28 Aug 2020 06:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=E+aHZUYr4/xAk5Vx/I2zH6eSvAeQy3DL/RIU7rMycss=;
 b=a2ZnNOH4/fX++Bii0FLpa2QoYHA7ZF++9TXVAv8wysEm4zGeQMN+oJTD+9HnTUlwl4
 EyHavyK9iR0zIJWcluvl8YgEOnyz3DzvbYxOWdJcP8jb/SYNXJw0hCRqB84506MweII2
 ffx9jAzAkq9bTuHQiyJ8PWT4UVCJ8k7VEBZ5FLot0aDT/+5Zryw2i0TcfDrcA/vsacC6
 kmcSJnN7RwFffVqPzTJN0omX8Eh7HbCbukRUnQQrV2j0v1i9tsZNrPLSM7T8jIa1u1fb
 kOQ0odPwiNS5235IgQlsEhSYT9vGUxnNPpTZngx+psguW85SMOpdO4khY4Z8FlUsXBOp
 wumw==
X-Gm-Message-State: AOAM531IQEtbNe18qNHJx+lK/qT63IdQqE+LXH4ijgGMbepPdJahqaAm
 GtQh87GGs5UKErm5fnvZqBk=
X-Google-Smtp-Source: ABdhPJw2sUyi5oI180j1s6a0iPM15L1BAjci1fZItmg5NmiUYVf2976kX7V0+smnXtOdifVljCX0Xg==
X-Received: by 2002:a50:bf08:: with SMTP id f8mr1717050edk.207.1598620121241; 
 Fri, 28 Aug 2020 06:08:41 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id j21sm849059eja.109.2020.08.28.06.08.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 28 Aug 2020 06:08:40 -0700 (PDT)
Date: Fri, 28 Aug 2020 15:08:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 00/19] dt-bindings / arm64: Cleanup of i.MX 8 bindings
Message-ID: <20200828130837.GA14163@kozik-lap>
References: <20200825193536.7332-1-krzk@kernel.org>
 <CACRpkdb4j2kJvpY23G-os9gTktZW5HT287MsvMZxC=ovgn_9LQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdb4j2kJvpY23G-os9gTktZW5HT287MsvMZxC=ovgn_9LQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_090842_525815_B85B4BC6 
X-CRM114-Status: GOOD (  18.95  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-pwm@vger.kernel.org, Frank Li <frank.li@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Fabio Estevam <festevam@gmail.com>,
 Anson Huang <Anson.Huang@nxp.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Han Xu <han.xu@nxp.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Fugang Duan <fugang.duan@nxp.com>, linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Aug 28, 2020 at 02:51:20PM +0200, Linus Walleij wrote:
> On Tue, Aug 25, 2020 at 9:35 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> > This is a v3 of cleanup of i.XM 8 bindings and DTSes.
> 
> If you are going to be working a lot on Freescale SoC code going forward
> I wouldn't mind if you could add yourself as maintainer for the
> Freescale pin controller and GPIO at least, I already have high trust
> in you in general so if the Freescale maintainers also have that I think you
> should just sign up as maintainer. This makes it easier to do pull requests
> and things like that.

Thanks for encouragement.  Indeed I am planning to do more work around
i.MX 8M platforms from NXP/Freescale. However there are already four
maintainers for Freescale pin controller drivers so I doubt there is
need for fifth entry :).

Different question is the GPIO driver which apparently lacks entry in
Maintainers file.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
