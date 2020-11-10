Return-Path: <SRS0=eCmO=EQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F810C388F7
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 08:39:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECB3B20731
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 08:39:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TaD1gul5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECB3B20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EwBzOJQ0AJ6iGkLJxz5ozIwDVs2WVOlG2Yc+ZtFSJ+Y=; b=TaD1gul5g6uC302CojtBwPX3/
	g8OnEP2nv8GypiTEkiRZ7iBrn7ClDeXRdsLUAO6MzZQJI+iiXflQ0clSbqBnHhAItT97lHPwYgPgL
	IbZvd7E/bGst0+IZSfkjLjhbDqSIhsGKo7mJAtEnK84u+2Gf3dDwB57fpGwM1BruxKB+/uzHtyKdY
	ZUa65T9FnUpzYewayXLuCjIadkgUCS+YiRE19vt7oFjzXUeqW+5OxVCvHqsp4edDptWG1k027wZ9Q
	P5S7WOnX4JuQpkPP6Y6PRjIksLOcypZN8YEL+QhZvlSrHiTIL2Yhn457IUwT/LJQPFlPZlR1zsWv0
	jb2HYgfuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcPAq-0006Rc-Fq; Tue, 10 Nov 2020 08:38:44 +0000
Received: from aposti.net ([89.234.176.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcPAn-0006Qz-Fx
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2020 08:38:42 +0000
Date: Tue, 10 Nov 2020 08:38:24 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] mtd: rawnand: ingenic: remove redundant get_device() in
 ingenic_ecc_get()
To: Yu Kuai <yukuai3@huawei.com>
Message-Id: <00OKJQ.IYM95XDRFCZI3@crapouillou.net>
In-Reply-To: <20201031105439.2304211-1-yukuai3@huawei.com>
References: <20201031105439.2304211-1-yukuai3@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_033841_895733_ED8F92FA 
X-CRM114-Status: GOOD (  11.17  )
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
Cc: vigneshr@ti.com, yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 harveyhuntnexus@gmail.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Le sam. 31 oct. 2020 =E0 18:54, Yu Kuai <yukuai3@huawei.com> a =E9crit :
> of_find_device_by_node() already takes a reference to the device, and
> ingenic_ecc_release() will drop the reference. So, the get_device() in
> ingenic_ecc_get() is redundand.
> =

> Fixes: 15de8c6efd0e("mtd: rawnand: ingenic: Separate top-level and =

> SoC specific code")
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Thanks,
-Paul

> ---
>  drivers/mtd/nand/raw/ingenic/ingenic_ecc.c | 2 --
>  1 file changed, 2 deletions(-)
> =

> diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c =

> b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
> index 8e22cd6ec71f..efe0ffe4f1ab 100644
> --- a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
> +++ b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
> @@ -71,8 +71,6 @@ static struct ingenic_ecc *ingenic_ecc_get(struct =

> device_node *np)
>  	if (!pdev || !platform_get_drvdata(pdev))
>  		return ERR_PTR(-EPROBE_DEFER);
> =

> -	get_device(&pdev->dev);
> -
>  	ecc =3D platform_get_drvdata(pdev);
>  	clk_prepare_enable(ecc->clk);
> =

> --
> 2.25.4
> =




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
