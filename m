Return-Path: <SRS0=2MvH=Q3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A63AC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 10:17:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BA0121773
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 10:17:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uTE8mbkh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BA0121773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q5GSVXjV+bUKDmS3HKrAOAyncqyup9bQF3ui4D3olvM=; b=uTE8mbkhUOylmg
	rS+ut3c1OZ9aUTqAtb7HSOnqNAvI6VVenIi3muP+WiKVupws75CeT38gjZhaGLTyVuZwelalhZdFX
	jT2AQ7D+VSruQTsxqmufV0vcxTAm0U1qn6nIPuRX6Ub6jqWJI35Wt2uA4Ypq0fyGB3pKQcT7Dg8t/
	7BOr/yUkPkGCLQQvwV7jiwhtfKdAi+JSDlqfU28nQKn+kkQFOj9j/35BvUc2LV4wkWX8HipPHOTif
	4eYSzEH5SCsJ80w5ss46dGmsvdDOnRa8zb7qCnDNOkPMfNETzmRngqaveQMYVaai/3LKZRfHeSaNu
	oLJJvn7vSUc15N6XawpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwOwZ-0007e8-Ik; Wed, 20 Feb 2019 10:17:35 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwOwU-0007TM-TO
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2019 10:17:34 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4EC6875236298C4075B6;
 Wed, 20 Feb 2019 18:17:25 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.408.0; Wed, 20 Feb 2019
 18:17:15 +0800
From: Hou Tao <houtao1@huawei.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/2] jffs2: fixes for file creation failed halfway
Date: Wed, 20 Feb 2019 18:21:31 +0800
Message-ID: <20190220102133.7878-1-houtao1@huawei.com>
X-Mailer: git-send-email 2.16.2.dirty
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190220_021731_270129_1EB29AB3 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, houtao1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

There are the fixes for file creation which failed halfway, the first
one is used to reclaim flash spaces had been used by the inode, and
the second one fixes a BUG assertion in jffs2_do_read_inode().

These two problems can be reproduced by concurrently creating files
until no space is left, and then removing these files, and repeating.

Comments are welcome.

Hou

Hou Tao (2):
  jffs2: reset pino_nlink to 0 when inode creation failed
  jffs2: handle INO_STATE_CLEARING in jffs2_do_read_inode()

 fs/jffs2/dir.c       | 28 ++++++++++++++++++++++++----
 fs/jffs2/readinode.c |  1 +
 2 files changed, 25 insertions(+), 4 deletions(-)

-- 
2.16.2.dirty


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
