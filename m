Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CF3C4167B
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 09:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LKOqFTH+R+FoE9gCDK2aesw5nL8EPlfgSl1WgDB8yt4=; b=SVltrhhAdCRpsB
	0Jk6vOSYAw4VQKJKDevj9J5erRYdxvf0I5SogHy/Rb2Vo7e8k3xxqJjedfvk96znUahSf9ubr+/M7
	b7xgSH2MfI83yysf24OLW/4EY6n9F8MjSsqOiLz4sGQgwVSh7gZIOgIxZ3+ImfPmvpbcEucms2lAR
	YY5qpp4kTt8M2tsBdClWMpM2XwtdeaMu1EJwXPZ6VB8ob178WfUcWAN2n7PH5k/VgvKp1IwKDIug8
	xKpSGTc1uaXGfcGd7n3FJipRxdlrFKgGCDOLnufHkdhy8v47ErfGCs4+vmtzOBJfRvqp8hl88uXS9
	NGmAvfnlHzqsBwmpEZ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCGiE-009f3c-V8; Mon, 02 Jan 2023 09:02:31 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCGga-009eTJ-31; Mon, 02 Jan 2023 09:00:51 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30290Zj6030661;
	Mon, 2 Jan 2023 03:00:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672650035;
	bh=Sfa9o0kdL5YsnLLCEDwGHRyigUI/UlPkkJoDS6qgMKI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VIeoKP1qktpphB0/sTMLIYm+IKZVhDH3qZme5rr6HJBIks4bTkkltIfgfdiVdevS3
	 vTvKWi3jB8vYAh8vsumR/LDpOTPQy/bE/mGsPl8xjEaf7O2Xs4h+gcZK7ra169cVkX
	 vIZuHvqBhliSdZn/ELshNkXQZr+6U6iq5b+Z6/FY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30290ZkC011689
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Jan 2023 03:00:35 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 2
 Jan 2023 03:00:34 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 2 Jan 2023 03:00:34 -0600
Received: from [172.24.223.105] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30290Tna071884;
	Mon, 2 Jan 2023 03:00:30 -0600
Message-ID: <dd505644-bbfb-ea3e-5282-ce750812e703@ti.com>
Date: Mon, 2 Jan 2023 14:30:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 5/7] mtd: rawnand: sunxi: Fix the size of the last OOB
 region
To: Samuel Holland <samuel@sholland.org>,
        Miquel Raynal
	<miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh
 Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec
	<jernej.skrabec@gmail.com>
CC: Boris Brezillon <bbrezillon@kernel.org>,
        Brian Norris
	<computersforpeace@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-sunxi@lists.linux.dev>
References: <20221229181526.53766-1-samuel@sholland.org>
 <20221229181526.53766-6-samuel@sholland.org>
Content-Language: en-US
From: "Gole, Dhruva" <d-gole@ti.com>
Organization: Texas Instruments Incorporated
In-Reply-To: <20221229181526.53766-6-samuel@sholland.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_010048_373687_32C48DEB 
X-CRM114-Status: GOOD (  15.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 12/29/2022 11:45 PM, Samuel Holland wrote:
> The previous code assigned to the wrong structure member.
Good catch!
>
> Fixes: c66811e6d350 ("mtd: nand: sunxi: switch to mtd_ooblayout_ops")
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
Acked-By: Dhruva Gole <d-gole@ti.com>
>
>   drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
> index 1ecf2cee343b..8e873f4fec9a 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -1609,7 +1609,7 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
>   	if (section < ecc->steps)
>   		oobregion->length = 4;
>   	else
> -		oobregion->offset = mtd->oobsize - oobregion->offset;
> +		oobregion->length = mtd->oobsize - oobregion->offset;
>   
>   	return 0;
>   }

-- 
Regards,
Dhruva Gole <d-gole@ti.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
