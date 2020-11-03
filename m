Return-Path: <SRS0=zrsi=EJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A16C2D0A3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 11:49:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 784FB216C4
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 11:49:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sMVlfnrQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="o0Ug5DF1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 784FB216C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1pT9Dy4lV9f6VBkn4O0rC7PyxsAV9gzZ8RlaCWzyYM=; b=sMVlfnrQ6LC18mdnpDn+i6MYAl
	DNGNOFJpqGNDNyIqvm3JYQCw0Dq4bKekUDSPwxNQUxoptWrkHT734ZxEuO8z4/WQ1Uo4XjUx+e7k8
	B91BQo7eYZe+8q+sPnvLegYP2MTb3VNwPwjOS8Y9Xd/RvPHTEsVKi8hltn+Dq0aN4P+GFnTziQ8PI
	5tVmHMwqyHLVhCKPAQ9Ecx7G6+91yql6hEZorc+3LINNPU9KXf6GHzy+yRCOZ/1njAhfVbBuK/F5c
	+Ih1522eKsF/kxh1omCOd2t9P+xAwNqJZDnd9zJ2bpY2MuHIZWeAkdcdXVPcJMwP7TxkGzZhh+Wg8
	IsfptRKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZunj-0004K5-OS; Tue, 03 Nov 2020 11:48:35 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZunZ-0004IL-Dc
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2020 11:48:27 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A3BmM8u074461;
 Tue, 3 Nov 2020 05:48:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604404102;
 bh=IZa5WQc/rpESZXfuIe4RXI1Md5tFfA37aiQeWFMk2EQ=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=o0Ug5DF1aIFS93loCiRQlMiaqfdqEubpibLn2Qssa8nE9gh9nT8FCfV+YDzWs7ElN
 7d7axnXwd4LtsyIWw9BOCBVM7dZvnPnycAnZIA3AgjKWWD3sAEDa9Vx2uS2AIsuArf
 11r7kfne0brpCU2d36vS5NuxvPtl3yBJWV9A1otM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A3BmMKZ063138
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 3 Nov 2020 05:48:22 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 3 Nov
 2020 05:48:21 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 3 Nov 2020 05:48:21 -0600
Received: from [10.250.233.179] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A3BmJW0056886;
 Tue, 3 Nov 2020 05:48:20 -0600
Subject: Re: [PATCH 2/3] UBI: Do not zero out EC and VID when multi-pass
 writes are not supported
To: Pratyush Yadav <p.yadav@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <20201012180404.6476-1-p.yadav@ti.com>
 <20201012180404.6476-3-p.yadav@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <f013d7af-6e1d-5b8f-4a23-7f6c150f896a@ti.com>
Date: Tue, 3 Nov 2020 17:18:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012180404.6476-3-p.yadav@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_064825_619327_CF04DED9 
X-CRM114-Status: GOOD (  22.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 10/12/20 11:34 PM, Pratyush Yadav wrote:
> For NOR flashes EC and VID are zeroed out before an erase is issued to
> make sure UBI does not mistakenly treat the PEB as used and associate it
> with an LEB.
> 
> But on some flashes, like the Cypress Semper S28 SPI NOR flash family,
> multi-pass page programming is not allowed on the default ECC scheme.
> This means zeroing out these magic numbers will result in the flash
> throwing a page programming error.
> 
> Do not zero out EC and VID when multi-pass writes are not supported.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/ubi/io.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
> index 14d890b00d2c..4023fc4886e3 100644
> --- a/drivers/mtd/ubi/io.c
> +++ b/drivers/mtd/ubi/io.c
> @@ -535,7 +535,7 @@ int ubi_io_sync_erase(struct ubi_device *ubi, int pnum, int torture)
>  		return -EROFS;
>  	}
>  
> -	if (ubi->nor_flash) {
> +	if (ubi->nor_flash && !(ubi->mtd->flags & MTD_NO_MULTI_PASS_WRITE)) {
>  		err = nor_erase_prepare(ubi, pnum);
>  		if (err)
>  			return err;
> 

You may want to get rid of assertion for mtd->writesize != 1 in case of
MTD_NORFLASH.

See drivers/mtd/ubi/build.c::631

        if (ubi->mtd->type == MTD_NORFLASH) {
                ubi_assert(ubi->mtd->writesize == 1);
                ubi->nor_flash = 1;
        }

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
