Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0819C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 07:49:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0FB760F6E
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 07:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0FB760F6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LkoISlRPrYsqU9zFjuR35plPlkZmzkHXbJ7l+dS1EBo=; b=BFqw9I9PfDvQO3
	ej+L33atLQ/aEBRaIzwFZbXlguoswoeOZOojLbq+XnSrp40Zj8AG1ROA2uGi7F0l5h3MkOtfn2duD
	GLkJdOyVedR7SgBDSWygsCKKGk0o0oXCe4rQS7cd0wte1DRi0iuOHveF5/JwLAzlSiDRHyy17G3RP
	jvqFj1byh7koy7mSwVKOLl+m2ZH4nmBypcFGcRlgasqlR6L/n64eFwvSLRF1xV9eVgMrlRNR1x0IV
	8EP6EQBoHqCSwNMRTue6ARwULBK0YW91kLxGRkCQ/Z76EunFPlWf0eXmzrMivRDCxEjHgT+Jvj6i9
	P15f9GKfvebNRtQCahWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSE2Q-000pgA-4u; Mon, 20 Sep 2021 07:48:30 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSE2M-000pdq-PB
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 07:48:28 +0000
Received: from skn-laptop (_gateway [172.25.0.1])
 by first.geanix.com (Postfix) with ESMTPSA id E8782AB4B8;
 Mon, 20 Sep 2021 07:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1632124101; bh=vkoWhf7sloEfAFSBeGHeT1f+T3PxmuCalGfPlIsLYpg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=WuyfTq1NdH1TGnha4ZUNNgH9CJROwBuhAF7oucqTJSpago8ixHkvgZY0in9ErdXC+
 myaJ5aIYtMVkDYlGpxlAKt23OnmdSTJRs5AFqwzAv2hCusI9zVIc4WpVYuCkIzMFh0
 kz5S2ZLICgQu7ttOpq8DnOWIClxAj0pYXbtS2QEPJfuFDQKW2uKAusfWtZWYb5e0HN
 CSH8X9wbRMlcu/kFRI4/Wd0I2oebTaigokgl+obSn8xImziy8iTuQlQxmgQImtd8IF
 uB/6zyxTQA/05bi00y+UjasquS5CEP1UsNrOY1JLUv7WRjML/aADE2AXAgboVx56Oa
 Vgf8PLQvKBNTA==
Date: Mon, 20 Sep 2021 09:48:19 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: richard@nod.at, boris.brezillon@bootlin.com, miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: ubi: io: add retries mtd_write
Message-ID: <20210920074819.jduvfemhztrioddx@skn-laptop>
References: <20210901085637.210572-1-sean@geanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210901085637.210572-1-sean@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_004827_227453_CD48DECA 
X-CRM114-Status: GOOD (  11.73  )
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

On Wed, Sep 01, 2021 at 10:56:37AM +0200, Sean Nyekjaer wrote:
> Fix "Device or resource busy" when resuming from suspend. Sometimes ubi
> tries to call mtd_write before the rawnand is resumed.
> 
> So add 3 retries to the mtd_write call:
> PM: suspend devices took 0.030 seconds
> ubi0 warning: ubi_io_write: error -16 while writing 4096 bytes to PEB 1762:94208, written 0 bytes
> Disabling non-boot CPUs ...
> ubi0 warning: ubi_io_write: error -16 while writing 4096 bytes to PEB 1762:94208, written 0 bytes
> ubi0 warning: ubi_io_write: error -16 while writing 4096 bytes to PEB 1762:94208, written 0 bytes
> PM: resume devices took 0.110 seconds
> OOM killer enabled.
> Restarting tasks ... done.
> PM: suspend exit
> 
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
> 
> Some explanation/discussion here:
> http://lists.infradead.org/pipermail/linux-mtd/2021-July/087390.html
> 

This is still an issue... Anyway to block ubi from accessing a suspended
rawnand?

Richard do you have an idea to solve this?

/Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
