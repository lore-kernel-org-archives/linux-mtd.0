Return-Path: <SRS0=S0OG=Z7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90FDEC43603
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 09:53:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6288B2072D
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 09:53:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CjjWdmIq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uPwVdXa2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6288B2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Wlna5hR/2/uSr6Ri23KXZt2OIonEmylGwjXQ0P5LcI=; b=CjjWdmIqDhm8bB
	eZbDp+ViED3xa/SKWwsYh9lNj47FTBkuNqPQnEqCdxssFCGuH4Ql8S3KWiKwRsEV6zOtRlZvn022X
	7dHAkwtgnVIWKn3wsQCl/OphqU0C+XXsdr4GfWDNLwcnijFXe7rHcgQ6BqOirtmwNfy5oIhcwDd3z
	5CC2ewFqsUyC25nFiu8aDs9FwnusTzNprp51+/Y+6cBhQhJOnvUBckYZ9KZDe/AtnMXTs3a5t5GNG
	Kx57jzr0mWSjpJqKYU3iScHqTIzR5tYdAAHlw571wQrdn4LJn70pwUDHxfFalY8RRCNfV37W5GSyP
	Luzp5hA+I4x5/C4W0o7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieFjJ-0003pv-P8; Mon, 09 Dec 2019 09:53:25 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieFjG-0003pV-FP
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2019 09:53:24 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB99r2HG035917;
 Mon, 9 Dec 2019 03:53:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1575885182;
 bh=HQh1TZLTVm5G5fKhCiTmdkbn5flX3Vcfi7oF9Gtg2R4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=uPwVdXa2LkR+h/TtP/tEcgRZoUneHHW98+jKZPQe69fHca2oDmJcsHSz7bNu3UKtD
 tEuH5/DB8L3Nqbsj3qr7qkfdSwRRJ4F6bNuKRtjYxjy1WUaUEVtbJfyugIR3rBAOU7
 OiUfdkwiW4r2RVFkTyNifIx2jF4XJg34xfyr67Fw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB99r24P091285
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Dec 2019 03:53:02 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Dec
 2019 03:53:02 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Dec 2019 03:53:02 -0600
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB99qwcX097397;
 Mon, 9 Dec 2019 03:52:58 -0600
Subject: Re: [PATCH 2/4] mtd: spi-nor: Add support for Octal 8D-8D-8D mode
To: <masonccyang@mxic.com.tw>
References: <1573808288-19365-1-git-send-email-masonccyang@mxic.com.tw>
 <1573808288-19365-3-git-send-email-masonccyang@mxic.com.tw>
 <3f514579-d3a4-1319-a55a-265a3f1ce00e@ti.com>
 <OFFE6363DF.95763BC3-ON482584CB.002A47E5-482584CB.002BAA8C@mxic.com.tw>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <20f3873f-66eb-3af9-c50d-1321a859093d@ti.com>
Date: Mon, 9 Dec 2019 15:23:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <OFFE6363DF.95763BC3-ON482584CB.002A47E5-482584CB.002BAA8C@mxic.com.tw>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_015322_600146_032F4677 
X-CRM114-Status: GOOD (  18.38  )
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
Cc: tudor.ambarus@microchip.com, juliensu@mxic.com.tw, richard@nod.at,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 marek.vasut@gmail.com, broonie@kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 09/12/19 1:26 pm, masonccyang@mxic.com.tw wrote:
> 
> Hi Vignesh,
> 
>>
>> On 15/11/19 2:28 pm, Mason Yang wrote:
>>> According to JESD216C (JEDEC Basic Flash Parameter Table 18th DWORD)
>>> Octal DTR(8D-8D-8D) command and command extension (00b: same, 01b: 
> inverse)
>>> to add extension command mode in spi_nor struct and to add write_cr2
>>> (Write CFG Reg 2) for 8-8-8/8D-8D-8D mode sequences enable.
>>>
>>
>> But I don't see any code setting "nor->ext_cmd_mode" based on BFPT?
>>
>> Any new feature that we add to spi-nor should make use of autodiscovery
>> feature made possible by SFDP tables. Could you modify the patch to
>> discover capabilities supported by flash and opcodes to be used from
>> SFDP table?
> 
> Got it but our device will return a empty SFDP table.
> 

If flash you tested on does not support JEDEC 216C then don't mention
about it. Above commit message gives an impression that flash in JEDEC
216C compliant.

>>
>>
>>> Define the relevant macrons and enum to add such modes and make sure
>>> op->xxx.dtr fields, command nbytes and extension command are properly
>>> filled and unmask DTR and X-X-X modes in 
> spi_nor_spimem_adjust_hwcaps()
>>> so that DTR and X-X-X support detection is done through
>>> spi_mem_supports_op().
>>>
[...]
>>> @@ -404,6 +436,30 @@ static int read_sr(struct spi_nor *nor)
>>>                 SPI_MEM_OP_NO_DUMMY,
>>>                 SPI_MEM_OP_DATA_IN(1, nor->bouncebuf, 1));
>>>
>>
>> This is not based on the latest tree.
>>
>>> +      if (spi_nor_protocol_is_8_8_8(nor->read_proto)) {
>>> +         op.cmd.buswidth = 8;
>>> +         op.addr.buswidth = 8;
>>> +         op.dummy.buswidth = 8;
>>> +         op.data.buswidth = 8;
>>> +         op.cmd.nbytes = 2;
>>> +         op.addr.nbytes = 4;
>>> +         op.dummy.nbytes = 4;
>>> +         op.addr.val = 0;
>>
>> This is not scalable... There will be bunch of if...else ladders when we
>> want to support other X-X-X modes... Can't these be derived from
>> nor->reg_proto? And then borrow the logic from 
> spi_nor_spimem_read_data()?
>>
> 
> Got it !
> 
>>
>> Could you have a look at Boris's initial submission to add 8-8-8 mode at
>> https://patchwork.kernel.org/cover/10638055/ ?
>> You could use that series as the base for your changes/additions.
> 
> Got it.
> My idea is to support 8D-8D-8D mode with a minimum patches because 
> there is no define for 1D-1D-1D, 2D-2D-2D and 4D-4D-4D mode in JEDEC 
> if I am right.
> 

JESD251-A1 does talk about 4S-4D-4D right? Also none of the JEDEC
standards prohibit flash vendors from supporting other X-X-X modes.

I think you haven't thought about bigger picture here. Flash devices
that support other mode exist today and we would need the framework to
be built such that these modes can be added in future.

I suggest you start with Boris's series [1] as base and port it to
latest kernel. Isn't that series alone enough to support Macronix Octal
flashes at least?
If required, you could also always include additional patches adding new
features.

[1] https://patchwork.kernel.org/cover/10638055/

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
