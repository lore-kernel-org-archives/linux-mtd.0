Received: from toronto-hs-216-138-233-67.s-ip.magma.ca ([216.138.233.67]
	helo=yow.seanm.ca)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L9qov-0006Ba-R3
	for linux-mtd@lists.infradead.org; Tue, 09 Dec 2008 00:51:26 +0000
Date: Mon, 8 Dec 2008 19:51:24 -0500
From: Sean MacLennan <smaclennan@pikatech.com>
To: "Josh Boyer" <jwboyer@linux.vnet.ibm.com>
Subject: Re: [PATCH] ndfc driver
Message-ID: <20081208195124.14988307@lappy.seanm.ca>
In-Reply-To: <20081204090107.20269571@zod.rchland.ibm.com>
References: <20081203222832.3fc77d28@lappy.seanm.ca>
	<20081204090107.20269571@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 4 Dec 2008 09:01:07 -0500
"Josh Boyer" <jwboyer@linux.vnet.ibm.com> wrote:

> You also seem to only support a single NAND chip, however the NDFC can
> support multiple chips.  Have you looked at how the the fsl_elbc_nand
> driver does multiple chip support?  If not, could you at least
> document the limitation in the patch?

Signed-off-by: Sean MacLennan <smaclennan@pikatech.com>
---
diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index 0352d5c..3dd85e8 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -2,11 +2,15 @@
  *  drivers/mtd/ndfc.c
  *
  *  Overview:
- *   Platform independend driver for NDFC (NanD Flash Controller)
+ *   Platform independent driver for NDFC (NanD Flash Controller)
  *   integrated into EP440 cores
  *
  *   Ported to an OF platform driver by Sean MacLennan
  *
+ *   The NDFC supports multiple chips, but this driver only supports a
+ *   single chip since I do not have access to any boards with
+ *   multiple chips.
+ *
  *  Author: Thomas Gleixner
  *
  *  Copyright 2006 IBM
