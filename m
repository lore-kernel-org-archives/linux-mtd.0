Received: from beta.dmz-eu.st.com ([164.129.1.35])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17aOaM-00025b-00
	for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2002 23:38:22 +0100
Date: Thu, 1 Aug 2002 23:37:10 +0100
From: Stuart Menefy <stuart.menefy@st.com>
To: gromit1463@mailworks.org
Cc: linux-mtd@lists.infradead.org
Subject: Re: "Read-only file system" error while writing
Message-Id: <20020801233710.6be124a0.stuart.menefy@st.com>
In-Reply-To: <1028231145.22264.9.camel@mahi190.austin.ibm.com>
References: <1028147069.12139.81.camel@mahi190.austin.ibm.com>
	<1028064443.23642.52.camel@mahi190.austin.ibm.com>
	<20020731163530.70c45960.stuart.menefy@st.com>
	<28851.1028197900@redhat.com>
	<20020801190500.7e73cf60.stuart.menefy@st.com>
	<20020801192624.28fe7b7e.stuart.menefy@st.com>
	<1028231145.22264.9.camel@mahi190.austin.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
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

This is slightly different from what I see with the bottom version of the device:

Number of erase regions: 2
Vendor 00000020 id 000000bb
Detected STM M28W320CB, applying CFI fixups
Primary Vendor Command Set: 0003 (Intel/Sharp Standard)
Primary Algorithm Table at 0035
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum:  2.7 V
Vcc Maximum:  3.6 V
Vpp Minimum: 11.4 V
Vpp Maximum: 12.6 V
Typical byte/word write timeout: 16 탎
Maximum byte/word write timeout: 256 탎
Full buffer write not supported
Typical block erase timeout: 1024 탎
Maximum block erase timeout: 8192 탎
Chip erase not supported
Device size: 0x400000 bytes (4 MiB)
Flash Device Interface description: 0x0001
  - x16-only asynchronous interface
Max. bytes in buffer write: 0x1
Number of Erase Block Regions: 2
  Erase Region #0: BlockSize 0x2000 bytes, 8 blocks
  Erase Region #1: BlockSize 0x10000 bytes, 63 blocks

In particular the buffer write is detected as not supported.

Try this variant of the patch I'm using:

diff -u -r1.66 cfi_probe.c
--- cfi_probe.c	2 Oct 2001 15:05:12 -0000	1.66
+++ cfi_probe.c	1 Aug 2002 22:31:11 -0000
@@ -147,6 +145,28 @@
 		((unsigned char *)cfi->cfiq)[i] = cfi_read_query(map,base + (0x10 + i)*ofs_factor);
 	}
 	
+	/* The STMicroelectronics M28W320C[BT] devices report incorrect CFI data.
+	 * Check here and fix up if necessary.
+	 */
+#define VENDOR_STMICROELECTRONICS 0x0020
+#define DEVICE_M28W320CT 0xba
+#define DEVICE_M28W320CB 0xbb
+	{
+		unsigned int vendor, id;
+		vendor = cfi_read_query(map,base + 0*ofs_factor);
+		id     = cfi_read_query(map,base + 1*ofs_factor);
+printk("Vendor %08x id %08x\n", vendor, id);
+		if ((vendor == VENDOR_STMICROELECTRONICS) && (id == DEVICE_M28W320CT)) {
+			printk("Detected STM M28W320CT, applying CFI fixups\n");
+			((unsigned char*)cfi->cfiq)[0x20 - 0x10] = 0x0;
+			((unsigned char*)cfi->cfiq)[0x24 - 0x10] = 0x0;
+		}
+		if ((vendor == VENDOR_STMICROELECTRONICS) && (id == DEVICE_M28W320CB)) {
+			printk("Detected STM M28W320CB, applying CFI fixups\n");
+			((unsigned char*)cfi->cfiq)[0x31 - 0x10] = 0x3e;
+		}
+	}
+
 	/* Do any necessary byteswapping */
 	cfi->cfiq->P_ID = le16_to_cpu(cfi->cfiq->P_ID);
 	

This is not intended as a permanent fix, just to see if it fixes the problem.

Stuart


On Thu, 1 Aug 2002 14:45:45 -0500
gromit1463@mailworks.org wrote:

> Number of erase regions: 2 
> Vendor 00000020 id 000000ba 
> Primary Vendor Command Set: 0003 (Intel/Sharp Standard) 
> Primary Algorithm Table at 0035 
> Alternative Vendor Command Set: 0000 (None) 
> No Alternate Algorithm Table 
> Vcc Minimum: 2.7 V 
> Vcc Maximum: 3.6 V 
> Vpp Minimum: b.4 V 
> Vpp Maximum: c.6 V 
> Typical byte/word write timeout: 16 s 
> Maximum byte/word write timeout: 512 s 
> Typical full buffer write timeout: 16 s 
> Maximum full buffer write timeout: 512 s 
> Typical block erase timeout: 1024 s 
> Maximum block erase timeout: 8192 s 
> Chip erase not supported 
> Device size: 0x400000 bytes (4 Mb) 
> Flash Device Interface description: 0x0001 
> x16-only asynchronous interface 
> Max. bytes in buffer write: 0x4 
> Number of Erase Block Regions: 2 
> Erase Region #0: BlockSize 0x10000 bytes, 63 blocks 
> Erase Region #1: BlockSize 0x2000 bytes, 8 blocks 
> 
> 
> 
> I have 8 chips total, 4MB each.
> 
> 
> On Thu, 2002-08-01 at 13:26, Stuart Menefy wrote:
> > Try building cfi_probe.c with DEBUG_CFI set, and post what it reports.
> 
> 
> -- 
> "Find out what you've been missing while you've been
> rebooting Windows NT." -- Infoworld on Linux
> 
> http://www.ao.com/~regan/penguins/tux.html
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


-- 
Stuart Menefy                                        stuart.menefy@st.com
STMicroelectronics Ltd                         ST Intranet: mo.bri.st.com
Bristol, UK                         Rest of the World: www.linuxsh.st.com
