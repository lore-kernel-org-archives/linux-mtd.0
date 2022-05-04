Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6B0C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  4 May 2022 06:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=72xmtD5LUGUsd4b1jt0N0kDlmJd0NjSyX9cI50E0X7s=; b=hMTizGZcJf52BD
	JzBFnxnlwdHLTTiUzI2V07hwJklu1coVKx78MKa/ja9+aq+dRjv8fBGXhK02YbW7uAycNdbNfpsbw
	z67cr23UR5GK0qhhAOcNpo5mv7mq7Tv+FJuRINVWcvgWcWSSlLUskicBjyYpeptbzjL/aJ47eJMzo
	W2etkL/VPCl5OiEYOWG768T5xWCzc5aueg4g2rekH/nJ5kLstGnvb/hztGGbXQI01ZpLDihF33baX
	FLsTXAOdcyQuxJ3R/cZvoe/sCHp/POkaBCUNgAXh3jAbzEn8HJFbRJk7D5aPTGVssfpqLenM/3UA5
	tsSwpMB6awwa29c4+1Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm8h8-0092JU-Kj; Wed, 04 May 2022 06:41:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm8h5-0092FU-AT; Wed, 04 May 2022 06:41:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CE695B821D7;
 Wed,  4 May 2022 06:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929DBC385A4;
 Wed,  4 May 2022 06:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651646459;
 bh=ZGMwwfSt9WgGcP9EzHW/QosFc70Yb/XaCBfaIMon8lM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hCMa156AuRtjnImdRRFb6sjNT7gi2K+aKH0x8uKbL7AEODCLcmpA+AldqhNahLoMc
 Jjbn4PU2sZC0QO3tUog7PiYYrqIfJDpXhjQPR0ah9UBAo6hM2LqRyEviiRxk8BR/Z/
 PswEhJLlhaaJETbJ+cDB+HgHVFfdIRtcQWjx3W6kmEYtvsvtdX1D61teQWllRNYd4Y
 4rq0yVjTAy3gemypN42SU8Wvxydjxbsf9n9Yu7PohyC0omGj3kKtLN8XGs6TxWmKd5
 RbuiHnFactE1ob6Dd26hg53PXFe++MOjqEkVBKu+OdQv2rpx3HjFyo1wUYQL3DAF3f
 4Lj9rl6MCVe6w==
Date: Wed, 4 May 2022 12:10:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Abel Vesa <abel.vesa@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 Anson Huang <Anson.Huang@nxp.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Han Xu <han.xu@nxp.com>, Dario Binacchi <dariobin@libero.it>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-iio@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-can@vger.kernel.org, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Drop redundant 'maxItems/minItems' in
 if/then schemas
Message-ID: <YnIf95FnuC01qxIp@matsya>
References: <20220503162738.3827041-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220503162738.3827041-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_234103_536421_5D891F46 
X-CRM114-Status: GOOD (  14.49  )
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

On 03-05-22, 11:27, Rob Herring wrote:
> Another round of removing redundant minItems/maxItems when 'items' list is
> specified. This time it is in if/then schemas as the meta-schema was
> failing to check this case.
> 
> If a property has an 'items' list, then a 'minItems' or 'maxItems' with the
> same size as the list is redundant and can be dropped. Note that is DT
> schema specific behavior and not standard json-schema behavior. The tooling
> will fixup the final schema adding any unspecified minItems/maxItems.

For phy:

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
