Return-Path: <SRS0=RMHD=KJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E8DC433B4
	for <linux-mtd@archiver.kernel.org>; Fri, 14 May 2021 18:36:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5162D61175
	for <linux-mtd@archiver.kernel.org>; Fri, 14 May 2021 18:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5162D61175
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=waGoDCw5D4p/hQtURkY2Nt3mWhiuYdqf/Clh2qb2Upc=; b=Q8ZpYkrzDNUnAOxC8dfNV6Rvl
	P98A5ZyVjxhfXMsD3gdDDLACGggsGbM28SYzn6ohNU9aaFn29ZPU1YedG8iQFnRhA5UMxJCVLAM5b
	OGNHXm1ltq8DJwHtyLtW1d/lM0YkFWpGvWRjhEhG12cZGeOaF18Pny8ifPP3rcEmC99fftsiEhDvj
	d2oHvn7akc4Da/eBdPx+IavqvEOaDTIJkcje3DFL0caLrTcVW0fqFIFJ95PD/ACMOd/Q6f26RIcp7
	TP6j22uzECVRoGqSmsp01mTt+nQK8v49ddSBjeg3vpPmGc8tbpaTjX0Tu8/jl1Wf/SzSIe69GYZcY
	6QW82I6UA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhcf2-008iF3-V4; Fri, 14 May 2021 18:35:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhcez-008iEm-HW
 for linux-mtd@desiato.infradead.org; Fri, 14 May 2021 18:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=riT+Nq4J1hu8+qyaKDSrJBVE67oxWgNH7ZvD4d985ck=; b=g9Uib8f0mfo1ROpYU41Wd8JQM5
 4eP4FUg0swNFzjP51/xxOcc/TPM27FuWLHZ9mnWN+8Q521xBt++kVYMm3lLUAKRWckqTszU0zdMlS
 t3oEq2qen/Bv+dldHb0TNXU1t2sUqbF/BAzQGPpHNsuiKtW0WpbRDx1ve980qBN2f3S0rVNVBlWEO
 hkMxu5W7c4wkG6gGxiBDKzJ1owGHCr0MCnogMpQLCB9pSngsSbv55ECTWP09TjaQJLL04YfqJOY5L
 SIIUDF5j31cQBVT1JAvYY5DVqjasrzPbjJm2BnGJcGtKpA2FAP1VL8AcXyJFIKKc7/7SyTUsBCIJZ
 rrwpGscA==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhcew-00CBMz-IB
 for linux-mtd@lists.infradead.org; Fri, 14 May 2021 18:35:40 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 9C68F2224B;
 Fri, 14 May 2021 20:35:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1621017331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=riT+Nq4J1hu8+qyaKDSrJBVE67oxWgNH7ZvD4d985ck=;
 b=O/U1tdww2I83EyZeJOZ+8G3qKDKFtGRh2Xjg72z0s4w8WIaxya1r5BpEyt/W7VTb4F2Ku6
 M3Mz//SSvneCcff0dEXJ5qNgWu6+4VJR1ur4hGKKL5jADOObyIRvWUkQ8wx+PQHSiscS8B
 YA8CgaeNUipNhg+GFgfs92nKjhsDznQ=
MIME-Version: 1.0
Date: Fri, 14 May 2021 20:35:31 +0200
From: Michael Walle <michael@walle.cc>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: core: Potential NULL dereference in mtd_otp_size()
In-Reply-To: <YJ6Iw3iNvGycAWV6@mwanda>
References: <YJ6Iw3iNvGycAWV6@mwanda>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <23f1c1a4cf741a40e63420ff9aedff9b@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_113538_784017_26C126DF 
X-CRM114-Status: UNSURE (   5.68  )
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

Am 2021-05-14 16:27, schrieb Dan Carpenter:
> If kmalloc() fails then it could lead to a NULL dereference.  Check and
> return -ENOMEM on error.
> 
> Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, were was my head..

Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
