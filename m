Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5331C25B4F
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2024 06:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AK1Fu93ktnuPSPAAXwmJnHDvfIOHHOy3JakzVRkS7Bc=; b=FJpN68fE9BnobS
	J0duxhxdNJquaEwwXgU/TKSBBQtL52kLDT/7zH3fY5i4G3uctX7/nIS+sf9lDf4opBymrwXQGXt0Y
	/b1FpeZURXCetLxjfquhiyXB0Q8jeC4lusFxJwioP+CduM65ZUnfQZtCoqZWTGsiCgCV/8wwGRfL2
	/pTXAeUcG3UE0kwAV1eZr04jkxnaBpP++uzpwQUm0/LaWH6tFa4BF3NY70+IP+kQLk1IZ+t4JrEB+
	ZHQpu8Sl0PRW1jnk3DSzu99DZGt8nx9RKquYIkvUh942RnKVB5QItJTafe4zRVQWl0qBwug6F4iYg
	6623+t6/H0DLTp/Pvh5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4avc-0000000EGfm-0ISS;
	Wed, 08 May 2024 06:37:24 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4avT-0000000EGeD-2y88
	for linux-mtd@lists.infradead.org;
	Wed, 08 May 2024 06:37:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02F5E1488174;
	Wed,  8 May 2024 08:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1715150227; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=BCDMUHxH7zhVa+DyU5CH1wIgdcR2YUBiJ5C+ZREWqJE=;
	b=BM5MwsgBgiPNNEs5y+B8IcJlStq/s9A/JMbJkY3Iecq9q58iZ27dCxKkih3zS7vbDuX9Hw
	/aL41xbYH4bktvLsd8pZ9lDRwlat8+DWqQ4rHYemIOGtLW4wAGnQegbW72eCD4NsML0ZpG
	39MWFArNQyq+1d73GFyFjvk51Q5mXyoO1SrxsSjLVGavjgNfILhfogV6wfjQxWaIDX0KEI
	+PybNIg5SMhauDZ+7ZumIPJsEI4lao3znT8Wu2wSYgCUIbKlM7TkAEBC+ZrnYMxTXLrlGx
	ZyFw+uFgYp5oIB3+XrhG+0k0LDLrd2WPnk30h9XqbRHXJPpgCg+5tUoTZOmqXA==
Date: Wed, 8 May 2024 08:36:55 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	stable@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
	Steven Seeger <steven.seeger@flightsystems.net>
Subject: Re: [PATCH 1/2] mtd: rawnand: Fix the nand_read_data_op() early check
Message-ID: <20240508-griminess-residue-e376b3315f55@thorsis.com>
Mail-Followup-To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	stable@vger.kernel.org,
	Steven Seeger <steven.seeger@flightsystems.net>
References: <20240507160546.130255-1-miquel.raynal@bootlin.com>
 <20240507160546.130255-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240507160546.130255-2-miquel.raynal@bootlin.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_233716_014035_4B2386A8 
X-CRM114-Status: GOOD (  24.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Miquel,

Am Tue, May 07, 2024 at 06:05:45PM +0200 schrieb Miquel Raynal:
> The nand_read_data_op() operation, which only consists in DATA_IN
> cycles, is sadly not supported by all controllers despite being very
> basic. The core, for some time, supposed all drivers would support
> it. An improvement to this situation for supporting more constrained
> controller added a check to verify if the operation was supported before
> attempting it by running the function with the check_only boolean set
> first, and then possibly falling back to another (possibly slightly less
> optimized) alternative.
> 
> An even newer addition moved that check very early and probe time, in
> order to perform the check only once. The content of the operation was
> not so important, as long as the controller driver would tell whether
> such operation on the NAND bus would be possible or not. In practice, no
> buffer was provided (no fake buffer or whatever) as it is anyway not
> relevant for the "check_only" condition. Unfortunately, early in the
> function, there is an if statement verifying that the input parameters
> are right for normal use, making the early check always unsuccessful.
> 
> Fixes: 9f820fc0651c ("mtd: rawnand: Check the data only read pattern only once")
> Cc: stable@vger.kernel.org
> Reported-by: Alexander Dahl <ada@thorsis.com>
> Closes: https://lore.kernel.org/linux-mtd/20240306-shaky-bunion-d28b65ea97d7@thorsis.com/
> Reported-by: Steven Seeger <steven.seeger@flightsystems.net>
> Closes: https://lore.kernel.org/linux-mtd/DM6PR05MB4506554457CF95191A670BDEF7062@DM6PR05MB4506.namprd05.prod.outlook.com/
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index acd137dd0957..248e654ecefd 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -2173,7 +2173,7 @@ EXPORT_SYMBOL_GPL(nand_reset_op);
>  int nand_read_data_op(struct nand_chip *chip, void *buf, unsigned int len,
>  		      bool force_8bit, bool check_only)
>  {
> -	if (!len || !buf)
> +	if (!len || (!check_only && !buf))
>  		return -EINVAL;
>  
>  	if (nand_has_exec_op(chip)) {

Thanks for tacking care of this.

Reviewed-by: Alexander Dahl <ada@thorsis.com>

Greets
Alex


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
