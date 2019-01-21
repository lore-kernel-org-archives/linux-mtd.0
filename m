Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55867C31D63
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 06:00:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DCF7217F9
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 06:00:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="onfqF49x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="IXX5w5rc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DCF7217F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iKctvyJfNkI5v22pdr37M7z4Z8EESV2bBCAuZVKSHFA=; b=onfqF49x6h6+Jx
	oSvV6InOuxeZDiZ+jv+17TQyy0gOe50sTIQPA+QTGYLymbJIPDRGHS6RiVy1Wxuixdv/BnRuucc8l
	d7AvnHZWMBW9NFkMDoTA/dwsHoqYVUTxT2bTVLB8NgVuPcnmlOsK0nS0DNDcImUEdAauphlzU4KMQ
	7F8LKx6L1D1bu4ztY6NWdBBkULadRk3mHBRunvWuSHc1otmrHM8pl+uEIBTuILBEc0vfnsVlBFOs1
	4EMocRGYDinZ4nS2zAjzYjy95cKwD4MEUrVrvb3cxf+PC2XsQHUuph+ID8EbxHoX0PXlw/K0QQbsB
	LWKWObzcwfqGVy0bPYIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glSd8-0004va-BE; Mon, 21 Jan 2019 06:00:18 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glSd5-0004v8-6S
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 06:00:16 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0L60DoF049910;
 Mon, 21 Jan 2019 00:00:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1548050413;
 bh=lJJzJMginXvGYLlJGSQHlnm/ZHSjHMZFHWx0S7M6PpM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=IXX5w5rczMnKky0VSlGlCHVBmhBBWrxMObnDepS2mMeKXgIljb4cxAJ1U/h9TFtFs
 fSZAVkKqaQYe0lNYKFEh4pI6YzGXy925dep/WAY3SP5vyxU5j6AigYblDvwzUXkx/6
 hMWi11GSxXAsD7pu5uJNL3s5NVtNV09sJNvJA4HQ=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0L60DOQ028121
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 21 Jan 2019 00:00:13 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Mon, 21
 Jan 2019 00:00:12 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Mon, 21 Jan 2019 00:00:13 -0600
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x0L608BO014152;
 Mon, 21 Jan 2019 00:00:11 -0600
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: cadence-quadspi: Add support for
 Octal SPI controller
To: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
References: <20190116103027.22657-1-vigneshr@ti.com>
 <20190116103027.22657-3-vigneshr@ti.com>
 <6e6f7c3a-4772-1a17-0f5f-547ea9809283@microchip.com>
 <353a011e-920a-ddb3-4eef-e3256555ac93@microchip.com>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <de9f281c-6bbb-2686-a809-f53302d1a3e0@ti.com>
Date: Mon, 21 Jan 2019 11:30:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <353a011e-920a-ddb3-4eef-e3256555ac93@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190120_220015_312050_6AC8ED51 
X-CRM114-Status: GOOD (  14.40  )
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
Cc: "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 20/01/19 8:58 PM, Tudor.Ambarus@microchip.com wrote:
> Vignesh,
> 
> On 01/20/2019 04:56 PM, Tudor.Ambarus@microchip.com wrote:
>> Looks good.
> 
> one more thing: in cqspi_read_setup() I see that the dummy cycles are adjusted
> if (f_pdata->inst_width != CQSPI_INST_TYPE_QUAD).
> 
> Should you adjust the dummy cycles for octo too? 

Driver does not claim support for SNOR_HWCAPS_PP_4_4_4 mode or
SNOR_HWCAPS_PP_8_8_8 mode. Therefore inst_width is always be
CQSPI_INST_TYPE_SINGLE (cqspi_set_protocol() always sets inst_width and
addr_width to CQSPI_INST_TYPE_SINGLE).
Code to support 4_4_4 or 8_8_8 mode is incomplete in the driver. Also,
using mode bits to satisfy dummy clk cycles does not seem right. My
guess is driver is broken, if inst_width is indeed CQSPI_INST_TYPE_QUAD
as we end up sending additional 8 dummy clock cycles over what is asked
in nor->read_dummy.
I will plan to fix these as part of moving driver over to spi-mem. But
above code should not impact 1-1-8 mode support.

> I tried to find a datasheet for the controller, without success though ...
> 

You can find Octal SPI controller datasheet in AM65x SoC TRM here:
http://www.ti.com/lit/ug/spruid7b/spruid7b.pdf
Page 9449: 12.3.2 Octal Serial Peripheral Interface (OSPI)



-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
