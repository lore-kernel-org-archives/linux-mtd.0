Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED211C7115B
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Jun 2025 08:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s9wDfqZBnxJyxhpIMkYWT5X0F2keeWXl12gliv/Ck8o=; b=PgfHlmfr9i8hIo
	tTTdmHkpZgAS+9fsSOkmyVbweabQvnSBj5MA03dXzD39l4kqWPxbYKYFge18M4iVilRfYxp6DfV88
	7zkC3iAj2bEy+C74LQApTZkSKwSLd4/p7m0V3TGgsQlODjqXhRZTzCODjtmtpZFyvsFzqENO0dXrX
	U55XYvHfcjSivNhj8430vJzJzQ0QqIsjsHXYJsx0qpfz6vQWwcpqWDG7kQXTa5fEemIUogglJv+s+
	GPyFKWvP0J29YZdbr16KFDMgcjZOZPzfI15U/DDVUzY0VB+Uj+6rikSGB2aZWtmpa8Czmt30HYK35
	z/cXxA8urh0phGz5sF7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAWT-0000000CQ9I-2jLh;
	Thu, 19 Jun 2025 08:21:25 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9yA-0000000CKxQ-2QvV
	for linux-mtd@lists.infradead.org;
	Thu, 19 Jun 2025 07:46:00 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55J7jjpV487733;
	Thu, 19 Jun 2025 02:45:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750319145;
	bh=OcekJlqR+QjjFXYQ0/9EyIz1ulgOW/6AKI7yyrCNQbU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MSt/E2g4VngUM/Rpu+Plaqt/nKFhU9lRU42XSypIC93Btb7zHstqfsotAxMjb2ui8
	 sNRT785IueX2sAr/RsB0Saq+4YYQ9kY69btu6TvcF1CrTrFC/1MfhM3vwfJ98mzzNn
	 ZxJGcU96zM5NVhcD/mG383BSKGa1MPrAp1uQyIos=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55J7jj8t3693138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 19 Jun 2025 02:45:45 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 19
 Jun 2025 02:45:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 19 Jun 2025 02:45:45 -0500
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55J7jgjr752899;
	Thu, 19 Jun 2025 02:45:43 -0500
Message-ID: <5c7ad4dc-a80b-488a-87aa-ecd6389e86c8@ti.com>
Date: Thu, 19 Jun 2025 13:15:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mtd: spi-nand: macronix: disable continuous read for
 MX35LFxGE4AD
To: Chukun Pan <amadeus@jmu.edu.cn>, Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>,
        Cheng Ming Lin
	<chengminglin@mxic.com.tw>,
        Chuanhong Guo <gch981213@gmail.com>,
        MTD Maling
 List <linux-mtd@lists.infradead.org>
References: <20250618100005.413403-1-amadeus@jmu.edu.cn>
 <20250618100005.413403-2-amadeus@jmu.edu.cn>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250618100005.413403-2-amadeus@jmu.edu.cn>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_004558_713379_CAE61E7E 
X-CRM114-Status: GOOD (  12.79  )
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

+ linux-mtd

Please cc linux-mtd@lists.infradead.org for all patches and queries
related to MTD subsystems.

Run ./scripts/get_maintainers.pl on the patch for more information.


On 18/06/25 15:30, Chukun Pan wrote:
> In on-die ECC mode, enabling continuous read will cause ubi_io_read error.
> [    7.852000] ubi0 warning: ubi_io_read: error -5 while reading ...
> 
> So disable it first. Tested on GL.iNet GL-MT3000 with MX35LF2GE4AD flash.

Why? this datasheet says otherwise [1]:

Would it be possible that SPI/QSPI controller of GL.iNet GL-MT3000 has a
limitation?

> 
> Fixes: 11813857864f ("mtd: spi-nand: macronix: Continuous read support")
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  drivers/mtd/nand/spi/macronix.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
> index eeaf5bf9f082..cedb3d04876d 100644
> --- a/drivers/mtd/nand/spi/macronix.c
> +++ b/drivers/mtd/nand/spi/macronix.c
> @@ -187,7 +187,6 @@ static const struct spinand_info macronix_spinand_table[] = {
>  		     SPINAND_HAS_QE_BIT,
>  		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
>  				     macronix_ecc_get_status),
> -		     SPINAND_CONT_READ(macronix_set_cont_read),
>  		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
>  					macronix_set_read_retry)),
>  	SPINAND_INFO("MX35LF4GE4AD",
> @@ -200,7 +199,6 @@ static const struct spinand_info macronix_spinand_table[] = {
>  		     SPINAND_HAS_QE_BIT,
>  		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
>  				     macronix_ecc_get_status),
> -		     SPINAND_CONT_READ(macronix_set_cont_read),
>  		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
>  					macronix_set_read_retry)),
>  	SPINAND_INFO("MX35LF1G24AD",


[1]
https://www.macronix.com/Lists/Datasheet/Attachments/9046/MX35LF2GE4AD,%203V,%202Gb,%20v1.6.pdf
8-3-4. Continuous Read Operation

-- 
Regards
Vignesh
https://ti.com/opensource


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
