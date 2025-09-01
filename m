Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD93CA0FFF
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 17:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aAKElkj3BzbQlEe/yYEHF5osw5Byo4uRqNHrlZjLPFU=; b=Lc+atjwXcyS5s4
	heQeNX+bzaHJQOBrhvrG3L7raqjHksL5fl4gwpTBSkiPYCUH1NSnHHBHyQbuESWLkndHkywI/ATS+
	YzoVeVZlireR71zej5wPNpg12ZLUUFlFT4Or9XE3riG+tlrEX4+XBdMqK3Tij6gKfB1nJnH9p1UFk
	B27rbisQzdTVW8CbdRS9Gczg1HFoV5uBlKyLIfRRP/I2+kUaGIxaN9ol+pkjQsvcdR2EpXb/y3K2l
	oJ2cYzpPwr6hCUFAC7BTuF+wYznfmeO6T5QAUaVJSY0e/q/+MHjYUG1e/7NDyjSmzb0Dc+yppRob4
	CMVkoMQMrlBUKTZJqWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8Q5-0000000DTOU-1oiL;
	Mon, 01 Sep 2025 17:34:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5Nz-0000000CovR-1EcO
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 14:19:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E1351601D9;
	Mon,  1 Sep 2025 14:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B60C4CEF0;
	Mon,  1 Sep 2025 14:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756736392;
	bh=qwR4eNLSEphXQYoDu4XlkNku43wQhu7Bs42cSMtT540=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mPQ9smyLLZAOt+/sSFM7ixGpGSb10fjRr5tJga38Wd9eFLAgpvsiQ1TQL0MRV3O05
	 H2eEK+HKCPbbl6h0gsXf43vrh8Ux/adqtnV37GuJ7P6Ph8gdRGXhJQiPb9KSw2E3ck
	 oCS5EfvU/ET1HkFBSBGVugHIIqNRBUfdHfgTIIafMv7ImXYo839qUldjCPZVF4DNxl
	 2AJrk6D7HLXsPfDkjLDhsSbH739ZUVySZrn+bZV/rtQuCrPMmMYloLtKqHL2piXEWP
	 /9JGaMNeOstIrkOERXwYtLKKqVJT3YV5BJWvAV/49olDe13PrOj4LqtB32ShqidNkF
	 mBICWiww/imRQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: ziniu.wang_1@nxp.com
Cc: pratyush@kernel.org,  tudor.ambarus@linaro.org,  mwalle@kernel.org,
  miquel.raynal@bootlin.com,  richard@nod.at,  vigneshr@ti.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  haibo.chen@nxp.com,  han.xu@nxp.com
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: core: avoid odd length/address
 reads on 8D-8D-8D mode
In-Reply-To: <20250708091646.292-1-ziniu.wang_1@nxp.com>
References: <20250708091646.292-1-ziniu.wang_1@nxp.com>
Date: Mon, 01 Sep 2025 16:19:49 +0200
Message-ID: <mafs0tt1mw8ze.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

Hi,

On Tue, Jul 08 2025, ziniu.wang_1@nxp.com wrote:

> From: Pratyush Yadav <p.yadav@ti.com>
>
> On Octal DTR capable flashes like Micron Xcella reads cannot start or
> end at an odd address in Octal DTR mode. Extra bytes need to be read at
> the start or end to make sure both the start address and length remain
> even.
>
> To avoid allocating too much extra memory, thereby putting unnecessary
> memory pressure on the system, the temporary buffer containing the extra
> padding bytes is capped at PAGE_SIZE bytes. The rest of the 2-byte
> aligned part should be read directly in the main buffer.
>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Reviewed-by: Michael Walle <michael@walle.cc>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>

Series applied to spi-nor/next. Thanks!

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
