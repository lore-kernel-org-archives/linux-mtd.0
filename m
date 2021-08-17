Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 583C7C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 16:54:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CBE960FD9
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 16:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CBE960FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a5OV3c3yvbq3f9Pb8bCGB8Qn1QIKdXzvJACPfSYgCj4=; b=v5VVc4wlT5x5Jk
	VHRgS4hpW8bxOi1nUA3FVNaMDnK69YRVM7KuL9oi2STIR+gCLFh5i8kMSe5ARShDbxejtQsKCuD2Q
	Et8e9thNpqWEWlhNLhklGqAiGX/bk54/Cqd9atwINy5DjaeE72kU3dK02D0X5VE+Q+KSLUNayLrHP
	lHnHuUGUzJOk9Hz6iMvgamZAVc9rxmNbTGMcNghF06wCPC9HMArz3whxaUlXPBKTlRtswYxMZ3RI3
	KJebc2Z6aFlYdoVa3eu7VppIs9ncycOOEcjcIjGkh9YFN8s2HjODChnAJF3zZvHmu4IxbmKsqLhDR
	tNzHKz/4D6nH9KcZwQug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG2Lo-0032zV-EJ; Tue, 17 Aug 2021 16:54:08 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG2L5-0032m3-6q; Tue, 17 Aug 2021 16:53:26 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17HGqx3O029123;
 Tue, 17 Aug 2021 11:52:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629219179;
 bh=ObUSCzLoNSuz8N2oXKl+zNnLbvp8oEZxvAppbAh7Y/I=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=h3jj6M7okgAZcGG3nmns0P+aTi752360tvthbgX4YK0/P1r2LzFV/XeuSNKP2ZmkY
 wJFXVFzpiTG9I5/855IRvRFxIY/DWFtx/KrdFVIDN+cwXdp/TKH/nTb6TrZttuJh7f
 CePJEPXVUt3+/3LERNHc8Vcsx/rKtMZd8YljZJ8s=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17HGqxfX070009
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 17 Aug 2021 11:52:59 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 17
 Aug 2021 11:52:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 17 Aug 2021 11:52:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17HGqw6p065857;
 Tue, 17 Aug 2021 11:52:58 -0500
Date: Tue, 17 Aug 2021 22:22:57 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 25/35] mtd: spi-nor: core: Move
 spi_nor_set_addr_width() in spi_nor_setup()
Message-ID: <20210817165255.kuhp7tzfuk54a3cg@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-26-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727045222.905056-26-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_095323_353279_7A12D6F6 
X-CRM114-Status: UNSURE (   6.94  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 27/07/21 07:52AM, Tudor Ambarus wrote:
> spi_nor_setup() configures the SPI NOR memory. Setting the addr width
> is too a configuration, hence we can move the spi_nor_set_addr_width()
> in spi_nor_setup().
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
