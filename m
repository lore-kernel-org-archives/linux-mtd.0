Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B140C531CC
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2026 08:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8nIFHC1RZrZQH4SZ1EJ63mjgXfoCvZ6aF1FBW3h+mBY=; b=GRZMeXbynp5yFn
	hoWxdii93b5rfFkoLHbszioXY+FGP1lP2DZEBJY8KwDLhhk2WjKHJKDBM7lAK1G4LVvEEzdHleoa0
	SjCcedBf2DgMAVQGKtWQZOslzZrJtc50V8la9rEwkooN/Qvuwim3uotpmLMZW/AQuNNowec5RjNLd
	/M8cfOUOgguXk1wVXG2uwTHKwTFf0PShw6sjipV2deWeFquq6d4vLF2RTNyXmpnRjkgDF0XcaP3ru
	YZZWpyIf0nKDSGUEXa2UHPepxDZWc+9aKwlwAHWYxXU6OUQHpB4B4B1li+fkIKR7zX8LByq9jBhq0
	2dRGFybS6zpHEGgIQrdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmokU-0000000DiwQ-2EfG;
	Thu, 23 Jul 2026 08:25:46 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmokO-0000000DivO-48mA
	for linux-mtd@lists.infradead.org;
	Thu, 23 Jul 2026 08:25:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=q7HPNQ2t8lDNN4zINFYU+eZaaXvZCOEtC2pH1AtpVRY=;
	b=aXRWBlbd9v8XinpFmWj8I4JtSDm8gA7MeoiHFDS0dPRo1mgstrSxYcr+QzT/U/SqyokCoCd+z
	pKZ27W561sIwEe82KqX7NwIIvVKjVv21XFG/vJsu1w3xURJsGwA+Hmk8EXWoOBDQF2byHTavBbt
	E/zN3oj9hQOlO5Xic63VGNE=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4h5P8N2JRrz1T4Hh;
	Thu, 23 Jul 2026 16:16:04 +0800 (CST)
Received: from dggpemr200001.china.huawei.com (unknown [7.185.36.96])
	by mail.maildlp.com (Postfix) with ESMTPS id 378B140538;
	Thu, 23 Jul 2026 16:25:26 +0800 (CST)
Received: from huawei.com (10.50.85.155) by dggpemr200001.china.huawei.com
 (7.185.36.96) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 23 Jul
 2026 16:25:25 +0800
From: Ran Hongyun <ranhongyun1@huawei.com>
To: <ranhongyun1@huawei.com>
CC: <artem.bityutskiy@linux.intel.com>, <chengzhihao1@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vapier@gentoo.org>,
	<vigneshr@ti.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: Re: [PATCH 2/2] UBI: support per-device wear-leveling threshold
Date: Thu, 23 Jul 2026 16:16:39 +0800
Message-ID: <20260723081639.3651721-1-ranhongyun1@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260723020233.3079997-3-ranhongyun1@huawei.com>
References: <20260723020233.3079997-3-ranhongyun1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.85.155]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemr200001.china.huawei.com (7.185.36.96)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_012541_498431_A27E869F 
X-CRM114-Status: UNSURE (   3.84  )
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

Here is the link to Sashiko's comments https://sashiko.dev/#/message/20260723020233.3079997-3-ranhongyun1%40huawei.com

Thanks,
Ran Hongyun

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
