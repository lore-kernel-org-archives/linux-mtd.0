Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA469C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jul 2022 14:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N7J6u+BbdIsU964PWmUw6oGimgdO13XxJ6cvdCp2Gs4=; b=zLh3smJpmXu68DxQJhnvBk6elG
	MY2KvYnMPBk4dyXx8Udh2My/7xy8+J+sFGDDv3A8P2qxGdJw+oTVeVtuh3HVpJvbZNrdPj7PKiEfd
	lU8iGwWILm27s9GiwZ7LnuN9O8mM5Qv1UwTwIIrI9KNvFWQALs12NiCttLNbBUfLwy5hcO4jK4Ons
	97mYyW3ZqmiKx6aD449q1FT7cRVEMSgJimtgmTYdyO0mLhgnVl2PGDtYiuKtVmrLS4/OFk1v43b4C
	RHOlfaRJLMYgUqGDTMI71oaOV2h799NCDEOH64NG/Xuw+wHjolrJOGGpMOvbDe4zjRg85xDSJtUQF
	cW1pqCSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8j7a-000fdg-Qb; Tue, 05 Jul 2022 14:01:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8j7K-000fTD-8B; Tue, 05 Jul 2022 14:01:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:References:In-Reply-To:
	Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BufwydC3gNQB0ICZ0UOD1tKDxwySMEp3LR8WaS4Z4zs=; b=ENZaePmjW889KNpdaPshWr3XHU
	Ph+OSZ9N9Pf131LQynodukm/8VH3i/unxTwEBXzrByIdZa5NtE4pfyD5AMsoBKgU9sVfq5sN1gY2e
	ZJ1ztkoIfwXmU3qjUOlv5/9Sa8RJtvw2ZkXQ4K46HgWz+wZlKob0vYRmj5hfuHFfHHO6vlTLIMOuS
	9up/xFaem5O4HYsA05nyjEc7ME0FYgccCQNP2VmkyR23RlnQ7kDzJI1I8FCdxoKORuBwyq4GBnKlU
	10eXBigeqbYJqlMD45ZWzImajP1SwWhuAjzo2jCcoFTTU7FTo7Vt0FtdisjbxoWWThrQtvh2TZ2kf
	VsAWKyVw==;
Received: from ssl.serverraum.org ([176.9.125.105])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8j7D-0000vO-5S; Tue, 05 Jul 2022 14:01:27 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 251922223E;
	Tue,  5 Jul 2022 16:01:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1657029672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BufwydC3gNQB0ICZ0UOD1tKDxwySMEp3LR8WaS4Z4zs=;
	b=fYcpBUFyOUG+LwIiR0lDML0iXn23L3u5Ir6BdbqPLeAJ6zuOIvEnxM0DeAq1IexEL51w3w
	J/yuiP2d4qHswkKIh/aMnShDG7OMS/JDi0Ln8y3avECMjWDHnLHW8mlSajaEXifahs5XtA
	FWEhq9qD4KYrPWK3OTzYkxrUsOXnuaA=
MIME-Version: 1.0
Date: Tue, 05 Jul 2022 16:01:12 +0200
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
Subject: Re: [PATCH 01/11] spi: spi-nxp-fspi: enable runtime pm for fspi
In-Reply-To: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
References: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <fc7d7ffe775feb1d9fde19a5dadbca1f@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_150125_421612_0F09305E 
X-CRM114-Status: UNSURE (   7.55  )
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
> Enable the runtime PM in fspi driver.
> Also for system PM, On some board like i.MX8ULP-EVK board,
> after system suspend, IOMUX module will lost power, so all
> the pinctrl setting will lost when system resume back, need
> driver to save/restore the pinctrl setting.

On a side note: The mails to Ashish Kumar bounces. He is currently
listed as the maintainer for the FlexSPI driver. Will someone from
NXP take over?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
