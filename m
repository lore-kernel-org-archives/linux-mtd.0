Return-Path: <SRS0=FPAn=5K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85619C43331
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 10:20:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E5B020714
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 10:20:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HuEEWTZW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aTKRhspK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E5B020714
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+mdP4kKutwBwXjuxJCQpTtCRbLBTsxLUuOBitZ9SlCo=; b=HuEEWTZWWUbZow
	t2lZUIJWT4UXuRyaCUPpvmu+/tAJE6jhK4kzXepsbjxOfH463yBynxV/PU4K8UTF/nBJlueiJLQY8
	LoTpIEYYwcxlFKo7ShRbs04f4KcCVuIhv0a38LUGmfASgKkmDFivhky0EVdjhZAxOp/ZRMJwunfDg
	Lw1/WqayWJdV6apUlsgM1gXacQDJ1HKqViiQdkaEBFoS2aW0CZWVyYHjSIZ/QiFWgeNcZLOTtVztQ
	sCCNiYPaMQMLNuvYImURqktCvhTBNjG/0uFgYpCUKhtewUJCFy/E4zaF9/j8f+QPxLbJtLhYQlL8O
	sRphGmDpRo1cpc4NmRBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH39B-00016Y-RW; Wed, 25 Mar 2020 10:20:29 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH398-00015z-Cb
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2020 10:20:28 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02PAKMNM118350;
 Wed, 25 Mar 2020 05:20:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1585131622;
 bh=OSxGpaK09WxIPHWAYq2xZJ9FIh1YNyA2G+FZovTeeaw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=aTKRhspK6YA/dfxTHvd2AQORcyI58fqHk0waeQISglqn30/rS9zW3c7xbgx3oW6sw
 182BJSgQTo0b6fYLUBzHgyffObAVyAR2aOxA2TpkqqhuKqRVsxmDmsX2XE17RTXrUf
 QfWTZ99whjPUrB9wsMHI7eAJojzJDQFETnoGjWG8=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02PAKM0s116991
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 25 Mar 2020 05:20:22 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 25
 Mar 2020 05:20:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 25 Mar 2020 05:20:22 -0500
Received: from [10.250.132.85] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PAKJ2L104547;
 Wed, 25 Mar 2020 05:20:20 -0500
Subject: Re: [PATCH] MAINTAINERS: Add the IRC channel to the MTD related
 subsystems
To: <Tudor.Ambarus@microchip.com>
References: <20200325094319.35841-1-tudor.ambarus@microchip.com>
 <6445550.R9AYsZg3I7@192.168.0.120>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <a52e2362-4e28-2978-6448-1bb747dfde15@ti.com>
Date: Wed, 25 Mar 2020 15:50:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6445550.R9AYsZg3I7@192.168.0.120>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_032026_509292_EAA15595 
X-CRM114-Status: GOOD (  14.53  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On 25/03/20 3:32 pm, Tudor.Ambarus@microchip.com wrote:
> Hi, Vignesh,
> 
> On Wednesday, March 25, 2020 11:43:27 AM EET Tudor Ambarus - M18064 wrote:
>> From: Tudor Ambarus <tudor.ambarus@microchip.com>
>>
>> The #mtd channel (on OFTC servers) is being used to discuss MTD related
>> topics. Add it for better visibility to the HYPERBUS, NAND and SPI NOR
>> entries.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  MAINTAINERS | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index f5143e248170..8124d8faa8f1 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7769,6 +7769,7 @@ F:	Documentation/ABI/testing/debugfs-hyperv
>>
>>  HYPERBUS SUPPORT
>>  M:	Vignesh Raghavendra <vigneshr@ti.com>
>> +C:	irc://irc.oftc.net/mtd
>>  S:	Supported
>>  F:	drivers/mtd/hyperbus/
>>  F:	include/linux/mtd/hyperbus.h

Acked-by: Vignesh Raghavendra <vigneshr@ti.com>

> 
> I saw that the Hyperbus entry misses the L: and T:, would you send a patch to 
> add them?
> 

Patch is already in mtd/next:

https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/commit/?h=mtd/next&id=c0b66dce0ca8e628c73f673f368230a455ea6631

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
