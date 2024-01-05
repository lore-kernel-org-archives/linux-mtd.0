Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A4CC47079
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jan 2024 13:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGG3cYP5L2uB3YwTcPzuPGqI7XZsGN+Dj4nArhv36+I=; b=MCJh8fFxSfd0ZBSE0oYUqFmimu
	YBpA3BZuZ+I310ZI1rejjBU8uD2u9EooGbK96QSTPJ1j18tCzfE/dWqSlEZB++WSTbGHiGT4EAp3d
	q86mVo+p+VgTIxwtttcQsngsbsVD1kwZisIi3QmecEWrEhEx5Jr2DYcLW09UXsmmJSeWSG93t1PVD
	Ehy3+K2HmggXKCqioDwqzDcPqzVX6AkLxBMTskM7fWSlnVeF1Y0zLLCTCsGnv7LqiQAR1NieFYX1P
	Vlg2T2lp9/TrpmnbRUMkh4VywXlos5JdrlwmBBLrEW+DE4Q44Bn1ddvuMKXcbEnRxoFWCvBPGeH64
	Xk9E7CXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLjqr-00GtVx-29;
	Fri, 05 Jan 2024 13:03:05 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLjqo-00GtVK-2K
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jan 2024 13:03:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1E156B81C9C;
	Fri,  5 Jan 2024 13:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52B5C433C8;
	Fri,  5 Jan 2024 13:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704459780;
	bh=6ptulP3XTtuEa/xd0EF/TUnRO+cyn3hMidplWP7CFGY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=r9bd1Pz+Dv22CJF1ttKyCFNDpDND8VM/w1Dv+V5D0LWek27m/O9eJEUfrSg09FbUI
	 ObRty0dmyBkiOYaocG62kL+DBll6rUGS5tp/FxpXTHzNS63ApI/yw3+4lB9uTwvxxC
	 PYefw/NyGf9Im/f9qGE3XzOoU+WDtpY6tAlAzLdBYOCIlaTm+U3sy3WhNgW6gX9lu3
	 gGpjlkzBBIvdH5F9rPxG5x+mbkkv7PE2uwLi4LgdygjztS661bGxFyMgQnS6ylmkr1
	 X10z0FqtQqA9Miui8WAoFu/jHUqFa6kk/Z7FVxDcIs6ngt9Uxowxeept3hAI4p/coy
	 jVykKuGbU9KhQ==
MIME-Version: 1.0
Date: Fri, 05 Jan 2024 14:02:56 +0100
From: Michael Walle <mwalle@kernel.org>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v7 4/7] mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order
 from BFPT
In-Reply-To: <20231221090702.103027-5-jaimeliao.tw@gmail.com>
References: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
 <20231221090702.103027-5-jaimeliao.tw@gmail.com>
Message-ID: <598c64a1ccd035788ca753ba77ce467c@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_050302_893085_07FBD1BB 
X-CRM114-Status: UNSURE (   7.75  )
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

> Parse BFPT in order to retrieve the byte order in 8D-8D-8D mode.
> 
> This info flag will be used as a basis to determine whether
> there is byte swapping of data for SPI NOR flash in octal
> DTR mode.
> 
> The controller driver will check whether byte swapping is supported
> to determin whether the corresponding operation are supported, thus
> avoiding the generation of unexpected data order.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>

Apart from the naming issue:

Reviewed-by: Michael Walle <mwalle@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
