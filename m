Received: from fk-out-0910.google.com ([209.85.128.186])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IP7WF-0005Ov-Au
	for linux-mtd@lists.infradead.org; Sat, 25 Aug 2007 22:06:31 -0400
Received: by fk-out-0910.google.com with SMTP id 19so1848163fkr
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Aug 2007 19:06:26 -0700 (PDT)
From: Jesper Juhl <jesper.juhl@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 3/4] mtd: Fix a potential NULL ptr deref bug and mem leak in
	init_msp_flash()
Date: Sun, 26 Aug 2007 03:56:17 +0200
References: <200708260352.33343.jesper.juhl@gmail.com>
	<200708260354.27928.jesper.juhl@gmail.com>
	<200708260355.20916.jesper.juhl@gmail.com>
In-Reply-To: <200708260355.20916.jesper.juhl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200708260356.17664.jesper.juhl@gmail.com>
Cc: Denys Vlasenko <vda.linux@googlemail.com>,
	Jesper Juhl <jesper.juhl@gmail.com>,
	Marc St-Jean <stjeanma@pmc-sierra.com>, linux-mtd@lists.infradead.org,
	"Robert P. J. Day" <rpjday@mindspring.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


    mtd: Fix a potential NULL ptr deref bug and mem leak in init_msp_flash()
    
    In drivers/mtd/maps/pmcmsp-flash.c::init_msp_flash() there is
    currently this funky little piece of code:
    
           msp_maps[i].name = strncpy(kmalloc(7, GFP_KERNEL),
                                   flash_name, 7);
    
    If this (tiny) memory allocation should happen to fail, then
    strncpy() will result in bad things happening - much better to
    simply check the allocation and return a sensible error than crash
    the entire kernel on a NULL deref.
    
    While fixing the above I also reorganized some other lines of code
    in the neighbourhood. There is a nice little check of whether or
    not the ioremap() returns NULL, but the check happens after we have
    already done the kmalloc() described above, so in case it triggers
    it will cause us to leak the 7 bytes that kmalloc() allocated. This
    is easily avoidable by simply moving the check so that if ioremap()
    fails we don't even attempt to do the memory allocation.
    And while I was moving code around I also moved the setting of
    msp_maps[i].bankwidth to 1 below both the ioremap() and kmalloc() so
    that if we bail out due to either of them failing then we don't have
    to spend time doing that assignment - very unlikely to actually
    matter in real life, but it seemed such an obvious
    micro-optimization that I just figured I might as well do it.
    
    Signed-off-by: Jesper Juhl <jesper.juhl@gmail.com>
---
 drivers/mtd/maps/pmcmsp-flash.c |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/pmcmsp-flash.c b/drivers/mtd/maps/pmcmsp-flash.c
index af72cdd..b6d382a 100644
--- a/drivers/mtd/maps/pmcmsp-flash.c
+++ b/drivers/mtd/maps/pmcmsp-flash.c
@@ -115,14 +115,18 @@ int __init init_msp_flash(void)
 		 */
 		if (size > CONFIG_MSP_FLASH_MAP_LIMIT)
 			size = CONFIG_MSP_FLASH_MAP_LIMIT;
-		msp_maps[i].virt = ioremap(addr, size);
-		msp_maps[i].bankwidth = 1;
-		msp_maps[i].name = strncpy(kmalloc(7, GFP_KERNEL),
-					flash_name, 7);
 
+		msp_maps[i].virt = ioremap(addr, size);
 		if (msp_maps[i].virt == NULL)
 			return -ENXIO;
 
+		msp_maps[i].name = kmalloc(7, GFP_KERNEL);
+		if (msp_maps[i].name == NULL)
+			return -ENOMEM;
+		strncpy(msp_maps[i].name, flash_name, 7);
+
+		msp_maps[i].bankwidth = 1;
+
 		for (j = 0; j < pcnt; j++) {
 			part_name[5] = '0' + i;
 			part_name[7] = '0' + j;
