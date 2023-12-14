Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0940AC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Dec 2023 09:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/O6pFux9AeK395Z4/YRQu9UcPEEHdetdtAxrtDE1mc=; b=NFtIsUcfAJT2GnZhBS4SHk/7Y9
	E0sVfYb0XCXLhj+IPRY0aLGFpoMikhBPLPeJObkRuTwIKDte14AhzocXMGse83mKLJfKd+R2p3Nwt
	Hg78ZbzMcGcB2k1YC9l7fShfGnj1HWJ6AMPS39//D25x3sBSbySZ9RH485k+CYGlceLSkes8CPBc+
	EVcq7rROPSciQAaL0ZOK0z+Rl9ge5K3sDHu5G0KNxoSnpDKfePcxeWs//BlzAO/ouL9mycCeIlMHH
	mHSrVChwyHFxlJQA4tHbNAG/Eh5sY4E7ngv/IhChZhvLi5Dp508rDKRdHTs6bLUs+PbQxyjW9X9Mi
	FEt5bgRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDiKV-00HNDO-2A;
	Thu, 14 Dec 2023 09:48:31 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDiKR-00HNBu-27
	for linux-mtd@lists.infradead.org;
	Thu, 14 Dec 2023 09:48:29 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id A56DBA32;
	Thu, 14 Dec 2023 10:48:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1702547300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5BfjF+ozz6NnLPHFYlPWr711t0t0lwjzEbAsrbgnCJo=;
	b=N4cyJJjc6VJhvvJLTkeTjJvV8hZIBV2PxX2L/lp8egLN7LxdjOV7360cROHsuk7jj8lYlY
	aAS4nH3yz67iVHnrMLzT7LUImiHJ8xsx+/GQqlRh+O8DXrtX/kh6wHsh5K/rVP4E4bgQf8
	lov/zUNmHLBtk3IPAvwSGyJ80mmsGEFV57VkPVsF2R+KfAlHc6dt82/lgyKawM0O3xPHNp
	7PuJ7Xn34zFsV3mf83BPoCBaYF5nM19W9MUylT2Y+6XsCd/dGXjoDyJ6hQRzO2xP6z9p+L
	3Fg7U9ae0cO9j1zx1tAtUMNkktkTgiG2Oifj+9jOEFQY2FwoqhE4mxrY2lFmtg==
MIME-Version: 1.0
Date: Thu, 14 Dec 2023 10:48:20 +0100
From: Michael Walle <michael@walle.cc>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: sfdp: Get the 1-1-8 protocol from
 BFPT
In-Reply-To: <20231214073344.66644-2-jaimeliao.tw@gmail.com>
References: <20231214073344.66644-1-jaimeliao.tw@gmail.com>
 <20231214073344.66644-2-jaimeliao.tw@gmail.com>
Message-ID: <d0d1171b2fd3e77774cffcd7112653aa@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_014828_031206_54810359 
X-CRM114-Status: UNSURE (   4.98  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

> From: JaimeLiao <jaimeliao@mxic.com.tw>
> 
> BFPT 17th DWORD contains the informations about 1-1-8,
> Parse BFPT 17 DWORD instruction to determine
> whether flash support 1-1-8, and set its dummy cycle
> accordingly.
> 
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>

Reviewed-by: Michael Walle <michael@walle.cc>

> ---

no need for a 0/N cover letter just for the changelog. That can
be included here below the "---".

And you can also keep my Rb tag.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
