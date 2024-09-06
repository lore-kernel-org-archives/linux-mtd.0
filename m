Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA204CE7B1E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GarGyzp6LI35p0xDuuri4jyLYeyAGRUSP+QDd0lQuaI=; b=c8jqet4eTeqmaD
	96yLYJmHDKmoeVqSMAfimPV98aDckgGjYF2F8uMBQ9PyLDkTD8nkArhrC3Q8dz+qyHap/LaRPdep/
	l2SMNPRCXsO0uDcwr5TqbtrQIRpZNe2jbCedoc2e5Th0UDH5hkpVaQAnLB4vK1FLj72d6khObURmU
	2/drcAjuKcHOES8Qzki0AuzPKK1+v7ZsUCvlA0iFI53pFUMOuIguU+286/2KVZIm+CatEg0FvopTa
	dBGExHEu/U10x5X+tX6lbYVFfiNsbQ4gmxOjGXM7Youx1B8Xi229NLVD0Cs/j0vUMx98LqGKpwViw
	iJBPOZcFYbPKCDiRrNtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaUt-0000000Cety-0RR5;
	Fri, 06 Sep 2024 15:03:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaTN-0000000CeWr-0AJk;
	Fri, 06 Sep 2024 15:02:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D34CC5C400F;
	Fri,  6 Sep 2024 15:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7969BC4CEC7;
	Fri,  6 Sep 2024 15:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725634924;
	bh=v1YN9lIA50M2bdjtyQ2t2WR8tS0vOrWTZqAkv9Trey8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nDFJ0iHp/D+oOrPR5qOvqHMEqGXx+5ruYLkVXwQb/DIhNp4Hs+lTx4DSiGQpdRNRK
	 eQhJ+TZyiKvnO0IUSFcso9SAAba+azvKSsHuEc2otPhkmjy6kCVVyz62sM2k7Ortfc
	 FpnKKg9efsnWEwc6pj7OdoLwwzrTS+p+ugypoSN1sEH/FQ6KDNsrnB+TBC5+3v5zqZ
	 hIYuvIJz++56ozk8BdGrlvTqkhfrb6ctEi+VzutgRrd3m9TScU4swgX6qVl9K3bmn6
	 PDhN+tXzruaj8yF1e+3yozXcCe9Fs0L0Bp42P2i1rSsfQMjFKvh1R9/eq69TwH44yA
	 4I/CYnT4xawsg==
Message-ID: <fd7558e1-9af0-4df1-8412-06226f1d96b5@kernel.org>
Date: Fri, 6 Sep 2024 17:01:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next 2/2] mtd: rawnand: mtk: Fix init error path
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240826153019.67106-1-miquel.raynal@bootlin.com>
 <20240826153019.67106-2-miquel.raynal@bootlin.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@kernel.org>
In-Reply-To: <20240826153019.67106-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080205_156684_7AD5B50C 
X-CRM114-Status: GOOD (  17.66  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 26/08/2024 17:30, Miquel Raynal wrote:
> Reviewing a series converting the for_each_chil_of_node() loops into
> their _scoped variants made me realize there was no cleanup of the
> already registered NAND devices upon error which may leak memory on
> systems with more than a chip when this error occurs. We should call the
> _nand_chips_cleanup() function when this happens.
> 
> Fixes: Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Matthias Brugger <matthias.bgg@kernel.org>

> ---
> Backporting this change will probably fail. In practice, the memory leak
> is very unlikely to happen so I guess we can live without it.
> ---
>   drivers/mtd/nand/raw/mtk_nand.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
> index bf845dd16737..586868b4139f 100644
> --- a/drivers/mtd/nand/raw/mtk_nand.c
> +++ b/drivers/mtd/nand/raw/mtk_nand.c
> @@ -1453,8 +1453,10 @@ static int mtk_nfc_nand_chips_init(struct device *dev, struct mtk_nfc *nfc)
>   
>   	for_each_child_of_node_scoped(np, nand_np) {
>   		ret = mtk_nfc_nand_chip_init(dev, nfc, nand_np);
> -		if (ret)
> +		if (ret) {
> +			mtk_nfc_nand_chips_cleanup(nfc);
>   			return ret;
> +		}
>   	}
>   
>   	return 0;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
