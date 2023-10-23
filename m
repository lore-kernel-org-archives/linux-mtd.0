Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404BACDB474
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Oct 2023 06:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+AxCt4xv+3T3fTrUG9XuDgwrpw6qV2MulhCVOlMzf4Y=; b=hlLYbOGbHj3bav
	scEZjl/zLfYZ78tKy1eCgzxG+e8LKFtn/cy693TZD/4JIdQS0Blnp9B0fcK8EbNewhXlz2q+20Pqm
	Lr5ZiVM+Rv52sF7au5A8XjpWzLFPNsFUARQf5LmcOVM5AIesNpb6LQbMGXHHSeN+/hlA/xwoVXsqR
	P57xqbU9nX6nPs9MzMoaWsqCmeJie1cv9ld4RvfljhOD88ba/ODIkjImt1XG0L6BDZNrNHP4o9Azk
	bQ88KRYEq6O9RgbhvII9ydSnTSJeJls64WLubpElk5ORtLRQ+Atzkp+k0eIHVOojmB2fv+1r3dE12
	/CiRFCsGCymkml505n3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quod5-006Y0Y-2B;
	Mon, 23 Oct 2023 06:41:35 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quod3-006Xyn-01
	for linux-mtd@lists.infradead.org;
	Mon, 23 Oct 2023 06:41:34 +0000
Received: from dggpemm500009.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SDQSl55KkzcdYH;
	Mon, 23 Oct 2023 14:36:23 +0800 (CST)
Received: from [10.174.178.209] (10.174.178.209) by
 dggpemm500009.china.huawei.com (7.185.36.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 23 Oct 2023 14:41:13 +0800
Message-ID: <9b543be7-a858-c982-3fcf-408701ae4ac9@huawei.com>
Date: Mon, 23 Oct 2023 14:41:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
To: Richard Weinberger <richard@nod.at>, chengzhihao1
	<chengzhihao1@huawei.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, dpervushin <dpervushin@embeddedalley.com>, Artem
 Bityutskiy <Artem.Bityutskiy@nokia.com>, linux-mtd
	<linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	yi zhang <yi.zhang@huawei.com>, yangerkun <yangerkun@huawei.com>
References: <20231018121618.778385-1-wangzhaolong1@huawei.com>
 <1381458025.20897.1697747248632.JavaMail.zimbra@nod.at>
 <891e554b-c133-6378-3a65-836fc9147e54@huawei.com>
 <441107100.23734.1697904580252.JavaMail.zimbra@nod.at>
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
In-Reply-To: <441107100.23734.1697904580252.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.209]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_234133_288532_F4244AD6 
X-CRM114-Status: UNSURE (   4.94  )
X-CRM114-Notice: Please train this message.
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

> 
> IOW, no mtdblock (hence, also no FTLs) on top of gluebi.
> 
> What do you guys think?
> 
> Thanks,
> //richard
> 


JFFS2 needs to work on the block device, so the mtdblock needs to work
on the top of gluebi.

This is directly reflected in the jffs2 mount command, such as

  # mount -t jffs2 /dev/mtdblockX /mnt/jffs2

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
