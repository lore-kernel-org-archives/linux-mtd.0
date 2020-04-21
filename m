Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 886E7C54FD0
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 12:17:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FF1B2064C
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 12:17:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TFIPd9G/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FF1B2064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3QYgVgFBZUHtuqnNJ9K/NB3/POMWWotOU6obb6yOQQE=; b=TFIPd9G/2LRlrC
	3c35v3Wd36nz16vsEU/U6uIhmWolBHDpXQQ7YzJ5If4n1ZtvEpPmKqg6SlIrWIDL70Adbuqd7sCRo
	jH/PLnrELyTHLKqKuJDD5uzQb+5TmVf7JaBtDwZmGYAVa2jnSIS1qnRgnxY+nlOUT0Q142zY65/8l
	/h/ouKVvuuw7o1jhH29dLGXhRlobk7Z/MLYRoWGRbhDRjhtnMWXfuvZg2Wc5vq6fgyWj8qSiotvGN
	Sp1zMNNpnfzaIT4Fi7BU2DHZwfczmVfGxrcrvmR2I2+gjcp6Hr4Q9yeh+A929R0jgHgwUKj3vKeZ9
	ILtJLM26zUs5631D+1ZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQrpw-0005Ni-0y; Tue, 21 Apr 2020 12:17:12 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQrps-0005L0-Bk
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 12:17:10 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id F1BF48B23A1EDA7E5F40;
 Tue, 21 Apr 2020 20:17:02 +0800 (CST)
Received: from [10.65.58.147] (10.65.58.147) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0;
 Tue, 21 Apr 2020 20:16:55 +0800
Subject: Re: [PATCH] mtd: spi-nor: sfdp: Fix wrong addr length and dummy when
 perform SMPT detection command
To: Pratyush Yadav <me@yadavpratyush.com>
References: <1587439812-49387-1-git-send-email-yangyicong@hisilicon.com>
 <20200421114432.px5cq3ajwwq7n2y5@yadavpratyush.com>
From: Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <bdb3bb21-7e6f-6902-ec16-1ac482b1bdc9@hisilicon.com>
Date: Tue, 21 Apr 2020 20:25:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200421114432.px5cq3ajwwq7n2y5@yadavpratyush.com>
X-Originating-IP: [10.65.58.147]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_051708_567491_DF9EC74E 
X-CRM114-Status: GOOD (  23.50  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com,
 tudor.ambarus@microchip.com, richard@nod.at, john.garry@huawei.com,
 linuxarm@huawei.com, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 alexander.sverdlin@nokia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Pratyush,


On 2020/4/21 19:44, Pratyush Yadav wrote:
> On 21/04/20 11:30AM, Yicong Yang wrote:
>> As per SFDP(JESD216D, Section 6.5.3) says of SMPT 1st DWORD, 11b of
>> bit[23:22] and 1111b of bit[19:16] represent variable
>> {address length, read latency}, which means "the {address length,
>> read latency} last set in memory device and this same value is used in the
>> configuration dectection command". Currently we use address length
>> and dummy byte of struct spi_nor in such conditions. But the value
>> are 0 as they are not set at the time, which will lead to
>> wrong perform of the dectection command.
>>
>> As the last command is read SFDP(1S-1S-1S, the only mode we use in kernel),
>> with 3-byte address and 8 dummy cycles, use the same values in
>> variable situations to perform correct dectection command.
>>
>> Fixes: b038e8e3be72 ("mtd: spi-nor: parse SFDP Sector Map Parameter Table")
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> FWIW, I posted a fix for the address width problem here [0], though in a 
> slightly different way. I'll re-roll the series soon, since it is based 
> on the code structure before the split.
>
>> ---
>>  drivers/mtd/spi-nor/sfdp.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>> index f6038d3..27a8faa 100644
>> --- a/drivers/mtd/spi-nor/sfdp.c
>> +++ b/drivers/mtd/spi-nor/sfdp.c
>> @@ -624,7 +624,7 @@ static u8 spi_nor_smpt_addr_width(const struct spi_nor *nor, const u32 settings)
>>  		return 4;
>>  	case SMPT_CMD_ADDRESS_LEN_USE_CURRENT:
>>  	default:
>> -		return nor->addr_width;
>> +		return 3;
> If in the future someone implements SFDP parsing in 8D-8D-8D mode, they 
> would want to use an address length of 4. Similarly, if someone has a 
> use-case where they have to configure their flash to a 4-byte addressing 
> mode in a non-volatile way, they would set nor->addr_width in a 
> flash-specific hook (like the post-BFPT hook) and would expect that 
> width to be used here as well.
>
> So I think instead of setting it in stone like this, we should instead 
> set the default nor->addr_width to 3 if it is configurable, and then let 
> flashes fix it up if they need to. This is what my patch [0] does.

As I mentioned in the commit, *currently* we use 1S-1S-1S mode to read SFDP, which is also
the last operation we did here. So I use the same address byte and dummy cycles here.
I think we won't meet the exception you mentioned, as it will fail when parsing SFDP
and won't come here.

I agree that currently we don't meet all the conditions. But your patch seems alike the way
here. AS you set address width when parsing BFPT, but it'll not be changed before parsing SMPT
here, we parse smpt once bfpt is parsed and don't do specific vendor operations, etc.


>
>>  	}
>>  }
>>
>> @@ -641,7 +641,7 @@ static u8 spi_nor_smpt_read_dummy(const struct spi_nor *nor, const u32 settings)
>>  	u8 read_dummy = SMPT_CMD_READ_DUMMY(settings);
>>
>>  	if (read_dummy == SMPT_CMD_READ_DUMMY_IS_VARIABLE)
>> -		return nor->read_dummy;
>> +		return 8;
> Same comment here. Set nor->read_dummy to a sane default (== 8) and then 
> let flash-specific hooks change it if they need to. This is tricky 
> though, since BFPT doesn't tell us the dummy cycles needed. Still, I 
> think if we set it in say spi_nor_parse_smpt(), it would be a bit more 
> flexible.

As I've mentioned above, it follows the behaviour in the current framework. What do you think of
introduce new field in spi_nor to provide more flexibility:

    struct spi_nor {
        ...
        sfdp_addr_width;
        sfdp_read_dummy;
        ...
    }

we can initialized it in the quite beginning(perhap in spi_nor_scan()) and let others to modify it.
It will also provide sfdp access and flash access with different parameter if necessary.


>>  	return read_dummy;
>>  }
> [0] https://lore.kernel.org/linux-mtd/20200313154645.29293-6-p.yadav@ti.com/
>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
