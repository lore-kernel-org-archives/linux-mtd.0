Return-Path: <SRS0=Xpy7=6G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E402C38A30
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 07:06:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 392DF206CD
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 07:06:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ip5Ku7fr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 392DF206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A0bdehk/GtBqGvdK1qmzvZFT/lcm4d6w8tG1YRkS+WI=; b=ip5Ku7frUy4iy2
	R+qAJyMPdx1Zun522tRq4NNcJ4D/+kCryRhFo17wIsqvT0JSbGuE9WQb7J2J4MOoddPQySofpRdpv
	Y4+iEDWhAEuQTiuo54hjuH2lVPNWQxMWou6uiscLc5jfdQuMWIo21lsz02bkfUN8R2yntKODNfxck
	pkwkC+RfuXwkFjAaC5tf2tyEGlD55IWqQXzabeV2J1PGmhdE708gHUrq5Zbqq60HMtl5BxkwEymnx
	TF+A6YfHnNDHaMyggvxylKISMA29PLvpfy50AhbIhLQGjEiEqVZGQcQpY4q3n0yHopenqT1CgdUF9
	0vli3E9u7oF7Hqy/yOjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jR9Sw-0008Vh-4v; Wed, 22 Apr 2020 07:06:38 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jR9Su-0008VJ-4R
 for linux-mtd@lists.infradead.org; Wed, 22 Apr 2020 07:06:37 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E6F322A0F90;
 Wed, 22 Apr 2020 08:06:34 +0100 (BST)
Date: Wed, 22 Apr 2020 09:06:31 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 1/6] mtd: rawnand: marvell: Fix the condition on a
 return code
Message-ID: <20200422090631.479deaed@collabora.com>
In-Reply-To: <20200421164857.8255-2-miquel.raynal@bootlin.com>
References: <20200421164857.8255-1-miquel.raynal@bootlin.com>
 <20200421164857.8255-2-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_000636_297200_03C47209 
X-CRM114-Status: GOOD (  20.42  )
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

On Tue, 21 Apr 2020 18:48:52 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> In a previous fix, I changed the condition on which the timeout of an
> IRQ is reached from:
> 
>     if (!ret)
> 
> into:
> 
>     if (ret && !pending)
> 
> While having a non-zero return code is usual in the Linux kernel, here
> ret comes from a wait_for_completion_timeout() which returns 0 when
> the waiting period is too long.
> 
> Hence, the revised condition should be:
> 
>     if (!ret && !pending)
> 
> The faulty patch did not produce any error because of the !pending
> condition so this change is finally purely cosmetic and does not
> change the actual driver behavior.
> 
> Fixes: cafb56dd741e ("mtd: rawnand: marvell: prevent timeouts on a loaded machine")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/marvell_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> index 179f0ca585f8..f2bf88336326 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -707,7 +707,7 @@ static int marvell_nfc_wait_op(struct nand_chip *chip, unsigned int timeout_ms)
>  	 * In case the interrupt was not served in the required time frame,
>  	 * check if the ISR was not served or if something went actually wrong.
>  	 */
> -	if (ret && !pending) {
> +	if (!ret && !pending) {
>  		dev_err(nfc->dev, "Timeout waiting for RB signal\n");
>  		return -ETIMEDOUT;
>  	}


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
