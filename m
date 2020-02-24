Return-Path: <SRS0=aChT=4M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C80EC38BE1
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2020 18:33:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42E4E2084E
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2020 18:33:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j99+FMrW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42E4E2084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMHOQg7T/sinPWHMyS00KF1bXlM1IGHjs8wooiHIylI=; b=j99+FMrWsuCiTC
	LAYn/2m5mS50rHophqFu7Y0p+ZBp0ebB7CVwQ4qsd/xnRbnlPNTaOitrdI2CdNUeBO8RSdfsnP3Gr
	D28zynHuADv6VcSkJldG4cynkz3s6Hq9/huqgAei0/0CosGpQWYEA+JKq0hlQsyxPdmuUNmVReVaB
	+/3qCUeMvrBLdv8Bbt717T5UvWklhqHqSy5jMQVRQptZS3RszG3dRUoOO1oX657ZJgcDG8K5zYUEG
	bZkdeScRJocxtED3Ul7aOg/gjCMohB9SgBR2WeY+GtR/a7kWqmOjZkMaZlMsraDEzfAruiGoJZVtO
	a4WU/M55JVQda/gccvvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6IXO-0007KB-Um; Mon, 24 Feb 2020 18:33:02 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6ISU-00012V-8Z; Mon, 24 Feb 2020 18:28:00 +0000
Received: by mail-oi1-f193.google.com with SMTP id r137so9884991oie.5;
 Mon, 24 Feb 2020 10:27:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8b3MliEDFbDrUpBm8jGhwYqreoGs6m8FNnF/yNIueEU=;
 b=Tb2wTBaOM1MDXpLpney58Kpc8cOzF4gKSRXv8h79ePvc/KQ3YelB/kJ9WOTrzVCQQm
 kPytDDHcy5CbZnKgpBf4cyBCo8knl/Ji7WvsoXrm8+L/66lxeAP4NbEkq1ZnsxNZHmmb
 OrXD/SUmsT5JGlhlq23Uew5YuIZ24lcTT3nPIuuJx4yX8wqHmel8DSxYjsIzAyDI6cBb
 sMvz8mLzEA8BHpI1lRHOeoQudOx/WWli2k4Uuj3OTUF8gJ6qJ2h7bjh564mNVjo1bLtW
 DkcT9JzFQ5JSm6SvOhAcbVV2Tw1Gnr0XsSg/CLJczD/DoncISpeaFMDbz0gZOxyS386d
 dWwA==
X-Gm-Message-State: APjAAAUdtenKB4Q+z9FWgSOHBaBNW9YWCHZeU52rLOh3kYr9Actf6JdH
 v0CUoMclJUj+qftYkx5Tig==
X-Google-Smtp-Source: APXvYqyzy4iiGXu+ZZ3t2yBP3j4K/yU2pKb0H/blTr6+iujeHVCL8mJihe7tO3CjLAVcADKqUCNWGQ==
X-Received: by 2002:aca:bfc2:: with SMTP id p185mr318449oif.57.1582568876626; 
 Mon, 24 Feb 2020 10:27:56 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v10sm4255017oic.32.2020.02.24.10.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 10:27:56 -0800 (PST)
Received: (nullmailer pid 13156 invoked by uid 1000);
 Mon, 24 Feb 2020 18:27:55 -0000
Date: Mon, 24 Feb 2020 12:27:55 -0600
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH] docs: dt: fix several broken doc references
Message-ID: <20200224182755.GB27161@bogus>
References: <0e530494349b37eb2eab4a8eccf56626e0b18e6d.1582448388.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0e530494349b37eb2eab4a8eccf56626e0b18e6d.1582448388.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_102758_377277_40004144 
X-CRM114-Status: GOOD (  11.42  )
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
Cc: alsa-devel@alsa-project.org, Olivier Moysan <olivier.moysan@st.com>,
 =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vignesh Raghavendra <vigneshr@ti.com>, devel@driverdev.osuosl.org,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Piotr Sroka <piotrs@cadence.com>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Feb 23, 2020 at 09:59:53AM +0100, Mauro Carvalho Chehab wrote:
> There are several DT doc references that require manual fixes.
> I found 3 cases fixed on this patch:
> 
> 	- directory named "binding/" instead of "bindings/";
> 	- .txt to .yaml renames;
> 	- file renames (still on txt format);
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../devicetree/bindings/mtd/cadence-nand-controller.txt       | 2 +-
>  .../devicetree/bindings/net/brcm,bcm7445-switch-v4.0.txt      | 2 +-
>  Documentation/devicetree/bindings/sound/st,stm32-sai.txt      | 2 +-
>  Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt  | 2 +-
>  Documentation/devicetree/bindings/spi/st,stm32-spi.yaml       | 2 +-
>  MAINTAINERS                                                   | 4 ++--
>  .../devicetree/bindings/net/wireless/siliabs,wfx.txt          | 2 +-
>  7 files changed, 8 insertions(+), 8 deletions(-)

Applied.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
