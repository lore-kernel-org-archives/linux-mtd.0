Return-Path: <SRS0=Xpy7=6G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682F7C55189
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 07:11:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37743206CD
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 07:11:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sNaHAsQk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37743206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZn0uaF2JuBLjME45oVnOcWf+UCclUutqIEID8XKx40=; b=sNaHAsQkZ0z1hx
	3gp44O1mXDEw9tJZSN6HYTUG8Lrrq0ronSqH+9KFiKUyJdyLH3YEAz3MVMgPN5j3fDBDqO9qb+NHa
	EEQynUNg1tyk2siwz9Fe/Jujtsp3RpkJ3/6e6tP4XFY8f76snE1NQJKqkV+morT0T5cNmYHugcezp
	rspheuHMokmrJcBe5i7yN/o0fucUgNgnfegXuTH0HWWCFjJn2h49b1GgfhmQRCdQqm43NaTKYZbDO
	qmHRV3mF02pma8gh7Wci1A6sb3OialuE/uFdcudDHc2esjaHl3VxHpt8CGeGo+9XWf1e5ga1SbB6n
	FPmLcwJ+CtFbM19djsSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jR9Xr-0004nk-19; Wed, 22 Apr 2020 07:11:43 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jR9X4-0004Lw-C2
 for linux-mtd@lists.infradead.org; Wed, 22 Apr 2020 07:10:56 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 143C32A17E5;
 Wed, 22 Apr 2020 08:10:53 +0100 (BST)
Date: Wed, 22 Apr 2020 09:10:50 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 5/6] mtd: rawnand: marvell: Rename a function to clarify
Message-ID: <20200422091050.21b51f23@collabora.com>
In-Reply-To: <20200421164857.8255-6-miquel.raynal@bootlin.com>
References: <20200421164857.8255-1-miquel.raynal@bootlin.com>
 <20200421164857.8255-6-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_001054_554096_22690BED 
X-CRM114-Status: GOOD (  16.16  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 21 Apr 2020 18:48:56 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Cosmetic change to clarify the purpose of the function.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/marvell_nand.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> index cb1e1a295002..2db143a97626 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -2166,8 +2166,8 @@ static const struct mtd_ooblayout_ops marvell_nand_ooblayout_ops = {
>  	.free = marvell_nand_ooblayout_free,
>  };
>  
> -static int marvell_nand_hw_ecc_ctrl_init(struct mtd_info *mtd,
> -					 struct nand_ecc_ctrl *ecc)
> +static int marvell_nand_hw_ecc_controller_init(struct mtd_info *mtd,
> +					       struct nand_ecc_ctrl *ecc)
>  {
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  	struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
> @@ -2261,7 +2261,7 @@ static int marvell_nand_ecc_init(struct mtd_info *mtd,
>  
>  	switch (ecc->mode) {
>  	case NAND_ECC_HW:
> -		ret = marvell_nand_hw_ecc_ctrl_init(mtd, ecc);
> +		ret = marvell_nand_hw_ecc_controller_init(mtd, ecc);
>  		if (ret)
>  			return ret;
>  		break;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
