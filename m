Return-Path: <SRS0=hsQV=GV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B87C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Jan 2021 12:59:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99BD622B48
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Jan 2021 12:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99BD622B48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RkaAH42AHaXEXXYYgYIUt6VoblrAnkxwr9fwOvjyw7s=; b=iFAiwV8FUsjCy/xGw2+NIhRBQ
	oV6A8VSn1EeXzaFLwY/vZqV21rtUSqBuNuy9PrNj/5NGg/L65qUAsHsokdDvammJWZcY8tz9kXSGO
	p6cG1O6AL0dbFJea8aVaizOojEncXVZ7UNm0L6V5ZYF7FA+v4pzwrs5x6unfyOKjYTKDVDRgT6Esg
	GLJZamaBOKFJMB7xibanT6Fs1oVtH53/TWAzm+1dlHOjtSseCTTsqcjb6d1385bDQUlyNFT2BDq9h
	L7/Yd6T+Nq/3clhegNpGHwpRgvJ8r6XivsaYjx6KPchNkDpQxsAdK5fiv6DouSjNu/3fftzUeWWbs
	TpazuL3Rg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1U6g-0002Aq-J1; Mon, 18 Jan 2021 12:58:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1U6R-00025F-5P; Mon, 18 Jan 2021 12:57:51 +0000
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1l1U6F-000424-1T; Mon, 18 Jan 2021 13:57:39 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: richard@nod.at, robh+dt@kernel.org, vigneshr@ti.com,
 miquel.raynal@bootlin.com, Yifeng Zhao <yifeng.zhao@rock-chips.com>
Subject: Re: (subset) [PATCH v16 0/8] Add Rockchip NFC drivers for RK3308 and
 others
Date: Mon, 18 Jan 2021 13:57:36 +0100
Message-Id: <161097370156.287816.7898637730580960045.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210002134.5686-1-yifeng.zhao@rock-chips.com>
References: <20201210002134.5686-1-yifeng.zhao@rock-chips.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_075751_246912_82F2DD57 
X-CRM114-Status: UNSURE (   9.55  )
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
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 10 Dec 2020 08:21:30 +0800, Yifeng Zhao wrote:
> Rockchp's NFC(Nand Flash Controller) has four versions: V600, V622, V800 and
> V900.This series patch can support all four versions.
> 
> 
> Changes in v16:
> - Fix some comments about 'ret' variable.
> 
> [...]

Applied, thanks!

[6/8] arm: dts: rockchip: Add NFC node for RV1108 SoC
      commit: 2525f194f9dc07c48b0a12697128357068c2e04b
[7/8] arm: dts: rockchip: Add NFC node for RK2928 and other SoCs
      commit: 9c2bfe53b2fc4a8a63311f162e80b27978db6c06
[8/8] arm: dts: rockchip: Add NFC node for RK3036 SoC
      commit: 4cd9a03435bcd20ce6f524e3826fd263951c22fe

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
