Date: Mon, 12 Apr 2010 19:49:15 +0400 (MSD)
From: Alexander Kurz <linux@blala.de>
To: David Woodhouse <dwmw2@infradead.org>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Magnus Damm <damm@opensource.se>, Karsten Keil <keil@b1-systems.de>
Subject: [PATCH 1/2] drivers/mtd/maps/pcmciamtd.c: fixing obvious errors
Message-ID: <alpine.DEB.1.10.1004121945510.7438@blala.de>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-188330283-1271087360=:7438"
Cc: linux-pcmcia@lists.infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-188330283-1271087360=:7438
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

Hello folks,
this is an attempt, to reanimate the pcmciamtd driver.
The driver has been marked as BROKEN for much too long.
After fixing the obvious errors, the patched driver will now compile
again on v2.6.34-rc3. First tests with two 4MB-Flashcards including
erase- and write test with one of the cards where successfull.
Here is an erase/write/read example:

# pccardctl ident
Socket 1:
  product info: "SMART Modular Technologies", " 4MB FLASH Card", "", ""
  function: 1 (memory)
 
# flash_erase /dev/mtd0 0 64
Erase Total 64 Units
Region 0 is at 0 of 16 sector and with sector size 20000
Region 1 is at 2097152 of 16 sector and with sector size 20000
Performing Flash Erase of length 131072 at offset 0x1e0000
Moving to region 1
Performing Flash Erase of length 131072 at offset 0x3e0000
Moving to region 2
 done

# dd if=/dev/mtd0 | od -t x1       
0000000 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
*
20000000
4194304 Bytes (4,2 MB) kopiert, 5,99274 s, 700 kB/s

# dd bs=65536 if=~/r4 of=/dev/mtd0
64+0 Datensätze ein
64+0 Datensätze aus
4194304 Bytes (4,2 MB) kopiert, 39,5289 s, 106 kB/s

# dd if=/dev/mtd0 of=c1
# diff c1 ~/r4 && echo 'jipeee!'
jipeee!

Cheers, Alexander Kurz

>From 314370c94eb035e7597bedcb901feee953eb1796 Mon Sep 17 00:00:00 2001
From: Alexander Kurz <linux@kbdbabel.org>
Date: Sun, 11 Apr 2010 23:05:28 +0200
Subject: [PATCH 1/2] drivers/mtd/maps/pcmciamtd.c: fixing obvious errors to get the
 BROKEN-flag off this nice module + two new PCMCIA_DEVICE_PROD_IDs

Signed-off-by: Alexander Kurz <linux@kbdbabel.org>
---
 drivers/mtd/maps/Kconfig     |    2 +-
 drivers/mtd/maps/pcmciamtd.c |   32 ++++++++++++++++----------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index aa2807d..f22bc9f 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -435,7 +435,7 @@ config MTD_PCI
 
 config MTD_PCMCIA
 	tristate "PCMCIA MTD driver"
-	depends on PCMCIA && MTD_COMPLEX_MAPPINGS && BROKEN
+	depends on PCMCIA && MTD_COMPLEX_MAPPINGS
 	help
 	  Map driver for accessing PCMCIA linear flash memory cards. These
 	  cards are usually around 4-16MiB in size. This does not include
diff --git a/drivers/mtd/maps/pcmciamtd.c b/drivers/mtd/maps/pcmciamtd.c
index 689d6a7..2dbe939 100644
--- a/drivers/mtd/maps/pcmciamtd.c
+++ b/drivers/mtd/maps/pcmciamtd.c
@@ -137,7 +137,7 @@ static map_word pcmcia_read8_remap(struct map_info *map, unsigned long ofs)
 		return d;
 
 	d.x[0] = readb(addr);
-	DEBUG(3, "ofs = 0x%08lx (%p) data = 0x%02x", ofs, addr, d.x[0]);
+	DEBUG(3, "ofs = 0x%08lx (%p) data = 0x%02lx", ofs, addr, d.x[0]);
 	return d;
 }
 
@@ -152,7 +152,7 @@ static map_word pcmcia_read16_remap(struct map_info *map, unsigned long ofs)
 		return d;
 
 	d.x[0] = readw(addr);
-	DEBUG(3, "ofs = 0x%08lx (%p) data = 0x%04x", ofs, addr, d.x[0]);
+	DEBUG(3, "ofs = 0x%08lx (%p) data = 0x%04lx", ofs, addr, d.x[0]);
 	return d;
 }
 
@@ -190,7 +190,7 @@ static void pcmcia_write8_remap(struct map_info *map, map_word d, unsigned long
 	if(!addr)
 		return;
 
-	DEBUG(3, "adr = 0x%08lx (%p)  data = 0x%02x", adr, addr, d.x[0]);
+	DEBUG(3, "adr = 0x%08lx (%p)  data = 0x%02lx", adr, addr, d.x[0]);
 	writeb(d.x[0], addr);
 }
 
@@ -201,7 +201,7 @@ static void pcmcia_write16_remap(struct map_info *map, map_word d, unsigned long
 	if(!addr)
 		return;
 
-	DEBUG(3, "adr = 0x%08lx (%p)  data = 0x%04x", adr, addr, d.x[0]);
+	DEBUG(3, "adr = 0x%08lx (%p)  data = 0x%04lx", adr, addr, d.x[0]);
 	writew(d.x[0], addr);
 }
 
@@ -245,7 +245,7 @@ static map_word pcmcia_read8(struct map_info *map, unsigned long ofs)
 		return d;
 
 	d.x[0] = readb(win_base + ofs);
