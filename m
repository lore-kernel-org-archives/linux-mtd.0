Return-Path: <SRS0=qoSA=CO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A856CC433E2
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Sep 2020 06:12:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4653C208DB
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Sep 2020 06:12:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w1vxtAGz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TrhoEUWF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4653C208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=llS1qVeVzGX2iRhbY9fi9+8zghrt7ZMwVAjVBB5YX4s=; b=w1vxtAGzCnTg8yogYFgbxQauS
	4wrVuRG6FzzFqD2dXNMtyffStyKHuu+JZdhhBCph+0/ekspUBeoKnonT+vNwjL4Fhe1GXJ9sBpiVL
	IiVEIZL27fsnd0uKEqub73MmFWjjBmNaLsIrua52OOX7vWEVEpVTQ83Y+WswiU/d0RjjyFSGpYuFM
	saNqKt8EF+wEMROKmfN5tZZfqSzfYxQAA3/+J8NB5G59yWXa00YDT0vob64xrp0+Y5jBhjRJrHhL6
	2p13bTs5CMkYo/yf2+fsKeSgmgHiJbPIPi91yziOfZamK8iOqbuIpJbWIvUdnOpuJwYT9DhYbg/lp
	qMsT4RSvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kERQb-0007vh-5Q; Sat, 05 Sep 2020 06:11:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kERQV-0007td-Uq; Sat, 05 Sep 2020 06:11:52 +0000
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 194A8208DB;
 Sat,  5 Sep 2020 06:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599286311;
 bh=CxoKGPqi4I54vbqLyfl1P1Xqg+kyx71MdFE6vDLG0/Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TrhoEUWFDIw9aRg6gJ43K36qpVmy9VKehFeQoejeMp3cnUjC8U2vqEgNBhyZnWOWV
 blOe2hDbTa6yJdhCqtCJZveZ6EaqCYrNYUEe23WYkJW3a8EbUoOdReaVtowYZVFvxb
 2295tMd6Nj6DyHz//hGMqR+JWlmL91PRkg3lyqEg=
Date: Sat, 5 Sep 2020 14:11:44 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 08/19] arm64: dts: imx8mm-evk: Add 32.768 kHz clock to
 PMIC
Message-ID: <20200905061144.GB9261@dragon>
References: <20200828164750.10377-1-krzk@kernel.org>
 <20200828164750.10377-9-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200828164750.10377-9-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200905_021152_042984_3D6267BC 
X-CRM114-Status: GOOD (  12.61  )
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
Cc: devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Anson Huang <Anson.Huang@nxp.com>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Han Xu <han.xu@nxp.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Aug 28, 2020 at 06:47:39PM +0200, Krzysztof Kozlowski wrote:
> The ROHM BD71847 PMIC has a 32.768 kHz clock.  Adding necessary parent
> allows to probe the bd718x7 clock driver fixing boot errors:
> 
>     bd718xx-clk bd71847-clk.1.auto: No parent clk found
>     bd718xx-clk: probe of bd71847-clk.1.auto failed with error -22
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied, thanks.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
