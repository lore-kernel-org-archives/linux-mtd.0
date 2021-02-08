Return-Path: <SRS0=9E2w=HK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C78C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Feb 2021 11:42:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8964364E40
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Feb 2021 11:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8964364E40
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GdC5gquVTtZlDF4Jmc2B7yEHrkZYAdAOgiPp+CJ8hko=; b=u5XI+zwtqgiTQPqO68tEbEML2
	HzoNLqzSqAXW7NA9yZ3AZsudA2MEucL038NC3LSbnSDBbqmVAmgaCXdZxSpMoQDlT5+K459mbwpM8
	3zOi6dWRv1OQ6MEnL+5ceLmNC3SuKVl3sDjxsmyrLzeKonOXje/qZQ1RczS5LvuHJ682p0JaNoqOv
	lphGH5CFsRRxDUxRLO2kCjgmAXoO7Jj2bgte+X34HxJXDvcYhyQ/a4jpQZZDM0EZaWlQEzJxLH0DY
	D/WVbp7cKK0ueUIxBDvmfmD7xlad6VCS64jyrZ6q7x5ctUozJqmXGm2nsMhYvqPz5GupLCEF+fBvo
	eA+YjXJ0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l94vE-0001wX-M9; Mon, 08 Feb 2021 11:41:40 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l94vA-0001u4-IS
 for linux-mtd@lists.infradead.org; Mon, 08 Feb 2021 11:41:37 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 118Bf3VY095821;
 Mon, 8 Feb 2021 05:41:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1612784463;
 bh=gPOYzQig2ofMeGL6mWafYiOOQyCf2dqSmSpIbpHmeWU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=MTBOcWuXClvQcebyokW0S4QjyWi61rKsrtU+UWEpOtZjKsdomQYkM26/k2QNNE4rY
 p/CyBMUivmqcKGibwW1q4WmlEOwNYCBQoyNEAv9aCnIKZO+VWyzUjNsC4Lj110iuko
 k9Yd7c27Qr4tjOrygMT2LiDfMLJVaw4igi7tneyo=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 118Bf3BI046924
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Feb 2021 05:41:03 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Feb
 2021 05:41:03 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Feb 2021 05:41:03 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 118Bf2T1082703;
 Mon, 8 Feb 2021 05:41:02 -0600
Date: Mon, 8 Feb 2021 17:11:01 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: core: Advance erase after the erase
 cmd has been completed
Message-ID: <20210208114101.txh7ao7bi66jezrb@ti.com>
References: <20210205135253.675793-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210205135253.675793-1-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_064136_714362_F6E37DE9 
X-CRM114-Status: GOOD (  16.85  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Takahiro.Kuwano@infineon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 05/02/21 03:52PM, Tudor Ambarus wrote:
> Wait for the erase cmd to complete and then advance the erase.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0522304f52fa..bcaa161bc7db 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1618,12 +1618,12 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
>  			if (ret)
>  				goto destroy_erase_cmd_list;
>  
> -			addr += cmd->size;
> -			cmd->count--;
> -
>  			ret = spi_nor_wait_till_ready(nor);
>  			if (ret)
>  				goto destroy_erase_cmd_list;
> +
> +			addr += cmd->size;
> +			cmd->count--;
>  		}
>  		list_del(&cmd->list);
>  		kfree(cmd);
> @@ -1704,12 +1704,12 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>  			if (ret)
>  				goto erase_err;
>  
> -			addr += mtd->erasesize;
> -			len -= mtd->erasesize;
> -
>  			ret = spi_nor_wait_till_ready(nor);
>  			if (ret)
>  				goto erase_err;
> +
> +			addr += mtd->erasesize;
> +			len -= mtd->erasesize;

Do these changes have any practical benefit? IMO they are worth doing 
even if there is none but I'm curious what prompted this patch.

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

>  		}
>  
>  	/* erase multiple sectors */

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
