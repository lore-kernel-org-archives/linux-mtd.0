Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A25C4453E
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2026 06:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jeTdwBU61h19CVJSrEJuQ7Gg6PgmKDnIe/T15dOsims=; b=hx9L1/xTCJm6iQ
	JuimsyxWIB4AFoi4HR2ODm699hT6pHdxysmJ/h4w6JUf9O5qVDCPfy0oG86xagS8L127TDrT0XVPZ
	pt8QKp+iRzGc53LxmtldZ6EcOCHjoPBqDWzFB4Gw8QdaGxpDdM5AQs50d7QbQ6NEoS5XhDSisBLTm
	wcByjZiHle8rZ2DYA6XurDWmKreeA/UxqW/dA2sagsKm5fnQkAqvcaGeBkkz2MtHra1Tmdf+l1dPz
	TR48wYNg1Y8mMWAqkCIhJnGgXIC7FBKmDhp3BUvJ13R+rrPGCaS/GUaoO4eDLQdiyRTWVFk/I0/dW
	5dARpFlTd9PRfYUI0K3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmmid-0000000DXGb-2bb5;
	Thu, 23 Jul 2026 06:15:43 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmmia-0000000DXG8-28Tz
	for linux-mtd@lists.infradead.org;
	Thu, 23 Jul 2026 06:15:42 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rLplc6xs1MMMg8YHWJFViFsfJ9sgkoImtpjCtUqawQw=;
	b=w4WjF4ViQ+yk7Ih2RZGqVimaRZboZ0MDw9BonKwj+bs17WM/WSRzpcdqRWYiDAOyjrSDKnKQC
	UjY8LI3KbwOjzLv9TYURXTf0SXvf7fQQyv24bHHN3TWfrT8soPFZnW1kD6/rAUy7oAT/x8AnPtw
	8CGOPHZtwxsr5b7zA6DKR0U=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4h5LGK6VJkzKm9T;
	Thu, 23 Jul 2026 14:06:01 +0800 (CST)
Received: from dggpemr200001.china.huawei.com (unknown [7.185.36.96])
	by mail.maildlp.com (Postfix) with ESMTPS id 9DFE54056C;
	Thu, 23 Jul 2026 14:15:27 +0800 (CST)
Received: from huawei.com (10.50.85.155) by dggpemr200001.china.huawei.com
 (7.185.36.96) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 23 Jul
 2026 14:15:26 +0800
From: Ran Hongyun <ranhongyun1@huawei.com>
To: <ranhongyun1@huawei.com>
CC: <artem.bityutskiy@linux.intel.com>, <chengzhihao1@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vapier@gentoo.org>,
	<vigneshr@ti.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: Re: [PATCH 2/2] UBI: support per-device wear-leveling threshold
Date: Thu, 23 Jul 2026 14:06:43 +0800
Message-ID: <20260723060643.2939964-1-ranhongyun1@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260723020233.3079997-3-ranhongyun1@huawei.com>
References: <20260723020233.3079997-3-ranhongyun1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.85.155]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemr200001.china.huawei.com (7.185.36.96)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_231541_272269_B4AD07DD 
X-CRM114-Status: UNSURE (   3.48  )
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

Reply to the issues raised by sashiko: The struct size is unchanged,
and all existing userspace programs zero-initialize the struct
ubi_attach_req, so wl_threshold reads as zero and falls back to 
CONFIG_MTD_UBI_WL_THRESHOLD. No backward compatibility issue.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
