Return-Path: <SRS0=Ia6G=Z2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF224C43603
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Dec 2019 12:55:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81F2220674
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Dec 2019 12:55:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AmGYbbxA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="e6TfccCf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81F2220674
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UdciKF2EzEDHQFQC9OcwRcGSFktV8g9BbZUz12UF5kU=; b=AmGYbbxAa3ihzA
	7Ag/xtuY5zhHrGv++4NfvEgAsQtuTvHqDHy/4gy0iQy+nAJ9gYBwFBkT+omruPLy9l5BbeQoUEpxk
	AgZWGLK/N98mHQ4RoD8mQWxyukUO1knOqCErNuFnScb9z1wuDhed2dQDtqaxyUSqL0eeqw3efYx7z
	QMYR/Xib5aQ1052//o5bzlFlYwX6m9tHeGlMNBzLuBS6EaESkBTk8iKpEOdovyVlkK7X/Xk8YWisp
	Pw+d+hkEM5KGMKTfxeAbk2Fok06sZQnU4hgzKN/E/llRxjP50yUPl703mE/wBtlVgYSYX+As3n4ht
	lT0Dqd9QjZ5D45yTm+bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icUBq-0000ha-7b; Wed, 04 Dec 2019 12:55:34 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icUBn-0000h1-CI
 for linux-mtd@lists.infradead.org; Wed, 04 Dec 2019 12:55:32 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB4CtLla021288;
 Wed, 4 Dec 2019 06:55:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1575464121;
 bh=75OBmJFI3hpuZ4Q6xPCszXW82HOFGTHmHSHourpUJo0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=e6TfccCfOlRHdE4aRiwj/c6mLAfsJvVI9jtvB241LwZYg12Kb3nKITmZXXAim2ENg
 mW4d9tz8/BHbqG9JyHgltecYvf8lGeGhYvn9gFVZQc8708HiuZU95x8HqXVPQd0Czd
 vr1tYpTKdDAeilTspVpALfyteFa87pBEN0Os9fPI=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4CtLqc057283;
 Wed, 4 Dec 2019 06:55:21 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Dec
 2019 06:55:21 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Dec 2019 06:55:21 -0600
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4CtHYT006688;
 Wed, 4 Dec 2019 06:55:18 -0600
Subject: Re: [PATCH v5 4/4] mtd: Add driver for concatenating devices
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20191127105522.31445-1-miquel.raynal@bootlin.com>
 <20191127105522.31445-5-miquel.raynal@bootlin.com>
 <690065a2-619d-3f97-30c6-5dea76896d78@ti.com> <20191204111751.5383b426@xps13>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <431e7345-ee60-6d79-7a0c-9396da93029c@ti.com>
Date: Wed, 4 Dec 2019 18:25:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191204111751.5383b426@xps13>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191204_045531_562591_238FC4CB 
X-CRM114-Status: GOOD (  14.67  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Bernhard Frauendienst <kernel@nospam.obeliks.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 04/12/19 3:47 pm, Miquel Raynal wrote:
> Hi Vignesh,
> 
> Vignesh Raghavendra <vigneshr@ti.com> wrote on Wed, 4 Dec 2019 15:28:46
> +0530:
> 
[...]
>> IIUC flash0 and flash1 are subnodes of a SPI master node?
>> And I believe flash0 node's compatible is "jedec,spi-nor"?
> 
> Indeed this is one possibility (probably the most common) but in theory
> this should work for any kind of MTD device, hence I voluntarily
> dropped the hardware-specific properties to focus on the partitions
> description here.
> 

Ah, make sense...

>>
>>
>>>
>>>         flash1 {
>>>                 partitions {
>>>                         compatible = "fixed-partitions";
>>>
>>> 			flash0_part1: part1@0 {  
>>
>> s/flash0_part1/flash1_part0?
> 
> Right!
> 
>>
>>> 				label = "part1_0";
>>> 				reg = <0x0 0x800000>;
>>> 			};
>>>
>>> 			part0@800000 {
>>> 				label = "part1_1";
>>> 				reg = <0x800000 0x800000>;
>>> 			};
>>>                 };
>>>         };
>>>   
>>
>> For my understanding, how many /dev/mtdX entries would this create?
> 
> If the master is retained (Kconfig option) and thanks to the common
> partitioning scheme, we would have:
> * flash0 (mtd0)
> *   part0_0 (mtd1)
> *   part0_1 (mtd2)
> * flash1 (mtd3)
> *   part1_0 (mtd4)
> *   part1_1 (mtd5)
> 
> If we enable this driver, we would also get an additional device:
> * mtd2-mtd4-concat (or part0_1-part1_0-concat, I don't recall the exact
>   name) being mtd6.

Ok, thanks for the clarification!


-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
