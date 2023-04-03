Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D17CC7619A
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Apr 2023 02:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=On4/n/QdGozMZiG7KnaHQ5dBGO9gL8azGdWlOUwrLug=; b=Lv2QvKN2IpsfLp
	sFdzyjegu2NRqsFnT6kDgi7/MTT5VdR5rBEr4Cg5dRT0mPXIcZgsfyIwIy90sXpgMbDUDstz6I9Qn
	DbSsVVCMFz8/HIK4B1wIHeND1vCEiX4uFx1KfM3+vCuwiTPq9NdvHQzqKAphT/h/iEdHaw7eiIE1Y
	NStibOK8FRF9fnN4H8JDXCT7TwswtX9izCVeLmji7LHR3IGsUoUIgL+h53MItYE1+d+PsfUSyOCuk
	lwtHMWBfcO9wcWuEokZnI3x1C4L0ZtrgfyGKW4tF54FZIn5HarYgRbimz47t/1NeHiXbc/AV8GWA1
	+F2WRfIG9JANPHBeq4Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pj9Yl-00Du5N-1S;
	Mon, 03 Apr 2023 02:04:39 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pj9Yh-00Du4G-0Z
	for linux-mtd@lists.infradead.org;
	Mon, 03 Apr 2023 02:04:37 +0000
Received: from dggpemm100009.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PqYyP1jsMzSq72
	for <linux-mtd@lists.infradead.org>; Mon,  3 Apr 2023 10:00:45 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 3 Apr
 2023 10:04:27 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <linux-mtd@lists.infradead.org>
Subject: Two bug fix commit fixes in the ubi_resize_volume() were fixed by a patch in the mailing list
Date: Mon, 3 Apr 2023 10:04:02 +0800
Message-ID: <20230403020402.2261218-1-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_190435_398236_A5E7086C 
X-CRM114-Status: UNSURE (   6.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi

    Mainline fix commit 1e591ea072df ("ubi: Fix unreferenced object reported by kmemleak in ubi_resize_volume()")

and 9af31d6ec1a4 ("ubi: Fix use-after-free when volume resizing failed")  involve fixing memory security issues, which

were fixed by a patch [1] ("ubi: fix slab-out-of-bounds in ubi_eba_get_ldesc+0xfb/0x130") that was on the mailing list

in 2022. In addition to fixing the race issue, I think this fix keeping old_eba_tbl might be a better solution to the UAF

problem.


    I'd like to know why patch[1] didn't get into the mainline.

[1] http://patchwork.ozlabs.org/project/linux-mtd/patch/20220124024056.1996763-1-guoxuenan@huawei.com/

Best Regards,

ZhaoLong Wang

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
