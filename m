Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48439C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 03:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hdQzISZDB78Sc6/0SqalXvVi54qNXEzeLTSnFBXENgo=; b=VUf1fbegUSgI+M
	i2Hfj+F9iyuw2DRfkW0HaZP5xMlqCu+WfQ/XRtYpAVhZ4/TVU7W+dDOgPlgyFwAkql0npFM5/aVQD
	EnA8G2G6Ly4a+2jpACxIyNKEm8BO4/GcQMVcsUV3ciawrtdyzlom0ketTZARNKq0zviUSw2I6y1u2
	JZ5i2/kQZzmmiPu+eYYQ3W/HzttC5vFFLoWz3mdl3XnSAtnCf1Moe4kw8lkjbDr+QzyoACSR7JE4C
	E8Zejhk1YEsUyJjdxkQ85RYaEweais7mDaC/q4RzYjp2MhBDXa5XHdIcbfykmU9cIh8E/876J3fry
	OCDTrDxMVMCeJoGIL6dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKtqz-00Cmsm-JE; Fri, 18 Feb 2022 03:22:41 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKtqw-00Cmpq-8i
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 03:22:39 +0000
Received: from kwepemi100011.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4K0H5Q3z23z9sjk;
 Fri, 18 Feb 2022 11:20:42 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 kwepemi100011.china.huawei.com (7.221.188.134) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Feb 2022 11:22:21 +0800
Received: from linux_suse_sp4_work.huawei.com (10.67.133.232) by
 kwepemm600010.china.huawei.com (7.193.23.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Feb 2022 11:22:21 +0800
From: Liao Hua <liaohua4@huawei.com>
To: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>,
 <yangds.fnst@cn.fujitsu.com>, <david@sigma-star.at>,
 <daniel.wagner@siemens.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <wangfangpeng1@huawei.com>, <liaohua4@huawei.com>
Subject: [PATCH mtd-utils] nor-utils: fix memory leak
Date: Fri, 18 Feb 2022 11:22:19 +0800
Message-ID: <20220218032219.97114-1-liaohua4@huawei.com>
X-Mailer: git-send-email 2.12.3
MIME-Version: 1.0
X-Originating-IP: [10.67.133.232]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_192238_504168_4FEF9653 
X-CRM114-Status: UNSURE (   7.44  )
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

From: liaohua <liaohua4@huawei.com>

This patch replace "free(rfd.sector_map)" with "free(rfd.header)"
to fix memory leak.

Signed-off-by: liaohua <liaohua4@huawei.com>
---
 nor-utils/rfddump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/nor-utils/rfddump.c b/nor-utils/rfddump.c
index 01ab4c2..78ec443 100644
--- a/nor-utils/rfddump.c
+++ b/nor-utils/rfddump.c
@@ -256,7 +256,7 @@ int main(int argc, char *argv[])
 	if (!rfd.sector_map) {
 		perror(PROGRAM_NAME);
 		close(fd);
-		free(rfd.sector_map);
+		free(rfd.header);
 		return 2;
 	}
 
-- 
2.12.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
