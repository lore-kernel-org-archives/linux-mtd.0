Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81984C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 13:10:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49F46207E0
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 13:10:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ws+RPf5q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EmGf34C9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49F46207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FOscwTfVGuzCdbH48Gxasf8QoMDPEaGmhvPCreMJ23Y=; b=Ws+RPf5qoIcwML
	UH+cgM1Ep5nIsZ8k/mtiyhglz/2Bw+tM4lriU4P/Kn/H0GFQmpHRuyfyyBiX2LorZDE2D79G8WYA3
	9618SrnP0SoUMaqUxMrFn8WiMdlVIR5hdMmbDkQUEcVgVahF8aRChHYPR0oYfZMDvkVTjH+H7q+EP
	H7Yhiz2DeRI/APlTCfMwOswIoG+V+p+J6omfKLyMmbLXbEarmlUgrRNKZ+/s5X96ICY9uHeW4SXuQ
	bIVxXtdlstOn7tE/iiAtGhZK78RUuoPujkC8HrNdB/BNtCq//MDQj4GbriKFMDq65G4SMs7fee9Lq
	ojoZmvPzvZYTqtwKUCYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwo7T-0005oR-R0; Thu, 21 Feb 2019 13:10:31 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwo7Q-0005o8-3I
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2019 13:10:29 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1LDAOij121403;
 Thu, 21 Feb 2019 07:10:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1550754624;
 bh=hugBsHCAGaJB7Qsx+c9P3n+DXVu2tvNWYRAeH/J9ITM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=EmGf34C9U7doGwkP8RYrfPTTsN+yyNUsgeHSg7eRqQ5wuE69NfsFHWmNoVxNd/3Cg
 zhXf4Yf/YzHEOgrVQgBsU9dimDP96Y5TqpmqsZPbsw8NK7XD4ECVF7BOYH3Rh7zBem
 FoinaDhU+hP64BAqeEHDyzkYDLoM9plcGdvd2x04=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1LDAOBo025156
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 21 Feb 2019 07:10:24 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Thu, 21
 Feb 2019 07:10:24 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Thu, 21 Feb 2019 07:10:24 -0600
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1LDALhE026078;
 Thu, 21 Feb 2019 07:10:21 -0600
Subject: Re: [EXT] [PATCH v6 2/2] mtd: spi-nor: cadence-quadspi: Add support
 for Octal SPI controller
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>, Boris Brezillon
 <bbrezillon@kernel.org>, "Tudor.Ambarus@microchip.com"
 <Tudor.Ambarus@microchip.com>
References: <20190212083809.6534-1-vigneshr@ti.com>
 <20190212083809.6534-3-vigneshr@ti.com>
 <BYAPR08MB453362F4253ADA149D05315FDB7E0@BYAPR08MB4533.namprd08.prod.outlook.com>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <b459f797-d24c-5501-76a0-057ec1df594d@ti.com>
Date: Thu, 21 Feb 2019 18:41:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <BYAPR08MB453362F4253ADA149D05315FDB7E0@BYAPR08MB4533.namprd08.prod.outlook.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_051028_243930_C58F0656 
X-CRM114-Status: GOOD (  13.92  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 21/02/19 4:11 PM, Bean Huo (beanhuo) wrote:
> Hi, Vignesh
> 
>>
>> Cadence OSPI controller IP supports Octal IO (x8 IO lines), It also has an
>> integrated PHY. IP register layout is very similar to existing QSPI IP except for
>> additional bits to support Octal and Octal DDR mode. Therefore, extend
>> current driver to support Octal mode. Only Octal SDR read (1-1-8)mode is
>> supported for now.
> 
> Does this your Cadence OSPI controller support 8-8-8 IO mode, if yes,
> Why not directly enable 8-8-8 mode? 
> 

Yes.. IP also supports 8-8-8 DTR mode. But supporting those modes
require enabling, configuring and calibrating OSPI PHY module within the
IP.
I am planning to do that, after moving driver over to spi-mem layer.


>> Tested with mt35xu512aba Octal flash on TI's AM654 EVM.
>>
>> Signed-off-by: Vignesh R <vigneshr@ti.com>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
