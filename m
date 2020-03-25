Return-Path: <SRS0=FPAn=5K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9929C43331
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 10:17:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E24D20714
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 10:17:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QWEwkiG2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sYbRtPbr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E24D20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJLPZjeYe3cV1kU1IzVvmlgDAWxVGB7ErpyaDEjwWTE=; b=QWEwkiG20L9Es5
	wBX+5rG1JmHMyeO51GQR+Mmz2dMFDR4BMKd30wY71fE1zUlopXPNJyLSO6XI9qBogBDKVJkFzQFwR
	lN7prj05Nm2Pv5DhW1WWuJKgLTl+PU1ZUYxY1R3VvMfGskJ9TM0izVUhYb5CmggQDkOD1LB6cm7aF
	o0QbbAKlnpQN5ZbqILbbW6uywFiizb1yLOTztSJyDIvuKOWXWtMoHjqrtfQOkYEYQJjs8eSEObYBu
	q9+HTFcDsJWIA0K/H1AjgSQYPa18PriUhfmCO6+tXLOP27pL4i6Xc0DSgOXFLjZbcEFkZ5JD0z/vy
	cxLltUc2RbpmcjKAKDvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH36V-0007kj-5i; Wed, 25 Mar 2020 10:17:43 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH36R-0007kL-Ut
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2020 10:17:41 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02PAHX5l036683;
 Wed, 25 Mar 2020 05:17:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1585131453;
 bh=rltnl+Y7AF/t7AP4Asr9lfZaDfQOLoo3x1/IxJBDCes=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=sYbRtPbrnkpz2wR12wioVenYax5Pa+ZxogSpxoeWwoXitBDfUmyy+0vJUr612leyY
 uy/Lv5weVQvnZK3ea27zKRAPIiPUKBcb+EjB7XL7x/78fyAqunUWKYUhg3i0UVXqL/
 C+iJ7l+8J4dnwxjgLOpTXhg91KDaIpXbqGtZrc5s=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PAHXFL109231;
 Wed, 25 Mar 2020 05:17:33 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 25
 Mar 2020 05:17:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 25 Mar 2020 05:17:33 -0500
Received: from [10.250.132.85] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PAHTFM103487;
 Wed, 25 Mar 2020 05:17:30 -0500
Subject: Re: [PATCH] mtd: Convert fallthrough comments into statements
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
References: <20200324222538.16446-1-miquel.raynal@bootlin.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <0a4751fa-ab4b-06b8-2bd2-5a9dc45315ad@ti.com>
Date: Wed, 25 Mar 2020 15:47:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200324222538.16446-1-miquel.raynal@bootlin.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_031740_056164_E9A957E5 
X-CRM114-Status: GOOD (  10.28  )
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
Cc: Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 25/03/20 3:55 am, Miquel Raynal wrote:
> Use Joe Perches cvt_fallthrough.pl script to convert "/* fallthrough
> */" comments (and its derivativs) into a "fallthrough;"
> statement. This automatically drops useless ones.
> 
> Do it MTD-wide.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0001.c             |  4 ++--
>  drivers/mtd/chips/cfi_cmdset_0002.c             |  5 ++---
>  drivers/mtd/chips/cfi_cmdset_0020.c             | 17 ++++++-----------
>  drivers/mtd/chips/cfi_util.c                    | 12 ++++++------


For CFI bits:

Acked-by: Vignesh Raghavendra <vigneshr@ti.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
