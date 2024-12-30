Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A1FE77188
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Dec 2024 08:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DfAPSkA1iKix0daJhHZUfUSYWcnC8Xqa/42XsYddCpE=; b=xe+22+/aITWGU9
	iWV/ellfmvr/j2c8d+6n0ips528JaUVoV66E0SclB8xrGtMwL0CizHRa1zTwBZv1RbD/glUWI4cte
	UGrcKnExxcdd9+tySpWyHN9JHf4c5gsCxRnNZtOerxzEL9Oqu8shOKGn8VwOYrbYi1yJmQvn1LFOB
	PY0/OOW7u/t5MZpcb/3OeNhWPSHrFmJ6D+ArAZ4jcJacudVlTwklyIVxLfiR8ucmdfST9zL7KEf/e
	Eff1KTMn8zCkUThhCrv+XMeCdmH/XSgs/g5yocezemzgmYQTFFB5eaQAdr8rwVa2vUVVNpCnJSpeQ
	PGGwkfAv3qKndy7pGZyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBbS-00000004qjp-1LQB;
	Mon, 30 Dec 2024 08:58:22 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBbQ-00000004qjQ-0v7l
	for linux-mtd@lists.infradead.org;
	Mon, 30 Dec 2024 08:58:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB6B960004;
	Mon, 30 Dec 2024 08:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735549097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0nez5oSC3Q1MijzhaO1mhDn5bg2A13bHM3qQN46bJiE=;
	b=Swt5U4pLqhin+by0HKL9jzpzCY3STCeFw+JK2Y4SNCb/cc5Qm2/NZ95vToio753AwqMoAu
	LrOYvlI5PIYM5cJZhyhqyL24O7khp7gzS80dUuMnqu4a+CeXKAk4jztGvVn8vOO4j4IKaw
	9mMzq2S6HJ3E+8D0IseOqMcPHiosyy45lsGrXfrFf1MbTxpMgeeoxlnBeW/FghG2vdKRnv
	DvPomVrAEEvBt8M4QB7YKPNYt1syjrzLVA/5/sQCauDoyRXHxjr1Jn3isumQ36t2vmaQTH
	dowqrQ1jjA+NgqQf60zIFBs8smW6QU7zsaJoziATnY3erR/p6eZAE8ZOE2P0Vw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Micha Ober <git@ober-mail.de>
Cc: linux-mtd@lists.infradead.org,  richard@nod.at,  vigneshr@ti.com
Subject: Re: [PATCH] mtd: spinand: micron: fix division by zero
In-Reply-To: <20241228154106.26995-1-git@ober-mail.de> (Micha Ober's message
	of "Sat, 28 Dec 2024 16:41:06 +0100")
References: <20241228154106.26995-1-git@ober-mail.de>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 30 Dec 2024 09:58:16 +0100
Message-ID: <87ed1p8s47.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_005820_412250_626B7BDD 
X-CRM114-Status: GOOD (  14.37  )
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

Hi Micha,

Thanks for the patch, looks important.

Please fix Richard's address in next submission.

On 28/12/2024 at 16:41:06 +01, Micha Ober <git@ober-mail.de> wrote:

> The `ecc_step_size` field ist not set at this point

typo                          ^

> in the call tree, leading to a division by zero.

Definitely needs Fixes: + Cc: stable!

> Read the step size from the mtd device ecc config instead.

s/mtd device//
s/ecc config/ECC configuration/

>
> Signed-off-by: Micha Ober <git@ober-mail.de>
> ---
>  drivers/mtd/nand/spi/micron.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
> index 12601bc4227a..7973996519d3 100644
> --- a/drivers/mtd/nand/spi/micron.c
> +++ b/drivers/mtd/nand/spi/micron.c
> @@ -106,9 +106,10 @@ static int micron_4_ooblayout_free(struct mtd_info *mtd, int section,
>  				   struct mtd_oob_region *region)

What about the exact same situation in the .ecc() hook?

>  {
>  	struct spinand_device *spinand = mtd_to_spinand(mtd);
> +	struct nand_device *nand = mtd_to_nanddev(mtd);
>  
>  	if (section >= spinand->base.memorg.pagesize /
> -			mtd->ecc_step_size)
> +			nanddev_get_ecc_conf(nand)->step_size)
>  		return -ERANGE;
>  
>  	if (section) {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
