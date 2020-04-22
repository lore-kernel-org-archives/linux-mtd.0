Return-Path: <SRS0=Xpy7=6G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6766CC38A30
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 07:01:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35AB82070B
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 07:01:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fm1/bmGW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35AB82070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0agBogJa4rlEqrbhXksaQXn3yG/T68ThdcpFIiFAuXc=; b=fm1/bmGWmQWa5D
	HOQQvCxZ7bvvyTxyg7j8WFxCjjBM66kSJ+Y/yIxKX1X+Ti05B5jt9jxmQD8bohPpbfjHH7mZq8mND
	hIyaNpBAPjytMM14rC5omovQV1HhGkGsa5SPF089NZ4u2ng67dKc3tZeRpOXMDgHzwoSYts1H3lJo
	H+JQjzaqsUMKKb3L8YWKsZ5BBb16JiorMfvlhpIPxIoHE+/cGu+Mp56liy5KlFxz7DrS1JPVid45C
	/8XzSnQkf0ropd0gxe5NzWSouanMuyMo1/EX4HttQlFU1rRF34HbErHQIk9/azbqV/tGzNiaQ3B1j
	9tmmOEvugNy9f7bB265g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jR9NV-0003xv-C6; Wed, 22 Apr 2020 07:01:01 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jR9NS-0003wN-In
 for linux-mtd@lists.infradead.org; Wed, 22 Apr 2020 07:00:59 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2A10F2A191E;
 Wed, 22 Apr 2020 08:00:57 +0100 (BST)
Date: Wed, 22 Apr 2020 09:00:52 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 6/8] mtd: rawnand: onfi: Simplify the NAND operations
 during detection
Message-ID: <20200422090052.5f27a42c@collabora.com>
In-Reply-To: <20200421164637.8086-7-miquel.raynal@bootlin.com>
References: <20200421164637.8086-1-miquel.raynal@bootlin.com>
 <20200421164637.8086-7-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_000058_749579_C58A9554 
X-CRM114-Status: GOOD (  16.41  )
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
Cc: Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 21 Apr 2020 18:46:35 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> There is no need for separate parameter page reads, the delay penalty
> is negligible so let's do read the three copies in one go.

		    ^let's read

In theory that's correct, but I fear this was done because some
controllers couldn't read 768 bytes in one go. Could we do that only if
the controller implements exec_op() and exec_op(check_only) returns true?

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_onfi.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
> index d6124180b47b..b76772666b82 100644
> --- a/drivers/mtd/nand/raw/nand_onfi.c
> +++ b/drivers/mtd/nand/raw/nand_onfi.c
> @@ -160,19 +160,13 @@ int nand_onfi_detect(struct nand_chip *chip)
>  	if (!pbuf)
>  		return -ENOMEM;
>  
> -	ret = nand_read_param_page_op(chip, 0, NULL, 0);
> +	ret = nand_read_param_page_op(chip, 0, pbuf, 3 * sizeof(*pbuf));
>  	if (ret) {
>  		ret = 0;
>  		goto free_onfi_param_page;
>  	}
>  
>  	for (i = 0; i < 3; i++) {
> -		ret = nand_read_data_op(chip, &pbuf[i], sizeof(*pbuf), true);
> -		if (ret) {
> -			ret = 0;
> -			goto free_onfi_param_page;
> -		}
> -
>  		crc = onfi_crc16(ONFI_CRC_BASE, (u8 *)&pbuf[i], 254);
>  		if (crc == le16_to_cpu(pbuf[i].crc)) {
>  			p = &pbuf[i];


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
