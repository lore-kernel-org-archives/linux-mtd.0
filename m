Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DECECAAA1
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Sep 2022 00:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=raf+1I3U8C93FSU4WW/l9/sfCtUhKKKmcFwaGi2KMl8=; b=Z75pLLVmQuJNdm
	chLuV4/R+0be7nTuIp9YIuj2BrtlulZHwCT43xF3V7XP2hGutRWyHA/X4UgYwax83+P4fAGzPqW7M
	0yscFRdeO2HzOt7CtpRz4AMiUWkwkXZR8y0Nw3ztH/188ow8aUaM1HZnGMro2fHiDB+rOJTUnygMU
	zL7smpkpEYx4lA5kZs5cd4PDmqRkGgyqgzCGA+EfIK2malEAWa+RB9VIY+oJeWrjn6+STzlSXZEAM
	IDMwbdEO0Bm3kRcbHH+cMMKSjgEmF0TiPsRSJ8SmeO3Z0GODgDv54K3B3AOArQuO/nUFfb1/J9h9W
	NFndxxEsqOupOjkC2fGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVMJN-000fpz-0h; Tue, 06 Sep 2022 00:19:29 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVMJH-000fmm-Sj; Tue, 06 Sep 2022 00:19:25 +0000
Received: by mail-pf1-x434.google.com with SMTP id y136so4833193pfb.3;
        Mon, 05 Sep 2022 17:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=v4JA0M0hCIbFC7NXFN+IygsKVK4ZMU4qWYqYqoR4tJc=;
        b=fHHlrsomzS5RX1w3UIei5qFtxTClmy9iSQEvGb1yFamLQYZo+o6zDJ8zJUVbJLL82Y
         pkr7UJu0RGPOf+0J7r9ut0astM8MHGg1EaaL+qlGu/ue2aBOikrSmX+DoJq6OVnfYCTQ
         FMcozHAuaegI9kVFEFk5BCS8NUELgRVLurFlc4zQR+4mEluidRXNcvb1Uq6r9730CALq
         i+o2Z457eW9sgjxUmvKSOZs27VXpd+EYrVSuTXtKTDhoWiowlHQASX22DQpd3afScQaO
         NjyzcFcZoXy1i9cNJaiHRj8JaHrrDq+3JIoFmZc3azTXuJLuoblV3/wMiYnfYqdVD2x3
         dUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=v4JA0M0hCIbFC7NXFN+IygsKVK4ZMU4qWYqYqoR4tJc=;
        b=0SlZFcEaoojArzRf0u/TXwqBOTogluJm54uUhdASJKYrwOoyYkLPKqudBKhXH0lWD5
         dg2B6AzpUBqx0swHy9tMx1PFUKmdcyHwXH78/z7NPmAbvyoGiJq8zPTbd+IX+bN/nqQw
         ZOUCa2iRU7PCRYfu8cdVdL8TZLkDtacwqFwbImijPqRckiGiTk5oAkdQ1tNPbxB8gsLD
         Gzooa1Epgcninl9mhj9EQn1ZvGAIXOKGD0n+P6FpZluvljZtkj3nb3syXKqWmDSFS2j/
         7pwECJmnL7oLJ32BbB9G+OD0t6phLYA0KcFdUQd/eWpGOSryhulT6VJPVLlsrcrUZkoK
         iwHw==
X-Gm-Message-State: ACgBeo3PYdnItXKDYHTLZ9vW6hbCzU1SJNrb5Es67WKTIQAfeguYnDW5
	8Yd43BlTfk/GjOlGK2cG+qo=
X-Google-Smtp-Source: AA6agR6BSwkY2FCM/mxUqmLHetzPYwEnkn1n9g0P2sCyTVfQpw3+hUsDHc+Gpjiwldy8UpbPbUcIag==
X-Received: by 2002:aa7:88c8:0:b0:536:926:700f with SMTP id k8-20020aa788c8000000b005360926700fmr53349294pff.72.1662423561657;
        Mon, 05 Sep 2022 17:19:21 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1190:fbfa:ae95:111c])
        by smtp.gmail.com with ESMTPSA id c10-20020a624e0a000000b0053e156e9475sm431528pfb.182.2022.09.05.17.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 17:19:21 -0700 (PDT)
Date: Mon, 5 Sep 2022 17:19:17 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Felipe Balbi <balbi@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Marc Zyngier <maz@kernel.org>, Richard Weinberger <richard@nod.at>,
	David Airlie <airlied@linux.ie>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: linux-watchdog@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 07/11] PCI: apple: switch to using
 fwnode_gpiod_get_index()
Message-ID: <YxaSBRkAG/hKjFol@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-7-b29adfb27a6c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-7-b29adfb27a6c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_171923_988984_A01EC68D 
X-CRM114-Status: GOOD (  18.16  )
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

On Sun, Sep 04, 2022 at 11:30:59PM -0700, Dmitry Torokhov wrote:
> I would like to stop exporting OF-specific gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit, so let's switch to the generic
> fwnode property API.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index a2c3c207a04b..d83817d3ff86 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -516,8 +516,8 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
>  	u32 stat, idx;
>  	int ret, i;
>  
> -	reset = gpiod_get_from_of_node(np, "reset-gpios", 0,
> -				       GPIOD_OUT_LOW, "PERST#");
> +	reset = fwnode_gpiod_get_index(of_fwnode_handle(np),
> +				       "reset", 0, GPIOD_OUT_LOW, "PERST#");

Hmm, I am looking at the driver and it leaks the reset gpio on
unbind/unload. I guess it does not matter in practice, but still nice
not to leak. Thankfully it is easy to cure by switching to devm option:
devm_fwnode_gpiod_get().

I'll send and updated patch with a new justification.

Thanks.

-- 
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
