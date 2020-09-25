Return-Path: <SRS0=nuHD=DC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7573C4727C
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 12:01:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CE4F2083B
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 12:01:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G655SlNQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Fkt4N4ix"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CE4F2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYEXI1231hYcE33aiwrBtD+uop5hwEwSuk9Uh+yNQcc=; b=G655SlNQ/PILe725HDhMMXSxNT
	eAAA7e7rEhZompuj2umhN/8w/u+ZZYclnLgMMqNtpI2ayomUHE53fqkoENh16vuDnbet6M4ClgWw9
	BtjCwU9y8qB0j2tphnVvwI3ZSA6kjThaqyfHo7MCMU3zExGvtWZJzCij5QYC3EwzxVh7V931Fe5J/
	ALPop635tPPP2/N5juaGb5pkVJ91OTWx1fkjcrvdSEf1uHctMC/QwkXGTIAXedJjqtEUJ3wdRekfu
	1qwo4yv/SKLxyvaZsUxLTSp57b40SYMX7kJa4FLjFdZAphs956IGvkS7qJ46M77B7aph3REi1ca4h
	PqaraAnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLmPj-0004dE-Qg; Fri, 25 Sep 2020 12:01:23 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLmPg-0004bc-Qg
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2020 12:01:21 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08PC1EPV090630;
 Fri, 25 Sep 2020 07:01:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601035274;
 bh=qzwd725KjmIIYDhMdoRsgxJ7w+TiAxAImEuhlfXni7o=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=Fkt4N4ix81MMPPoThdTFfi9CZX55AWf0k652MQSViJV6H3NKdVqkL/gMMmTppPCsG
 aKfWJRDG9n9CsiKU59u/whT8s3+WiILE1TyWNNKgGikEW8PiDw+wbdPWZafInsEpcn
 DG1dza1sxtSiLIX8/gLfUqGIEZzsQ1v2cLOIt0WE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08PC1E2u108349
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 25 Sep 2020 07:01:14 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 25
 Sep 2020 07:01:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 25 Sep 2020 07:01:14 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08PC1BOY010743;
 Fri, 25 Sep 2020 07:01:12 -0500
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: add GD25LQ80C
To: Stijn Tintel <stijn@linux-ipv6.be>, <tudor.ambarus@microchip.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
References: <20200921184754.4010068-1-stijn@linux-ipv6.be>
 <49548dc7-aff5-a6de-de54-41c446620551@ti.com>
 <4e7c1e35-1d2a-2621-3f0a-2eeea0df2b56@linux-ipv6.be>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <6a83a579-8d28-57b8-1cf9-3f0dee3517c8@ti.com>
Date: Fri, 25 Sep 2020 17:31:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4e7c1e35-1d2a-2621-3f0a-2eeea0df2b56@linux-ipv6.be>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_080120_990227_64379579 
X-CRM114-Status: GOOD (  18.14  )
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



On 9/25/20 5:09 PM, Stijn Tintel wrote:
> On 25/09/2020 14:36, Vignesh Raghavendra wrote:
>> Hi,
>>
>> On 9/22/20 12:17 AM, Stijn Tintel wrote:
>>> Tested on a TP-Link OC200.
>>>
>> But what was tested? Dual and quad mode tested (as you enable those
>> flags)? And lock/unlock as well?
>>
>> Could you add this info to commit message?
> I tested read and write with dd, verified the written image afterwards.
> I enabled those flags based on what's in the datasheet. If this is not
> enough, please advise an acceptable way to test those flags.
>>

We want to make sure that entries being added are actually tested on a
real HW especially wrt quad mode. Can you confirm quad mode is being
used to reading image from the flash?
(you could put prints in spi_nor_read() file and see the opcode being
used for read and compare with Datasheet to know the mode).

If you are unable to test quad/dual mode due to limitations then please
do not add the flag just based on datasheet.

Regards
Vignesh

>>> Datasheet: https://www.gigadevice.com/datasheet/gd25lq80c/
>>>
>>> Signed-off-by: Stijn Tintel <stijn@linux-ipv6.be>
>>> ---
>>>  drivers/mtd/spi-nor/gigadevice.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
>>> index 447d84bb2128..840fa9f90a67 100644
>>> --- a/drivers/mtd/spi-nor/gigadevice.c
>>> +++ b/drivers/mtd/spi-nor/gigadevice.c
>>> @@ -24,6 +24,9 @@ static struct spi_nor_fixups gd25q256_fixups = {
>>>  };
>>>  
>>>  static const struct flash_info gigadevice_parts[] = {
>>> +	{ "gd25lq80c", INFO(0xc86014, 0, 64 * 1024, 16,
>>> +			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>> +			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>>>  	{ "gd25q16", INFO(0xc84015, 0, 64 * 1024,  32,
>>>  			  SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>>  			  SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>>>
>> Regards
>> Vignesh
> 
> Thanks,
> Stijn
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
