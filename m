Return-Path: <SRS0=kfRK=BG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D046C433E8
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 12:34:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D43920663
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 12:34:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JDXTBwhv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="poAoP0cJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D43920663
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1Zk3LMOfCcg+yve91Z1h7pEuS2NU3OngypAmhWNBOZg=; b=JDXTBwhvkPP0ADCQJcgl4VfDk
	wZjRMsaGXPZ/jM6bZgjMkgKTCosyATfTShwpaCEvKDp5c0Aw1y65cCE3v0f81L6xgUiATBEeXE8kG
	mCRm1JKNxW+46tMSJRVdBS4yl5FWGECbmIeBGd21QQGKijBYFeHuIRQZjEwCVaS6iRRA4pF+nd4bf
	lzEQyK2lx4v/ERZifU/S2c+kxDgIbCJwcW64UHz9YrVaPK8N5Ifs4oOUfU6K/p6BbaclwySyRk7lJ
	I638yxqwfhdNglsn8+DyCprR0s/izykbvPUthHr4zakBgj+dSGxqZaxOsvcFAIysUCSWBs7EQ7xj/
	8ywpZP1Ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k02KP-0006Ra-Lz; Mon, 27 Jul 2020 12:34:01 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k02KK-0006P7-MW
 for linux-mtd@lists.infradead.org; Mon, 27 Jul 2020 12:33:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1595853237; x=1627389237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kk7mDj3shVL78FoLQVIgoSsJqxh6RbgaFj8efq/de6U=;
 b=poAoP0cJZjFt5we8eTmwZIM6m2fRNNJknzhi6I/Co/6jG/8tMqiPDwml
 RQy7Yfi1Q1AMnoBgsdsL0QBmWK0hvUYHQ87WfjCzZ+GjuFar8CYRrBIo7
 5Dn9WG3rnkFtHDElB+6t4gRvcW7mRxvETlOCoEI+m37cnNvBJZwYSWR7b
 zdR9bKx7LrN/Rpe2g7JzHZ/9fCXpeSxchtWQ8oeglffoVj8lwYOIBx0pz
 MTrgeJ6a3yGW5qJqXbR59S2qayjSLH0IwmshsNXgCdnJVZFzFoZOwz43l
 7Krir5EsE3ZLTepTFN64dGv+GJmRAHkmQOYLwO7p8BlAVKvt1f7EojbJK A==;
IronPort-SDR: NxJ72YEh9CAkl3ul99OI8LqWh5bYmnwjsy+wL/GnLWgyPkn8H258qukxGqYObZCu1aGFWPYefB
 zKcMzDXqiHgNmzOvbiL0Aq7tNeF5JbleKhtb5E0Daok9kV/wQiOgm9eV3yHqD8ifFJibylOmsc
 8ZEfa1lkr0etsj3OiEBtPz83vpcSIfmyXXn5BgYXPzEDD/lVaUV+VdNrWksO95kFpBdsWAUzte
 keLKFcEaZ3d3L60qmfmgueR6KEE9kJj7fnjGxUhRU1BUZmCVDugxW+H1WNSZrm9X6ScLBe9Gqs
 sS0=
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; d="scan'208";a="84719015"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jul 2020 05:33:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 27 Jul 2020 05:33:53 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 27 Jul 2020 05:33:07 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <linux-mtd@lists.infradead.org>, David Clear <dac2@pensando.io>
Subject: Re: [PATCH v2 0/2] Support flash devices used on Pensando boards
Date: Mon, 27 Jul 2020 15:33:43 +0300
Message-ID: <159585278401.156466.16245419083060726355.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200720163656.38006-1-dac2@pensando.io>
References: <20200720163656.38006-1-dac2@pensando.io>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_083356_893900_76FB4D60 
X-CRM114-Status: UNSURE (   8.78  )
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
Cc: snelson@pensando.io, Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 20 Jul 2020 09:36:54 -0700, David Clear wrote:
> Changes since v1:
>   - Added test descriptions to the patches.
> 
> Pensando boards use Macronix and Micron flash devices in x2 mode.  This
> patchset adds support for the previously unlisted Macronix mx66u2g45g, and
> it enables x2 mode on the Micron mt25qu02g.
> 
> [...]

Applied to spi-nor/next, thanks!

[1/2] mtd: spi-nor: macronix: Add support for mx66u2g45g
      https://git.kernel.org/mtd/c/48029e620dec
[2/2] mtd: spi-nor: micron: Add SPI_NOR_DUAL_READ flag on mt25qu02g
      https://git.kernel.org/mtd/c/1371a80cac33

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
