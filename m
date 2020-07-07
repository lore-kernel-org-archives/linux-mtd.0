Return-Path: <SRS0=3nwF=AS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC6BC433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 08:10:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47608206C3
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 08:10:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cH/1S36y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CRJZKB33"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47608206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=snMVFAdrsgl+dxaRi2Uf3ZHI/hPO3cPQvhFv5w+o+6c=; b=cH/1S36yfYSpMs45hVt0rW7s1
	YNIERFwd3aHmUoXd9wKh0hT/3Eo5aOZjAomarg+c7KxOZy/S3c+J8C+ixmsfwfuc/pUVPORiE6QoF
	77BueXOTL4F/MojXprRqQdkQ+D4CWfmVcE0KPrmjWhPQ199IPkH9lhN+ANbAXX3cWeg4OtCrseOm3
	Z5599z6cS7xLoafGe82KnCwBufLJnODiuZkI+kLYD9KVSSavoGOTG3jOox/dxkvD/OjNnttuVm+AM
	DL/Nd7sjAxIU1x+u+WeHGK9v5UvSu69MhxO5ew0Ca84ok23McGTDolUz2Y4hoOxLsWTRry7cC+e1e
	aFqPvhMwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsifu-00083N-8y; Tue, 07 Jul 2020 08:09:58 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsifr-00082B-OT
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2020 08:09:56 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06789jNd066026;
 Tue, 7 Jul 2020 03:09:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1594109385;
 bh=b/Sj5k/vnAzZB4RskTu/OTPGjII+fd4GdS2Nv+pUwso=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=CRJZKB33RFwluKPk/Cf3lMGG4jI3zMedzf0FOB5SPaW28Ye7K5KNCQoaWyOVLYKGN
 vYSEmS+CP/Mv39BGnNIxvuV2qGxGCnNzSKHsEhHpWHMRIN17MkAkb5f8xcEEHyt23n
 wSONeQkfFm/53te4KUjiDCJV4FB6ucD63Up+UKlA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06789jLW108789
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 7 Jul 2020 03:09:45 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 7 Jul
 2020 03:09:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 7 Jul 2020 03:09:45 -0500
Received: from [10.250.151.93] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06789eJH062895;
 Tue, 7 Jul 2020 03:09:41 -0500
Subject: Re: Octal RAM driver support related query
To: Miquel Raynal <miquel.raynal@bootlin.com>, Priyank Bhatt
 <priyankbhatt196@gmail.com>
References: <aceb03c8-00f4-a6f5-01c3-55621aa6d3d0@gmail.com>
 <20200706082709.5bcc6ce7@xps13>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <d3bedcc1-a71a-77a9-673b-c2565b6215c2@ti.com>
Date: Tue, 7 Jul 2020 13:39:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200706082709.5bcc6ce7@xps13>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_040955_922273_97D3754B 
X-CRM114-Status: GOOD (  15.35  )
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd@lists.infradead.org, miquel@bootlin.com,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Priyank,

+Tudor,

On 06/07/20 11:57 am, Miquel Raynal wrote:
> Hi Priyank,
> 
> +mtd maintainers
> +mtd list
> 
> Priyank Bhatt <priyankbhatt196@gmail.com> wrote on Mon, 6 Jul 2020
> 11:05:14 +0530:
> 
>> Hi Miquel,
>>
>> I am working on NXP's iMX8 and trying to communicate to an ISSI Octal RAM with its flexSPI interface. I was recently going through a presentation *MTD: What's new? *from www.bootlin.com and at the end I found that in what's next section you have listed hyperRAM support.
>>
>> So my question: Is there any OctalRAM supported driver which I can refer to create my own for a specific chip manufacturer?
>> Right now I am referring mchp23k256.c(microchip) SPI RAM driver inside /driver/mtd/devices. But I am a little confused as to how to use my driver in Octal mode.
> 
> I guess we should ask Vignesh about it because he is the one mastering
> this subsystem, I could only give you dump answers about these devices
> :)
> 

There is no support for any type of Octal RAM devices currently.

Also HyperRAM and Octal RAM use different protocols... Octal RAM uses
traditional (Octal) SPI command set where as HyperRAM uses HyperBus
protocol (https://www.cypress.com/products/hyperram-memory). Even ISSI
website lists Octal and HyperRAM as two different products

Traditionally RAM devices that follow SPI NOR protocol have been
supported under drivers/mtd/spi-nor/  (Eg.: cy15x104q, mr25h* and
mb85rs1mt). Read/write logic in drivers/mtd/spi-nor/core.c has been
sufficient enough to handle these RAM devices as well.

I don't have access to ISSI Octal RAM datasheets, but if these RAM
devices use same commandset as SPI/Octal SPI NOR flashes then we can
continue to support them under SPI NOR framework.

Otherwise, there would be a need for separate Octal RAM driver under
drivers/mtd/devices/ which would then use spi_mem_ops to communicate
with spi-nxp-fspi.c driver (just like drivers/mtd/spi-nor/core.c)

Please note that SPI NOR framework still lacks complete Octal mode
support.. There is a patchset to add 8D-8D-8D mode Octal SPI NOR flash
that still under review:

https://patchwork.ozlabs.org/project/linux-mtd/list/?series=185337

This patchset might be prerequisite to support Octal RAM under SPI NOR
framework

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
