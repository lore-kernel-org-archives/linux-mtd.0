Received: from wp110.webpack.hosteurope.de ([80.237.132.117])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M4DCg-0000K8-NY
	for linux-mtd@lists.infradead.org; Wed, 13 May 2009 12:05:01 +0000
Message-ID: <4A0A1F38.6000500@sp-ss.de>
Date: Wed, 13 May 2009 03:15:36 +0200
From: Tobias Simon <tobias.simon@sp-ss.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: mtd_dataflash bug
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello List,

i have figured out a bug in mtd_datflash.c of kernel 2.6.29, which 
causes my ARM bootloader to be killed with every "erase" operation on 
arbitrary adresses. The fix is:

--- linux-2.6.29.2-a/drivers/mtd/devices/mtd_dataflash.c  2009-05-13 
03:11:16.000000000 +0200
+++ linux-2.6.29.2-b/drivers/mtd/devices/mtd_dataflash.c     2009-05-13 
03:13:30.000000000 +0200
@@ -184,7 +184,7 @@
                /* Calculate flash page address; use block erase (for 
speed) if
                 * we're at a block boundary and need to erase the whole 
block.
                 */
-               pageaddr = div_u64(instr->len, priv->page_size);
+               pageaddr = div_u64(instr->addr, priv->page_size);
                do_block = (pageaddr & 0x7) == 0 && instr->len >= blocksize;
                pageaddr = pageaddr << priv->page_offset;

Regards,
Tobias
