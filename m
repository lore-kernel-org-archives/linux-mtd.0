Return-Path: <SRS0=MywH=JJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67694C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 09:36:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E87EC6121E
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 09:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E87EC6121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4YJCj81PDH55O9fsxC7tAazw6BdwPBSH30D8QBBvSFo=; b=Qaej7+1ndfthZRSnAZZxEi/kFd
	O0r9xobChIA8Y8qruJynXTV9q0tpxhDIXIVz/zg9ZtKWjXtWGoMjVz08KvElz5nt7rMNcspMHfO+H
	Gf8dujhagBJmY5X2EZEU90WS/EJpCga9Ocj4a4XMn87g7qLuYIQKQgGgGb6RJwt5v3/k0RCkXwT6Y
	bMMoCnJ9fET9O6HaFdCYb61QoK6areZ0tUT+95dyonXsaFTTuRqmW2uAJlayzSA+3hVGrwabfF54b
	gBrSX0ozovKlHCLZYYSlDpHInC7HnyfPJIwD8n/JcTPcTfaYlSXvtLzqvc6f0o93rvOygbrGAt8Jr
	Kh61bY0Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVsz6-006IjQ-Fr; Mon, 12 Apr 2021 09:35:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVsyn-006Iep-4f
 for linux-mtd@desiato.infradead.org; Mon, 12 Apr 2021 09:35:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=XK5iFrfYhqn+obs9srmi6ZkJ5YfL87qVGfMNuQrWBfQ=; b=PSDy53mZb71WxSmMwo2tpb6Zkj
 +X7iObE+MY2UL5IDcbnPt5Sbeln2It96WVH1Ufg2rN/MQzObN40SxaUNT7XefwLb+nZsoVywDN3tE
 TE3bvH+O0T2o5+0T+YCJRVfHTGEHDXQmv9tE1W644YmMOD0TMM+oVra16xwZAEFtENsGGytZ5i48K
 tVwdDrBhj6fHsHeIaN3tGnFEzzIv7YoDcB+/njXO5E73rKguiUJXrFVYQ88lko8fn9HMRYYPmlwce
 5MLo0kWyKTwXj7oMMXDyvbDXiYFn7DXY3GmXH5I3Uure1JI8ix/HVp7fsMfnANgf65nz/It51vm0S
 QbL8g+iQ==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVsyk-0064PQ-84
 for linux-mtd@lists.infradead.org; Mon, 12 Apr 2021 09:35:35 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FJk7G6Wdcz1BGfw;
 Mon, 12 Apr 2021 17:33:14 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Mon, 12 Apr 2021 17:35:21 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, Tian Tao <tiantao6@hisilicon.com>
Subject: [PATCH drivers/mtd v2 0/2] convert sysfs sprintf/snprintf/scnprintf
 to sysfs_emit
Date: Mon, 12 Apr 2021 17:35:42 +0800
Message-ID: <1618220144-33839-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_023534_492193_E7636D47 
X-CRM114-Status: UNSURE (   5.57  )
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

Use the generic sysfs_emit() function to take place of snprintf,
to avoid buffer overrun.

v2: rewrite the commit message

Tian Tao (2):
  mtd: core: Convert sysfs sprintf/snprintf family to sysfs_emit
  mtd: mtdpart: Convert sysfs sprintf/snprintf family to sysfs_emit

 drivers/mtd/mtdcore.c | 35 +++++++++++++++++------------------
 drivers/mtd/mtdpart.c |  2 +-
 2 files changed, 18 insertions(+), 19 deletions(-)

-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
