Return-Path: <SRS0=QbZc=CZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615C9C2D0A7
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Sep 2020 06:17:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E252C21D7D
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Sep 2020 06:17:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x+oduiCz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ftzmHZQV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E252C21D7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sfmq7Zm+J1nLUugdmTco8LtpbVa/9Zs8six296HDdz4=; b=x+oduiCz99fkushlu/68rw6iz
	6o8J989Mt4Srcwml4xk9QowkYVKPAXJDkIw/0NO+X+TWSX/v74jEoiFQSxj6+sJBGkXdyNDW1bb3K
	fEqquk+E+y9iyVa9TOiBjSyS0naB0OpxRaavH9uJTQLT4rq+LuVJUakrUFf/Jn3mbSdyvPdUQrzbM
	6JGRDDULiMz8EI9p1GFHWeNjrNAp0R4yE4lChvsUT1/0sX8w+WRc2qn/Su1s8jdOhFQ0MDL94t87t
	rlgxTpTpHg+LCkYg5sgXzgXcPls/wK+X4BNk8alRj0Bw2qkdBhR03X9htpiiJ7u/g+u8F2guAhxoj
	GoZhyTv1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIQkY-0005OV-Rc; Wed, 16 Sep 2020 06:17:02 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIQkW-0005No-0P
 for linux-mtd@lists.infradead.org; Wed, 16 Sep 2020 06:17:01 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08G6GsKm105157;
 Wed, 16 Sep 2020 01:16:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600237014;
 bh=JkvZZE/7TajQ1Ag1zDg2OOuvEmolACGaWWAYZnR3LPI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ftzmHZQVNqgihpu/IhCSlDNSEyKdG91woGLYPfZuAF8WgpVsyz4IuPxfo8eQLKqkJ
 U0LiBJPgRmO4/p9u10USTP7EI0HpHTB44syf74ekmaLxnyV7VdSwFTglPmGJ9kArCx
 xIIt7XZN3yCPv6O0GYVKAj2fr3VhFw9/MRTlBYA4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08G6GsIG043681
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Sep 2020 01:16:54 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 16
 Sep 2020 01:16:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 16 Sep 2020 01:16:54 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08G6Go6J088464;
 Wed, 16 Sep 2020 01:16:51 -0500
Subject: Re: [PATCH v12 00/14] mtd: spi-nor: add xSPI Octal DTR support
To: Pratyush Yadav <p.yadav@ti.com>
References: <20200903171313.18741-1-p.yadav@ti.com>
 <973eac67-fa01-309f-c4d1-7983f404d507@ti.com>
 <20200915074727.o4drgfgdabhozjb5@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <c56f3517-383c-2e45-d5cc-fde5a44ac34f@ti.com>
Date: Wed, 16 Sep 2020 11:46:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200915074727.o4drgfgdabhozjb5@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_021700_134232_E684C6AD 
X-CRM114-Status: GOOD (  21.20  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sekhar Nori <nsekhar@ti.com>,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, "open
 list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 9/15/20 1:17 PM, Pratyush Yadav wrote:
> On 15/09/20 12:16PM, Vignesh Raghavendra wrote:
>>
>>
>> On 9/3/20 10:42 PM, Pratyush Yadav wrote:
>>> Hi,
>>>
>>> This series adds support for Octal DTR flashes in the SPI NOR framework,
>>> and then adds hooks for the Cypress Semper and Micron Xcella flashes to
>>> allow running them in Octal DTR mode. This series assumes that the flash
>>> is handed to the kernel in Legacy SPI mode.
>>>
>>> Tested on TI J721E EVM with 1-bit ECC on the Cypress flash.
>>>
>> [...]
>>
>> Please fix checkpatch issues on patch 1, 3, 4 and 5
> 
> I ran checkpatch on my patches based on top of next-20200914 just now. I 
> only see issues with patches 3 and 4. Patches 1 and 5 report no issues. 
> What problems do you see on patches 1 and 5?
> 

Please run with --strict argument to checkpatch. You can see the issues
at: https://pastebin.ubuntu.com/p/5pPWcGNsmp/

> As for patches 3 and 4, the error I see is "ENOTSUPP is not a SUSV4 
> error code, prefer EOPNOTSUPP". I left it in intentionally. There a 
> couple other functions in SPI NOR that use ENOTSUPP instead of 
> EOPNOTSUPP so I followed the local convention.
> 

This is a recent addition to checkpatch: 6b9ea5ff5abd ("checkpatch: warn
about uses of ENOTSUPP").

> If you insist, I can add a preparatory patch that first changes those 
> uses of ENOTSUPP to EOPNOTSUPP and then update patches 3 and 4 to do the 
> same. Let me know.
>  

Changing existing usage of ENOTSUPP to EOPNOTSUPP is a separate exercise
and patches are welcome. But any new addition of ENOTSUPP would need to
be avoided.

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
