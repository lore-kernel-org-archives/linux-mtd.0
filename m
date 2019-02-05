Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B58C282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 07:01:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13FF120821
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 07:01:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PigRjfdY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13FF120821
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e5Dtr9CBeMwqhEyXTpplTvlRT5f8FyCrc5OpYAMxOWY=; b=PigRjfdY8sjkt3boT55OocDey
	bzdr8jjuMKkj2P+/YnRQvqzlWEONHIab5SB/iHQ16v5XzG/WlLHx9WpsruooGPRQnLuk8cgzea99r
	JN8f6dgW9m69fYyd19v37qcZQHMOf7EqZDe4Ps+7FrMI2h/+UCbIFK/+DTz3oWgTs4JZTSgv4Jrx7
	1Lbql+xZcoYEANb3COUoB2ceTKzjSgi6jGII5EaBus8N9MG25LDLkbyl25yaXdYEfOn7v+2ydANnO
	AIer9eF5PpTST7mKVjf0pMZVSzQrAB/FKaVeP4B77Gn+AL+ZuS1ALAnPElxWUEVoz1VPU4x0pq/jl
	EXirCsxvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqujD-00037P-7x; Tue, 05 Feb 2019 07:01:07 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gquj5-00036c-ON
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 07:01:01 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Feb 2019 23:00:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,562,1539673200"; d="scan'208";a="120043642"
Received: from mandalpu-mobl.gar.corp.intel.com (HELO [10.252.77.33])
 ([10.252.77.33])
 by fmsmga007.fm.intel.com with ESMTP; 04 Feb 2019 23:00:53 -0800
Subject: Re: [PATCH] mtd: spi-nor: cadence-quadspi: write upto 8-bytes data in
 STIG mode
To: Vignesh R <vigneshr@ti.com>,
 "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
 "f.blogs@napier.co.nz" <f.blogs@napier.co.nz>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "richard@nod.at" <richard@nod.at>
References: <20190128050229.44965-1-purna.chandra.mandal@intel.com>
 <82eafaf8-803e-36a9-49ca-83d84c55537a@microchip.com>
 <7655324a-9cd2-7ffe-56bb-83c44740265c@ti.com>
From: "Mandal, Purna Chandra" <purna.chandra.mandal@intel.com>
Message-ID: <56748733-74f9-50a6-bcb7-ff4fd878a597@intel.com>
Date: Tue, 5 Feb 2019 12:30:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <7655324a-9cd2-7ffe-56bb-83c44740265c@ti.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_230059_838268_A1149D95 
X-CRM114-Status: GOOD (  20.54  )
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
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 04-Feb-19 7:07 PM, Vignesh R wrote:
> Hi,
> 
> On 03/02/19 5:50 PM, Tudor.Ambarus@microchip.com wrote:
>> + Vignesh
>>
> 
> Thanks for looping in.
> 
>> On 01/28/2019 07:02 AM, Purna Chandra Mandal wrote:
>>> cadence-quadspi controller allows upto eight bytes of data to
>>> be written in software Triggered Instruction generator (STIG) mode
>>> of operation. Lower 4 bytes are written through writedatalower and
>>> upper 4 bytes by writedataupper register.
>>>
>>> This patch allows all the 8 bytes to be written.
>>>
> 
> Code as such looks fine. But, how was this tested? How can I trigger
> this new code path with current linux-next? AFAICS, STIG mode write is
> used to in nor->write_reg() path, and I dont see any nor->write_reg()
> call with >4bytes len.
Currently there is no linux user of write_reg() for write_len > 4byte.

For volatile and non-volatile sector locking [1], we have one out of 
tree implementation and that is specific to flash chip "mt25qu02g". In 
this implementation we need additional sector address (4 byte) to be 
provided for each lock-bit write/erase operation. So total write len in 
write_reg() will be 6 bytes (=1 for opcode, 4 for sect addr, 1 for 
data). We are finalizing the patch for review.

Since cadence qspi controller do support the 8-byte read/write in STIG 
mode, I have tried here to enable that in write_reg(), similar to 
read_reg().

[1] 
https://www.micron.com/~/media/documents/products/data-sheet/nor-flash/serial-nor/n25q/n25q_128mb_3v_65nm.pdf

> 
>>> Signed-off-by: Purna Chandra Mandal <purna.chandra.mandal@intel.com>
>>
>> Looks good for me:
>> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>>
>> Vignesh, can we have your R-b or T-b tag?
>>
>> Cheers,
>> ta
>>
>>> ---
>>>
>>>   drivers/mtd/spi-nor/cadence-quadspi.c | 15 ++++++++++++---
>>>   1 file changed, 12 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
>>> index 04cedd3a2bf6..7f78f9409ddd 100644
>>> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
>>> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
>>> @@ -418,9 +418,10 @@ static int cqspi_command_write(struct spi_nor *nor, const u8 opcode,
>>>   	void __iomem *reg_base = cqspi->iobase;
>>>   	unsigned int reg;
>>>   	unsigned int data;
>>> +	u32 write_len;
>>>   	int ret;
>>>   
>>> -	if (n_tx > 4 || (n_tx && !txbuf)) {
>>> +	if (n_tx > CQSPI_STIG_DATA_LEN_MAX || (n_tx && !txbuf)) {
>>>   		dev_err(nor->dev,
>>>   			"Invalid input argument, cmdlen %d txbuf 0x%p\n",
>>>   			n_tx, txbuf);
>>> @@ -433,10 +434,18 @@ static int cqspi_command_write(struct spi_nor *nor, const u8 opcode,
>>>   		reg |= ((n_tx - 1) & CQSPI_REG_CMDCTRL_WR_BYTES_MASK)
>>>   			<< CQSPI_REG_CMDCTRL_WR_BYTES_LSB;
>>>   		data = 0;
>>> -		memcpy(&data, txbuf, n_tx);
>>> +		write_len = (n_tx > 4) ? 4 : n_tx;
>>> +		memcpy(&data, txbuf, write_len);
>>> +		txbuf += write_len;
>>>   		writel(data, reg_base + CQSPI_REG_CMDWRITEDATALOWER);
>>> -	}
>>>   
>>> +		if (n_tx > 4) {
>>> +			data = 0;
>>> +			write_len = n_tx - 4;
>>> +			memcpy(&data, txbuf, write_len);
>>> +			writel(data, reg_base + CQSPI_REG_CMDWRITEDATAUPPER);
>>> +		}
>>> +	}
>>>   	ret = cqspi_exec_flash_cmd(cqspi, reg);
>>>   	return ret;
>>>   }
>>>
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
