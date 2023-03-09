Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845C0C61DA4
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Mar 2023 09:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTPS9EFEGAWBX3gbSgN0NXveKmZUGOl3Ah4i7D29EIg=; b=ivLbyXjiIbpuiO
	Y0tBZpcgX8M5ukUoQlyasf1WHHrF2EJesQVNcqQcqe89r+GoYkWDYj/8SYmcrOje7+MPgobwrjWJ8
	xRg4w8ctYxwKNrZ7n1o9uyo39aAkz4SXPxqq0g0BoH5mwdKok3X2F+GCdX3Cdk6z33NmQlwjD/8RN
	W8HLjx5cMDMKCD4DHlv6RKyLgYvl4s5+buuCiUErsm2nt5TtEVbQSxg5oNFZw0xh2YqGcVcbDsLbb
	5X8D2vgTf95PKre6kcudaelAj0ORcENz0cj7waCJBduUpjAG+U5vxHsyE0sx/1lrrHLQ4UzmyjlwC
	lOlWGQFWqjp5wViuOgIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCl6-008rA7-2E; Thu, 09 Mar 2023 09:40:24 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCl1-008r75-E1; Thu, 09 Mar 2023 09:40:20 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 0EF2A127D;
	Thu,  9 Mar 2023 10:40:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1678354816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j6A1cqIav5oN+sJ0Pm8CyKz7tSgwht+condPuImcVwY=;
	b=zsMPy9kNOSpYIQk2v92UlAChhQ1RPWvR19mptAEqIVjK7y7MtNDhCwb2WjCLD1XqQrz1Lw
	q8s4RCfCX8HShn15fWBvySjzhsBHUFHE1ZVKHu5VkB4RcwxibgapaU57G1lZ9MaCbGS+ZB
	d8zZihUMbqMqbCgfK1NPj8qFc6HdOzqsvmbsDviuS3ZwcHJ6DMQw2zRg/+2Ht3+IwL13B9
	3XbUFM/uL/TIFiDCwAouAEb4qEnSGJF/f7NhSKUHWODVLEtFviq2WFQVuobulTjGODAOt4
	qJx7Hf6BNV7PeSGwCgjwgSvM/epAZE1St3F3Qp7iV4+07CGebjwrTQ4MPMgtqQ==
From: Michael Walle <michael@walle.cc>
To: zajec5@gmail.com
Cc: a.zummo@towertech.it,
	agross@kernel.org,
	alexandre.belloni@bootlin.com,
	alexandre.torgue@foss.st.com,
	alyssa@rosenzweig.io,
	andersson@kernel.org,
	angelogioacchino.delregno@collabora.com,
	asahi@lists.linux.dev,
	baolin.wang@linux.alibaba.com,
	claudiu.beznea@microchip.com,
	festevam@gmail.com,
	hayashi.kunihiko@socionext.com,
	heiko@sntech.de,
	jbrunet@baylibre.com,
	jernej.skrabec@gmail.com,
	kernel@pengutronix.de,
	khilman@baylibre.com,
	konrad.dybcio@linaro.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-imx@nxp.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	marcan@marcan.st,
	martin.blumenstingl@googlemail.com,
	matthias.bgg@gmail.com,
	mcoquelin.stm32@gmail.com,
	mhiramat@kernel.org,
	michal.simek@xilinx.com,
	miquel.raynal@bootlin.com,
	neil.armstrong@linaro.org,
	orsonzhai@gmail.com,
	rafal@milecki.pl,
	richard@nod.at,
	s.hauer@pengutronix.de,
	samuel@sholland.org,
	shawnguo@kernel.org,
	srinivas.kandagatla@linaro.org,
	sven@svenpeter.dev,
	vigneshr@ti.com,
	vincent.sunplus@gmail.com,
	wens@csie.org,
	zbr@ioremap.net,
	zhang.lyra@gmail.com,
	Michael Walle <michael@walle.cc>
Subject: Re: [PATCH V2] nvmem: add explicit config option to read OF fixed cells
Date: Thu,  9 Mar 2023 10:40:10 +0100
Message-Id: <20230309094010.1051573-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230224072903.20945-1-zajec5@gmail.com>
References: <20230224072903.20945-1-zajec5@gmail.com>
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_014019_651227_B407760E 
X-CRM114-Status: GOOD (  15.72  )
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

[as this mentions  nvmem layouts it would have been nice to include me]

> NVMEM subsystem looks for fixed NVMEM cells (specified in DT) by
> default. This behaviour made sense in early days before adding support
> for dynamic cells.

Why is that? It still makes sense, doesn't it?

> With every new supported NVMEM device with dynamic cells current
> behaviour becomes non-optimal. It results in unneeded iterating over DT
> nodes and may result in false discovery of cells (depending on used DT
> properties).

What false discoveries?

> This behaviour has actually caused a problem already with the MTD
> subsystem. MTD subpartitions were incorrectly treated as NVMEM cells.

But this is solved, correct?

> Also with upcoming support for NVMEM layouts no new binding or driver
> should support fixed cells defined in device node.

How would you support older device trees with newer kernels or the
other way around? I'm not sure I get your motivation to drop handling
the fixed cells.

> Solve this by modifying drivers for bindings that support specifying
> fixed NVMEM cells in DT. Make them explicitly tell NVMEM subsystem to
> read cells from DT.

How can a driver know when there are fixed cells and when not? IOW.
only new ones can be affected.

If you want to get rid of the schema for *new* drivers then what
about having a new child node, something like "nvmem-fixed-cells",
similar to "nvmem-layout".

And then you'd tell the new drivers to use the new-style dt binding. But
there are no new drivers yet. So I'm still not sure I get your motivation.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
