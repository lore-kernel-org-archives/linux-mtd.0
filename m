Return-Path: <SRS0=9vQs=AY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CF0C433E4
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 09:27:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A135820758
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 09:27:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1EHv57WG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="awNF3GOJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A135820758
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FUNS8CBivdXie/n6d+kMvgc3mKvA0Kk1xC6M/SagvH4=; b=1EHv57WGpfG+gCk1PPFMMGhvu
	oK5lBPKmOhWQbZ1tBZTYHjdVGdft5ucg0AgNnpi/YkYWWacnXi0WoRy646/w2VaKOodeQXLyjDq4q
	W2MtHyfGOvPlFJwxMZm0Ju9JETWWm8g5OLtCe8NpN4t9dOfIBsSYD+aCjE4MhFaYpYssmLD3kSwJX
	Eeu6Q4c1hRZ9lQuzOgaV0ZMY1EIFmvZJvOLxARCH6Xy5l9PaZml+ouhWX95tpv2TzPNgzGPB3uL0h
	Q+Eu5CvSE9zbDBXsBBwjR2eVVjX29gPQwIv7DvzoSHRKIXtWpBJsUUdhHZ1WU+TZ1Dkbo/l2QVWcm
	rJ5x2nxOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juujP-0007BJ-QD; Mon, 13 Jul 2020 09:26:39 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juujN-0007Ad-4Y
 for linux-mtd@lists.infradead.org; Mon, 13 Jul 2020 09:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1594632396; x=1626168396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vL41X88FwAgkDXETE4N/DxdgdUjInMPhcnNmYi9pfwg=;
 b=awNF3GOJua8Uoj7LljGAWXx2NkCy4wq+2eNg8I9qe1BGWK7gTqzIoaKY
 NmuOatxDlc/wIrjTjUHmS535SGfjmpHNyK1fIrYHbSFOb+igk59cU8aoW
 cwR5ndRPUMRgREfgNg9twWAs8kVhoPOV2PuGh24mQtSb509D+mFlIF55U
 GkOHHOat1jrI86BJ4A5mWQYQSObwkC7aG8U9NZAii4u2ea+cs1X1AybYb
 RorRLiTDoTMYPS1S7Nxip4sHKnUM4EqIwhmqTKErKzkorPv3svI0zjG5E
 EErpdvzIvKFKlFmksg6725V9Z25+vTkzXVAb84MFyNLaRKN94IG+G3Xxq g==;
IronPort-SDR: 4WtjRueCFoSSehdm+HKn2k5gKpQLyM9PekiiSYP3ii2GRpF1MMX9+OHXLm/7BQ3TQR6mGto7qX
 T8DJvwFvFzOR0biEZmDsmOxbHzRrDdMB84OLvodVGUVf4/M4b6G8GNE7qP89UDuLVT6uWZYPji
 fwLgerWVlHnhxeM+Z0LTRxIWVdUPibkW76ipYZz3jV/FHVtOZo6U41x53FxwO3gf3XfQDvqMlQ
 u1mqR6QG2JCdBWE/do9cwByrUWf2ZS3+fMTe80xe9p7AOnT8L714VVN8lbqw6ihkKUxjea1c1p
 VUY=
X-IronPort-AV: E=Sophos;i="5.75,347,1589266800"; d="scan'208";a="87312056"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Jul 2020 02:26:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 13 Jul 2020 02:26:27 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 13 Jul 2020 02:26:25 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: Yicong Yang <yangyicong@hisilicon.com>, <linux-mtd@lists.infradead.org>,
 <p.yadav@ti.com>
Subject: Re: [PATCH v2 0/2] Add support to Disable the flash quad mode
Date: Mon, 13 Jul 2020 12:26:20 +0300
Message-ID: <159463163327.204564.12231091628878870659.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1594027356-19088-1-git-send-email-yangyicong@hisilicon.com>
References: <1594027356-19088-1-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_052637_337408_42CC1415 
X-CRM114-Status: UNSURE (   8.09  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com,
 Tudor Ambarus <tudor.ambarus@microchip.com>, richard@nod.at,
 john.garry@huawei.com, linuxarm@huawei.com, alexander.sverdlin@nokia.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 6 Jul 2020 17:22:34 +0800, Yicong Yang wrote:
> Previously we didn't disable the flash's quad mode when it's removed
> Then comes the problem that if we next time load the flash
> in Standard/Dual SPI mode, the quad enable bits is not cleared,
> and the function of flash's WP# and RESET#/HOLD# pin will not
> be restored.
> 
> This series adds the capability to disable the flash's quad mode. And
> restore the flash when it's removed in spi_nor_restore().
> 
> [...]

Applied to spi-nor/next, thanks!

[1/2] mtd: spi-nor: Add capability to disable flash quad mode
      https://git.kernel.org/mtd/c/be192209d5a3
[2/2] mtd: spi-nor: Disable the flash quad mode in spi_nor_restore()
      https://git.kernel.org/mtd/c/cc59e6bb6cd6

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
