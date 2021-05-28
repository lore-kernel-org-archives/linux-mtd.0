Return-Path: <SRS0=UlXy=KX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B1FC4708C
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 12:11:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1007611BD
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 12:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1007611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OksYo21D4NftKced4mtjHs/cD18zMdOHDC0pSyvm2yg=; b=tOw1k9U810pYOS/ZUVbGtrlhVl
	tjpctKK4OJGVMgShoYL+DbWXDbqiE/qnEz7Lqg/P604NJWE1RKKnUa/F+ORtAHQjVx7I4zvGIAiPe
	/tCM/6LvKgWBc6rt/euugJnD7dYxyLZQQCc/Q+Dh5Nc5L7bz6EEmQ3oQmgYwknLGsmP837XOnJa+Y
	1FPYqTLp6z+Bzke1N1Z0j5bC6xjDruO/o/jSndJUTvK4lW3bE+EodbjuGAoO4Lt0LBFZedmCiqXlQ
	sb3VZ00vvhtV2o1XgYzkbdcgYsd/O420Qjud1KqNM7bmLQrOZs53AD3eJb9VNBGnDsZa1nCFqJwnd
	u6PAb7Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmbK0-00FEiw-B3; Fri, 28 May 2021 12:10:36 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmb66-00F8Fs-HQ
 for linux-mtd@lists.infradead.org; Fri, 28 May 2021 11:56:16 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14SBu725025437;
 Fri, 28 May 2021 06:56:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1622202967;
 bh=6k3rdfaYl0ovxYBeV2J0Gi+aueUf9QX7NcoORD0ttIc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ZHFsky4e0hRJyW6ZG9ZqTgbHYWGGBfPoV2Tol7chn5U+5uLGGQbEC4ocNCvsrtokw
 XfWouwMhvxXamyGBSSDrQ0YXtjUHlz+GMGgkKte87Gn1prFXPSQsqknUuZE+k6IY1T
 elXo/xTRS932aIshpl2lLBzRyRBa7nInx6p5Lf4g=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14SBu7SH121764
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 28 May 2021 06:56:07 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 28
 May 2021 06:56:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 28 May 2021 06:56:06 -0500
Received: from [10.250.234.148] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14SBu3Lo025645;
 Fri, 28 May 2021 06:56:04 -0500
Subject: Re: [PATCH] spi-nor: sfdp: Allow configuring unknown flashes using
 SFDP
To: Petr Malat <oss@malat.biz>
CC: Pratyush Yadav <p.yadav@ti.com>, <linux-mtd@lists.infradead.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
References: <20210520160701.28176-1-oss@malat.biz>
 <20210521095503.qw3aivg4zklupwcj@ti.com>
 <20210521115350.GA7908@ntb.petris.klfree.czf>
 <64dd1df6-0ace-702b-f205-a7c7d4d12697@ti.com>
 <20210527151702.GA4807@ntb.petris.klfree.czf>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <62097eb2-22e3-e70e-9c2c-c5178c8de9d5@ti.com>
Date: Fri, 28 May 2021 17:26:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210527151702.GA4807@ntb.petris.klfree.czf>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_045614_731393_1584A984 
X-CRM114-Status: GOOD (  23.99  )
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



On 5/27/21 9:15 PM, Petr Malat wrote:
> On Thu, May 27, 2021 at 07:22:19PM +0530, Vignesh Raghavendra wrote:
>>>>> This change allows adding a support for flashes with correct SFDP
>>>>> without recompilation of the kernel by setting sfdp-compatible property
>>>>> in their node. Alternatively, sfdp_compatible module option can be used
>>>>> to list JEDEC IDs of flashes, whose SFDP can be trusted. Star "*" can
>>>>> be used to match all JEDEC IDs.
>>>>
>>>> I have skimmed through the patch. Before I look at it more closely, I 
>>>> want to understand the use case for this patch. Why would you not want 
>>>> to recompile the kernel when adding support for new hardware? Do you 
>>>> want the ability to support flashes on devices that have already been 
>>>> deployed in the field? Is it something that comes up frequently?
>>> In my case the kernel is loaded from a USB mass storage device, which
>>> can be preproduced and on stock (with the kernel already on it). With
>>> my patch I can change the flash vendor without the need of updating
>>> the image on already existing USB mass storage devices.
>>>
>>> The patch is also useful for people who use distribution kernel as they
>>> will not have to wait until (and if) the distribution updates it.
>>
>> Don't need separate DT property or cmdline argument. There is no way to
>> know if the SFDP tables are 100% valid when kernel is working with a
>> "generic flash".
>> Flashes are often replaced with newer revisions of the part that may/may
>> not have valid SFDP tables.
>>
>> So just rely on SFDP, when no valid entry is found in the manufacturer's
>> flash_info[] while printing out a warning to user that this is just best
>> effort support.
> 
> OK, I will rework it to fallback to SFDP by default. I put the safeguard
> there to avoid a case when one has a flash requiring workarounds and then
> does a kernel downgrade to a release where the flash is not known and uses
> it. Should I make an opposite flag sfdp-incompatible or do we consider this
> a theoretical scenario not worth of addressing in the code?
>  

We can guarantee new kernels don't regress wrt older version on
upgrading. But anyone downgrading kernel should expect some HW support
to be missing (not just SPI flash but many other things in general).
I don't see a need to work about such scenario

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
