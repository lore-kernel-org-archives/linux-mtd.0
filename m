Received: from out014pub.verizon.net ([206.46.170.46] helo=out014.verizon.net)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CDEjM-0001kr-LI
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2004 00:09:19 -0400
Received: from [192.168.1.100] ([209.158.211.53]) by out014.verizon.net
	(InterMail vM.5.01.06.06 201-253-122-130-106-20030910) with ESMTP
	id <20041001040914.DHVS17054.out014.verizon.net@[192.168.1.100]>
	for <linux-mtd@lists.infradead.org>; Thu, 30 Sep 2004 23:09:14 -0500
Message-ID: <415CD869.7070607@verizon.net>
Date: Fri, 01 Oct 2004 00:09:13 -0400
From: Jim Nelson <james4765@verizon.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: 2.6.8.1 compile failed.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It looks like struct map_info (in include/linux/mtd/map.h) uses 
'bankwidth' instead of 'buswidth'.

A question from a relative newbie (just getting started in kernel 
hacking) - is there a focus on 2.6 development exclusively in this list 
or is there some attempt to maintain 2.4 compatibility?  Although I can 
understand either way, I'd like to know if there needs to be an effort 
to maintain backwards compatibility.

Patch to drivers/mtd/chips/amd_flash.c included.

------------------------------------------------------------------------

