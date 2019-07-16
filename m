Return-Path: <SRS0=2WOf=VN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02CBDC76188
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jul 2019 07:32:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C358F206C2
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jul 2019 07:32:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a9EYvggQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C358F206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pH+noJx+7Unyu4SToYr4s47gHys+OzoC4BGJ3CM+l2Q=; b=a9EYvggQ0P5eGM
	UWtzZHhbd+wClF0ktBPpBKDYoMq7ujbA7pWPnAz+9lq9CnzNT9cKzi0cuoOcy5N/FT8Vqu0HXy74C
	DEgE+8K/c+O3JZttrdXVLhi9ahdwH4WEUc+bndF13LQ9QwyguAq2pBkkQLP0P62IPW+gcnuDOhv2u
	yh71P5NMvZEO3PaaCY5azBxnRgcJc0RzBCMNMqSdg5iQL3H/SZ1VNvktVCJmmeEzuRi3lWDssCxeR
	11mDtyA/XEk9JS610Z/cdHAk28qHO1J8GCHIUQpQYnxZM9anIA7dQjcaDdcNuJy6iEdGht6B3H4QZ
	HXFqEVSZhFlL2hbYswJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hnHwE-0002ro-S9; Tue, 16 Jul 2019 07:31:50 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnHwB-0002qs-MY
 for linux-mtd@lists.infradead.org; Tue, 16 Jul 2019 07:31:49 +0000
Received: from pc-375.home
 (2a01cb0c88d94a005820d607da339aae.ipv6.abo.wanadoo.fr
 [IPv6:2a01:cb0c:88d9:4a00:5820:d607:da33:9aae])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4329528B6A4;
 Tue, 16 Jul 2019 08:31:43 +0100 (BST)
Date: Tue, 16 Jul 2019 09:31:37 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Subject: Re: [LINUX PATCH v18 1/2] mtd: rawnand: nand_micron: Do not over
 write driver's read_page()/write_page()
Message-ID: <20190716093137.3d8e8c1f@pc-375.home>
In-Reply-To: <20190716053051.11282-1-naga.sureshkumar.relli@xilinx.com>
References: <20190716053051.11282-1-naga.sureshkumar.relli@xilinx.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190716_003147_869358_2B056EAA 
X-CRM114-Status: GOOD (  13.20  )
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
Cc: nagasuresh12@gmail.com, vigneshr@ti.com, bbrezillon@kernel.org,
 yamada.masahiro@socionext.com, richard@nod.at, svemula@xilinx.com,
 linux-kernel@vger.kernel.org, michal.simek@xilinx.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 15 Jul 2019 23:30:51 -0600
Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:

> Add check before assigning chip->ecc.read_page() and chip->ecc.write_page()
> 
> Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
> ---
> Changes in v18
>  - None
> ---
>  drivers/mtd/nand/raw/nand_micron.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
> index cbd4f09ac178..565f2696c747 100644
> --- a/drivers/mtd/nand/raw/nand_micron.c
> +++ b/drivers/mtd/nand/raw/nand_micron.c
> @@ -500,8 +500,11 @@ static int micron_nand_init(struct nand_chip *chip)
>  		chip->ecc.size = 512;
>  		chip->ecc.strength = chip->base.eccreq.strength;
>  		chip->ecc.algo = NAND_ECC_BCH;
> -		chip->ecc.read_page = micron_nand_read_page_on_die_ecc;
> -		chip->ecc.write_page = micron_nand_write_page_on_die_ecc;
> +		if (!chip->ecc.read_page)
> +			chip->ecc.read_page = micron_nand_read_page_on_die_ecc;
> +
> +		if (!chip->ecc.write_page)
> +			chip->ecc.write_page = micron_nand_write_page_on_die_ecc;
>  

Seriously?! I told you this was inappropriate and you keep sending this
patch. So let's make it clear:

Nacked-by: Boris Brezillon <boris.brezillon@collabora.com>

Fix your controller driver instead of adding hacks to the Micron logic!

>  		if (ondie == MICRON_ON_DIE_MANDATORY) {
>  			chip->ecc.read_page_raw = nand_read_page_raw_notsupp;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
