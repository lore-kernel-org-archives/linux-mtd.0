Return-Path: <SRS0=TlnG=ZO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02BF3C432C3
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Nov 2019 06:15:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBC6120708
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Nov 2019 06:15:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aEKtAxXo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9G61iSV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBC6120708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1A6r2B8YU9gEkeJt+g/Y91EJPcvKj/hPrqhn1do/cDo=; b=aEKtAxXo8GuCPc
	QfSpmqBAAUvz3xXlViPuPTUJAjh3uYwTa+0ZMrGJ72GcFdPvKRjFmDL5oFRH7NLGoRvVujJEUjZ9D
	y6Zez2azeYw360OdniXyV9LStp4Gos2cG+AWyXOYqtvk8LrMCwr4oUuFQgUxdsmIFFXFT1rdXovoq
	8ypj3+DxC8sU82kqy2VCsOMBHCTeMVHRDfHtuLFTpeX8WTJAoy3xL9bzM8JU4S3AxeeC99jE++5n+
	E2uRy5Zc6qvKU+tc1h2rlLm+8ViZB8wIr5eWSIhxe7wqKidpw0GMHkB96AS2iV1VJAeN1slFvZ00C
	zd29ryu0dfWrgtG5pS8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iY2E2-0002uo-42; Fri, 22 Nov 2019 06:15:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iY2Cy-0000iy-Kc
 for linux-mtd@lists.infradead.org; Fri, 22 Nov 2019 06:14:22 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE58A20707;
 Fri, 22 Nov 2019 06:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574403259;
 bh=v2yq6QuBQJWjhwP+bGg0C5drFr5wc3WHgW3vI2tG9V8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i9G61iSVM2qLV2TX+OVljOYZomPg/5KVEbfGJZJQ2e8zbSqvS7tZl2kl8ilkjVBhr
 pXIi+CqI3bk+t65h/jR2rr/ESmARhHA4ptOo/dhb5NJg0yYzuvzmTma4P7utWrVgzV
 L1rPXhOslnOQkvE2puOOhidLaJZ1bvdHJaMO97Io=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 68/68] mtd: Remove a debug trace in mtdpart.c
Date: Fri, 22 Nov 2019 01:13:01 -0500
Message-Id: <20191122061301.4947-67-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122061301.4947-1-sashal@kernel.org>
References: <20191122061301.4947-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_221420_928503_8C0A50D8 
X-CRM114-Status: UNSURE (   7.63  )
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
Cc: Sasha Levin <sashal@kernel.org>, linux-mtd@lists.infradead.org,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <bbrezillon@kernel.org>

[ Upstream commit bda2ab56356b9acdfab150f31c4bac9846253092 ]

Commit 2b6f0090a333 ("mtd: Check add_mtd_device() ret code") contained
a leftover of the debug session that led to this bug fix. Remove this
pr_info().

Fixes: 2b6f0090a333 ("mtd: Check add_mtd_device() ret code")
Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mtd/mtdpart.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 9b48be05cd1af..59772510452a5 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -624,7 +624,6 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
 	mutex_unlock(&mtd_partitions_mutex);
 
 	free_partition(new);
-	pr_info("%s:%i\n", __func__, __LINE__);
 
 	return ret;
 }
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
