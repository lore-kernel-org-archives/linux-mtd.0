Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B34AC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jun 2022 02:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yRX/DsKcbhClzsWK0T5obpgS9Kdc3dB8lKFfyjQhRUk=; b=yEvm63BmyIovpk
	wDt+SdkhZGDE3G89r5VLkKlkDrduivGF+DKd+Ct8JrI50/qSelCn2ItX0OhtdTuOXXH0APz/fbLSC
	FxCzARMAuM+NhGpcnT16B742rUTG8lguhnKuPH6WdXZmFdFKTwkih7h/jIo29F1XKfe3GzXEAvFPZ
	sngTvWgmWHcHDYFVmwGuHkVWpt7v4oFKjN7JP6Nr413dfZaLRarUNTY5v8aTOuBXbez3dMDGy2XdS
	uKS/cdCjWGmeDxH2tw9WZi6621w5lBf3LgvmIsChhBN1XgH70gvy9T65/3ih1BKNgpcKJbvtBfX/d
	oZK1MFZid4vSIeI0hffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwENq-00DUst-Rk; Wed, 01 Jun 2022 02:46:54 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwENl-00DUir-5h
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2022 02:46:50 +0000
Received: from kwepemi100015.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LCYQh2zxTz1K97w;
	Wed,  1 Jun 2022 10:45:00 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi100015.china.huawei.com (7.221.188.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 1 Jun 2022 10:46:39 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 1 Jun
 2022 10:46:38 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>,
	<kirill.shutemov@linux.intel.com>, <willy@infradead.org>,
	<s.hauer@pengutronix.de>, <ext-adrian.hunter@nokia.com>,
	<Artem.Bityutskiy@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH v2 0/2] ubifs: Fix bugs triggered by fadvise
Date: Wed, 1 Jun 2022 10:59:58 +0800
Message-ID: <20220601030000.49714-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_194649_409579_F71AA6FA 
X-CRM114-Status: UNSURE (   4.53  )
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

v1->v2:
  Adapt folio changes in ubifs_releasepage(). bcaabc554("ubifs: Convert
  to release_folio")


Zhihao Cheng (2):
  ubifs: ubifs_writepage: Mark page dirty after writing inode failed
  ubifs: ubifs_releasepage: Remove ubifs_assert(0) to valid this process

 fs/ubifs/file.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
