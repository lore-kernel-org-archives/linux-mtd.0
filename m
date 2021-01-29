Return-Path: <SRS0=IJeB=HA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47155C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jan 2021 11:18:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D867D64E33
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jan 2021 11:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D867D64E33
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kM5jD9kKI55xIGjOw/6jizTu5tb3RmADxejdkzvrEXQ=; b=jlXnmVtPhDnXoL/DciahZTgnD
	AQzs5mC7aUfC6VJncWjfzYTYe5wd2wbxR6UTPpar6BPfDMjtF3/++ENCHnk0kjSX4zhXTxJl+pIDB
	672IS4gPKDlSIgxaqQq8S99Hw9v2pjBe+XQmeegM7q8gWH7d9iHoRpUxRL5DGGHngJsjXATXcdX9u
	5FTZN4cr7g2YdtD6TA1nSY+sZjzGGKmWIgyTkGrBm6+ZaJtJVIi+KzO5m1awA+aCHKctiSogUA+yc
	+/qZ/pfCsQGx3LmGz1okX8MGMY3CIhqTnurl4OqOr7msXOOP+T3G5xuXzr/GlyyA5V8H2HmPIl6D+
	8FDjJNhmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5RmC-0000PD-S5; Fri, 29 Jan 2021 11:17:20 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Rm5-0000OT-Vg
 for linux-mtd@lists.infradead.org; Fri, 29 Jan 2021 11:17:15 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10TBGpMt126761;
 Fri, 29 Jan 2021 05:16:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1611919011;
 bh=r0ojtchmfDK7FgSYu2qTp1vnKLRMgpGwsorhlBRsWsA=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ZyNwFW5Xo21waOL/LzeXw7FTSbr099OEK411abVut2ahgydxWE8Q8OU73tOlhkUT6
 25cw2i/5KfGB3rugc1g+5o7g4MXJMMs6e+ed3nIy9iQSwkFZsUrO2A/gBAOGtHPeIf
 uDtc+iWmcp88jDNb4liAObvw4QiQDepIsZjwU6ZY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10TBGpdY086954
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 29 Jan 2021 05:16:51 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 29
 Jan 2021 05:16:51 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 29 Jan 2021 05:16:51 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10TBGowO099108;
 Fri, 29 Jan 2021 05:16:50 -0600
Date: Fri, 29 Jan 2021 16:46:49 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Yicong Yang <yangyicong@hisilicon.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: check 4-byte address support when
 parsing 4bait
Message-ID: <20210129111649.jypytpp7dkywthwh@ti.com>
References: <1611740450-47975-1-git-send-email-yangyicong@hisilicon.com>
 <1611740450-47975-2-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611740450-47975-2-git-send-email-yangyicong@hisilicon.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_061714_120150_40DD91CE 
X-CRM114-Status: GOOD (  29.89  )
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

Hi Yicong,

On 27/01/21 05:40PM, Yicong Yang wrote:
> The spi-nor core will convert the address mode to 4-btye,
> without checking whether 4-byte address is supported or not.
> For example, the 16M s25fs128s1 can work under both 3-byte
> and 4-byte address and provides a 4bait table. The spi-nor
> will drive the flash under 4-byte address mode after parsing
> the 4bait and will cause it unusable on platforms doesn't
> support 4-byte.

Another problem caused by 4BAIT parser prematurely selecting the address 
width. See [0].
 
Let's fix this 4BAIT problem once and for all. Instead of setting 
nor->addr_width to 4 in spi_nor_parse_4bait(), just set SNOR_F_HAS_4BAIT 
(which is already being done). Then in spi_nor_default_setup(), use this 
information when negotiating the read/write/program commands with the 
controller to determine the correct address width to use.

This refactor is easier said than done. We don't associate address width 
information with a command. Just protocol, opcode, and dummy cycles 
(only for read commands). A new mechanism needs to be added where we 
associate a set of supported addresses with a command and then the 
command negotiation can use all this information to arrive at the 
optimal set of commands.

With this in mind, it would be great if you can come up with a patch to 
add such a mechanism. But I would also be OK with this fix with the 
condition that it is clearly marked as a temporary fix, and mentions 
what should ideally be done.

> Add checking of 4-byte address support when parsing the 4bait
> table, stop converting the address mode if it's not supported.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/mtd/spi-nor/sfdp.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 6ee7719..fdafc9b 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -940,6 +940,27 @@ static int spi_nor_parse_smpt(struct spi_nor *nor,
>  	return ret;
>  }
>  
> +static int spi_nor_spimem_check_4byte_addr(struct spi_nor *nor,
> +					   const struct spi_nor_read_command *read)
> +{
> +	struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(read->opcode, 1),
> +					  SPI_MEM_OP_ADDR(4, 0, 1),
> +					  SPI_MEM_OP_DUMMY(0, 1),
> +					  SPI_MEM_OP_DATA_IN(0, NULL, 1));

Set buswidths to 0 here...

> +
> +	op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(read->proto);
> +	op.addr.buswidth = spi_nor_get_protocol_addr_nbits(read->proto);
> +	op.data.buswidth = spi_nor_get_protocol_data_nbits(read->proto);
> +	op.dummy.buswidth = op.addr.buswidth;

... and use spi_nor_spimem_setup_op() to do this. It will also take care 
of setting up DTR ops.

> +	op.dummy.nbytes = (read->num_mode_clocks + read->num_wait_states) *
> +			  op.dummy.buswidth / 8;
> +
> +	if (!spi_mem_supports_op(nor->spimem, &op))
> +		return -EOPNOTSUPP;
> +
> +	return 0;
> +}
> +
>  /**
>   * spi_nor_parse_4bait() - parse the 4-Byte Address Instruction Table
>   * @nor:		pointer to a 'struct spi_nor'.
> @@ -1061,6 +1082,33 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>  		goto out;
>  
>  	/*
> +	 * Check whether the 4-byte address is supported before converting
> +	 * the instruction set to 4-byte.
> +	 */
> +	if (nor->spimem) {
> +		bool support = false;
> +
> +		for (i = 0; i < SNOR_CMD_READ_MAX; i++) {
> +			struct spi_nor_read_command read_cmd;
> +
> +			memcpy(&read_cmd, &params->reads[i], sizeof(read_cmd));
> +
> +			read_cmd.opcode = spi_nor_convert_3to4_read(read_cmd.opcode);
> +			if (!spi_nor_spimem_check_4byte_addr(nor, &read_cmd)) {
> +				support = true;
> +				break;
> +			}
> +		}
> +
> +		/*
> +		 * No supported 4-byte instruction is found, stop parsing the
> +		 * 4bait table.
> +		 */
> +		if (!support)
> +			goto out;
> +	}
> +
> +	/*
>  	 * Discard all operations from the 4-byte instruction set which are
>  	 * not supported by this memory.
>  	 */

[0] https://lore.kernel.org/linux-mtd/20201212115817.5122-1-vigneshr@ti.com/

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
