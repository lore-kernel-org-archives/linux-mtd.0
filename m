Received: from gv-out-0910.google.com ([216.239.58.189])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K8IkQ-0004uw-Bh
	for linux-mtd@lists.infradead.org; Mon, 16 Jun 2008 17:44:06 +0000
Received: by gv-out-0910.google.com with SMTP id n40so987537gve.5
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 Jun 2008 10:44:03 -0700 (PDT)
Message-ID: <90d987c0806161044g4b52faa5qb62be9a7b5882d90@mail.gmail.com>
Date: Mon, 16 Jun 2008 23:14:02 +0530
From: "rohit h" <hrohit85@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH][MTD][OneNAND]Update oobretlen in onenand_write_ops_nolock
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We are missing updating the oobretlen return parameter
in onenand_write_ops_nolock. This patch fixes it.
Regards,
Rohit H
Signed-off-by: Rohit H <hrohit85@gmail.com>
---
--- a/drivers/mtd/onenand/onenand_base.c	2008-05-30 13:04:59.000000000 +0530
+++ b/drivers/mtd/onenand/onenand_base.c	2008-06-16 22:27:02.000000000 +0530
@@ -1554,6 +1554,7 @@ static int onenand_write_ops_nolock(stru
 	}

 	ops->retlen = written;
+	ops->oobretlen = oobwritten;

 	return ret;
 }
