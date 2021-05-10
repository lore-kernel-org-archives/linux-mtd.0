Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA9F7C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:41:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABC2061430
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABC2061430
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t72Vofg9pvpD2486eD2t/fqi73gpV6gxgLBaS8iTRnE=; b=aLHiP6iPmKKWpNgve7v+dkvSy
	nNeRBx7dvhrH/D1JamC/RlN9whiSHXl1Gq9b9LabPx08c/zkHYvypp5qKCf+IiGFiuuyk1zTGM30W
	M0G6Sb07DcY42P+5Fo7oLCFMckx6I5FIP125ezXc10FI2rp97n/RhUBd3gJhIudQKmZCQB4VU4WrZ
	yd8uK30oE1LMLuGzHH5TOF8+Axf69O1qiBa4k/pW2OWWcFmiRY69o56cY6wMVYAUxjQomVaqzYIKq
	r7PuBmphuboNpLXCS3G3z6w+K8StvHQVqq+44KWdGcLqJ46V45c4R8FyR8Y/EgrSDgsW75pEpXSyP
	nSfNv8TKg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg2Oh-00DnYZ-PH; Mon, 10 May 2021 09:40:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg27x-00Dkkt-SO; Mon, 10 May 2021 09:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=Gzqa8okERyAR6qH7zOXncblogCnXOe5C9zVhP50AQwQ=; b=HaDrE1YWzAoG4gB7h1z88xUVra
 RdXCyWC2SHpiRgL48NnZO+IAcHXPDS1j/wMQXgi1gT8Tc1dCFAtppHxj2Vj3yrh5sJGM0xMB2j4em
 LxhhG6R07ERSjXcK5MdPQ+Ub7uTR6PXdFtgEkZv/LN34DflRd7NN4VFCjfoQ1EHswmU9dCMArqDIu
 sHXuamgzNzJZ6A1hVyoVWZHZWZLbIZKJNxdxX8iBLHrAcPUiW41CGDf2lhhKFfMNnTA4sFAbUgP3c
 VtDqnP4k7+HitA1CEdDgac3kmxl3UtDsRy9d8RUCPw5qA0yvrxJT/GLpaaWsrYQ2Bh8UH+ESxoLWH
 aNpaW1EQ==;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg27u-008SEL-Sy; Mon, 10 May 2021 09:23:00 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 189581F42076;
 Mon, 10 May 2021 10:22:54 +0100 (BST)
Date: Mon, 10 May 2021 11:22:49 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: Mark Brown <broonie@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-spi@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
Subject: Re: [PATCH v2 1/3] spi: spi-mem: add automatic poll status functions
Message-ID: <20210510112249.5613978e@collabora.com>
In-Reply-To: <542000b4-1a65-5090-72f9-441c75ee1098@foss.st.com>
References: <20210507131756.17028-1-patrice.chotard@foss.st.com>
 <20210507131756.17028-2-patrice.chotard@foss.st.com>
 <20210508095506.4d0d628a@collabora.com>
 <542000b4-1a65-5090-72f9-441c75ee1098@foss.st.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_022259_105119_1B9D0D30 
X-CRM114-Status: GOOD (  17.21  )
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

On Mon, 10 May 2021 10:46:48 +0200
Patrice CHOTARD <patrice.chotard@foss.st.com> wrote:

> >   
> >> +
> >> +	if (ctlr->mem_ops && ctlr->mem_ops->poll_status) {
> >> +		ret = spi_mem_access_start(mem);
> >> +		if (ret)
> >> +			return ret;
> >> +
> >> +		reinit_completion(&ctlr->xfer_completion);
> >> +
> >> +		ret = ctlr->mem_ops->poll_status(mem, op, mask, match,
> >> +						 timeout_ms);
> >> +
> >> +		ms = wait_for_completion_timeout(&ctlr->xfer_completion,
> >> +						 msecs_to_jiffies(timeout_ms));  
> > 
> > Why do you need to wait here? I'd expect the poll_status to take care
> > of this wait.  
> 
> It was a request from Mark Brown [1]. The idea is to implement
> similar mechanism already used in SPI framework.

Well, you have to choose, either you pass a timeout to ->poll_status()
and let the driver wait for the status change (and return -ETIMEDOUT if
it didn't happen in time), or you do it here and the driver only has to
signal the core completion object. I think it's preferable to let the
driver handle the timeout though, because you don't know how the
status check will be implemented, and it's not like the
reinit_completion()+wait_for_completion_timeout() done here would
greatly simplify the drivers wait logic anyway.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
