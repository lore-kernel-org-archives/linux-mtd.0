Return-Path: <SRS0=tjU8=CX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA46C2BC11
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 14:00:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB96E20E65
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 14:00:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aiUZ6Lal"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB96E20E65
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n/EOCPNaxaNFw+6EEuJkoGSH+ADTrAU/pUJBIpReHnE=; b=aiUZ6LalGRa2FKsLoQQsZmxv68
	7VbJ0jcyNPMri5uanf5DqoH6PIA2pryBA2tyfS8ZZgFnY9YpPYdRWR8QXVXnzieBPkP0kZnvP00oY
	CfzwMWFNRBpMPbC4w+2KRqjZu4gDDSupjjg2VETXA/fc2kU/yStV/PyjoS7P6pk9LFuQ8cR1Tc0lq
	3R5TW9VjBhZ/IY+nY5rH7lQAmxAXlybZgKNsT/hMDOB/qJdT0aTlT7Ly1K7oeeD8V1BnrEqCemiK3
	q4nM90tLS0vwQWGkb+pmnlabmCy1OfVVMa4DK1Rag47OKiwpMYaB3Ku8PtpoSKfXZzUqkN49JEaZj
	tLFLMkmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHp1h-0003A5-SV; Mon, 14 Sep 2020 14:00:13 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHp1Y-00035P-4n
 for linux-mtd@lists.infradead.org; Mon, 14 Sep 2020 14:00:06 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 93EFCBB7559C96A72334;
 Mon, 14 Sep 2020 21:59:48 +0800 (CST)
Received: from huawei.com (10.175.113.133) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Mon, 14 Sep 2020
 21:59:42 +0800
From: Wang Hai <wanghai38@huawei.com>
To: <richard@nod.at>
Subject: [PATCH -next 0/4] ubifs: Fix some kernel-doc warnings for ubifs
Date: Mon, 14 Sep 2020 21:56:50 +0800
Message-ID: <20200914135654.55120-1-wanghai38@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.133]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_100005_329534_6C1624D3 
X-CRM114-Status: UNSURE (   7.04  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In the ubifs module, there are some kernel-doc warnings,
this series of patches can fix these warnings.

Wang Hai (4):
  ubifs: Fix 'hash' kernel-doc warning in auth.c
  ubifs: Fix some kernel-doc warnings in gc.c
  ubifs: Fix some kernel-doc warnings in replay.c
  ubifs: Fix some kernel-doc warnings in tnc.c

 fs/ubifs/auth.c   | 2 +-
 fs/ubifs/gc.c     | 4 ----
 fs/ubifs/replay.c | 2 --
 fs/ubifs/tnc.c    | 3 +--
 4 files changed, 2 insertions(+), 9 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
