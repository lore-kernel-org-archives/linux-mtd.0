Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C18C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 14:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBQRcqBtDyuKJvpVA87xlryU5s2VPnx6iJ3sazdOazw=; b=zS6AQuvs/gKZR09pXLjy65NoqI
	nXSRw892GkxQk4sVvmMgjBzR0htmfUFGXpp9E6nAUWGipuSECf2GwQI4ajuKFHcNG/sNLRzrpfh/G
	NhvrvaUJc4EE0IwqkpUMCzaqXn98K+SMzEWfAT56iX7r6uFuO0aXBNMQRjrk0tKbk2mLP1vIrlcld
	B/Wn807nP/nXFulRTBpxIZ/WyVdrodoNuwMb3wRpHtlkjUbtr21a/GbMZPMF+7g87yNLWhCVIC+fm
	J0xexOwpq8qZHQdTdRhCOf/J+hJ5Kt/cLDbxuBMSjyMFg5TdIcPUmDd3KiNcEICkeHgAdnUX9UCEI
	pDdeLdcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP3hX-00H72l-DO; Tue, 01 Mar 2022 14:42:07 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP3hL-00H70L-23; Tue, 01 Mar 2022 14:41:56 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6F91522239;
 Tue,  1 Mar 2022 15:41:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1646145709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Pg68QtdWJVabqjtuDo5gKHfSwE0+uWbcneOb9qe6pk=;
 b=rc4i0esQGI0Qkm+QL7T4L8I5sV7+6/wTTRtGsKVL9WErAlp1XHgk91izWUvTDqn5NmlLTI
 bpC4jyp8PGkO0D5GDGT10WTXkinIFwC+RsQV2uYQ4Ns823FNTA958Uj/gIkFuDRUHafesd
 n1DiG6/QTDFj1HNPqGzYku9/UgFf7ew=
MIME-Version: 1.0
Date: Tue, 01 Mar 2022 15:41:49 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: heiko.thiery@gmail.com, p.yadav@ti.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Nicolas.Ferre@microchip.com
Subject: Re: [PATCH 2/2] mtd: spi-nor: macronix: Use post_bfpt hook to fix
 quad_enable method for MX25L12835F
In-Reply-To: <20220301095640.313852-3-tudor.ambarus@microchip.com>
References: <20220301095640.313852-1-tudor.ambarus@microchip.com>
 <20220301095640.313852-3-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <fc29d0c274af1df36f996a925465f33e@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_064155_339229_81058D0A 
X-CRM114-Status: GOOD (  16.56  )
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

Am 2022-03-01 10:56, schrieb Tudor Ambarus:
> MX25L12835F does not define BFPT[DWORD(15)], update the quad_enable 
> method
> in a post_bfpt hook.
> 
> Reported-by: Heiko Thiery <heiko.thiery@gmail.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/macronix.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c 
> b/drivers/mtd/spi-nor/macronix.c
> index 3d0e34c9410c..20fab9814b80 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -37,6 +37,9 @@ static int mx25l12805d_post_bfpt_fixups(struct 
> spi_nor *nor,
>  	 */
>  	nor->name = "mx25l12835f";
> 
> +	/* BFPT lacks information about the Quad Enable method, set it here. 
> */
> +	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;

btw. this flash has this bit as non-volatile. I don't know if is a
good idea to enable 4-4-4 on this flash.

Does anyone know if the SFDP will give us enough information so
we know whether the QE bit is volatile or not? I had a quick look
and cannot find anything in particular.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
