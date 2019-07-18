Return-Path: <SRS0=pV2g=VP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B3EC76196
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2019 16:21:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E66F21850
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2019 16:21:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KG3ZW5T+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="IqUh0Tsa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E66F21850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wIxPGlwQI2dWB9oymm5nfe0LLVsCuPCcwMQg/PmDync=; b=KG3ZW5T+2n27PoC2OASJNCkKc
	81X9oKfSM2XPyhFluU5UeYDLThWz1xCqlZApmdfUVhqszLmsb2uHzKyEKU9DkCc7F5DCk8D7Y1Epn
	slcQybGAfZ6N0GZFBbUOVIcMmOrTi/QSXGZDOpFPnwtydOxPSkVYhyvb7iw8dHWB+hPoR5/KMUjJR
	J6fCk+tnqEw+mQenFxLpMgzikhNcRxtlH61k4MNMjO1hNTvMoQQ+Yy7qRVT/PI5WNgFakGQ61VqC/
	DlywtVXBgua9MJfGoSLpoVbdr49ffzAL3enbRpxMnVZEHmERhgEssVWC4X0LBouvAZpQw9aueFn7i
	XHCldHGbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ho99o-0006FG-26; Thu, 18 Jul 2019 16:21:24 +0000
Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ho99k-00064A-65
 for linux-mtd@lists.infradead.org; Thu, 18 Jul 2019 16:21:22 +0000
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6IGFrdN029373; Thu, 18 Jul 2019 18:20:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=AvBlOX1aAMndwD1rjimEhtxf+389A11U97y4vAzgGfA=;
 b=IqUh0TsabC6t4UVUgILGQJoOnGYPHB6A9sgdy0pQo0YpyX/k0K+8YOgbM62oj46PUEBJ
 VMHguLTLKZpuhT50f3d3RdXVGyF6kTjYCTSiuj7JCt62pTWtW+EftpVJO0uKnK5h3dgH
 uZnzPwTGIRwk8vdR15Qs1c5hol+P+o8kq7CP5JhemBuKrKvBzIHhJYsxKGT+Ddw/h21B
 j98b1HPDnN1ApI4H7+rkes6BE+l99ewV37Isjstx4PCWsvOfhcF/UXPKHt0mKp/gySQV
 tcRIFPIFRmwjG4O2rwT4RoGmyQ/Qp5JDAGIHxwJD/t+/cWs402vzqVLTHxAxLDMp4hFU QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tsdeppqs2-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 18 Jul 2019 18:20:54 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4439038;
 Thu, 18 Jul 2019 16:20:44 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DBBA9533C;
 Thu, 18 Jul 2019 16:20:43 +0000 (GMT)
Received: from lmecxl0912.lme.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 18 Jul
 2019 18:20:42 +0200
Subject: Re: [PATCH] dt-bindings: Ensure child nodes are of type 'object'
To: Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>
References: <20190715230457.3901-1-robh@kernel.org>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <66b45e4e-31b1-f878-5042-2282a5e8334f@st.com>
Date: Thu, 18 Jul 2019 18:20:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190715230457.3901-1-robh@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-18_08:, , signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190718_092120_709764_AF867787 
X-CRM114-Status: GOOD (  15.92  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-gpio@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Rob

On 7/16/19 1:04 AM, Rob Herring wrote:
> Properties which are child node definitions need to have an explict
> type. Otherwise, a matching (DT) property can silently match when an
> error is desired. Fix this up tree-wide. Once this is fixed, the
> meta-schema will enforce this on any child node definitions.
> 
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-spi@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack. I will take this via the DT tree.
>

For pinctrl STM32:

Acked-by: Alexandre TORGUE <alexandre.torgue@st.com>

thanks

Alexandre

> Rob
> 
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
