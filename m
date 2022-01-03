Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171C8C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jan 2022 11:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Cc:To
	:Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qlgi8JShKstVKe59QZmaCbfFushapeMFHJl5m2InkCI=; b=wm5RhRQdeUY03XizyRjkDJ5Kir
	7t2n6cMIQhdwybMAkhZ3Owb2k1pEbT0+8HJ7n8FUqtA6MJC/Z9ACSC74WN9/LaA++d5cImsVrvlZC
	IoWhJUc4D+DNLLnipdn/uiZEC6KVXX8mEQ6qJJcS/RJpKTBM2JLVzXJIM5bdqHuzf01yozkOPlr0C
	T2Wsi4OEoBvZB2S+ewUx0XmPS+61onzy4tvj1/TtnhnWDMbN+t0HQGd1ZVz7Cs8azbU4uwUxL5jQt
	6HDpPbEDzu/neVl5bv0OCeyD9QfykMVLClj9vfPlv6mwtOs+4cOl/IuvHnYkGqiL24W7DDwI59MVv
	kHw7wXiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4LZg-008swX-MZ; Mon, 03 Jan 2022 11:32:24 +0000
Received: from aposti.net ([89.234.176.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4LZd-008suY-52
 for linux-mtd@lists.infradead.org; Mon, 03 Jan 2022 11:32:22 +0000
Date: Mon, 03 Jan 2022 11:32:02 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] mtd: rawnand: ingenic: Fix missing put_device in
 ingenic_ecc_get
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Harvey Hunt <harveyhuntnexus@gmail.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <EDT45R.P10AQNFPT9FP1@crapouillou.net>
In-Reply-To: <20211230072751.21622-1-linmq006@gmail.com>
References: <20211230072751.21622-1-linmq006@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_033221_391314_5E0A6C22 
X-CRM114-Status: GOOD (  12.99  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Le jeu., d=E9c. 30 2021 at 07:27:51 +0000, Miaoqian Lin =

<linmq006@gmail.com> a =E9crit :
> If of_find_device_by_node() succeeds, ingenic_ecc_get() doesn't have
> a corresponding put_device(). Thus add put_device() to fix the =

> exception
> handling.
> =

> Fixes: 15de8c6 ("mtd: rawnand: ingenic: Separate top-level and SoC =

> specific code")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  drivers/mtd/nand/raw/ingenic/ingenic_ecc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c =

> b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
> index efe0ffe4f1ab..9054559e52dd 100644
> --- a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
> +++ b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
> @@ -68,9 +68,14 @@ static struct ingenic_ecc *ingenic_ecc_get(struct =

> device_node *np)
>  	struct ingenic_ecc *ecc;
> =

>  	pdev =3D of_find_device_by_node(np);
> -	if (!pdev || !platform_get_drvdata(pdev))
> +	if (!pdev)
>  		return ERR_PTR(-EPROBE_DEFER);
> =

> +	if (!platform_get_drvdata(pdev)) {
> +		put_device(&pdev->dev);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
>  	ecc =3D platform_get_drvdata(pdev);
>  	clk_prepare_enable(ecc->clk);
> =

> --
> 2.17.1
> =




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
