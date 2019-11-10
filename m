Return-Path: <SRS0=dr70=ZC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F16C43331
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Nov 2019 15:35:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 978F920842
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Nov 2019 15:35:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WK07m+so"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 978F920842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DfE+RfYYyqUtxTTuByTRJ5ezPZKPlNQ/5e9Z+9W20FU=; b=WK07m+so9OJOT3
	g0126GnBDxlqrrWJll/mUyg9xpmaSoqU3GIYnEeHLEolOW0/VUIfLwxa/ZdLNal7v6w3IgqwgcX5N
	nEDcSjy/Tf3h3vwfKj/82v/UWcsIjqY6qOLQCyJIwq38v0YoFFjWffOvdEEtSBc2yu/lSevQjSsto
	Wdw3PTfA9HgOeG7v402c9i6Qi7gIok8lhunxcHMCUCTIP+fe7sXgZLD2PioMDlSTCQbKKBiHC9NEA
	Razb1kv6Y4EpVg4NUqg9u7641TkgPkmpogTZnYDEhQTswlHIeAFXe16OnWNXpLJ6Wt9n+6zEVnp0f
	lND5ZY0uRK1A75Y+px2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTpEv-0008FS-DB; Sun, 10 Nov 2019 15:34:57 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTpCI-0005ch-QQ
 for linux-mtd@lists.infradead.org; Sun, 10 Nov 2019 15:32:17 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 0AD7A181099FA;
 Sun, 10 Nov 2019 16:32:13 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 1CpnlixEyB3j; Sun, 10 Nov 2019 16:32:11 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id xjTsroIr22RH; Sun, 10 Nov 2019 16:32:11 +0100 (CET)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 12/15] nanddump: don't leak copied command line arguments
Date: Sun, 10 Nov 2019 16:30:56 +0100
Message-Id: <20191110153059.28878-13-david.oberhollenzer@sigma-star.at>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191110153059.28878-1-david.oberhollenzer@sigma-star.at>
References: <20191110153059.28878-1-david.oberhollenzer@sigma-star.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191110_073215_025848_5C6AD1D4 
X-CRM114-Status: GOOD (  10.57  )
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
Cc: richard@nod.at, David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

For some command line flags, the argument string is copied. Simply
writing over the buffer leads to a resource leak if the same flag
is specified on the command line more than once.

This patch adds a free() call to the old buffer before overwriting
it with the new copy.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 nand-utils/nanddump.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/nand-utils/nanddump.c b/nand-utils/nanddump.c
index 2f167bb..841ed67 100644
--- a/nand-utils/nanddump.c
+++ b/nand-utils/nanddump.c
@@ -162,6 +162,7 @@ static void process_options(int argc, char * const argv[])
 				start_addr = simple_strtoll(optarg, &error);
 				break;
 			case 'f':
+				free(dumpfile);
 				dumpfile = xstrdup(optarg);
 				break;
 			case 'l':
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
