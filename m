Return-Path: <SRS0=4jNj=J3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF16C433B4
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Apr 2021 16:53:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 391EE6146D
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Apr 2021 16:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 391EE6146D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t7L25xer0cr0SWVfu1v3oMTGHmIpJfWiD+mU7po30zk=; b=hIQEHuoh2rIsW+8tF1PoHseH6
	aV7z1nlKyCTLlIlwqurjIin4GWU4N5KTkFxCYiFHt2SJmaA5GWbM8u73Ef8GYRTDVVfUAm8DIH80z
	7PKWawCy1jdoD1SbszXVPQ2rK7C0Mg3QeEOov3D0LebJ9jrulD86KoGBHxxYK0UWFglwimveDUuYs
	/ORJHUv1tZ/23EiE0GwjXAh301PIHdnJ7moayG31g10PAUUV6ZgF0cLir7qlzwhrBaiUuZGFYOKXf
	BlfjLj6eIpPBfGtfOYV6Q2IgH9DZaqYpabkVrw4p7IGlgInQyrSexmU/P+2stbDl+r/ScQ8q7DP4/
	5OhfNBHUQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcWNR-008EkC-4e; Fri, 30 Apr 2021 16:52:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcWN6-008Efm-5H; Fri, 30 Apr 2021 16:52:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=l5TXFCSDfD3cnJlewdlaBgB5tLrfsuHcUxnI407CIDg=; b=tEUr55YBhnFrWr1bPvcWhvTOMv
 fTjOdRVB7cf6HqNS3RvUQTfjxOv0WslQDf1xquh4S848q6x4Wu1kKU0baDuW7y+WvNXdWm2I5WFO5
 BJYObvEDOaijBhOPTV/pd1F7cVEdclCTiq/hBFPkrHkVrTcGtgqiH9yHfCMZs1VPhL36HKFfvbU2Q
 7/NSQG9pAFCurF+SniytJBx6bIC1zbcmB4m1bL72y/Cw9+tqKJUI7YQg2C6yxEujUcDnCny6I7kJt
 UfNQFPCcyeHI81DmqLnwbexMW2DYXFS5IUl5Di/IO2Oed4zqcGfj2S+OReU/dpHbu6MNGqtOUNJ0n
 CfXrqlag==;
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcWN3-001XDG-KS; Fri, 30 Apr 2021 16:52:06 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8B0E21F43BCF;
 Fri, 30 Apr 2021 17:52:03 +0100 (BST)
Date: Fri, 30 Apr 2021 18:52:01 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <patrice.chotard@foss.st.com>
Cc: Mark Brown <broonie@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-spi@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
Subject: Re: [PATCH 1/3] spi: spi-mem: add automatic poll status functions
Message-ID: <20210430185201.0b79bb62@collabora.com>
In-Reply-To: <20210426143934.25275-2-patrice.chotard@foss.st.com>
References: <20210426143934.25275-1-patrice.chotard@foss.st.com>
 <20210426143934.25275-2-patrice.chotard@foss.st.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_095205_853553_F478BB28 
X-CRM114-Status: UNSURE (   8.04  )
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

On Mon, 26 Apr 2021 16:39:32 +0200
<patrice.chotard@foss.st.com> wrote:

> +/**
> + * spi_mem_poll_status() - Poll memory device status
> + * @mem: SPI memory device
> + * @op: the memory operation to execute
> + * @mask: status bitmask to ckeck
> + * @match: status expected value
> + * @timeout: timeout

What's the unit?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
