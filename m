Received: from asav4.lyse.net ([81.167.36.150])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tc1Sq-0004li-Dz
 for linux-mtd@lists.infradead.org; Fri, 23 Nov 2012 22:11:13 +0000
Message-ID: <50AFF477.2030803@pvv.org>
Date: Fri, 23 Nov 2012 23:11:03 +0100
From: Harald Nordgard-Hansen <hhansen@pvv.org>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: Fix recovery after failed write-buffer operation in
 cfi_cmdset_0002.c
References: <509D03B7.3070304@pvv.org>
 <1353484119.2701.4.camel@sauron.fi.intel.com>
In-Reply-To: <1353484119.2701.4.camel@sauron.fi.intel.com>
Content-Type: multipart/mixed; boundary="------------090307080802020901090303"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------090307080802020901090303
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/21/12 08:48, Artem Bityutskiy wrote:
> Hi, your patch is not applicable, it is line-wrapped. Can you
> please send a patch I can easily apply?

Sorry about that.  It's been way too many years since I regularly sent
patches in mail.  If this attempt does not work better, I'll just do
it all manually instead of trying to use these new-fangled MUAs. :-)

> Would be nice to put a short comment about what you do and why, may
> be some reference as well. Just to make sure if someone reads the
> code, he/she has some clue what are these about.

Hopefully in place now.

-Harald
-- 
Harald Nordgård-Hansen

--------------090307080802020901090303
Content-Type: text/x-patch;
 name="write_buffer_recovery.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="write_buffer_recovery.patch"

diff -ru a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
--- a/drivers/mtd/chips/cfi_cmdset_0002.c	2012-11-23 22:43:05.000000000 +0100
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c	2012-11-23 23:01:58.000000000 +0100
@@ -1536,8 +1536,16 @@
 		UDELAY(map, chip, adr, 1);
 	}
 
-	/* reset on all failures. */
-	map_write( map, CMD(0xF0), chip->start );
+	/*
+	 * Recovery from write-buffer programming failures requires
+	 * the write-to-buffer-reset sequence.  Since the last part
+	 * of the sequence also works as a normal reset, we can run
+	 * the same commands regardless of why we are here.
+	 * See e.g. http://www.spansion.com/Support/Application%20Notes/MirrorBit_Write_Buffer_Prog_Page_Buffer_Read_AN.pdf
+	 */
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	xip_enable(map, chip, adr);
 	/* FIXME - should have reset delay before continuing */
 

--------------090307080802020901090303--
