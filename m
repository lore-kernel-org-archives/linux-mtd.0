Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BB6C43334
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jul 2022 13:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZHHroRkl4BFlNlNfCficK0VAKtVaUC7aHAyMB4HEQ8=; b=mYm+6aI4a8owBXTqx656cJEFRZ
	g5DQWiuLYC/4Rfw0aEz5IT55lzd9Dw5P0Cp64qHCcTrfatMLtJMOHoy979AzGGS9kGAR13TgbBFrQ
	N2jHtBtxNERIWFrqsvR0WWMyYvYYEDLHN+a0cJA+BkuWpOVUubkhowChdUe5om+ZR+36J1tpPYyJD
	c98jsJJbkAHShYq6DYBNMoUiFFpUmrmaPDpNji5Qa86jGfi01wHIoUWiulzFsEEIuR9aHF4sQaQXL
	Nri5A+Wx9NmaB7DfZTtipKWOJMIa1xOryoHv8CokUf9ChBwWECdNdjd45TIZKm2tOg2zqYrhkBPiu
	OH4cXbuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8iwV-000bZC-4f; Tue, 05 Jul 2022 13:50:19 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8iwK-000bVW-Ho; Tue, 05 Jul 2022 13:50:09 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 13EB02223E;
	Tue,  5 Jul 2022 15:50:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1657029005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GB9HU/M2Mnn421s3orIG2Ic3eQJpqeuHzFfYbqGQ4Sw=;
	b=jqWm2euabGg75wqWBKK2DDHsz+WYLaebWUdzLXcIgT1kaJmaxy6YOX7zID2TnkI0lqcsJl
	p+sYlNnbYudAFO39mqugj8HREtra9oKXnrcvW+ClZgqysquP6Gygnfy4MA5swhzumzmKmN
	7etNfT9Ogav64i8NrW84cX97LOqKr24=
MIME-Version: 1.0
Date: Tue, 05 Jul 2022 15:50:03 +0200
From: Michael Walle <michael@walle.cc>
To: haibo.chen@nxp.com
Cc: ashish.kumar@nxp.com, yogeshgaur.83@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, han.xu@nxp.com,
 singh.kuldeep87k@gmail.com, tudor.ambarus@microchip.com, p.yadav@ti.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 festevam@gmail.com, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
 zhengxunli@mxic.com.tw
Subject: Re: [PATCH 05/11] spi: spi-nxp-fspi: Add quirk to disable DTR support
In-Reply-To: <1657012303-6464-5-git-send-email-haibo.chen@nxp.com>
References: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
 <1657012303-6464-5-git-send-email-haibo.chen@nxp.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d1b27db8bb86762587bce829a4e39c56@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_065008_816024_9C20C1DC 
X-CRM114-Status: UNSURE (   8.70  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-07-05 11:11, schrieb haibo.chen@nxp.com:
> From: Haibo Chen <haibo.chen@nxp.com>
> 
> Not all platform currently supports octal DTR mode. lx2160a do not
> implement DQS, this causes flash probe failure and therefore, provide
> an option of quirk FSPI_QUIRK_DISABLE_DTR for platforms not support
> DTR mode.

You write "DQS is not supported" but your quirk targets DTR. DTR works
without DQS. DQS is needed for faster frequencies, no? So the quirk
should be named accordingly.

Also, this compatible is (unfortunately!) also used on for the LS1028A
SoC and as far as I know DQS is supported there. I'm not sure what to
do here. Maybe add a new compatible "nxp,ls1028a-fspi" and change the
device tree to
compatible = "nxp,ls1028a-fspi", "nxp,lx2160a";

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
