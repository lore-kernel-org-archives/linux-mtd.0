Received: from mail.gmx.net ([213.165.64.20])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JoTaj-0006jN-7q
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 01:16:09 +0000
Message-ID: <480E8DD9.3030108@gmx.de>
Date: Wed, 23 Apr 2008 03:16:09 +0200
From: Thomas Kunze <thommycheck@gmx.de>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] fix cfi for collie flash
References: <480E7784.6030902@gmx.de>
	<1208910618.9212.701.camel@pmac.infradead.org>
In-Reply-To: <1208910618.9212.701.camel@pmac.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Again with (hopefully) no line wrappings.

Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c 
b/drivers/mtd/chips/cfi_cmdset_0001.c
index 0080452..34da59b 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -618,7 +618,11 @@ static int cfi_intelext_partition_fixup(struct 
mtd_info *mtd,
                             + (rinfo->NumBlockTypes - 1) *
                               sizeof(struct cfi_intelext_blockinfo);
             }
-
+
+               /* if numregions=0 we have one big partition */
+               if(!numparts)
+                       numparts = 1;
+
             /* Programming Region info */
             if (extp->MinorVersion >= '4') {
                     struct cfi_intelext_programming_regioninfo *prinfo;
