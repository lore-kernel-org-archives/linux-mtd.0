Return-Path: <SRS0=XqRS=YF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FA0C4360C
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Oct 2019 09:02:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E164206A1
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Oct 2019 09:02:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VLMLDQCl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E164206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KKuSqpkkeSE9YVt+JkrJZb8iWFDsF9R13A9wbcsRKp8=; b=VLMLDQClC7jRN/
	NimXfeo5R7+EL0WfmbhFto8QWB1S0JT1t1Xd18Z/OQn5Ztl7v9Jmh2wQRE4gyXbjwz+sTdAAwMwW7
	rjWXVrmNV7ja6xG53te01yDkuzuwg50TrsOGbPy4zEkJd3lDwWeEeozvf0ZJmp2FhV7ZfSPNvO1jq
	fiGFxqoASdjUxTF2rxvCjhZLbd/5b4UWOOGy7Ab6dWFffWfPk2/vhV+99ohVAtZgKBvbJ3UAJOiHq
	sdIi6V27N9YIBaV+xwkLAJmsrOOT6+bBlelLW9DNjcKhuzamO4CJVo+ObUrlG7dXDBFBTKvgPh6ME
	ZPVJT6rrmu0RRsZHCguQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJDI5-0006bt-S3; Sat, 12 Oct 2019 09:02:21 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJDHx-0006UA-QO; Sat, 12 Oct 2019 09:02:15 +0000
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C83142912D7;
 Sat, 12 Oct 2019 10:02:11 +0100 (BST)
Date: Sat, 12 Oct 2019 11:02:09 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 03/40] mtd: rawnand: Create a new enumeration to
 describe OOB placement
Message-ID: <20191012110209.3a3eafc6@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <20190919193141.7865-4-miquel.raynal@bootlin.com>
References: <20190919193141.7865-1-miquel.raynal@bootlin.com>
 <20190919193141.7865-4-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191012_020214_120523_582887E6 
X-CRM114-Status: GOOD (  19.10  )
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
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 19 Sep 2019 21:31:03 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> There is currently a confusion between the ECC type/mode/provider
> (eg. hardware, software, on-die or none) and the in-bad/out-of-band

						   ^in-band

> layout which is only described for hardware engines (OOB first,
> syndrome).

It's not really about in-band/out-of-band data placement (though it
also has an impact on it since free OOB bytes are sometimes protected
by ECC or placed next to it), more ECC bytes placement.

> 
> Create a new enumeration to describe this placement.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c |  5 +++++
>  include/linux/mtd/rawnand.h      | 12 ++++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index e6c483ec191a..74e9289e931c 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -4842,6 +4842,11 @@ static const char * const nand_ecc_modes[] = {
>  	[NAND_ECC_ON_DIE]	= "on-die",
>  };
>  
> +static const char * const nand_ecc_engine_oob_placement[] = {

			     ^nand_ecc_placement ?

> +	[NAND_ECC_SYNDROME_OOB_PLACEMENT] = "hw_syndrome",
> +	[NAND_ECC_OOB_FIRST_PLACEMENT] = "hw_oob_first",

Since this is something you introduce, I'd recommend to change the
naming here:

s/NAND_ECC_SYNDROME_OOB_PLACEMENT/NAND_ECC_PLACEMENT_INTERLEAVED/
s/hw_syndrome/ecc-interleaved/
s/NAND_ECC_OOB_FIRST_PLACEMENT/NAND_ECC_PLACEMENT_FIRST/
s/hw_oob_first/ecc-first/

> +};
> +
>  static int of_get_nand_ecc_mode(struct device_node *np)
>  {
>  	const char *pm;
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index ccdc0c314acc..89f964816f2c 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -93,6 +93,18 @@ enum nand_ecc_mode {
>  	NAND_ECC_ON_DIE,
>  };
>  
> +/**
> + * enum nand_ecc_engine_oob_placement - NAND ECC engine OOB placement
> + * @NAND_ECC_DEFAULT_OOB_PLACEMENT: Standard layout, or not specified

Maybe describe what the standard layout is (ECC placed at the end), and
mention that "not specified/default" means the driver can decide to put
the ECC/free-OOB bytes where he wants.

> + * @NAND_ECC_SYNDROME_OOB_PLACEMENT: Syndrome layout (interlaced)
> + * @NAND_ECC_OOB_FIRST_PLACEMENT: Free OOB bytes first
> + */
> +enum nand_ecc_engine_oob_placement {
> +	NAND_ECC_DEFAULT_OOB_PLACEMENT,
> +	NAND_ECC_SYNDROME_OOB_PLACEMENT,
> +	NAND_ECC_OOB_FIRST_PLACEMENT,
> +};
> +
>  enum nand_ecc_algo {
>  	NAND_ECC_UNKNOWN,
>  	NAND_ECC_HAMMING,


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
