Return-Path: <SRS0=dDgs=E2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 739AAC2D0E4
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 18:41:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB59922464
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 18:41:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wPjRZaEz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mk9MEjo7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB59922464
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CZNTT/LIh1kLarhy5ZmU37o2XNgRm91aShhPUU7vBoY=; b=wPjRZaEzLRfiAzq2CG1WJxB3r
	EOOruIRgPqkRvL1RBxuL5r6Ub7y7x+yUYvVSlnzhc5lP3bvxxHSaCUYDV3acRAvqvouXh2laRj1Xe
	6U+V0rznni/DKmMlhHuFdqe/RXg+X1Xl7WNyeLxVCmvKyxInSXQSBfIufLHA+heYvdq+mFFSyD/j5
	vlRgXZG4KP6CHCBNzMi9xZ6Ng+WjjGMVufiDAqECOUqx4NtCqf4jCZdC243s7kMmtfVz6fysT+OLB
	uZoT4o1KonPZIZg88s95kzok3xc5YtqwVJaNz4Xp6E4WSfui1XreoK2QFM8kOdjRI0cgQk0VyFian
	iJluj1Ehg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgBKV-0003ub-Lc; Fri, 20 Nov 2020 18:40:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgBKS-0003to-Q1
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2020 18:40:17 +0000
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 74D082242B;
 Fri, 20 Nov 2020 18:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605897616;
 bh=wudRPP+wqVsv4+yGObzaOuxmgZG9U6wManSiQKXTp9Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mk9MEjo79V+BzFEhe/4/27YbZZSwG2D/amMJ2qUK3ttuSO2YOcj1P3+2Hy/2cNjog
 fyWLNx8xun49tk4kv9GB3BCP4uWJMQ0+fvjcA5qB7gRUuuuBtJqGvdT6a+3yoyO+bS
 svMmEQpIOaG+AZ99G/il4YGp9fCcdu94aY1xppW4=
Date: Fri, 20 Nov 2020 12:40:21 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 132/141] ubi: Fix fall-through warnings for Clang
Message-ID: <f0e64930fe514c59ff2354b1c17f1341e70366c6.1605896060.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_134016_927330_AFEF2A1D 
X-CRM114-Status: GOOD (  12.93  )
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
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a fallthrough pseudo-keyword instead of letting the
code fall through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/mtd/ubi/build.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index e85b04e9716b..75b6e98db775 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1353,6 +1353,7 @@ static int bytes_str_to_int(const char *str)
 		result *= 1024;
 		if (endp[1] == 'i' && endp[2] == 'B')
 			endp += 2;
+		fallthrough;
 	case '\0':
 		break;
 	default:
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
