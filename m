Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC88FC46467
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Jan 2023 09:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EjdZ619MFO8pJfR9FkifZ36B+R8bilJtemol1hD+kHM=; b=cbPmnfClwdfKTw
	tVfhToDvbUiYvo/uA7MddVQYt+t3xAsP7AN0GraI7gllKGQjCRgKVJDijrH1eW+Po0U6S7tkTSmhI
	9tIhZlLbZ2fIjg8+hF4aysmYJZxn8avwWS29VAApPfbyCIRy2VIm3G2Gwoo7ZL3EA9uU9mKGyWrBm
	Nlr1/5TZ+r3BZaO7W6OWxX9N8NwlriIGDuq/JBFUEFJV8SGlS/8jUz+04QVpAnL25E52G825og+Sl
	dcY2NLjYXVK0biuZW52mh/eQz+YANuB7rmrhbwwxuzoSCH+7qv7yekENrJnwwgGhrO8PqWpB/HQ39
	oXanpupaklBy0h9iypRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHM5z-009T1C-He; Mon, 16 Jan 2023 09:48:03 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHM5m-009SsU-Nq
	for linux-mtd@lists.infradead.org; Mon, 16 Jan 2023 09:47:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D7D4810000A;
	Mon, 16 Jan 2023 09:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673862465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iovkvBdCIqu8LeMuEk5/sBiaBBiNcoPwgU6qzxfo5Ls=;
	b=YIrjIL4uK9oFAYl495P2lOXWw7SfEYoJ71noj4DFa8VLDfxkRQbr1Hg3PRAyPw0JMYaHxA
	1+Luxa1gozFEYVFe16GuTj922BKEOLLaKzQc+dnUCzGEGJjeo5Eb/yto45GSIXjbTLAhQq
	ymBF55vPv++lljFhAGwo7hL2CXmEP0hIAR4fHEdziU8kHgcHKDxQywH/+Zf082UpWP+1v7
	1JV1rdG6B8xLTOTElfqxmQ28ScIzD/6obqsI8O8i+ldS+vdJMqGrJyq9SdvuiCMtwW9AjC
	HEcz7RmvJUoXemxLMJ3GVvseqW1nBWViQWNyDFj5w+yhA0Zjl/2sPFvrwnvtqg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] mtd: rawnand: Fix nand_chip kdoc
Date: Mon, 16 Jan 2023 10:47:35 +0100
Message-Id: <20230116094735.11483-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_014750_961355_7B64223B 
X-CRM114-Status: UNSURE (   8.29  )
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

Describe the continuous read nand_chip fields to avoid the following
htmldocs warning:
include/linux/mtd/rawnand.h:1325: warning: Function parameter or member
'cont_read' not described in 'nand_chip'

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 003fe4b9545b ("mtd: rawnand: Support for sequential cache reads")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/rawnand.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 1b0936fe3c6e..f8d4be9c587a 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1260,6 +1260,10 @@ struct nand_secure_region {
  * @read_retries: The number of read retry modes supported
  * @secure_regions: Structure containing the secure regions info
  * @nr_secure_regions: Number of secure regions
+ * @cont_read: Sequential page read internals
+ * @cont_read.ongoing: Whether a continuous read is ongoing or not
+ * @cont_read.first_page: Start of the continuous read operation
+ * @cont_read.last_page: End of the continuous read operation
  * @controller: The hardware controller	structure which is shared among multiple
  *              independent devices
  * @ecc: The ECC controller structure
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
