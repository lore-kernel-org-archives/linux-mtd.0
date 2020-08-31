Return-Path: <SRS0=zkQe=CJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75773C433E7
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2020 10:36:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4513B2083E
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2020 10:36:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nwbt0kty";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yadro.com header.i=@yadro.com header.b="el4jZtFP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4513B2083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yadro.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z4hMIFyEbnxtGlkxQ8wL6Wtm/3mYzCMB4Vz6DO7MGmA=; b=nwbt0kty0vZHhDsrIXGMd4DHK
	RDO5Wgv1+wCQQsZiiyanvq9u2WPb1ofoVOykpH2F3VbzFoAupu4UKRNZYHclw7E5NQkiEBeO76G+R
	CqKxG9HgbN0x+FSjd+QzQw910hvNvm5T8e1bYc1D5PR9KLb1mSz+LhrmZDPycZOgfV3cLNPpJcW0a
	RZRFAYtBt6zyBUoq58zDMv6H+uEBe9q5ZygpBeeKWWsqn9B8ahJbiZLYfpPaQkhmxJq1f6urkMmne
	keYR9YJwuVqxqgDrD5GOsu6wxtY7c37P+v48JA2N3evAE1ZyAVCwViHzO0jrXbJCvPhRB9VrBWq5Z
	wEqQTOgtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCh9f-0007RM-JC; Mon, 31 Aug 2020 10:35:15 +0000
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCh9d-0007Qs-0J
 for linux-mtd@lists.infradead.org; Mon, 31 Aug 2020 10:35:14 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 4AB3B535F4;
 Mon, 31 Aug 2020 10:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1598870107; x=1600684508; bh=0VeHPiaZvmXhvT8L0B+62aDY+
 CfD9GT+ShogVgL+t5U=; b=el4jZtFPa2eA0Frb34kzBlWeZJFpu6vmRd2cjaBhR
 Z75GF1kTCnzfpBkaqalOd+Oroc5ZNdG1Rl3AZGlYtTO373d9mzq30UyAitYJk/03
 8G1FjxYGFbNeSAeHijFCSI57QRqXKvk0//0AkpHa/nDGEM7mY8g8Hng240YR6UOJ
 iE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a0OIJ2ihJJKe; Mon, 31 Aug 2020 13:35:07 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id D9E275718C;
 Mon, 31 Aug 2020 13:35:06 +0300 (MSK)
Received: from localhost.localdomain (10.199.3.42) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 31
 Aug 2020 13:35:06 +0300
Message-ID: <6a9ce70135805862b93fdfea07418b0b248445d4.camel@yadro.com>
Subject: Re: [PATCH 0/2] enable lock interface for macronix chips
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
Date: Mon, 31 Aug 2020 13:38:21 +0300
In-Reply-To: <20200812151818.16699-1-i.mikhaylov@yadro.com>
References: <20200812151818.16699-1-i.mikhaylov@yadro.com>
Organization: YADRO
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
X-Originating-IP: [10.199.3.42]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_063513_367488_D817F13A 
X-CRM114-Status: GOOD (  12.34  )
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
Cc: Vignesh
 Raghavendra <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2020-08-12 at 18:18 +0300, Ivan Mikhaylov wrote:
> TB(Top/Bottome protection bit) is not present in the status register for
> macronix chips, do not touch TB bit in status register in this case.
> Enable lock interface for most of macronix chips which are suitable for it.
> 
> Tested only mx25l51245g (BP0-3).
> 
> Ivan Mikhaylov (2):
>   mtd: spi-nor: do not touch TB bit without SPI_NOR_HAS_TB
>   mtd: spi-nor: enable lock interface for macronix chips
> 
>  drivers/mtd/spi-nor/core.c     | 22 +++++++---
>  drivers/mtd/spi-nor/macronix.c | 75 ++++++++++++++++++++++------------
>  2 files changed, 66 insertions(+), 31 deletions(-)
> 

ping


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
