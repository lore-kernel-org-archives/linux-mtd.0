Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2635C25B78
	for <linux-mtd@archiver.kernel.org>; Sat, 25 May 2024 20:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XUmyNCEjxURWoE5z/jD8oTojXoQYVDe1GpDLjpq6zz0=; b=cae5Nwib9tP7IL
	UosvzCYlS0XmVgFB3z+8k6PSum3wdcYZNQS4jjXaMAet06BTXeGNpk5ZmAj4iWmSCvrjrLOWme8f3
	A043jvsE6pmMxDhPpJLLF5+5AzjOumnAv8jn0nXePmIy2u0/KpOoeDTVnp1Fsb+ex0+IaEUlkHDfY
	Qorv5nioCoOyXeNSDZWv0VNxqpla+dp+298nXuFc30O5qGbXDhoZI6fkh7Me8tPCyXVBc9ACSc/r9
	kRGVD68mpekZ1+wIG33I3pA+sqw/k3p0LpGvsCg5e7CjS2hcsCKO56oXRzrRhDz2/XEFs0aNUDNcC
	BbrVqYxvaWNfmS2pjk5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAxxd-0000000BeU5-33sj;
	Sat, 25 May 2024 20:25:49 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAxxa-0000000BeTT-1Qje
	for linux-mtd@lists.infradead.org;
	Sat, 25 May 2024 20:25:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=L8yXfVyv7RnwhIiGInf9JF68oMRoKkvKLcNTX0uZDoM=; b=AcIOfu3DYYRzy5OR
	a3WVMzVoT4zUlhp9Q2CEzrOJZT/gZj86VfBPy0m39BUt8luaxqmJsFLONbSSFVkR47+JRHtcUZdL7
	rzmQnOjm5j/DxzmQNW2GzxCm3WuSV/5/SSFF3uwOFLAm4DU9v8Fl8hgtqgeMo9QUaeSnS6FZA6dJa
	fcqENOKFiSxqi3tipg7zX3p5qiFwZzTi76DYYgskBfcP76s2uJC8ki3U7GZyLa7ZZfApXoO9TezUS
	SCg+7PuRz6xjbDZ6JNrZPDZZwaPwtmw3JWYThJMFCBbokrZnkdirfqJmaGCMrNogySgNJFPp2GWUQ
	hlIezcxhzzK/AqBASw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sAxxM-002XDI-1Y;
	Sat, 25 May 2024 20:25:33 +0000
From: linux@treblig.org
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] mtd: rawnand: cadence: remove unused struct 'ecc_info'
Date: Sat, 25 May 2024 21:25:29 +0100
Message-ID: <20240525202529.120792-1-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_132546_578215_DE83BB26 
X-CRM114-Status: UNSURE (   7.08  )
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'ecc_info' has been unused since the original
commit ec4ba01e894d ("mtd: rawnand: Add new Cadence NAND driver to MTD
subsystem").

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 04f84d87c657..ff92c17def83 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -531,11 +531,6 @@ struct cdns_nand_chip {
 	u8 cs[] __counted_by(nsels);
 };
 
-struct ecc_info {
-	int (*calc_ecc_bytes)(int step_size, int strength);
-	int max_step_size;
-};
-
 static inline struct
 cdns_nand_chip *to_cdns_nand_chip(struct nand_chip *chip)
 {
-- 
2.45.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
