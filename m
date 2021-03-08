Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F82C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 17:29:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EA596523B
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 17:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EA596523B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gh9yji3J0KA1ze8n+Q8HoWgHxO5q/Dvi6KrliGkCn8Q=; b=N7K/FIN03AWfou9a+BO3/gmfJ
	gBPs4hGdPu4IiA5ZUBF1kRHyGCIXmvIRIBU0m/NGUJUFKtnlSU6756jD5D++VH5alJIf0HoQikLSZ
	D2O1VX0hVmwhzdZ6d3sEyqcgQZm0astAlrcHolZ7t9yEnalO+NmwMiOm6pfHVZL9eCgy/7NwCJapW
	eVvAVOsEWbLBF+HNA3JZTkkSgio9fBVl/BHuCvswSiq9NOy22EKWBf4d3+R8w7iyST71zp0JmpSHk
	dBrniR4m5uqrZg/QdoH9qUa73IYi0h1YAEK2qmK+kqwlrdKyGEsk/5RCPG9ZTcm8fGI1ZGU5hnCC1
	CRyv1KC7Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJJgm-001OqE-OM; Mon, 08 Mar 2021 17:29:04 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJJgQ-001OY2-Hp
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 17:28:46 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 128HSU7Y052912;
 Mon, 8 Mar 2021 11:28:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615224510;
 bh=GpREsgSTwcq19+cPP74hfnW6aIqIvYUcq82ps0QLSf4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=wzYsypbj9q4hdeszGRtzVDAhJTopc3GXt32elNGdD/YfryPLY2DlNgJH8B4cqEfee
 +8waHOMmIBRhxW1BqELVynVeYt/eB5VTVJ1bsiEd282QuYOI7fN25W51W5+W1jCdxK
 rGYLlJFwkXjvav6Oj6spS8miwYvMzG7CiTgQX/yQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 128HSTHt107616
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Mar 2021 11:28:29 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Mar
 2021 11:28:28 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Mar 2021 11:28:29 -0600
Received: from [10.250.234.120] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 128HSQob124335;
 Mon, 8 Mar 2021 11:28:27 -0600
Subject: Re: [PATCH v2 4/5] mtd: spi-nor: Move Software Write Protection logic
 out of the core
To: Tudor Ambarus <tudor.ambarus@microchip.com>, <p.yadav@ti.com>,
 <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-kernel@vger.kernel.org>
References: <20210306095002.22983-1-tudor.ambarus@microchip.com>
 <20210306095002.22983-5-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <963232a4-9100-ebca-927c-7f5a1e947fbe@ti.com>
Date: Mon, 8 Mar 2021 22:58:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210306095002.22983-5-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_172844_637791_1703EF66 
X-CRM114-Status: GOOD (  10.44  )
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



On 3/6/21 3:20 PM, Tudor Ambarus wrote:
> It makes the core file a bit smaller and provides better separation
> between the Software Write Protection features and the core logic.
> All the next generic software write protection features (e.g. Individual
> Block Protection) will reside in swp.c.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/Makefile |   2 +-
>  drivers/mtd/spi-nor/core.c   | 407 +---------------------------------
>  drivers/mtd/spi-nor/core.h   |   4 +
>  drivers/mtd/spi-nor/swp.c    | 419 +++++++++++++++++++++++++++++++++++

Hmmm, name swp.c does not seem intuitive to me. How about expanding it a
bit:

soft-wr-protect.c or software-write-protect.c ?

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
