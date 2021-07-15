Return-Path: <SRS0=WX7q=MH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617BAC636C8
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jul 2021 22:45:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06435611C0
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jul 2021 22:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06435611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jNrWlPqDm4Bceoe/dzM0hg1tAxbdePfy4kceW5kDmJo=; b=BbhC3/KQBk2Kk+
	QIhughdrxRgMq4/04mVoj3lKDZ7CtjfKCs+sMcRtDxGQy6foL+bCDNtPbnfqUVsODtTCbrs4VZK1r
	MpSpi2DUjPILctwIi1eHmk9xRgc3GTXAy+coGSkK4wGYttf3cS4S7BM6hR5hXlqv4ZEGtn6qc7+Vd
	YJlMiBx81PEQahgBKZ+b3CSoUPjsF2lVFxrGUuDQWIpZ0mc+Ykp3yGH2ZADpAH7cMGRcSLGt0P6yF
	1THOiXidcrBLdeLmNXbAs8DYn3JKvfTfeBmeuBhzViSI8wPooUX3KJuwAFM7OrDdjHpXt4JP1Pbn7
	lOOBIm1n8c+IkLuBkWww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4A5y-002VQT-6Y; Thu, 15 Jul 2021 22:44:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4A4N-002UmY-Bg; Thu, 15 Jul 2021 22:43:04 +0000
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1m4A4J-0005t7-7I; Fri, 16 Jul 2021 00:42:59 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Jon Lin <jon.lin@rock-chips.com>,
	linux-spi@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>, macroalpha82@gmail.com,
 sugar.zhang@rock-chips.com, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 p.yadav@ti.com, hjc@rock-chips.com, linux-kernel@vger.kernel.org,
 sboyd@kernel.org, mturquette@baylibre.com, yifeng.zhao@rock-chips.com,
 jbx6244@gmail.com, linux-clk@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-rockchip@lists.infradead.org,
 broonie@kernel.org
Subject: Re: (subset) [PATCH v12 00/10] Add Rockchip SFC(serial flash
 controller) support
Date: Fri, 16 Jul 2021 00:42:54 +0200
Message-Id: <162638886253.651069.9476890727039205269.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210713094456.23288-1-jon.lin@rock-chips.com>
References: <20210713094456.23288-1-jon.lin@rock-chips.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_154303_481552_C4728AFE 
X-CRM114-Status: GOOD (  10.57  )
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

On Tue, 13 Jul 2021 17:44:46 +0800, Jon Lin wrote:
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

[04/10] clk: rockchip: rk3036: fix up the sclk_sfc parent error
        commit: 0be3df186f870cbde56b223c1ad7892109c9c440
[05/10] clk: rockchip: add dt-binding for hclk_sfc on rk3036
        commit: b13c1fff66cc255c0a9d48561d05f0f7e8ffd385
[06/10] clk: rockchip: Add support for hclk_sfc on rk3036
        commit: d61eb8a1f5184f32ddc5ac03c930cff8e9a6fae9

I've just picked the clk-related patches for now, as they're
not dependent on the sfc being applied itself.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
