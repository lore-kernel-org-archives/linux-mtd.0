Return-Path: <SRS0=ctmN=LY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C5C9C11F65
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 18:26:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED32E6113A
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 18:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED32E6113A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sbJzh4BIpdctYrJQhDgpepiTo+6s5Uonx5uTaYASCKE=; b=LpEwxJBqmoLPD5
	1ONrSUVbKkkk2+NnuE4pWQeuSElnrI9MwiWaH9sPJYRL/ievu2Y3nvuSYwpIqjJ3tVlByANgQ8Ur+
	NX9DP85C6dKkQRFrG5tAR3oxEXpQzoOqNASJ5DgRY10TrK9YOHPK+/kSyc80UShWIedlMP/vMmBhj
	zYXSImhB6hGXqW76ih/IXBHeAhNVA0q6jHOZkGLvgOtno2tff/N8wDTZscU2txIv2XT1nJzW8jsIL
	vQ1JBF6N9PYQI54khKoDXSGJ4Ltg/H/XJQ/QE2JdQ4CHQeaN3pUnLLRGKJEZY/+ITrDml8BbQnA0a
	jRX1dyU9sy7JGQd3nGgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyety-00Evkm-K7; Wed, 30 Jun 2021 18:25:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyesc-00EvDk-K2; Wed, 30 Jun 2021 18:24:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3AF6A61468;
 Wed, 30 Jun 2021 18:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625077450;
 bh=kQWxalafhDaa1dOH4MeAdwMUlRDKpy97WdejoxexQ88=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=OykUUttLfg5lTxarPE//W+sguxd6nQ6a4QabIOR36ZWFnWt05y/h4guB7kPkpS3V2
 BVCJr4g9n/rU3bTPmAZKSAD6tTR8JzWk+pLTfaao8F5qb0MRTtKUpUoqziXqMVfWx7
 JngPBKB6YtoDGoxp+Yxn9TBOzjZXKWC5wJL3PkkCoE1eO8VBh9Y/9NS/ZP8zaqSpTr
 a1wAoddS7KsGKKaO1sBqz0AMICmDMXORqntObaeoZmWSrU8WPxTBRVUdbW6gKqRz4q
 ZPKlJPXaHUxmIs4w2IBTC+K3WyyBgtHnJtncjStHjtgxCAk7L3tQr1yHyuEXCZv1ZQ
 bqPVREV4bLkOA==
MIME-Version: 1.0
In-Reply-To: <20210630134745.7561-2-jon.lin@rock-chips.com>
References: <20210630134702.7346-1-jon.lin@rock-chips.com>
 <20210630134745.7561-1-jon.lin@rock-chips.com>
 <20210630134745.7561-2-jon.lin@rock-chips.com>
Subject: Re: [PATCH v10 06/10] clk: rockchip: Add support for hclk_sfc on
 rk3036
From: Stephen Boyd <sboyd@kernel.org>
Cc: jon.lin@rock-chips.com, broonie@kernel.org, robh+dt@kernel.org,
 heiko@sntech.de, jbx6244@gmail.com, hjc@rock-chips.com,
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, macroalpha82@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mturquette@baylibre.com, linux-clk@vger.kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
To: Jon Lin <jon.lin@rock-chips.com>, linux-spi@vger.kernel.org
Date: Wed, 30 Jun 2021 11:24:09 -0700
Message-ID: <162507744904.3331010.2867883126485374831@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_112410_732353_F929A2E6 
X-CRM114-Status: UNSURE (   6.44  )
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

Quoting Jon Lin (2021-06-30 06:47:41)
> Add support for the bus clock for the serial flash controller on the
> rk3036. Taken from the Rockchip BSP kernel but not tested on real
> hardware (as I lack a 3036 based SoC to test).
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
