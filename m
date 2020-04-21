Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E2BC54FD0
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 11:45:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4EB4206F4
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 11:45:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jmfyhRO0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4EB4206F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yadavpratyush.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hp9NsxGeSApEW2Sog0fbVjRvkJWBjwAP8MIFoERnbpg=; b=jmfyhRO0kRHWWa
	ycKqCbBKlUu/nNHbLSTnPVYjQKyJePBnNCl7RnJKAZnDlfJBnXtYhCYYo3p4lltW9VOkJGj59Xf3R
	k+/dQDivpyCxXmfMSiXBuDa+gc0wdSSJ/J0ssvMawUKDYmAbtkBied5cxNv73fA7gsVyhehbDwQyC
	9SyMdQyh542KcRwad2iVUzOaHzRBKMw/wqUUBUofTAUI+dGZNVVMnrNlJdUthQ1v9hcT39IskBtue
	CampxrnU64ZiFQtRhQd7stB9zG5V5EjF5uEOcIDgxJ6ORTuBXzfJNbSMLbU623p3PDUH83X+kTlHB
	w27nn/yXPHbXw9VYAl1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQrKp-0004nK-3w; Tue, 21 Apr 2020 11:45:03 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQrKk-0004eK-N0
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 11:45:00 +0000
X-Originating-IP: 42.109.201.149
Received: from localhost (unknown [42.109.201.149])
 (Authenticated sender: me@yadavpratyush.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id CB63FFF80C;
 Tue, 21 Apr 2020 11:44:46 +0000 (UTC)
Date: Tue, 21 Apr 2020 17:14:32 +0530
From: Pratyush Yadav <me@yadavpratyush.com>
To: Yicong Yang <yangyicong@hisilicon.com>
Subject: Re: [PATCH] mtd: spi-nor: sfdp: Fix wrong addr length and dummy when
 perform SMPT detection command
Message-ID: <20200421114432.px5cq3ajwwq7n2y5@yadavpratyush.com>
References: <1587439812-49387-1-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587439812-49387-1-git-send-email-yangyicong@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_044458_884463_0D423DD1 
X-CRM114-Status: GOOD (  20.76  )
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

On 21/04/20 11:30AM, Yicong Yang wrote:
> As per SFDP(JESD216D, Section 6.5.3) says of SMPT 1st DWORD, 11b of
> bit[23:22] and 1111b of bit[19:16] represent variable
> {address length, read latency}, which means "the {address length,
> read latency} last set in memory device and this same value is used in the
> configuration dectection command". Currently we use address length
> and dummy byte of struct spi_nor in such conditions. But the value
> are 0 as they are not set at the time, which will lead to
> wrong perform of the dectection command.
> 
> As the last command is read SFDP(1S-1S-1S, the only mode we use in kernel),
> with 3-byte address and 8 dummy cycles, use the same values in
> variable situations to perform correct dectection command.
> 
> Fixes: b038e8e3be72 ("mtd: spi-nor: parse SFDP Sector Map Parameter Table")
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

FWIW, I posted a fix for the address width problem here [0], though in a 
slightly different way. I'll re-roll the series soon, since it is based 
on the code structure before the split.

> ---
>  drivers/mtd/spi-nor/sfdp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index f6038d3..27a8faa 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -624,7 +624,7 @@ static u8 spi_nor_smpt_addr_width(const struct spi_nor *nor, const u32 settings)
>  		return 4;
>  	case SMPT_CMD_ADDRESS_LEN_USE_CURRENT:
>  	default:
> -		return nor->addr_width;
> +		return 3;

If in the future someone implements SFDP parsing in 8D-8D-8D mode, they 
would want to use an address length of 4. Similarly, if someone has a 
use-case where they have to configure their flash to a 4-byte addressing 
mode in a non-volatile way, they would set nor->addr_width in a 
flash-specific hook (like the post-BFPT hook) and would expect that 
width to be used here as well.

So I think instead of setting it in stone like this, we should instead 
set the default nor->addr_width to 3 if it is configurable, and then let 
flashes fix it up if they need to. This is what my patch [0] does.

>  	}
>  }
> 
> @@ -641,7 +641,7 @@ static u8 spi_nor_smpt_read_dummy(const struct spi_nor *nor, const u32 settings)
>  	u8 read_dummy = SMPT_CMD_READ_DUMMY(settings);
> 
>  	if (read_dummy == SMPT_CMD_READ_DUMMY_IS_VARIABLE)
> -		return nor->read_dummy;
> +		return 8;

Same comment here. Set nor->read_dummy to a sane default (== 8) and then 
let flash-specific hooks change it if they need to. This is tricky 
though, since BFPT doesn't tell us the dummy cycles needed. Still, I 
think if we set it in say spi_nor_parse_smpt(), it would be a bit more 
flexible.

>  	return read_dummy;
>  }

[0] https://lore.kernel.org/linux-mtd/20200313154645.29293-6-p.yadav@ti.com/

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