-	DEBUG(3, "ofs = 0x%08lx (%p) data = 0x%02x", ofs, win_base + ofs, d.x[0]);
+	DEBUG(3, "ofs = 0x%08lx (%p) data = 0x%02lx", ofs, win_base + ofs, d.x[0]);
 	return d;
 }
 
@@ -259,7 +259,7 @@ static map_word pcmcia_read16(struct map_info *map, unsigned long ofs)
 		return d;
 
 	d.x[0] = readw(win_base + ofs);
-	DEBUG(3, "ofs = 0x%08lx (%p) data = 0x%04x", ofs, win_base + ofs, d.x[0]);
+	DEBUG(3, "ofs = 0x%08lx (%p) data = 0x%04lx", ofs, win_base + ofs, d.x[0]);
 	return d;
 }
 
@@ -276,27 +276,27 @@ static void pcmcia_copy_from(struct map_info *map, void *to, unsigned long from,
 }
 
 
-static void pcmcia_write8(struct map_info *map, u8 d, unsigned long adr)
+static void pcmcia_write8(struct map_info *map, map_word d, unsigned long adr)
 {
 	caddr_t win_base = (caddr_t)map->map_priv_2;
 
 	if(DEV_REMOVED(map))
 		return;
 
-	DEBUG(3, "adr = 0x%08lx (%p)  data = 0x%02x", adr, win_base + adr, d);
-	writeb(d, win_base + adr);
+	DEBUG(3, "adr = 0x%08lx (%p)  data = 0x%02lx", adr, win_base + adr, d.x[0]);
+	writeb(d.x[0], win_base + adr);
 }
 
 
-static void pcmcia_write16(struct map_info *map, u16 d, unsigned long adr)
+static void pcmcia_write16(struct map_info *map, map_word d, unsigned long adr)
 {
 	caddr_t win_base = (caddr_t)map->map_priv_2;
 
 	if(DEV_REMOVED(map))
 		return;
 
-	DEBUG(3, "adr = 0x%08lx (%p)  data = 0x%04x", adr, win_base + adr, d);
-	writew(d, win_base + adr);
+	DEBUG(3, "adr = 0x%08lx (%p)  data = 0x%04lx", adr, win_base + adr, d.x[0]);
+	writew(d.x[0], win_base + adr);
 }
 
 
@@ -432,7 +432,7 @@ static int pcmciamtd_cistpl_geo(struct pcmcia_device *p_dev,
 }
 
 
-static void card_settings(struct pcmciamtd_dev *dev, struct pcmcia_device *link, int *new_name)
+static void card_settings(struct pcmciamtd_dev *dev, struct pcmcia_device *p_dev, int *new_name)
 {
 	int i;
 
@@ -490,7 +490,6 @@ static int pcmciamtd_config(struct pcmcia_device *link)
 {
 	struct pcmciamtd_dev *dev = link->priv;
 	struct mtd_info *mtd = NULL;
-	cs_status_t status;
 	win_req_t req;
 	int ret;
 	int i;
@@ -565,7 +564,7 @@ static int pcmciamtd_config(struct pcmcia_device *link)
 	dev->pcmcia_map.map_priv_1 = (unsigned long)dev;
 	dev->pcmcia_map.map_priv_2 = (unsigned long)link->win;
 
-	dev->vpp = (vpp) ? vpp : link->socket.socket.Vpp;
+	dev->vpp = (vpp) ? vpp : link->socket->socket.Vpp;
 	link->conf.Attributes = 0;
 	if(setvpp == 2) {
 		link->conf.Vpp = dev->vpp;
@@ -652,7 +651,6 @@ static int pcmciamtd_config(struct pcmcia_device *link)
 	link->dev_node = &dev->node;
 	return 0;
 
- failed:
 	err("CS Error, exiting");
 	pcmciamtd_release(link);
 	return -ENODEV;
@@ -737,8 +735,10 @@ static struct pcmcia_device_id pcmciamtd_ids[] = {
 	PCMCIA_DEVICE_PROD_ID12("intel", "VALUE SERIES 100 ", 0x40ade711, 0xdf8506d8),
 	PCMCIA_DEVICE_PROD_ID12("KINGMAX TECHNOLOGY INC.", "SRAM 256K Bytes", 0x54d0c69c, 0xad12c29c),
 	PCMCIA_DEVICE_PROD_ID12("Maxtor", "MAXFL MobileMax Flash Memory Card", 0xb68968c8, 0x2dfb47b0),
+	PCMCIA_DEVICE_PROD_ID123("M-Systems", "M-SYS Flash Memory Card", "(c) M-Systems", 0x7ed2ad87, 0x675dc3fb, 0x7aef3965),
 	PCMCIA_DEVICE_PROD_ID12("SEIKO EPSON", "WWB101EN20", 0xf9876baf, 0xad0b207b),
 	PCMCIA_DEVICE_PROD_ID12("SEIKO EPSON", "WWB513EN20", 0xf9876baf, 0xe8d884ad),
+	PCMCIA_DEVICE_PROD_ID12("SMART Modular Technologies", " 4MB FLASH Card", 0x96fd8277, 0x737a5b05),
 	PCMCIA_DEVICE_PROD_ID12("Starfish, Inc.", "REX-3000", 0x05ddca47, 0xe7d67bca),
 	PCMCIA_DEVICE_PROD_ID12("Starfish, Inc.", "REX-4100", 0x05ddca47, 0x7bc32944),
 	/* the following was commented out in pcmcia-cs-3.2.7 */
-- 
1.7.0

--8323328-188330283-1271087360=:7438--
