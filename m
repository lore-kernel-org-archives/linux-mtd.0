Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A32A5C282C4
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 16:27:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73F6F2085A
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 16:27:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KTaMpear";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="q20oaR1Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73F6F2085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wr/WaRArJpGWxIMW73GLqAooES5mmwwjdxkeO/HokrY=; b=KTaMpearNIihxh
	MOnr4lV9pK4s7BdWmqSTpKRc/4ZNIk4U0PtAjRa42In3K+dh6QQcwTP9pyePwxRZH0Qhlf6seN/RK
	pjoHRj/VubrSB1C6RePUcHqa33AnLn1KC3U/Ezt54cfGvTomqFhuXzcTXM0BkKw0zpOcMjuvKdzv+
	qQfrzE+/ezVtwQ7sa7FJd9Zu/jm3Zxz6Gu4tb21e+CUuF8IsUvN2cmnJwkwKeUy88+Kw4hXVDjkcQ
	BoVOaf+/hGMO+wA8wNAtx2230etl4poXDJC91EtkicVmgIAaj8bK0wD98adULTJ+Vzqwc1kF07iUu
	yqEmGCcVI4OY0cB3Rpzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glytv-0005cY-4R; Tue, 22 Jan 2019 16:27:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glytr-0005PW-Gw
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 16:27:44 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E465A2085A;
 Tue, 22 Jan 2019 16:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548174463;
 bh=lNb94LlMvk29Pwlw43y6W7QGnz/YG5YHhNI1f7bJR/s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q20oaR1YZGO/U/b56cCmuuKPr+yI5cE8yPwQcQoWWAfM0G9I6P6tJBXgCfNX66UnS
 D7hz6bKX54/B3f9hxC7IMzfC9n4m1JNMdOFh6ehFX+PgOHIV94dEfMaX0+U0mqC4Ov
 N3VzuFHyWtVPLsrzYVEEvBmZFq7zVuoR+wYMvAXI=
Date: Tue, 22 Jan 2019 17:27:32 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v2 3/4] mtd: rawnand: ESMT: Also use the last page for
 bad block markers
Message-ID: <20190122172732.6cbcffec@bbrezillon>
In-Reply-To: <20190122112258.20042-4-frieder.schrempf@kontron.de>
References: <20190122112258.20042-1-frieder.schrempf@kontron.de>
 <20190122112258.20042-4-frieder.schrempf@kontron.de>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_082743_572831_151B84AA 
X-CRM114-Status: GOOD (  17.03  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 22 Jan 2019 11:23:32 +0000
Schrempf Frieder <frieder.schrempf@kontron.de> wrote:

> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> It is known that some ESMT SLC NANDs have been shipped
> with the factory bad block markers in the first or last page
> of the block, instead of the first or second page. To be on
> the safe side, let's check all three locations.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>

> ---
>  drivers/mtd/nand/raw/nand_esmt.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_esmt.c b/drivers/mtd/nand/raw/nand_esmt.c
> index 99a8092969a7..b37e0b5af5ae 100644
> --- a/drivers/mtd/nand/raw/nand_esmt.c
> +++ b/drivers/mtd/nand/raw/nand_esmt.c
> @@ -36,7 +36,14 @@ static void esmt_nand_decode_id(struct nand_chip *chip)
>  static int esmt_nand_init(struct nand_chip *chip)
>  {
>  	if (nand_is_slc(chip))
> -		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
> +		/*
> +		 * It is known that some ESMT SLC NANDs have been shipped
> +		 * with the factory bad block markers in the first or last page
> +		 * of the block, instead of the first or second page. To be on
> +		 * the safe side, let's check all three locations.
> +		 */
> +		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE |
> +				 NAND_BBM_LASTPAGE;
>  
>  	return 0;
>  }


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
