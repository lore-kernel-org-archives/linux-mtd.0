Return-Path: <SRS0=3IXU=IX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E06C433C1
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Mar 2021 08:33:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38B8761A16
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Mar 2021 08:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38B8761A16
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PjEGNuD0qHHBvcee/Ye6ONwrlQuWig6KLpXUua8Gqi0=; b=GTOz0MXy8nwIKjwBUo45/0v5s
	W1tHNSQyCq14wC1cPbToAlB0wXKk5ssVZ3pGHZ5u8xLQmKeBwD2KW/E+eBZmfxdfq1cB1D8riHf45
	n/FgeiMmE9l0ZMEMw8ZaDjiyq3qTBUKfnEjUbjBMSQeNkVosQOO1wPdWG8kdsP/WtCC9WfXeCa/Ap
	Gl+FkXmd2uqQNUDjo5n1CiuW7Q8oon6g2dq9g0pVyUf3XgcnwU0uu8Ay+0xUC25PE6sQzbi+5I9Zi
	E1uJcopBKL9lBD/mBIumj0PxgYJVArTbK/dFt3ZRcIg8UHHvjy7rGEuCn+XkZdsvrEEUCqkKsM+GF
	elYch4Iww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPLPb-000wl6-ET; Thu, 25 Mar 2021 08:32:15 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPLPR-000wig-Bq
 for linux-mtd@lists.infradead.org; Thu, 25 Mar 2021 08:32:08 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F5dZY0hzvzlVpQ;
 Thu, 25 Mar 2021 16:29:57 +0800 (CST)
Received: from DESKTOP-FKFNUOQ.china.huawei.com (10.67.101.50) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Mar 2021 16:31:28 +0800
From: Zhe Li <lizhe67@huawei.com>
To: <joakim.tjernlund@infinera.com>
CC: <chenjie6@huawei.com>, <dwmw2@infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <lizhe67@huawei.com>, <richard@nod.at>, <wangfangpeng1@huawei.com>,
 <xukunkun1@huawei.com>, <zhongjubin@huawei.com>
Subject: Re: [PATCH] jffs2: fix kasan slab-out-of-bounds problem
Date: Thu, 25 Mar 2021 16:31:27 +0800
Message-ID: <20210325083127.32796-1-lizhe67@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <CY4PR1001MB2389E99ECB5B04A65BE35E22F4659@CY4PR1001MB2389.namprd10.prod.outlook.com>
References: <CY4PR1001MB2389E99ECB5B04A65BE35E22F4659@CY4PR1001MB2389.namprd10.prod.outlook.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.101.50]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_083207_398365_FA16F7FD 
X-CRM114-Status: UNSURE (   5.39  )
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

>Reviewe-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Thanks for your review.

>It would be interesting to known how you managed to create such a dir entry as that is a bug too.
We discovered this bug by performing fuzzing tests, which simulate bit flips that may occur anywhere in a flash device in real-world scenarios.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
