Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F39AC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 08:54:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 706DC20776
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 08:54:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kxg4nLNs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 706DC20776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOZ0FLHlvXRNB74q1zIoyAnq08a/rhKx9x/feTpIlno=; b=kxg4nLNseSAe35
	r7GeN8biOtj9lolZR+BLmitU7YNjX4FWiTx3nH2tsL0BcJT9olfcSh577b+6hZHPSX0CVRFvPRilG
	GQXzHdH7EFkjFNV9vqXiBmgH9921cMZpVrVQ/GuDJ45bcaywOI5u0Oi0V4LWf2B4ZLb/pQ49CZ3F9
	wqolZIU+LSnkyaJoic2GHHMhmJz9byVeuvGMH/7yYLEZnebslwPp5a1C8M9MIVOaL7SToaMzqeTCf
	OMV0zhd52wHuK1Z6D5MxPWo2h03GzZHeRZPpu8uXnO5DI+zQ2v4hk5GzgNZDZgPDkc+QEzLSy2TOF
	jxAVY2958Um7p1SvXLRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeaml-0002qg-Re; Fri, 29 May 2020 08:54:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeamj-0002qB-3B
 for linux-mtd@lists.infradead.org; Fri, 29 May 2020 08:54:38 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8D9772A4357;
 Fri, 29 May 2020 09:54:35 +0100 (BST)
Date: Fri, 29 May 2020 10:54:31 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v6 30/30] mtd: rawnand: Allocate the best interface
 configuration dynamically
Message-ID: <20200529105431.5d0b7a9a@collabora.com>
In-Reply-To: <20200528231612.8958-31-miquel.raynal@bootlin.com>
References: <20200528231612.8958-1-miquel.raynal@bootlin.com>
 <20200528231612.8958-31-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_015437_267112_7359171A 
X-CRM114-Status: GOOD (  12.51  )
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
Cc: Rickard Andersson <rickaran@axis.com>, Michal Simek <monstr@monstr.eu>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 29 May 2020 01:16:12 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

>  
> @@ -947,7 +949,8 @@ static int nand_reset_interface(struct nand_chip *chip, int chipnr)
>   */
>  static int nand_setup_interface(struct nand_chip *chip, int chipnr)
>  {
> -	u8 mode = chip->interface_config.timings.mode;
> +	const struct nand_controller_ops *ops = chip->controller->ops;
> +	u8 mode = chip->best_interface_config->timings.mode;

I didn't check, but I assume it's safe to dereference
->best_interface_config here (IOW, ->best_interface_config is
guaranteed to be != NULL).

>  	u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = { mode, };
>  	int ret;
>  

>  
>  /**
> @@ -2523,8 +2542,8 @@ int nand_reset(struct nand_chip *chip, int chipnr)
>  	 * nand_setup_interface() uses ->set/get_features() which would
>  	 * fail anyway as the parameter page is not available yet.
>  	 */
> -	if (!memcmp(&chip->interface_config, nand_get_reset_interface(),
> -		    sizeof(chip->interface_config)))
> +	if (!chip->best_interface_config ||
> +	    chip->best_interface_config == nand_get_reset_interface())

I think 'chip->best_interface_config == nand_get_reset_interface()' is
never true.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
