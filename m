Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92382CD98DA
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2026 09:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OktL4ifFwkfxwZwaXF8wSLiK6HVxzr7HT3beM2p+JvE=; b=Ec6iBuikpcFdZl
	Q9be977nIKcv19gVIdLObEbQIcFMu9l0VcE00tpJoeazO9UBDO+pb0hPvzJtLspyRSUs7ZUllDc7i
	6q8EVCY2paMpqsmn84PdgYA8QGqLxgMDPIX9COOlFseQLwwDPj5ggqjnCUr8Gj34YSi+ociYrJRO+
	ceiyYaTEFyR8039M5xsQ93UPcmydku8jO3ddwq6ChLYHEOiKxEgw0R3knJxtPzswWp2+Rn+FxgSvT
	jKqCEtPhigi1tw4t+gdyZuRBwBX5ytDIgZKBFq8T/cnT2MOcm10VDwZGO+mE+g9q6RN6kocIs3uuj
	Au3och+PcJVackuiQ/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQSo-0000000FXmL-0cXe;
	Tue, 16 Jun 2026 09:52:10 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQSi-0000000FXlQ-1mkd
	for linux-mtd@lists.infradead.org;
	Tue, 16 Jun 2026 09:52:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6BC37C2BB2D;
	Tue, 16 Jun 2026 09:52:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E705A601A9;
	Tue, 16 Jun 2026 09:51:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC7CE106C9C50;
	Tue, 16 Jun 2026 11:51:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781603519; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mt0GL6MEmje9F72ypwtGT1PU+BwRpdD8k+Q4H0emcR0=;
	b=T/o2QZVhJ2rg78gzBDrqFL96SRVdHfxhZgRh43/6KOhI0m2P/jfThebQx6CVADpyWgctLa
	EXIdYEO1gB3dxOdzt+sVVtb8FCKimZVdBQWoABIwNfU3Un5TQYq/BbgXPky3JrfG1U6HcL
	gxk3qbSwPaBKAVwUbTIBlOElqav5nkM8VHPxa6XD/ZIUg4C1SczvCpLNfvGDOvm15sTHLs
	2kpN4iPYMn1aTRq5ARp1h82JL71dggnJT2+HDBX4JorHF5yFavC63KxjddfS7RFCMGYVRn
	14HXFtmP1RkNjJ+2KsUtN9iHi3uzeahI24nZhzPwEi4mc6dyL10IkvHuQ5u9AQ==
Mime-Version: 1.0
Date: Tue, 16 Jun 2026 11:51:53 +0200
Message-Id: <DJADQJ8GEDNF.334T2EXRX7DXJ@bootlin.com>
Cc: <kernel-janitors@vger.kernel.org>, <error27@gmail.com>
To: "Harshit Mogalapalli" <harshit.m.mogalapalli@oracle.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Amit Kumar Mahapatra"
 <amit.kumar-mahapatra@amd.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] mtd: virt_concat: fix use-after-free in
 mtd_virt_concat_destroy_joins()
X-Mailer: aerc 0.21.0
References: <20260614081052.1332702-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20260614081052.1332702-1-harshit.m.mogalapalli@oracle.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_025204_654403_136E49A0 
X-CRM114-Status: GOOD (  20.53  )
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

Hello Harshit, Miquel/Richard/Vignesh,

On Sun Jun 14, 2026 at 10:10 AM CEST, Harshit Mogalapalli wrote:
> mtd_concat_destroy() frees item->concat so calling
> mtd_virt_concat_put_mtd_devices(item->concat) leads to a use after free.
>
> Fix this by moving mtd_virt_concat_put_mtd_devices() before
> mtd_concat_destroy()
>
> Fixes: 43db6366fc2d ("mtd: Add driver for concatenating devices")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is static analysis finding by Smatch, only compile tested.
> ---
>  drivers/mtd/mtd_virt_concat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/mtd_virt_concat.c b/drivers/mtd/mtd_virt_concat.c
> index 37075ead0f33..a3fb96788e9d 100644
> --- a/drivers/mtd/mtd_virt_concat.c
> +++ b/drivers/mtd/mtd_virt_concat.c
> @@ -75,8 +75,8 @@ void mtd_virt_concat_destroy_joins(void)
>  		if (item->concat) {
>  			mtd_device_unregister(mtd);
>  			kfree(mtd->name);
> -			mtd_concat_destroy(mtd);
>  			mtd_virt_concat_put_mtd_devices(item->concat);
> +			mtd_concat_destroy(mtd);
>  		}
>  	}
>  }

This patch looks OK:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

@Miquel/Richard/Vignesh:
However while looking at the code to understand it I noticed two possible
issues in the existing code.


Issue 1: the CONCAT() macro implementation looks hacky:

  /*
   * Given a pointer to the MTD object in the mtd_concat structure,
   * we can retrieve the pointer to that structure with this macro.
   */
  #define CONCAT(x)  ((struct mtd_concat *)(x))

Shouldn't it be implemented as a container_of() instead? The current
implementation works just "by chance", i.e. because the struct mtd_info is
the first field in struct mtd_concat.


Issue 2: in mtd_virt_concat_destroy_joins():

	list_for_each_entry_safe(item, tmp, &concat_node_list, head) {
		mtd = &item->concat->mtd; [0]
		if (item->concat) { [1]

At line [0] we dereference item->concat, but at line [1] we apparently
handle the case where item->concat can be NULL. Either [1] is always true
and we can remove the if(), or [1] can be false, so [0] is a bug and should
probably be moved to inside the if().


Do these look like correct findings?


Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
