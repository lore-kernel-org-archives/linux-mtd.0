Return-Path: <SRS0=AJHc=DO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB427C4363D
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 01:52:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D91020782
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 01:52:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jTX61SQ3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="Hffk7LYC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D91020782
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VD2p9RCc9S/Nh9WB6shXCVI8ONc8+7w7egLAyy+Cjus=; b=jTX61SQ3KWV8nayLE2hKxYUuA
	MHGS2Hi6tz5W4rqSEgzpN1DgiDUPFSb0uPpwlUm6DAtURl3qpSfqUyoGdMi2B+fLXoX8bT+am+jyG
	E5sjhfK8ff2iHPIX+2v4eXV95uzKH69UYW9qJ/bqfICz+L2moti2Qa5ma+fe2m70LTHkT1uxiRRqF
	bEtVkTowIsPLJaSUxnt4II6wtAwnQ+BDf5fJ+HdCZ5t4tbov/FwdAoijd48G+zcKKZGEX6hCpFmIh
	3G3XSZbodRTGYSo9Wrq/qM0HDSZJfhvrz8k5EV1I686za70yE/nh4CWVQ8qajiq66FWGWehuMAAYp
	2IoWE7NUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPyc7-0003J1-76; Wed, 07 Oct 2020 01:51:31 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPyc4-0003IZ-UP
 for linux-mtd@lists.infradead.org; Wed, 07 Oct 2020 01:51:29 +0000
Received: by mail-qk1-x742.google.com with SMTP id q5so912646qkc.2
 for <linux-mtd@lists.infradead.org>; Tue, 06 Oct 2020 18:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DhT5192mGIN04lhJQKpHcHO54yzKIALf8GZavNFgKps=;
 b=Hffk7LYCHuRT4fwBiH02KWrywWC4XMNDBL0iY0bvlLeZtyPRI1ZFYMDIOJrZNUdQCa
 3v5C+9WWM9EP9YH42m6jfBxJ0U5H8lyPvCzVKOV+kzDfyseytSN05hvW3KA4kJJrZzqX
 wXUpBNC2WB6tA37LTs6mw+MWawOqDklG+sSSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DhT5192mGIN04lhJQKpHcHO54yzKIALf8GZavNFgKps=;
 b=lINIoVvq2tikBqyZs7XU7XzMZcItPWhGRik3q/0uZvqzhLjw9oLIOFDPJH08IIO0E+
 3ewObFp4AHYdMZfD5vMgwuMDeflP04fwzKPIKtdmFz8bPuNPftZ79aS9w8PZ41PbwBaw
 tHsLbd9aJuwqSPKyYUSUrpCMtLfzEz9GBtaOiwivlRZSl+tSqJA84VW3u7CVWCJrFIRC
 S2uI7QJB0D0FcyXUM9Hua7mpaSpn/ItQW11l1goU/8cempHVeZ3sPZztEFhGjmmTceC4
 0VkM3JkzFiWwV0lk1UaFYUid3DLsvbUurVRTTKJTWlL3c6jjs4U7H5szwKq8SLAKH2Fn
 KbsQ==
X-Gm-Message-State: AOAM530JDRkdXngSECrBRitC+WrgiyB1I7QpBwF8uoYZJOnQSgh2Dvxe
 v7udvzLr29HDP4FWSFFodVunrotcylJYl09A23s=
X-Google-Smtp-Source: ABdhPJxFMdJlBX+/LRa3e7NAJmDb4iEWSAKzYbDMp6aTkrAOrOw6u96cKjLozMg5OBgEU09Hsuq6vZ2a/PlAdj8aNqk=
X-Received: by 2002:a37:c404:: with SMTP id d4mr630341qki.273.1602035487238;
 Tue, 06 Oct 2020 18:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201004213204.11584-1-bert@biot.com>
In-Reply-To: <20201004213204.11584-1-bert@biot.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Oct 2020 01:51:15 +0000
Message-ID: <CACPK8XceL_QHCQOhfus27rei0vwfRJAFjfL6JkVw9pwxJj2d6Q@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Fix address width on flash chips > 16MB
To: Bert Vermeulen <bert@biot.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_215129_006920_CFEC0628 
X-CRM114-Status: GOOD (  20.53  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, 4 Oct 2020 at 21:33, Bert Vermeulen <bert@biot.com> wrote:
>
> If a flash chip has more than 16MB capacity but its BFPT reports
> BFPT_DWORD1_ADDRESS_BYTES_3_OR_4, the spi-nor framework defaults to 3.
>
> The check in spi_nor_set_addr_width() doesn't catch it because addr_width
> did get set. This fixes that check.
>
> Signed-off-by: Bert Vermeulen <bert@biot.com>

After replying to the other thread, I just saw this one.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Tested-by: Joel Stanley <joel@jms.id.au>

Thanks Bert!

Cheers,

Joel

> ---
>  drivers/mtd/spi-nor/core.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0369d98b2d12..a2c35ad9645c 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3009,13 +3009,15 @@ static int spi_nor_set_addr_width(struct spi_nor *nor)
>                 /* already configured from SFDP */
>         } else if (nor->info->addr_width) {
>                 nor->addr_width = nor->info->addr_width;
> -       } else if (nor->mtd.size > 0x1000000) {
> -               /* enable 4-byte addressing if the device exceeds 16MiB */
> -               nor->addr_width = 4;
>         } else {
>                 nor->addr_width = 3;
>         }
>
> +       if (nor->addr_width == 3 && nor->mtd.size > 0x1000000) {
> +               /* enable 4-byte addressing if the device exceeds 16MiB */
> +               nor->addr_width = 4;
> +       }
> +
>         if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
>                 dev_dbg(nor->dev, "address width is too large: %u\n",
>                         nor->addr_width);
> --
> 2.17.1
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
