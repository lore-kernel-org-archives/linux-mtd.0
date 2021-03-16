Return-Path: <SRS0=hRrE=IO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F5AC433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 22:24:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4927464F01
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 22:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4927464F01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5A+1hTHhUY+1WgfNJIm+94gRlYwNBuONl57Q7mCOc+k=; b=WOtlR7it/mO3/Zb0FgIGd5X2T
	KN4pWOVhFoYekoib5e9eRnjiPU+0cTKV4HVnkLgZ1kucL8F7Z4RMhoxNcJzfEKkb3Q2dCTDTo/cQc
	TvE/L/Tb4XYj2b7mwHaDwK9a+DbgvRuGAEqilFZVCkMkj8fxYvU1q7W5ew7yJgJFpRMhoel7DBSnc
	lD/veyH04W7FDrk7IClBY2FyJE7qH4LIBWHAkSeNMv1UVXlZ6wnqDWL34BSpYoBJrOXIO4mpQMEmt
	8c5o7S7sGMNLdC6U8pcOxlwzQwTqVvRAum64dDSCRO8quNIonvrmNt7zpBLvrFbrJdiwVzAhdGwNa
	kZeSvhi6w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMI6M-001xeC-ID; Tue, 16 Mar 2021 22:23:46 +0000
Received: from mail-il1-f173.google.com ([209.85.166.173])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMI6G-001xcn-Tu
 for linux-mtd@lists.infradead.org; Tue, 16 Mar 2021 22:23:42 +0000
Received: by mail-il1-f173.google.com with SMTP id p10so14229421ils.9
 for <linux-mtd@lists.infradead.org>; Tue, 16 Mar 2021 15:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lcEgacFxEXTOUONKpaBOr7CK/rmW0Nxi28Yhlw7TNto=;
 b=i9hb03qvw4v8FQ/bKwoLzPRXnlP2ZU9kra0+zW1p5nOKiJw0yE6k9ODlxzKwFNfKH4
 Wr8sT64eOXVaMhsPGF+RUI6VNFXpQ9VvZZhtdSDfibgqoNa9L2YodJ69SDOgK5TxT2fU
 imFp8UI+nNs+pO/UINuIwhex1cOGUdWvLXlDQ24pKQRGd0tH817bdANHHl3p9H9jvkNd
 4QavYOvMgYlgl0vJnFAjTSy9jS9Q+6ixyLEyjzFGamwQwW3gqMFb+mmQycH8o/WT9nef
 /R8bgTaJSpkc3+cMEIGgvohK3GPidyQfEml90QrQq2eSDgsqIu3J1IDNW/BV7CAOvujD
 2/kg==
X-Gm-Message-State: AOAM533x8faruPOb+Z2ck/g02lrvsSBpwWBEirY9qa6ZVdyieprXTCrC
 HpJ70WFpQ8TYYnwnCLFApA==
X-Google-Smtp-Source: ABdhPJxQlggYieg0A96D07xQPL8UIkwZdQVG3xRj5IAyYzwC6Evtykc7FEXQvQZl3JBs/NaD+ze+qQ==
X-Received: by 2002:a92:d201:: with SMTP id y1mr5711020ily.129.1615933414864; 
 Tue, 16 Mar 2021 15:23:34 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id h2sm8619148ioj.30.2021.03.16.15.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 15:23:34 -0700 (PDT)
Received: (nullmailer pid 3790746 invoked by uid 1000);
 Tue, 16 Mar 2021 22:23:31 -0000
Date: Tue, 16 Mar 2021 16:23:31 -0600
From: Rob Herring <robh@kernel.org>
To: Tim Harvey <tharvey@gateworks.com>
Cc: linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: arm: imx: add imx8mm gw7901 support
Message-ID: <20210316222331.GA3790694@robh.at.kernel.org>
References: <20210309220014.22205-1-tharvey@gateworks.com>
 <20210309220014.22205-3-tharvey@gateworks.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210309220014.22205-3-tharvey@gateworks.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_222341_055790_F3A0AD74 
X-CRM114-Status: UNSURE (   9.98  )
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

On Tue, 09 Mar 2021 14:00:13 -0800, Tim Harvey wrote:
> The Gateworks GW7901 is an ARM based single board computer (SBC)
> featuring:
>  - i.MX8M Mini SoC
>  - LPDDR4 DRAM
>  - eMMC FLASH
>  - SPI FRAM
>  - Gateworks System Controller (GSC)
>  - Atmel ATECC Crypto Authentication
>  - USB 2.0
>  - Microchip GbE Switch
>  - Multiple multi-protocol RS232/RS485/RS422 Serial ports
>  - onboard 802.11ac WiFi / BT
>  - microSD socket
>  - miniPCIe socket with PCIe, USB 2.0 and dual SIM sockets
>  - Wide range DC power input
>  - 802.3at PoE
> 
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
