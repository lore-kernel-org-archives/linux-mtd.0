Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA20CCCD1BF
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Oct 2025 15:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYBdg7lRHPki/TdBg5e8Xy3daxpVAAUqs4UYwu8l28U=; b=JuplcdsoKHjG8P
	5CRxCg30HELNQGttHiIIGXVMrT4GgI0hHzmX/Gwkm20hhn/2vxAw/MUenwgLqF6Xu7v4mnic2e21L
	+NZ9/JTcPqnbmTw5KDQnByz9F7vqrdjQYa+TwG7KhhjcD/Vj2OEkeqEyY0/M1Od9zoTum8HvF+L/7
	SI3ZBScB2e+PO4vG4MXpxbuTlFZ7DBgLPcoyw33UEbuxJBG3VreTPohak8OYcUi8hZ5zyUSSlS9ua
	iuu9TjVVcrs87wCZ8OKYiBeiUeeVdZoyqgWOrHiTHTRaMS5mHdtyE6hT2tHs0k9G5UNqsIrWNe6Gu
	mgJHZE7YGKASl8w3//Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJI2-00000009khL-1O3l;
	Fri, 24 Oct 2025 15:01:14 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJHz-00000009kgB-3LFG
	for linux-mtd@lists.infradead.org;
	Fri, 24 Oct 2025 15:01:13 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b67ae7e76abso1609760a12.3
        for <linux-mtd@lists.infradead.org>; Fri, 24 Oct 2025 08:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761318071; x=1761922871; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ipd+fJKM54dwFhjqVqY2/vt0B0gPimIr32J295wlB+M=;
        b=aZed0QV8bwyDF5UN7rrs0OP2/zZGp+AKJ/K85aQFedEAnQGSdMv/AFlo5LNc8I5BFh
         O2VkbRcei+f5gTlllCa3C+YIJoi9EwAcSniTwwOwVVCAowev196moBtnXntz7U5yis6l
         oY9XVf8Ai2FRf9s/SbILTR77fdhkmKGfDQ5UnLCheuvU91f+vEf2LxupS0EZknfqbe2+
         HW6u7OYqaHZLmU1TNhwjzutp2f7WjC94tKE7VMj4K0oD9VeFfqAo9bcDMBGd2KuX8fjf
         f3SUsVcYFE+GcD+ctxk0IcnU/qSWtsoT8rCODFlqn5rscod4SP7BsoFLJz/0LhJj16Cx
         WZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761318071; x=1761922871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ipd+fJKM54dwFhjqVqY2/vt0B0gPimIr32J295wlB+M=;
        b=sv71Ux6ckxKeWcMhAIoF+mXBZs7cdo5t9qZ9DzezpTGd9jralSYezmoOhYeo12jmLH
         Fl5oLQHq8h+BVKgTWs36tkCRc3tc/LEmn8f35KbhCO3i+yZi39P44TYHq9qD89sSXZJn
         Z2bCWXihNF6/zWWkwAAmjEqmseof1oVLeBQqvBhg5W6xHCKwmY7CzVfY9tNbf4FD6dDy
         xGRNA4Sgzt+1YOoYacaQKcjWAD2yzoRPBWBBs95j0L7ZI+ro7ZFbvjoLVw6sumupIygx
         siJrlAOvWGssWE+yrd+7/Te0bRLVQNXE7tyQPt7Sx9tlNW8UQEvFqt2BxzW8eMgDFEZ9
         EpVw==
X-Forwarded-Encrypted: i=1; AJvYcCVq2pcUE+CmbWmxvE9GP5s4OgNSvnXgCaGe9ucsSffw4mjN7+tmzKRIrODgj0QgyMKs55ggU5IpS1c=@lists.infradead.org
X-Gm-Message-State: AOJu0YzDyUheZ+7mEiq3gfSUBtPEdo8QlRl81OWwV2oIS2hvAllGJ863
	I/nJfB5GTrUZKIDdwOAIBl/64oxR0o8l/DuHb6SMNGipocjankAfXDBxLq61GdM+YPY=
X-Gm-Gg: ASbGncvdr/RRmqOOwKsh6dGEkPoFF04QgxwzvPYLwx5KqZDqHGr7HidoZihKimpKuY/
	bovhhBQybOOVLOHs9LruBO0O9uDg5rLaSVrQqoydNsk+JuOK1kd+raetOlcwf97neXGFI+QzQkB
	BWAXhradvmi2rAwmJjdgNgEcVvJkO8cQNYABhtaREN36kDHbwugXgUKEsukSnpilRt+9jhiz+0H
	sGD/XjLEjDlbXmjfLFoSZiWPEe+nxbBk4dJfldKiBUsIVagj5Ug0sMj4LvIFFLN1zhgdzoRFmSF
	lUevZ7qCk7O0qKA3+Ctahimht/hMJizWf+CqpY6fttVl6ct0rUDmCvhVS4XoC7i8kSn1wkZyMiJ
	fbt3H2EqLNAzyifTjPE5vnjZHYQ72482993D6mnQ3YDFrtZwti9EffRlXqsKEhNfRPRM4fwK9TB
	Ya7BY=
X-Google-Smtp-Source: AGHT+IHuDfyfb1rJHT8ZJBZDENWXEuZEgoATFw7kevTr6Wui6O5rdZfaFJ1o7hmkdy/EeXDSX0H8pg==
X-Received: by 2002:a17:903:8c6:b0:28d:18fb:bb93 with SMTP id d9443c01a7336-290c9c8968cmr381787975ad.7.1761318070419;
        Fri, 24 Oct 2025 08:01:10 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c4aa:f655:2dba:5bb5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e0f3794sm59537715ad.88.2025.10.24.08.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 08:01:09 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:01:05 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Guenter Roeck <linux@roeck-us.net>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Georgi Djakov <djakov@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joerg Roedel <joro@8bytes.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-pm@vger.kernel.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
Message-ID: <aPuUseub-Z60hrOx@p14s>
References: <20251023143957.2899600-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_080112_341796_F49144DC 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
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

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org> # remoteproc

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
