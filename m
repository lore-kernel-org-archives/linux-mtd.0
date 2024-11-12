Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE0ED3ABFB
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2024 13:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uit05NZ3VH1pMW5sFaeQHuBeIR+Y7ERxcS/TOIdDs/U=; b=XJz0nW9lWKT/7E
	4I1rcVfRmPL678RghmtwfVcC6n+qbLCWE+vauyO7k1S10C/szgzoQYjmjfklfguS+YTpCsEFI90hV
	hDg4kkB5X1POH8N4+82rArgfkJ/QW6Cyiywl8iYmVqK0KAPIYYSHzeLrfcJgT4RkiNYWv8SfQkvYy
	HuBsWm/aa0xtlfnE3sY6zuciVC9K2w+cWbopvXBgh+FMlIrpdQt5Nm697KLiVID4UT31GDeMaxdQf
	RpPgbHNjoBKifQxjG5LhinlBMXtTRfZcXJk/Hmm8OVl9HRPR/sIvIpfIP4pZDhV3Cg33a5VAMaE3I
	Ptv5Jj5nXWy1G0CtsCsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqiN-00000003WAS-1lv2;
	Tue, 12 Nov 2024 13:13:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqbc-00000003UrP-2sjT;
	Tue, 12 Nov 2024 13:06:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D6C1A5C576C;
	Tue, 12 Nov 2024 13:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F54C4CED5;
	Tue, 12 Nov 2024 13:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731416811;
	bh=gZIoQGeaxcISi/ApxKkNhmG1J31HpPDf5Fz9RDF5j7A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Au0AuZi/Rn7AT215+X3xhBpDv2QBrk/MG72TFVKe2QDEBUqSbF2RjZqR+WR8H9H+r
	 wjTZrGv9gG25+EWAjHc9b6VPh0FREUb2t/EcqUpmliZVIv64CMEr35eppyew9b6qlP
	 fLTpgOxWbf5DgmG7T5Nd0nioGzwM9Xq2t8PzA6oTncpLqdODXHj2OVoejZPa4sk9vC
	 9Hag+ZCqioZWlLHuaJy5BcfCQKSK7ogdCsE1RNYZdkLalye/3oG/iqGI/GPgMyvpJv
	 Bc1vFGxS8HavceXJANJIZMk1o3JEXDkmles1llhgqgMMLLWBqJGKz1o2eJsneNduvS
	 x+kqoEbZ5Pcdw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peng.fan@oss.nxp.com,  m.felsch@pengutronix.de,  pratyush@kernel.org,
  mwalle@kernel.org,  miquel.raynal@bootlin.com,  richard@nod.at,
  robh@kernel.org,  krzk+dt@kernel.org,  conor+dt@kernel.org,
  shawnguo@kernel.org,  s.hauer@pengutronix.de,  kernel@pengutronix.de,
  festevam@gmail.com,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,  Peng Fan
 <peng.fan@nxp.com>
Subject: Re: [PATCH v5 3/3] mtd: spi-nor: support vcc-supply regulator
In-Reply-To: <20241111111946.9048-3-tudor.ambarus@linaro.org> (Tudor Ambarus's
	message of "Mon, 11 Nov 2024 13:19:46 +0200")
References: <20241111111946.9048-1-tudor.ambarus@linaro.org>
	<20241111111946.9048-3-tudor.ambarus@linaro.org>
Date: Tue, 12 Nov 2024 13:06:48 +0000
Message-ID: <mafs0bjyk7g9j.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_050652_783087_1038212D 
X-CRM114-Status: UNSURE (   7.62  )
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

On Mon, Nov 11 2024, Tudor Ambarus wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> SPI NOR flashes needs power supply to work properly. The power supply
> maybe software controllable per board design. So add the support
> for an vcc-supply regulator.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> [ta: move devm_regulator_get_enable() to spi_nor_probe().]
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
