Received: from nf-out-0910.google.com ([64.233.182.185])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Ft10K-0004p3-2j
	for linux-mtd@lists.infradead.org; Wed, 21 Jun 2006 07:36:24 -0400
Received: by nf-out-0910.google.com with SMTP id p48so80261nfa
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Jun 2006 04:36:08 -0700 (PDT)
Message-ID: <fe810cf0606210436w7196e009o82ac67a86e41ee9c@mail.gmail.com>
Date: Wed, 21 Jun 2006 15:36:08 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: [PATCH] NAND: fix nand_write_oob_std return value
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It seems nand_write_oob_std should not return just status value

Signed-off-by: Alexander Belyakov <alexander.belyakov@intel.com>

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 27083ed..79eae5d 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1176,7 +1176,7 @@ static int nand_write_oob_std(struct mtd

 	status = chip->waitfunc(mtd, chip);

-	return status;
+	return status & NAND_STATUS_FAIL ? -EIO : 0;
 }

 /**
