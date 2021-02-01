Return-Path: <SRS0=Ud6c=HD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB959C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 12:57:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9877464EBA
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 12:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9877464EBA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CK4IEe3aSNnfIkWBkD0IeJY8xjIrHmvw7QK56IuwRbY=; b=E1O2YqrCFepNBzs2C8JOeWl4P
	yLzAEtmOTjAMuDO/NmrPf9p0MysOEVupomFFz1kKiWi/tCfXQeFkLFWgmA8W0hnaNhmcDoy54AKto
	pzwYEv/XSe8NF7/TGZjgO/G2isuvKzOwSx1zkd2t8wFyUycMucP3xJTpPMbOz1L+Yx5zOtjd3L7kP
	+0WmXX8CTLfHgNKjmRd6GtLRNt2fuMCdkxtfpPn9iIKqALffsX4yN/51A/WdoRVbjR++r6kQ+kMth
	yNltRIwhwcWHFspqMVDuJtejQhiN2FYv5oLlYPJ2d1wpJPy8qX0wQ4ZhOs9r5B74h0gpWkXbuAWn7
	ZD0Fe12Rg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6YkD-0004zC-Ey; Mon, 01 Feb 2021 12:55:53 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6Yk4-0004x6-NR
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2021 12:55:48 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DTnv505rhzlDr8;
 Mon,  1 Feb 2021 20:53:53 +0800 (CST)
Received: from [127.0.0.1] (10.69.38.196) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Mon, 1 Feb 2021
 20:55:23 +0800
Subject: Re: [PATCH 1/2] mtd: spi-nor: check 4-byte address support when
 parsing 4bait
To: Pratyush Yadav <p.yadav@ti.com>
References: <1611740450-47975-1-git-send-email-yangyicong@hisilicon.com>
 <1611740450-47975-2-git-send-email-yangyicong@hisilicon.com>
 <20210129111649.jypytpp7dkywthwh@ti.com>
From: Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <28c3dacb-e222-8d5e-b795-947b555551bf@hisilicon.com>
Date: Mon, 1 Feb 2021 20:55:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20210129111649.jypytpp7dkywthwh@ti.com>
X-Originating-IP: [10.69.38.196]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_075546_825007_1886CF04 
X-CRM114-Status: GOOD (  31.52  )
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
Cc: vigneshr@ti.com, prime.zeng@huawei.com, tudor.ambarus@microchip.com,
 richard@nod.at, john.garry@huawei.com, linuxarm@openeuler.org,
 linux-spi@vger.kernel.org, broonie@kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Pratyush,

Thanks for the comments. Some replies below.

On 2021/1/29 19:16, Pratyush Yadav wrote:
> Hi Yicong,
> 
> On 27/01/21 05:40PM, Yicong Yang wrote:
>> The spi-nor core will convert the address mode to 4-btye,
>> without checking whether 4-byte address is supported or not.
>> For example, the 16M s25fs128s1 can work under both 3-byte
>> and 4-byte address and provides a 4bait table. The spi-nor
>> will drive the flash under 4-byte address mode after parsing
>> the 4bait and will cause it unusable on platforms doesn't
>> support 4-byte.
> 
> Another problem caused by 4BAIT parser prematurely selecting the address 
> width. See [0].
>  
> Let's fix this 4BAIT problem once and for all. Instead of setting 
> nor->addr_width to 4 in spi_nor_parse_4bait(), just set SNOR_F_HAS_4BAIT 
> (which is already being done). Then in spi_nor_default_setup(), use this 
> information when negotiating the read/write/program commands with the 
> controller to determine the correct address width to use.

The idea is great. ideally we should check the buswidth and commands in
spi_nor_default_setup() and finally set address width in
spi_nor_set_addr_width().

> 
> This refactor is easier said than done. We don't associate address width 
> information with a command. Just protocol, opcode, and dummy cycles 
> (only for read commands). A new mechanism needs to be added where we 
> associate a set of supported addresses with a command and then the 
> command negotiation can use all this information to arrive at the 
> optimal set of commands.
> 
> With this in mind, it would be great if you can come up with a patch to 
> add such a mechanism. But I would also be OK with this fix with the 
> condition that it is clearly marked as a temporary fix, and mentions 
> what should ideally be done.
> 

i'd like to get this issue fixed first to make the flash work properly,
if possible. then to do the refactor as it may take me sometime.

>> Add checking of 4-byte address support when parsing the 4bait
>> table, stop converting the address mode if it's not supported.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>  drivers/mtd/spi-nor/sfdp.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>> index 6ee7719..fdafc9b 100644
>> --- a/drivers/mtd/spi-nor/sfdp.c
>> +++ b/drivers/mtd/spi-nor/sfdp.c
>> @@ -940,6 +940,27 @@ static int spi_nor_parse_smpt(struct spi_nor *nor,
>>  	return ret;
>>  }
>>  
>> +static int spi_nor_spimem_check_4byte_addr(struct spi_nor *nor,
>> +					   const struct spi_nor_read_command *read)
>> +{
>> +	struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(read->opcode, 1),
>> +					  SPI_MEM_OP_ADDR(4, 0, 1),
>> +					  SPI_MEM_OP_DUMMY(0, 1),
>> +					  SPI_MEM_OP_DATA_IN(0, NULL, 1));
> 
> Set buswidths to 0 here...

ok.

> 
>> +
>> +	op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(read->proto);
>> +	op.addr.buswidth = spi_nor_get_protocol_addr_nbits(read->proto);
>> +	op.data.buswidth = spi_nor_get_protocol_data_nbits(read->proto);
>> +	op.dummy.buswidth = op.addr.buswidth;
> 
> ... and use spi_nor_spimem_setup_op() to do this. It will also take care 
> of setting up DTR ops.

will change to the new function, i didn't notice it. :)

Thanks,
Yicong

> 
>> +	op.dummy.nbytes = (read->num_mode_clocks + read->num_wait_states) *
>> +			  op.dummy.buswidth / 8;
>> +
>> +	if (!spi_mem_supports_op(nor->spimem, &op))
>> +		return -EOPNOTSUPP;
>> +
>> +	return 0;
>> +}
>> +
>>  /**
>>   * spi_nor_parse_4bait() - parse the 4-Byte Address Instruction Table
>>   * @nor:		pointer to a 'struct spi_nor'.
>> @@ -1061,6 +1082,33 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>>  		goto out;
>>  
>>  	/*
>> +	 * Check whether the 4-byte address is supported before converting
>> +	 * the instruction set to 4-byte.
>> +	 */
>> +	if (nor->spimem) {
>> +		bool support = false;
>> +
>> +		for (i = 0; i < SNOR_CMD_READ_MAX; i++) {
>> +			struct spi_nor_read_command read_cmd;
>> +
>> +			memcpy(&read_cmd, &params->reads[i], sizeof(read_cmd));
>> +
>> +			read_cmd.opcode = spi_nor_convert_3to4_read(read_cmd.opcode);
>> +			if (!spi_nor_spimem_check_4byte_addr(nor, &read_cmd)) {
>> +				support = true;
>> +				break;
>> +			}
>> +		}
>> +
>> +		/*
>> +		 * No supported 4-byte instruction is found, stop parsing the
>> +		 * 4bait table.
>> +		 */
>> +		if (!support)
>> +			goto out;
>> +	}
>> +
>> +	/*
>>  	 * Discard all operations from the 4-byte instruction set which are
>>  	 * not supported by this memory.
>>  	 */
> 
> [0] https://lore.kernel.org/linux-mtd/20201212115817.5122-1-vigneshr@ti.com/
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
