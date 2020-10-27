Return-Path: <SRS0=AizK=EC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76C8C388F9
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2020 11:19:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AE13204FD
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2020 11:19:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XtXMuIMt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OBohc5nk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AE13204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gvr7fAx/GXdksuUEi9bakvnQbRy1o7Hb/7cs64Wbea0=; b=XtXMuIMtTxHVU+snBxElTPfUNU
	vTg27DbkLVtTDHzOjfIGWmssmdrBQWuHUi5ijsUPSz6dODhHHd+MZrxazI/7mnm+82frIqNcAGGj1
	GEnMu38uvZWsrIg5h7fdpsT93lv0fPXcGX/miG8ywwblqnk3b2FSILevy7xwnIch4zqvQISnYmdlY
	VvdO2rZFpclYuSeGFF+mlCHfuWqLOBywLUrzWWfHmnQSwbnNAMM8aeAExBYBgcj46jxwpemKEvAcs
	OvZB8PJvzR4jJjd5OQ8J64yNR9eHnk9LQsXaE9wvoSrjCafyFsRef4cY1cIP6+fz4vW/m/v0hmzeF
	3vQNEqwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXMzZ-0008JC-CO; Tue, 27 Oct 2020 11:18:17 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXMzV-0008IU-6f
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2020 11:18:14 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09RBI84V022554;
 Tue, 27 Oct 2020 06:18:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1603797488;
 bh=n2ru3Mr0iMYemHjwDfq5SA03dYGNMsfunxIAIX/C4X8=;
 h=Date:From:To:Subject:References:In-Reply-To;
 b=OBohc5nkMosV1XoUEV2HaULUopaZmqCJnwMKQMlfNbrK9MLppABUZ58d9bjFYAuLa
 9RhhaanS1g1te6K1MQWu+qbuwwiSKYrdQZGo1rnmCEi+FAAhu0FAvg/fI486RA3tvn
 U8h/UDquKGOup5A21Nb2jq/FUdIZqbhRF7WDJu/I=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09RBI89S047065
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Oct 2020 06:18:08 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 27
 Oct 2020 06:18:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 27 Oct 2020 06:18:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09RBI7U1106738;
 Tue, 27 Oct 2020 06:18:07 -0500
Date: Tue, 27 Oct 2020 16:48:06 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] mtd: Make sure UBIFS does not do multi-pass page
 programming on flashes that don't support it
Message-ID: <20201027111804.e27pyvf62eksngmp@ti.com>
References: <20201012180404.6476-1-p.yadav@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201012180404.6476-1-p.yadav@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_071813_367252_6FCD2C3B 
X-CRM114-Status: GOOD (  23.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/10/20 11:34PM, Pratyush Yadav wrote:
> Hi,
> 
> The Cypress Semper S28 flash family uses 2-bit ECC by default. Under
> this ECC scheme, multi-pass page programs result in a program error.
> This means that unlike many other SPI NOR flashes, bit-walking cannot be
> done. In other words, once a page is programmed, its bits cannot then be
> flipped to 0 without an erase in between.
> 
> This causes problems with UBIFS because it uses bit-walking to clear EC
> and VID magic numbers from a PEB before issuing an erase to preserve the
> file system correctness in case of power cuts.
> 
> This series fixes that problem by introducing a flag
> MTD_NO_MULTI_PASS_WRITE that tells the file system layer that it can't
> do multi-pass writes. It also sets the writesize to the page size for
> such flashes to make sure file systems know that they should write the
> entire page in one go.
> 
> It is based on the xSPI/8D series that adds support for Cypress S28
> flash [0]. The patches themselves are independent of that series in the
> sense that they don't rely on 8D support. But since S28 flash is not
> supported without that series, these patches don't make much sense
> without it.
> 
> Tested on Cypress S28HS512T and MT35XU512ABA on J7200 and J721E
> respectively.
> 
> [0] https://lore.kernel.org/linux-mtd/20201005153138.6437-1-p.yadav@ti.com/

Ping. Any comments on the series?
 
> Pratyush Yadav (3):
>   mtd: abi: Introduce MTD_NO_MULTI_PASS_WRITE
>   UBI: Do not zero out EC and VID when multi-pass writes are not
>     supported
>   mtd: spi-nor: core: Introduce SPI_NOR_NO_MULTI_PASS_PP
> 
>  drivers/mtd/spi-nor/core.c     | 5 +++++
>  drivers/mtd/spi-nor/core.h     | 6 ++++++
>  drivers/mtd/spi-nor/spansion.c | 2 +-
>  drivers/mtd/ubi/io.c           | 2 +-
>  include/uapi/mtd/mtd-abi.h     | 1 +
>  5 files changed, 14 insertions(+), 2 deletions(-)
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
