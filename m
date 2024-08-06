Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B5FC52D71
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Aug 2024 17:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aWBVrCrNQ6MIEULH5jLvF3KjYOp7RkCLjzH5u6IqQbs=; b=nwdZVY8+TuQg1d
	ko2fdw8Ypu9lnQwA9WnErN9nHqi/l96dylWtlyklmGImpNDuCS1dmtSPq1H398kZM5kFXQUBuCL9O
	oiqWQlJ2++CWfvvtwBgIcH34p4YV5KzoxGXZ+ezntdClOrAvUblQdYdZsZkjTtWPpfFH10kEqca8V
	UxsTLj/a96mWUSMjIBgkJDxsqQaeab1RGFVxmBTOHlSkPkJ4dm7Mfx2u8cLijxNrXplEVsWEZ1aWs
	/nCRREqYqF521dk0Q28DlsNzg3E/E6ByNtj60udxAOizsMdn/0zeMezjUrM1mTmRlfeD5ygk13QpU
	V3Fe2D+l5f0R89OS/9Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbNo5-00000002T4w-1Bam;
	Tue, 06 Aug 2024 17:17:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbNo3-00000002T4j-27gG
	for linux-mtd@bombadil.infradead.org;
	Tue, 06 Aug 2024 17:17:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vef8U/NvAQhnHHBic1VYdlSRlaLPaFr0gvNkGR8+8sc=; b=o+N6ITuPUtl1j/Km3Svu/0dngw
	V9Vg+4JN5qQkRuZ3OMYdlDXHUlELAfP/D/EGYXOWWi/2vCIGozyY1nJ2XXePOVfeK+d1XAkVZbhxi
	RaBVdqpvON6r2YbatALt7dxjtEEKcWFT8qL3gYHpG0/7Ofi5oFjI3VeLQcXlCJq3CT9X577FuR3/9
	x6XTMgzkns3aQI42SdjU/rGvOZBaAjAqvgl2m/vOnvnbiiSQ0o33oUmJEoYL6L+1BSooq3lJuWSY1
	bIqbo1Ts4na6ZMsnTxa+WtQQTrCTnSNz1VfHrgBnjS1FQU4h8DDMX0A4NmLoo5SiZv83jSMdXSf5h
	jCuwX5Lg==;
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbNnz-00000006Uke-3g3T
	for linux-mtd@lists.infradead.org;
	Tue, 06 Aug 2024 17:17:06 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 476HGikm086270;
	Tue, 6 Aug 2024 12:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722964604;
	bh=vef8U/NvAQhnHHBic1VYdlSRlaLPaFr0gvNkGR8+8sc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HR6xnu+IjF19lbyGqcqPovQSx1xLvAJtKdPvCYxE8HOhUoVaks8u5zMZrhsYExdSt
	 ubStEkDqDPeU5Kr5Y3pDzAUcG1cbZWTgI6csBORT3iGbRbNYDw9WynmyePWAmWN6+N
	 dUpBepF1PkCzRylIBAtWzwzBLACMsPv6GoFVY71k=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 476HGieX078762
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Aug 2024 12:16:44 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Aug 2024 12:16:44 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Aug 2024 12:16:44 -0500
Received: from [172.24.227.94] (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 476HGfLB061428;
	Tue, 6 Aug 2024 12:16:41 -0500
Message-ID: <653f0d75-c35b-4182-8378-a4f0727301f0@ti.com>
Date: Tue, 6 Aug 2024 22:46:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: hyperbus: rpc-if: Add missing MODULE_DEVICE_TABLE
To: Biju Das <biju.das.jz@bp.renesas.com>,
        Miquel Raynal
	<miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
CC: Tudor Ambarus <tudor.ambarus@linaro.org>,
        Sergei Shtylyov
	<sergei.shtylyov@cogentembedded.com>,
        <linux-mtd@lists.infradead.org>,
        Geert
 Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.au@gmail.com>, <linux-renesas-soc@vger.kernel.org>
References: <20240731080846.257139-1-biju.das.jz@bp.renesas.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20240731080846.257139-1-biju.das.jz@bp.renesas.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_181704_272353_3A0E551D 
X-CRM114-Status: GOOD (  16.87  )
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



On 31/07/24 13:38, Biju Das wrote:
> The rpc-if-hyperflash driver can be compiled as a module, but lacks
> MODULE_DEVICE_TABLE() and will therefore not be loaded automatically.
> Fix this.
> 
> Fixes: 5de15b610f78 ("mtd: hyperbus: add Renesas RPC-IF driver")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>


> Note:
>  Only compile tested. Changes are similar to [1]
>  [1] https://lore.kernel.org/all/20240731072955.224125-1-biju.das.jz@bp.renesas.com/
> ---
>  drivers/mtd/hyperbus/rpc-if.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/mtd/hyperbus/rpc-if.c b/drivers/mtd/hyperbus/rpc-if.c
> index b22aa57119f2..e7a28f3316c3 100644
> --- a/drivers/mtd/hyperbus/rpc-if.c
> +++ b/drivers/mtd/hyperbus/rpc-if.c
> @@ -163,9 +163,16 @@ static void rpcif_hb_remove(struct platform_device *pdev)
>  	pm_runtime_disable(hyperbus->rpc.dev);
>  }
>  
> +static const struct platform_device_id rpc_if_hyperflash_id_table[] = {
> +	{ .name = "rpc-if-hyperflash" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(platform, rpc_if_hyperflash_id_table);
> +
>  static struct platform_driver rpcif_platform_driver = {
>  	.probe	= rpcif_hb_probe,
>  	.remove_new = rpcif_hb_remove,
> +	.id_table = rpc_if_hyperflash_id_table,
>  	.driver	= {
>  		.name	= "rpc-if-hyperflash",
>  	},

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
