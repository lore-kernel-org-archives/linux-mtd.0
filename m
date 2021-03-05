Return-Path: <SRS0=7c/v=ID=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C15C433DB
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Mar 2021 08:26:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93C8165014
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Mar 2021 08:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93C8165014
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X+5gsDZP9B9YlbLOwVo/1gc4m9C5c1yBZUHR23wKW5g=; b=AkmAUrcOWAJ99evReqHndIIsCc
	cDnw246Cu7+Y+ql/4ukJF2aHF6fPeyEHuLR9Hzx5UNF+0BCbK7CJ4M2cCgVM6O3I3F6s+SbMXOah4
	JpCLTFhTdEBBFb42xtdEZus86sDO2I4ZEmvZzTVnhKB2fZ3NJUnMQzGB9enre63y7f41rLHcVsTvg
	o1xNm655WjHdVhxn7DrljTXDtHECTcPOaw2y0mmxhFJi1pFMXDXjUOQaB8bsC5DVQ3xFL2MNI5EtE
	h3SeytFm4EEzAmOfn/QvFuloH0KW2JUofPL91l8ElGVkJpF6/7Ixr0JinjF8AGAb4fiZGOp1IzCb+
	W4VXuQKA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI5mi-00DzJi-4y; Fri, 05 Mar 2021 08:26:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI5md-00DzIc-Hi
 for linux-mtd@lists.infradead.org; Fri, 05 Mar 2021 08:26:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C09165014;
 Fri,  5 Mar 2021 08:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614932762;
 bh=8kCER71SB1n8leoU2EokvztmF4jGpV7K4ZN1wSNRgdY=;
 h=Date:From:To:Cc:Subject:From;
 b=jATUPn7IhyWdnarY212YsfhDcdb7T5CObxeJPOXvyC1quwn2QrzKatXWTeoyLh1Bo
 1oXI+VqiVs/cNHaFRuZgwUHsvlRjOm+9efhQFV6HXLgf1kbD09mKeyUv0h4tI2As/D
 5M41oqOi+RWWO6aiGgeuz3Pk5IPQbCsj2M3rnsULCrJvXmoaG/nyByH4NCZowJGu/F
 C8SPoM7nM9PG/1esGPMcysWFF0HfN1mtXTWtKoV4z3tTwEzc5uJCTbsOF+QOM+uz1L
 niCFLhYyAZAdmg4xSQ+tr8vhCyyM1vb1ZkZtIvlymwfVV3COF0Yq+anFOYo7GCgYVy
 YBvh0OaxI2YCQ==
Date: Fri, 5 Mar 2021 02:25:59 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH RESEND][next] mtd: rawnand: fsmc: Fix fall-through warnings
 for Clang
Message-ID: <20210305082559.GA137646@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_082603_986665_EFAD954E 
X-CRM114-Status: UNSURE (   7.96  )
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

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a break statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index a24e2f57fa68..bf695255b43a 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -930,6 +930,7 @@ static int fsmc_nand_attach_chip(struct nand_chip *nand)
 				 "Using 4-bit SW BCH ECC scheme\n");
 			break;
 		}
+		break;
 
 	case NAND_ECC_ENGINE_TYPE_ON_DIE:
 		break;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
