Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E047C04A95
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Sep 2022 01:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJTCpnJig412Z7bZBEQHWMzUBLLGSACsSDsyNhinYEY=; b=IbHiIHP5ok3bKnTwlo9CCdx8Si
	BfvKxW0LLT5emCfkPSn7RTphPeCx8lcqVtu/TlDXQbdItpClcfrFYYJ4PV/xfa9M3+hyIs4UVbp+g
	fOU/MEFgIJPSwBUJ/TP0hWoi/YqiWcyrHy4Nc2uhz0gBRDhuBMewHtlNUdxBv/mDqBLG+NZ5ms9jR
	lEZkkh4YiZWVs7E9H9HLdLlIiN15d1PkccWYnj/2H2mIw84ce1o+emHiQ1N8HvYmuLch6cWe9WxTG
	ZqjMIFlRvXxDaxvmRuPRF6dImfjB6MADq8MCoeIE4xn2Ie6vK5BT3aCiIRSz39zaF3FfRb5NLDouK
	XudRTCUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocdN6-000tmU-E5; Mon, 26 Sep 2022 01:57:24 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocdMu-000ti8-26
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2022 01:57:14 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MbQmk6RSMzHqBV;
	Mon, 26 Sep 2022 09:54:46 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 09:57:01 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 09:57:00 +0800
Subject: Re: [PATCH -next] mtd: rawnand: intel: Add missing of_node_put() in
 ebu_nand_probe()
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>
References: <20220924131010.957117-1-yangyingliang@huawei.com>
 <CAFBinCCFSrYv-JZrda27Ein=YrEik=yvOjHtiz-=aR0q-+FFFA@mail.gmail.com>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <e640b2b7-edf7-54dd-c207-a0906858d98c@huawei.com>
Date: Mon, 26 Sep 2022 09:57:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCCFSrYv-JZrda27Ein=YrEik=yvOjHtiz-=aR0q-+FFFA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_185712_315984_16B9E2BB 
X-CRM114-Status: GOOD (  16.38  )
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

Hi,

On 2022/9/26 3:39, Martin Blumenstingl wrote:
> Hello,
>
> On Sat, Sep 24, 2022 at 3:03 PM Yang Yingliang <yangyingliang@huawei.com> wrote:
>> The 'chip_np' returned by of_get_next_child() with refcount decremented,
>> of_node_put() need be called in error path to decrease the refcount.
> Thanks a lot for bringing this up!
>
> [...]
>> @@ -695,6 +700,8 @@ static int ebu_nand_probe(struct platform_device *pdev)
>>          ebu_dma_cleanup(ebu_host);
>>   err_disable_unprepare_clk:
>>          clk_disable_unprepare(ebu_host->clk);
>> +err_of_node_put:
>> +       of_node_put(chip_np);
> Here I have one question:
> My understanding is that with this patch we now use
> of_node_put(chip_np); in case any error occurs during probe.
> But what about the case where there's no error and someone later
> unloads the driver (using rmmod)? Or in other words: do we need
> another of_node_put() call in ebu_nand_remove()?
In normal case, when the module is removing, the of_node_put() is
called in del_mtd_device() which is called by mtd_device_unregister().

Thanks,
Yang
>
>
> Best regards,
> Martin
> .

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
