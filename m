Return-Path: <SRS0=hRrE=IO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E467EC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 08:53:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8585265002
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 08:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8585265002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bFTrLkKReB48zj+nTPC/aKRIfOraisE0PyUml7PcyDE=; b=rSXKg83l7l8Nt1wiqxsjpc/Wkm
	LHqjR+tid+SR9ZDi7PG8w17XqRa7l2nSaXi22SOR1WAgxnyxJtAMXyzODc7Kd2ujxwaXafsO6fpWY
	/Z4xsXNKTBFmIo/B2HbZ+g7/uiKLj848d0CGglTPodgTm9GSRhdnXcPE2Cr0segOGQGLICL+JmTPS
	gVwlpWE1pVqHBxSQhVFUZBq++Gb9D4Quq6CBNSwOtBQXtwetVla1VnzLBjXh6qfUyraDZChWptdGa
	to1UnVw9ZUZCaftQINVOwWspMt5OxG3T3oxwEGVwU8XU5hyBhd6p4ajEP8qXE5zWszF4DnF8MrQS1
	zXRNioQQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM5Rm-000AGm-96; Tue, 16 Mar 2021 08:53:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM5RK-000ACs-GY; Tue, 16 Mar 2021 08:52:37 +0000
X-UUID: bf6f9933a9014a26b600aa9843c1d2c9-20210316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=asaERHApB7o8tgq8EonZKgJNNZsv+m7lo8P20WfniJs=; 
 b=i6DXK4W6JL1KnmclN874pBW1rCYoLrLxrAvCGzgnuPpOuGXwOZPqvoP/Akz3a2RWWvABRvFVfqE2p2miORxnL2oFZ4Q2L9HSLwGVJhQIOqPuDPjx/5Z7oM6GsGGrWZnELPz6tKvVjL5zsbLxWxsEma2hvzl3gCKLTqXN7soy69U=;
X-UUID: bf6f9933a9014a26b600aa9843c1d2c9-20210316
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <guochun.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 883367390; Tue, 16 Mar 2021 00:52:19 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 01:52:18 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 16:52:16 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Mar 2021 16:52:16 +0800
From: <guochun.mao@mediatek.com>
To: Richard Weinberger <richard@nod.at>
CC: Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>
Subject: [Patch v1 0/1] ubifs: only check replay with inode type to judge if
 inode linked
Date: Tue, 16 Mar 2021 16:52:13 +0800
Message-ID: <20210316085214.25024-1-guochun.mao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_085234_912725_5EB2FC44 
X-CRM114-Status: UNSURE (   6.69  )
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

This patch make sure one file could be deleted completely when write and delete mixed
operations occur power-cut.

Guochun Mao (1):
  ubifs: only check replay with inode type to judge if inode linked

 fs/ubifs/replay.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--
2.18.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
