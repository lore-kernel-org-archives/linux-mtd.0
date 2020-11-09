Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD10C388F7
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 13:13:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC2522076E
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 13:13:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D2YkGsg/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC2522076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OWmp7VgcOZj29YdlzHSl7ODFG3IwELO4X8hIsFtPhqg=; b=D2YkGsg/SEWihREBfN1N72vcs
	ZxoemHK/x5Dur20QkkNU4jx5pfum+FOvQAmZjQStZyv+I1U9ZbIJ8RiITlIk5X9vZWzJ4AkX1vgj9
	jV+vN4PaN0J1zgRMCIOGt7ViIBzhSYv0J3EMSmkUva6kaygs+INuQN/FjIJ3bVj3JGvvN8/q0vv96
	+R+mzq4LIioRLgmSHBQyPQVrf6wYYSHU4zLOcTHWJmx5rmU5PjniWr2WEgAxZUWGidA6Oc+8xYF35
	MctlMpGcT55z7G6+vI/uqCSeogu0HM1uGdN8zPsyhJ6XZNsnb57NbRajjuVwLYcU/geSgk/o/CUPt
	ZKHx6ZDlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc6yA-0007xX-En; Mon, 09 Nov 2020 13:12:26 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc6y7-0007w2-Lh
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 13:12:25 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CVBGr1K1Jz756Y;
 Mon,  9 Nov 2020 21:12:04 +0800 (CST)
Received: from [10.174.179.62] (10.174.179.62) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Mon, 9 Nov 2020 21:12:03 +0800
Subject: Re: [PATCH] mtd: rawnand: ingenic: remove redundant get_device() in
 ingenic_ecc_get()
To: <paul@crapouillou.net>, <harveyhuntnexus@gmail.com>,
 <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
References: <20201031105439.2304211-1-yukuai3@huawei.com>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <5d14a96d-3815-c485-46e9-3c580d68f1e4@huawei.com>
Date: Mon, 9 Nov 2020 21:12:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201031105439.2304211-1-yukuai3@huawei.com>
X-Originating-IP: [10.174.179.62]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_081223_995443_C1703DF9 
X-CRM114-Status: GOOD (  12.42  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 yi.zhang@huawei.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

ping..

On 2020/10/31 18:54, Yu Kuai wrote:
> of_find_device_by_node() already takes a reference to the device, and
> ingenic_ecc_release() will drop the reference. So, the get_device() in
> ingenic_ecc_get() is redundand.
> 
> Fixes: 15de8c6efd0e("mtd: rawnand: ingenic: Separate top-level and SoC specific code")
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>   drivers/mtd/nand/raw/ingenic/ingenic_ecc.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
> index 8e22cd6ec71f..efe0ffe4f1ab 100644
> --- a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
> +++ b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
> @@ -71,8 +71,6 @@ static struct ingenic_ecc *ingenic_ecc_get(struct device_node *np)
>   	if (!pdev || !platform_get_drvdata(pdev))
>   		return ERR_PTR(-EPROBE_DEFER);
>   
> -	get_device(&pdev->dev);
> -
>   	ecc = platform_get_drvdata(pdev);
>   	clk_prepare_enable(ecc->clk);
>   
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
