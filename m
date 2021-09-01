Return-Path: <SRS0=cUeG=NX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB7DC432BE
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 08:23:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14F236103D
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 08:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14F236103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eSg5LRQeiE+jcta3rCTp+B/5KVqTHNL/onpLBez1wLU=; b=dEXqVXiLYek2bX
	HnP+n9+cDJoikUk/j8DraUQ2Ro9vF3WVbcmxrv+3uGHvkkXuCcNd/BWxZGgaXZFAtlWS3Zc2/Zngv
	XBt63ILpbthkDsZklWJPzk5pF9qqIX3ULIc+b7U9ZEcvm6HedXelhFCGQCVZZjmblgbgJOgOuKEAN
	eWrM19RjN6QqLjbzzlg434MRdSte/nithmIkqg/myduHzVZj1R5kczkx4O0b0QmQnT3/wANqk99zc
	2jfWc9Bncid1iCHr0AqupbM6rHuHGsDkJ+w9zlzwZeYaI5GO9YZTlXVF+/URa2sk0ogXonB8VnVwY
	MxSUBKfXFfuAjnolon0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLLWa-004YHa-KO; Wed, 01 Sep 2021 08:23:12 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLL3C-004QD0-5z
 for linux-mtd@lists.infradead.org; Wed, 01 Sep 2021 07:52:51 +0000
Received: from dggeme768-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Gzx8z3Q67z1DDxM;
 Wed,  1 Sep 2021 15:52:03 +0800 (CST)
Received: from DESKTOP-T9ACQLA.china.huawei.com (10.67.103.61) by
 dggeme768-chm.china.huawei.com (10.3.19.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Wed, 1 Sep 2021 15:52:45 +0800
From: Zhaolei Dou <douzhaolei@huawei.com>
To: <dwmw2@infradead.org>, <richard@nod.at>, <jamie@nuviainc.com>,
 <christian.brauner@ubuntu.com>, <trix@redhat.com>, <wangqing@vivo.com>,
 <yang.yang29@zte.com.cn>
CC: <douzhaolei@huawei.com>, <linux-mtd@lists.infradead.org>,
 <wangfangpeng1@huawei.com>, <zhongjubin@huawei.com>, <zengweilin@huawei.com>
Subject: 
Date: Wed, 1 Sep 2021 15:52:09 +0800
Message-ID: <20210901075210.1657-1-douzhaolei@huawei.com>
X-Mailer: git-send-email 2.33.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.67.103.61]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeme768-chm.china.huawei.com (10.3.19.114)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_005250_446229_3F2AFACF 
X-CRM114-Status: UNSURE (   2.51  )
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


When the value of rp_size is greater than mtd->size, jffs2 can be remounted normally.
It can be easily reproduced with the steps listed below.
1.mount -t jffs2 -o rw,relatime  /dev/mtdblockx /mnt
2.mount -o remount -o rp_size=xxx /mnt


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
