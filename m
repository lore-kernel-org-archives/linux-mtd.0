Return-Path: <SRS0=Ic5j=4I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2769C34031
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Feb 2020 06:05:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CC8724654
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Feb 2020 06:05:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bov36PmY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="t5BUBNzn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CC8724654
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KpGk23/f/+pi8b1E7Vuj/MBpFn6L/Dz3vNJ3hhwnY8E=; b=Bov36PmYCxNqKU
	KOP427NVQ8EVfYE4L6JLvZ6s58HiGCPOZQhwYAyrmH3z5I0Yd58GVpLmJ/s4uLFAA4wU1/yY1Wxg1
	XbpPDQ689qDYbFdnGGVQCYL7j8Mh1TeM0xNR4hSWMoefqn2CeA7FCUoVZfhJ35pk/kvkedOqp0LnF
	M7Y3oyhB3MDh+N+HSrpMGWdG+7Xq1IAzJIDhzw0YBzupObYazn/Vhc0t7pviO1+flhs1Z5FxPMnpC
	KGwp9Ju6i5dGLTguKNQD1ZIIGnCCU+6+IoXeBTFCa7psfrv3vob3oTX8pRtYNLc0V3OYJ21jbqh+4
	oxjGPE/1sgGMWRzjJacg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4exn-0007pN-7Z; Thu, 20 Feb 2020 06:05:31 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4exk-0007ol-5q
 for linux-mtd@lists.infradead.org; Thu, 20 Feb 2020 06:05:30 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01K65Ea3055317;
 Thu, 20 Feb 2020 00:05:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582178714;
 bh=SzYWVR0OMF4IyIsYEG3d7U8CInzWybttnBOSLIJsfow=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=t5BUBNzndsIGDO13xW2jVMa8Tan0As53J5wlUu9T9HW5w+1FFSeQ4Bx7pEXXIM1kv
 n7GQZVzACsLUwM2HZ8lKYlTQ7HhsMd98TYAib1ejdGXT3hrbUpixk+RaE/KUmbg2j/
 jbwGS+/YYGMJK77gMF3VsSEk5AEK+I5lW15Peh2g=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01K65EXI018694;
 Thu, 20 Feb 2020 00:05:14 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 20
 Feb 2020 00:05:13 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 20 Feb 2020 00:05:13 -0600
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01K65BOe048014;
 Thu, 20 Feb 2020 00:05:11 -0600
Subject: Re: [PATCH RFT 0/2/2] mtd: hyperbus: add Renesas RPC-IF driver
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <fd1360ab-8872-f750-1314-77c6d432b413@cogentembedded.com>
 <eba43289-3cb2-406b-cc5f-1209778621bf@cogentembedded.com>
 <16309076-4378-d9ff-30c3-93a46af1d803@ti.com>
 <d09bb1b9-fef8-5a96-df4e-eccc228f2777@cogentembedded.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <d208a7d6-7778-7ed9-998c-74f0678a5248@ti.com>
Date: Thu, 20 Feb 2020 11:35:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <d09bb1b9-fef8-5a96-df4e-eccc228f2777@cogentembedded.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_220528_318341_85661208 
X-CRM114-Status: GOOD (  17.99  )
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
Cc: Mark Brown <broonie@kernel.org>, Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 20/02/20 1:43 am, Sergei Shtylyov wrote:
[...]
>>> +static const struct rpcif_op rpcif_op_tmpl = {
>>> +	.cmd = {
>>> +		.buswidth = 8,
>>> +		.ddr = true,
>>> +	},
>>> +	.ocmd = {
>>> +		.buswidth = 8,
>>> +		.ddr = true,
>>> +	},
>>> +	.addr = {
>>> +		.nbytes = 1,
>>> +		.buswidth = 8,
>>> +		.ddr = true,
>>> +	},
>>> +	.data = {
>>> +		.buswidth = 8,
>>> +		.ddr = true,
>>> +	},
>>> +};
>>> +
>>
>> Looking around, there seems to be more than one SPI controllers, apart
>> from Renesas, which also support SPI NOR and HyperFlash protocol within
>> a single IP block. E.g.: Cadence xSPI controller [1]. Therefore, we need
>> a generic framework to support these kind of controllers.
> 
>    We can use e.g. 'struct rpcif_op' as generic command description.
> 
>> One way would be to extend spi_mem_op to support above template along
>> with a new field to distinguish SPI NOR vs HyperFlash protocol. HyperBus
>> core can then register a spi_device and use spi-mem ops to talk to
>> controller driver.
> 
>    We have discussed this idea with Mark Brown, the SPI maintainer, and
> he wasn't terribly impressed (I've invited him to #mtd -- his nick is
> broonie and mine is headless, I'm also adding him to CC:).
> 

I don't see HyperFlash to be very different than Octal DDR SPI NOR
flashes. While Octal DDR mode has 2 byte opcode and 4 byte address
phase, HF has 6 byte combined cmd-addr phase.

There is no support for Octal DDR flash currently. But there have been
multiple attempts to add Octal DDR mode support though:

https://patchwork.ozlabs.org/patch/982913/
https://lkml.org/lkml/2019/11/15/254
https://patchwork.ozlabs.org/patch/1236285/


>> So, I suggest making Renesas RPC-IF backend a full fledged spi-mem
>> driver (instead of driver/memory) and use extended spi_mem_op to support
>> HyperFlash.
> 
>    I don't think cramming support for the different flash busses into
> the SPI drivers is a good idea... I'm not against generalizing the
> drivers/memory/ APIs though.
> 

IMO, its easier to extend spi-mem to support HF by adding an additional
field to indicate the protocol than creating a new one.
But, I am open to other generic ways to support these controllers as well.

>> [1]
>> https://ip.cadence.com/uploads/1244/cdn-dsd-mem-fla-host-controller-ip-for-xspi-pdf
> 
>    Do they have the full datasheet available? I'll try looking at the driver 
> tomorrow...
> 

I don't see a datasheet, you could probably ask on the patch adding the
driver (using the mbox from here:
https://patchwork.kernel.org/cover/11354193/). But above document
indicates its supports both the flashes.

Also have look at JEDEC xSPI spec that combines Octal DDR and HF into a
single standard: https://www.jedec.org/standards-documents/docs/jesd251

So, I expect more controllers to support SPI/QSPI + Octal DDR SPI + HF
with a single IP.



-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
