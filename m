Received: from beta.dmz-eu.st.com ([164.129.1.35])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZvWO-0007F3-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 16:36:20 +0100
Date: Wed, 31 Jul 2002 16:35:30 +0100
From: Stuart Menefy <stuart.menefy@st.com>
To: gromit1463@mailworks.org
Cc: linux-mtd@lists.infradead.org
Subject: Re: "Read-only file system" error while writing
Message-Id: <20020731163530.70c45960.stuart.menefy@st.com>
In-Reply-To: <1028064443.23642.52.camel@mahi190.austin.ibm.com>
References: <1028064443.23642.52.camel@mahi190.austin.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Stephen

On Tue, 30 Jul 2002 16:27:23 -0500
gromit1463@mailworks.org wrote:
> I have a set of STMicro flash chips (M28W320CT) that use the Intel
> Extended CFI command set (0001), and I'm using kernel 2.4.2.  I can
> partition the chips, lock and unlock the chips, erase the chips and read
> from (dd) the chips perfectly fine.

I had problems getting these devices to work as well, and ended up deciding
there were a couple of bugs which had to be worked around. One is a problem
in the state machine which handles unlocking returns to read mode when
it should stay in command mode, and the other is a simple error in the CFI
data, which gets the size of the device wrong!

The attached changes work for me. Unfortuntaly my cfi_cmdset_0001.c is
pretty heavily modified, so the patch may not apply cleanly. The two
changes are for do_lock_onblock() and do_unlock_oneblock().

Note that I was using the bottom bank version, so if you find you also
need the work around for the CFI data being wrong, you will probably have
to adjust the device ID being checked for.

Hope this helps

Stuart



diff -ru --exclude=CVS mtd.orig/drivers/mtd/chips/cfi_cmdset_0001.c mtd/drivers/mtd/chips/cfi_cmdset_0001.c
--- mtd.orig/drivers/mtd/chips/cfi_cmdset_0001.c	Tue Nov 27 14:55:12 2001
+++ mtd/drivers/mtd/chips/cfi_cmdset_0001.c	Mon Dec 10 17:46:05 2001
@@ -1400,6 +1479,10 @@
 	ENABLE_VPP(map);
 	cfi_write(map, CMD(0x60), adr);
 	cfi_write(map, CMD(0x01), adr);
+
+// SIM: I've added this for the ST chip which reverts to read mode. Ahhh
+cfi_write(map, CMD(0x70), adr);
+
 	chip->state = FL_LOCKING;
 	
 	spin_unlock_bh(chip->mutex);
@@ -1550,7 +1621,10 @@
 	cfi_write(map, CMD(0x60), adr);
 	cfi_write(map, CMD(0xD0), adr);
 	chip->state = FL_UNLOCKING;
-	
+
+// SIM: I've added this for the ST chip which reverts to read mode. Ahhh
+cfi_write(map, CMD(0x70), adr);
+
 	spin_unlock_bh(chip->mutex);
 	schedule_timeout(HZ);
 	spin_lock_bh(chip->mutex);
diff -ru --exclude=CVS mtd.orig/drivers/mtd/chips/cfi_probe.c mtd/drivers/mtd/chips/cfi_probe.c
--- mtd.orig/drivers/mtd/chips/cfi_probe.c	Tue Oct  2 16:05:12 2001
+++ mtd/drivers/mtd/chips/cfi_probe.c	Mon Dec 10 17:51:24 2001
@@ -147,6 +145,22 @@
 		((unsigned char *)cfi->cfiq)[i] = cfi_read_query(map,base + (0x10 + i)*ofs_factor);
 	}
 	
+	/* The STMicroelectronics M28W320CB device reports incorrect CFI data.
+	 * Check here and fix up if necessary.
+	 */
+#define VENDOR_STMICROELECTRONICS 0x0020
+#define DEVICE_M28W320CB 0xbb
+	{
+		unsigned int vendor, id;
+		vendor = cfi_read_query(map,base + 0*ofs_factor);
+		id     = cfi_read_query(map,base + 1*ofs_factor);
+printk("Vendor %08x id %08x\n", vendor, id);
+		if ((vendor == VENDOR_STMICROELECTRONICS) && (id == DEVICE_M28W320CB)) {
+			printk("Detected STM M28W320CB, applying CFI fixups\n");
+			((unsigned char*)cfi->cfiq)[0x31 - 0x10] = 0x3e;
+		}
+	}
+
 	/* Do any necessary byteswapping */
 	cfi->cfiq->P_ID = le16_to_cpu(cfi->cfiq->P_ID);
 	
-- 
Stuart Menefy                                        stuart.menefy@st.com
STMicroelectronics Ltd                         ST Intranet: mo.bri.st.com
Bristol, UK                         Rest of the World: www.linuxsh.st.com
