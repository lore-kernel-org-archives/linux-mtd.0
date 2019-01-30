Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C650C282D7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 10:25:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A34921852
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 10:25:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pnCaxHNe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=procenne.com header.i=@procenne.com header.b="E/GIHx3+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A34921852
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=procenne.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cq0pYh+BWm3NJX2JyFdPbFTpuQmYiX9VGaTkcbgPKyY=; b=pnCaxHNeCovNe3WebMRcNn6w0
	7MNfD/hHAHE89N1viskgmHT6swrzCxrGprM8S2CUrzRJY3rY6y5Y71A49u1lVQgUrhdaTBA3OGWoT
	BzD8Ueh79wtac6c2eXY2K9tAkPHxC85JsJ4W/dnwt3HUpHJ3Las6xBRCxLe4nTZqbcotgtguTjbSK
	TCMnQo2ZVntlGEzZoLE8xBvrw8fq/d9e1Ay8Voe5TioZ42XEKnBZZjMH5Q92t1c4E0wXigT87slCW
	R0QDo7BaYR0dur961krcj+pXVK74TuDxDy3esAirFzTxyJ9QGjwMQEa2s2dzflKFzc8Hq2SlRFzFY
	EtIZxLalQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gon3n-0007mX-4s; Wed, 30 Jan 2019 10:25:35 +0000
Received: from forward104o.mail.yandex.net ([37.140.190.179])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gon3j-0007m0-OP
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 10:25:33 +0000
Received: from mxback11o.mail.yandex.net (mxback11o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::62])
 by forward104o.mail.yandex.net (Yandex) with ESMTP id ED539943A85;
 Wed, 30 Jan 2019 13:25:25 +0300 (MSK)
Received: from smtp4p.mail.yandex.net (smtp4p.mail.yandex.net
 [2a02:6b8:0:1402::15:6])
 by mxback11o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id RbRKgXRrxl-PPaOWvBZ;
 Wed, 30 Jan 2019 13:25:25 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=procenne.com; s=mail;
 t=1548843925; bh=kbuCcjKaSDgKOEsJ027gwVg7L5Xvok0FZIqlrSR+YTs=;
 h=Subject:To:Cc:References:From:Message-ID:Date:In-Reply-To;
 b=E/GIHx3+h5UmhEQ4NeshU47xjuYoLoGfIsLkTt7GOBNZa31Fs7lbGqeatkw8FuHGZ
 aJdCk0boajq3YmZlDjFg2XjKpJq8M/gd+XkyTjsQHyf7E/0fmu/ULyYesaQAFb6WHA
 XmKULWzvc38g652a9fH/YEEh6V5X8SJ7SPI6e2Vk=
Authentication-Results: mxback11o.mail.yandex.net;
 dkim=pass header.i=@procenne.com
Received: by smtp4p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
 PEfwS3fT38-POcKYp77; Wed, 30 Jan 2019 13:25:24 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client certificate not present)
Subject: Re: [PATCH] mtd: spi-nor: split s25fl128s into s25fl128s0 and
 s25fl128s1
To: linux-mtd@lists.infradead.org
References: <1548843080-6930-1-git-send-email-ahmet.celenk@procenne.com>
From: "A. Celenk" <ahmet.celenk@procenne.com>
Message-ID: <ad7dda83-f5eb-26ba-d6a9-c0e25e7db723@procenne.com>
Date: Wed, 30 Jan 2019 13:25:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1548843080-6930-1-git-send-email-ahmet.celenk@procenne.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_022531_979667_B936A839 
X-CRM114-Status: GOOD (  14.71  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch contains errors, please ignore this and check out the next one.

Ahmet

On 30.01.2019 13:11, A. Celenk wrote:
> Due to two different versions (S25FL128SAGBHI200 and S25FL128SAGBHI210) of
> the s25fl128s qspi memory, the single "s25fl128s" device entry must be
> split into two to match the correct JEDEC ID's for each version. Solves
> paging related issues of S25FL128SAGBHI210 chips.
>
> Signed-off-by: A. Celenk <ahmet.celenk@procenne.com>
>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> ---
>   drivers/mtd/spi-nor/spi-nor.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 13a5055..c59486f 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1899,6 +1899,8 @@ static const struct flash_info spi_nor_ids[] = {
>   	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
>   	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
>   	{ "s25fl128s",  INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> +	{ "s25fl128s0", INFO6(0x012018, 0x4d0080, 256 * 1024, 64, SPI_NOR_QUAD_READ | USE_CLSR) },
> +	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_QUAD_READ | USE_CLSR) },
>   	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>   	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>   	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