--- amd_flash.c	2004-08-09 09:19:43.000000000 -0400
+++ amd_flash_fix.c	2004-09-30 23:51:54.517951212 -0400
@@ -140,11 +140,11 @@
 
 static inline __u32 wide_read(struct map_info *map, __u32 addr)
 {
-	if (map->buswidth == 1) {
+	if (map->bankwidth == 1) {
 		return map_read8(map, addr);
-	} else if (map->buswidth == 2) {
+	} else if (map->bankwidth == 2) {
 		return map_read16(map, addr);
-	} else if (map->buswidth == 4) {
+	} else if (map->bankwidth == 4) {
 		return map_read32(map, addr);
         }
 
@@ -153,11 +153,11 @@
 
 static inline void wide_write(struct map_info *map, __u32 val, __u32 addr)
 {
-	if (map->buswidth == 1) {
+	if (map->bankwidth == 1) {
 		map_write8(map, val, addr);
-	} else if (map->buswidth == 2) {
+	} else if (map->bankwidth == 2) {
 		map_write16(map, val, addr);
-	} else if (map->buswidth == 4) {
+	} else if (map->bankwidth == 4) {
 		map_write32(map, val, addr);
 	}
 }
@@ -176,16 +176,16 @@
 static inline void send_unlock(struct map_info *map, unsigned long base)
 {
 	wide_write(map, (CMD_UNLOCK_DATA_1 << 16) | CMD_UNLOCK_DATA_1,
-		   base + (map->buswidth * ADDR_UNLOCK_1));
+		   base + (map->bankwidth * ADDR_UNLOCK_1));
 	wide_write(map, (CMD_UNLOCK_DATA_2 << 16) | CMD_UNLOCK_DATA_2,
-		   base + (map->buswidth * ADDR_UNLOCK_2));
+		   base + (map->bankwidth * ADDR_UNLOCK_2));
 }
 
 static inline void send_cmd(struct map_info *map, unsigned long base, __u32 cmd)
 {
 	send_unlock(map, base);
 	wide_write(map, make_cmd(map, cmd),
-		   base + (map->buswidth * ADDR_UNLOCK_1));
+		   base + (map->bankwidth * ADDR_UNLOCK_1));
 }
 
 static inline void send_cmd_to_addr(struct map_info *map, unsigned long base,
@@ -199,7 +199,7 @@
 				int interleave)
 {
 
-	if ((interleave == 2) && (map->buswidth == 4)) {
+	if ((interleave == 2) && (map->bankwidth == 4)) {
 		__u32 read1, read2;
 
 		read1 = wide_read(map, addr);
@@ -220,8 +220,8 @@
 {
 	/* Sector lock address. A6 = 1 for unlock, A6 = 0 for lock */
 	int SLA = unlock ?
-		(sect_addr |  (0x40 * map->buswidth)) :
-		(sect_addr & ~(0x40 * map->buswidth)) ;
+		(sect_addr |  (0x40 * map->bankwidth)) :
+		(sect_addr & ~(0x40 * map->bankwidth)) ;
 
 	__u32 cmd = make_cmd(map, CMD_UNLOCK_SECTOR);
 
@@ -240,7 +240,7 @@
 	send_cmd(map, sect_addr, CMD_MANUFACTURER_UNLOCK_DATA);
 
 	/* status is 0x0000 for unlocked and 0x0001 for locked */
-	status = wide_read(map, sect_addr + (map->buswidth * ADDR_SECTOR_LOCK));
+	status = wide_read(map, sect_addr + (map->bankwidth * ADDR_SECTOR_LOCK));
 	wide_write(map, CMD_RESET_DATA, 0);
 	return status;
 }
@@ -326,10 +326,10 @@
 	send_cmd(map, base, CMD_RESET_DATA);
 	send_cmd(map, base, CMD_MANUFACTURER_UNLOCK_DATA);
 
-	mfr_id = wide_read(map, base + (map->buswidth * ADDR_MANUFACTURER));
-	dev_id = wide_read(map, base + (map->buswidth * ADDR_DEVICE_ID));
+	mfr_id = wide_read(map, base + (map->bankwidth * ADDR_MANUFACTURER));
+	dev_id = wide_read(map, base + (map->bankwidth * ADDR_DEVICE_ID));
 
-	if ((map->buswidth == 4) && ((mfr_id >> 16) == (mfr_id & 0xffff)) &&
+	if ((map->bankwidth == 4) && ((mfr_id >> 16) == (mfr_id & 0xffff)) &&
 	    ((dev_id >> 16) == (dev_id & 0xffff))) {
 		mfr_id &= 0xffff;
 		dev_id &= 0xffff;
@@ -353,12 +353,12 @@
 
 					mfr_id_other =
 						wide_read(map, chips[j].start +
-							       (map->buswidth *
+							       (map->bankwidth *
 								ADDR_MANUFACTURER
 							       ));
 					dev_id_other =
 						wide_read(map, chips[j].start +
-					    		       (map->buswidth *
+					    		       (map->bankwidth *
 							        ADDR_DEVICE_ID));
 					if (temp.interleave == 2) {
 						mfr_id_other &= 0xffff;
@@ -975,8 +975,8 @@
 	chipstart = private->chips[chipnum].start;
 
 	/* If it's not bus-aligned, do the first byte write. */
-	if (ofs & (map->buswidth - 1)) {
-		unsigned long bus_ofs = ofs & ~(map->buswidth - 1);
+	if (ofs & (map->bankwidth - 1)) {
+		unsigned long bus_ofs = ofs & ~(map->bankwidth - 1);
 		int i = ofs - bus_ofs;
 		int n = 0;
 		u_char tmp_buf[4];
@@ -984,13 +984,13 @@
 
 		map_copy_from(map, tmp_buf,
 			       bus_ofs + private->chips[chipnum].start,
-			       map->buswidth);
-		while (len && i < map->buswidth)
+			       map->bankwidth);
+		while (len && i < map->bankwidth)
 			tmp_buf[i++] = buf[n++], len--;
 
-		if (map->buswidth == 2) {
+		if (map->bankwidth == 2) {
 			datum = *(__u16*)tmp_buf;
-		} else if (map->buswidth == 4) {
+		} else if (map->bankwidth == 4) {
 			datum = *(__u32*)tmp_buf;
 		} else {
 			return -EINVAL;  /* should never happen, but be safe */
@@ -1016,14 +1016,14 @@
 	}
 	
 	/* We are now aligned, write as much as possible. */
-	while(len >= map->buswidth) {
+	while(len >= map->bankwidth) {
 		__u32 datum;
 
-		if (map->buswidth == 1) {
+		if (map->bankwidth == 1) {
 			datum = *(__u8*)buf;
-		} else if (map->buswidth == 2) {
+		} else if (map->bankwidth == 2) {
 			datum = *(__u16*)buf;
-		} else if (map->buswidth == 4) {
+		} else if (map->bankwidth == 4) {
 			datum = *(__u32*)buf;
 		} else {
 			return -EINVAL;
@@ -1035,10 +1035,10 @@
 			return ret;
 		}
 
-		ofs += map->buswidth;
-		buf += map->buswidth;
-		(*retlen) += map->buswidth;
-		len -= map->buswidth;
+		ofs += map->bankwidth;
+		buf += map->bankwidth;
+		(*retlen) += map->bankwidth;
+		len -= map->bankwidth;
 
 		if (ofs >> private->chipshift) {
 			chipnum++;
@@ -1050,21 +1050,21 @@
 		}
 	}
 
-	if (len & (map->buswidth - 1)) {
+	if (len & (map->bankwidth - 1)) {
 		int i = 0, n = 0;
 		u_char tmp_buf[2];
 		__u32 datum;
 
 		map_copy_from(map, tmp_buf,
 			       ofs + private->chips[chipnum].start,
-			       map->buswidth);
+			       map->bankwidth);
 		while (len--) {
 			tmp_buf[i++] = buf[n++];
 		}
 
-		if (map->buswidth == 2) {
+		if (map->bankwidth == 2) {
 			datum = *(__u16*)tmp_buf;
-		} else if (map->buswidth == 4) {
+		} else if (map->bankwidth == 4) {
 			datum = *(__u32*)tmp_buf;
 		} else {
 			return -EINVAL;  /* should never happen, but be safe */
