Return-Path: <SRS0=DwYL=VG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FEA8C73C46
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2019 18:54:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4983A20665
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2019 18:54:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pKsvN7qC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=agner.ch header.i=@agner.ch header.b="JxcVs2Sq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4983A20665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=raEOgWAGnNsAQnpb/Da/52VREtghL18Gm23m1yfisSY=; b=pKsvN7qCexsR5A
	sDO1dRZREriGG0TdYK0UQo5V4ahkJdhYcUh5o7QE99c8feeCa65uhNd4DEiacSzlvi/VesrCK2wyp
	7erQ8teRDCgLBhEvjXKNbsrhc3JGTK1upS8FWQ0ScONqZFzTmaBowt3F+R6+DlikBsBHjZnLzX6VD
	470pMemwWibCxS85XCdnhS2CmZvaDLqp2hqkZO/f3VUysE2MEcnNXt9wr9neT10LIjvYTf8/EHv/h
	l+6CvC5w8s6czH0ulYnb9toBs8/Ni27+HkjUJ6xY9bXAwRSxlFjGe6+JqPwjgL2t6gbycSfvIxHbH
	w+JO5Y3xkDyg7+9LuOcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hkvFi-0000Ng-AD; Tue, 09 Jul 2019 18:54:10 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hkvFf-0000NJ-D8
 for linux-mtd@lists.infradead.org; Tue, 09 Jul 2019 18:54:08 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 6B5465C072A;
 Tue,  9 Jul 2019 20:54:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1562698445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LK+Adb725ZjH4DbihgZdbmF2ZTqv6ZhFTilAQoLTCrc=;
 b=JxcVs2SqjAMcJLrzHV4oGC+s74UqUO4yFkFvkPbThzdylyV+bKGi1MSAWjys/oR+tPlo6S
 c9VsSgxTTya8QISWeT+uOEYE8pAXuuY9JHzlqk6Bo8HH6o/chKPZZwQUgFabtTckFO+YX3
 Mi3tQweENDmgWQyAR8Da5ZWbKROveHU=
MIME-Version: 1.0
Date: Tue, 09 Jul 2019 20:54:05 +0200
From: Stefan Agner <stefan@agner.ch>
To: Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: vf610_nfc: Add of_node_put() before goto
In-Reply-To: <20190709170837.13315-1-nishkadg.linux@gmail.com>
References: <20190709170837.13315-1-nishkadg.linux@gmail.com>
Message-ID: <d28641662420b0a10fbf2a238a3dd056@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190709_115407_597123_EA544D31 
X-CRM114-Status: GOOD (  13.06  )
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
Cc: vigneshr@ti.com, richard@nod.at, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2019-07-09 19:08, Nishka Dasgupta wrote:
> Each iteration of for_each_available_child_of_node puts the previous
> node, but in the case of a goto from the middle of the loop, there is no
> put, thus causing a memory leak. Hence add an of_node_put before the
> goto.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Looks good to me:

Reviewed-by: Stefan Agner <stefan@agner.ch>

--
Stefan

> ---
>  drivers/mtd/nand/raw/vf610_nfc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
> index e4fe8c4bc711..6b399a75f9ae 100644
> --- a/drivers/mtd/nand/raw/vf610_nfc.c
> +++ b/drivers/mtd/nand/raw/vf610_nfc.c
> @@ -862,6 +862,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
>  				dev_err(nfc->dev,
>  					"Only one NAND chip supported!\n");
>  				err = -EINVAL;
> +				of_node_put(child);
>  				goto err_disable_clk;
>  			}

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
