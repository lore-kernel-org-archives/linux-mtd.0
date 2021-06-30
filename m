Return-Path: <SRS0=ctmN=LY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34CAC11F65
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 18:24:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 971E06100C
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 18:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 971E06100C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLwM+3oQapbtXNm3tZ1HM19h13KgiCHytQMnO1EQeMA=; b=tc57IRVSEbUMZv
	K7UQrKlTmZZUCKInHyqYAaLddfiiBvdIf5bHk6t3E2/fb58L7oZKcFPJEjClVdmISS8/J3fDwVza/
	RE0LBOw7iSTNI73CApgG7LuOZbKfEYXUDk0bqZPPO2I63p0mfg8pyFsOoEDpFtmxR49VekCGEI385
	C1fgafyaZRbn/KK46SrKGgQfXL5wlRdY4TpYUYEozgjG86PljVpj5UJEnK8zVgpeKiGmOQXDoNfUe
	3o2R2Tco9cgVJjaZZnIwtjFiUGX/rQz1sbPHKmM0M1X2StFOtQRH3YRJOZUh8dmmZbX+htwq1zapo
	DOhA9E6qT1mYySxmIvPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyesb-00EvDX-Qc; Wed, 30 Jun 2021 18:24:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyesO-00EvAE-4Y; Wed, 30 Jun 2021 18:23:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3B1261474;
 Wed, 30 Jun 2021 18:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625077435;
 bh=4obaIe35ZSS+oHdciFheQSkU3RY3pDJCdjmKqHmoW0c=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=kPE8MHv6jyippasun8dBIOGhwO92UFHZtzoyINDLwN1vbW9pbA3NriPQbReU5u14O
 t0p9QUBbcOB8D2fIeLl2K/WklzVc4WUHkHVVxVEsCJN91IrwJfgwO8x8BUkvgGuTUU
 HkJ7snfL0VYFZ0Wbb6VtjCCmnNqW3RvDAUm2vpStdpr+PiJq0TwvYX5GkY42czNcoC
 1oia++zl10MZ9Gs5OAAmgfoTU2qacWXrBPUgUIKdmGuXZNUMkmAHpv/q0A29bAi/pd
 DDxxKqLRmSNSTc+ylRTzhRDF3ENccbgr8xkCDdtLDy+FkAWnU5Rnvlzc3DpRsD61Eu
 d1U4emwqkCVCw==
MIME-Version: 1.0
In-Reply-To: <20210630134702.7346-5-jon.lin@rock-chips.com>
References: <20210630134702.7346-1-jon.lin@rock-chips.com>
 <20210630134702.7346-5-jon.lin@rock-chips.com>
Subject: Re: [PATCH v10 04/10] clk: rockchip: rk3036: fix up the sclk_sfc
 parent error
From: Stephen Boyd <sboyd@kernel.org>
Cc: jon.lin@rock-chips.com, broonie@kernel.org, robh+dt@kernel.org,
 heiko@sntech.de, jbx6244@gmail.com, hjc@rock-chips.com,
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, macroalpha82@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mturquette@baylibre.com, linux-clk@vger.kernel.org,
 Elaine Zhang <zhangqing@rock-chips.com>
To: Jon Lin <jon.lin@rock-chips.com>, linux-spi@vger.kernel.org
Date: Wed, 30 Jun 2021 11:23:54 -0700
Message-ID: <162507743443.3331010.11705732490811171559@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_112356_232034_6C651A24 
X-CRM114-Status: UNSURE (   3.84  )
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

Quoting Jon Lin (2021-06-30 06:46:56)
> Choose the correct pll
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
