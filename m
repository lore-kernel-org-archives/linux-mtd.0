Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D79C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 22:16:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82E016101A
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 22:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82E016101A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mlAdqAKP4KKpql7fhMgDEWXfEiBUv0jEVOkO5Qgk2nY=; b=ygH5uVVrqQZm6T
	CAtDmnDNWRtayZ3wFRtn163UlzlSn9r48OxtuC6PXP6QcdQF+78WPmwNyBdwur4QIb5XAnSu4/cHW
	3Q2eNLOB6qgY7GScQc5zxjbPpUP49osh5oZ5zNujwPGo7BGL6ZB/fv5pzZdAPUZ77Qlx5QLByzb6Y
	Ufxdbe+seNW7rp5SP8XrKIw2XfyG0cU3kE5DVyz43SU3FGFkpBdHXqIuHGP9o3Gp3MAYaWuM9bPpL
	DLqaYPQMWYwWoTLGpo79uFHRWp6ap5M9QTI03cmlv9UpCFFLaQQAXNMwouHWjRCAIukvEG/d+TGEA
	mNhIWFZxQ5fxH1zsDdqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGTq1-006l2a-10; Wed, 18 Aug 2021 22:15:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGTpm-006l0F-Oc; Wed, 18 Aug 2021 22:14:56 +0000
Received: from [212.185.68.41] (helo=phil.client.m3-hotspots.de)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mGTpj-0001gc-9s; Thu, 19 Aug 2021 00:14:51 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Jon Lin <jon.lin@rock-chips.com>,
	linux-spi@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>, hjc@rock-chips.com,
 linux-rockchip@lists.infradead.org, p.yadav@ti.com, sboyd@kernel.org,
 macroalpha82@gmail.com, linux-arm-kernel@lists.infradead.org,
 yifeng.zhao@rock-chips.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, broonie@kernel.org,
 linux-mtd@lists.infradead.org, sugar.zhang@rock-chips.com,
 jbx6244@gmail.com, robh+dt@kernel.org, linux-clk@vger.kernel.org,
 mturquette@baylibre.com
Subject: Re: (subset) [PATCH v13 0/6] Add Rockchip SFC(serial flash
 controller) support
Date: Thu, 19 Aug 2021 00:14:48 +0200
Message-Id: <162932487840.2867187.12225818198624183651.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210812134546.31340-1-jon.lin@rock-chips.com>
References: <20210812134546.31340-1-jon.lin@rock-chips.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_151454_863007_F6D15C6B 
X-CRM114-Status: UNSURE (   9.57  )
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

On Thu, 12 Aug 2021 21:45:40 +0800, Jon Lin wrote:
> Changes in v13:
> - Provide independent interfaces to obtain RX TX FIFO status respectively
> - Add more debug information
> - Depress DMA limitation
> 
> Changes in v12:
> - Remove useless oneOf lable
> - Add sfc controller discription
> - Remove the limitation of SFC_MIN_SPEED_HZ
> - Add IRQ_NONE method for irq handler
> - Add SPI_MASTER_HALF_DUPLEX flags
> - Add sfc interrupt mask bits and status register initial progress
> 
> [...]

Applied, thanks!

[3/6] arm64: dts: rockchip: Add SFC to PX30
      commit: c68defec1585819af54f011fa4d47892b38fb74a
[4/6] arm: dts: rockchip: Add SFC to RV1108
      commit: 9d508827c7939242e8ed6b06f66aa87d9f7ea832
[5/6] arm64: dts: rockchip: Add SFC to RK3308
      commit: ab438ba2dc6b7bd3dce8e3c8b0f131905cd133d9
[6/6] arm64: dts: rockchip: Enable SFC for Odroid Go Advance
      commit: f9576999b0aef399e7cb1065787032d42198c362

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
