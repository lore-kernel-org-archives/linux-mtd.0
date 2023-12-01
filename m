Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD93C4167B
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Dec 2023 18:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QYDfFZtNcyKdW5nbHJLD181Z3FAiAe4GlQi+ki6YYMI=; b=u66JnUsXPbnCqc
	+qVoHfoZaySwZ2HRJ5erX5Z/HWSTrcsOKgsFutHDkVc14K5GrzYAhGBu9iPka/0UgbLCageFObznM
	lD6Bfjg0kBFoiehlje9xvr8wNByZaIJnTeJts4mvOxFcpI6GgeLT/Zx4lvWqlg/f0S2kj8V1rTBST
	aHimIwnlvrSqwFhtawNW7QK9DW/BaxD8W4GYJQIR9Xx04tFwWVsTutEHlTU8OO16NqMQamJyMnukt
	zx+bVFHzwvSN1shqueZp5ulqbH0ILx6ZhodH34COHGFcUbXYpCKDqshnESNkRI0MqZtsOsLCHn02+
	8BCGmV2Ey9Xqwqwkx8Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r983h-00EPcV-2O;
	Fri, 01 Dec 2023 18:16:13 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r983f-00EPbR-08
	for linux-mtd@lists.infradead.org;
	Fri, 01 Dec 2023 18:16:12 +0000
Received: from bld-lvn-bcawlan-34.lvn.broadcom.net (bld-lvn-bcawlan-34.lvn.broadcom.net [10.75.138.137])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id A6970C0000D4;
	Fri,  1 Dec 2023 10:16:05 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com A6970C0000D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1701454565;
	bh=oOit/4rL2wvddJb+2fxKmDWbNk0f7jYnHz9/Hr/bK+c=;
	h=From:To:Subject:Date:From;
	b=C4tDQY8EKcPwDOkiiufmRVq8/AV+fmjWbbxXz9rWjYHsRquZSCpJtqNOXCJpwi7gO
	 /LztMBDdDSpGUScW6K3X0vre14j350zSWmAK2+ukeBiZrMV67+1Jtmx/PwuKpUy0LZ
	 GX+49kybcRVrRovdTPAh0ufSlwFx07Hbr/K6F+/8=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.75.138.105])
	by bld-lvn-bcawlan-34.lvn.broadcom.net (Postfix) with ESMTPSA id 6C42F18728D;
	Fri,  1 Dec 2023 10:16:05 -0800 (PST)
From: dregan <dregan@broadcom.com>
To: dregan <dregan@broadcom.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH 1/1] mtd: rawnand: Add deassert_wp comment
Date: Fri,  1 Dec 2023 10:15:42 -0800
Message-Id: <20231201181542.421077-1-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_101611_167655_423018AB 
X-CRM114-Status: UNSURE (   8.49  )
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

From: Boris Brezillon <bbrezillon@kernel.org>

Add deassert_wp description comment

Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
Signed-off-by: David Regan <dregan@broadcom.com>
---
 include/linux/mtd/rawnand.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index fcad94aa0515..3049b05d8a20 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1001,6 +1001,8 @@ struct nand_op_parser {
 /**
  * struct nand_operation - NAND operation descriptor
  * @cs: the CS line to select for this NAND operation
+ * @deassert_wp: set to true when the operation requires the WP pin to be
+ *		 de-asserted (ERASE, PROG, ...)
  * @instrs: array of instructions to execute
  * @ninstrs: length of the @instrs array
  *
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
