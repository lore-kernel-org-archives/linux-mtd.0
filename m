Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14XMs7-0003a6-00
	for mtd-list@infradead.org; Mon, 26 Feb 2001 12:35:23 +0000
Received: from [203.238.93.91] (helo=hades.idis.co.kr ident=mail)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14XMs5-0003Yg-00
	for mtd@infradead.org; Mon, 26 Feb 2001 12:35:22 +0000
Received: from cwryu by hades.idis.co.kr with local (Exim 3.22 #1 (Debian))
	id 14XMnl-0000rp-00
	for <mtd@infradead.org>; Mon, 26 Feb 2001 21:30:53 +0900
To: mtd@infradead.org
Subject: Re: kernel/jedec.c bug?
References: <871ysrcxko.fsf@hades.idis.co.kr>
MIME-Version: 1.0
Content-Type: text/plain; charset=euc-kr
Content-Transfer-Encoding: 8bit
From: Changwoo Ryu <cwryu@debian.org>
Date: 26 Feb 2001 21:30:52 +0900
In-Reply-To: Changwoo Ryu's message of "22 Feb 2001 10:31:51 +0900"
Message-ID: <871ysl8w3n.fsf@hades.idis.co.kr>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Changwoo Ryu <cwryu@debian.org> writes:

[...]
> Last[0], Last[1] and Last[2] for my flash are all "0x084C084C".  It's
> ok, isn't?  Reading 32bit data requires 4 reads (0x08, 0x4C, 0x08,
> 0x4C) from the 8bit flash.  So when the erasure is not completed, the
> two 32bit values should be same.

OK, maybe nobody cares about jedec any more even if the code doesn't
work...  Anyway here is a simple fix.  With applying this patch, the
flash_erase uses either of map->read8/read16/read32 according to
map->buswidth.  I also added the vendor/device ids for AM29F017 and
for MX29F016.

Could anyone commit this patch?

-- 
Changwoo Ryu

diff -u -r1.4 jedec.c
--- jedec.c	2001/01/05 23:01:51	1.4
+++ jedec.c	2001/02/26 12:27:59
@@ -36,10 +36,12 @@
 /* Listing of parts and sizes. We need this table to learn the sector
    size of the chip and the total length */
 static const struct JEDECTable JEDEC_table[] = 
-  {{0x01AD,"AMD Am29F016",2*1024*1024,64*1024,MTD_CAP_NORFLASH},
+  {{0x013D,"AMD Am29F017D",2*1024*1024,64*1024,MTD_CAP_NORFLASH},
+   {0x01AD,"AMD Am29F016",2*1024*1024,64*1024,MTD_CAP_NORFLASH},
    {0x01D5,"AMD Am29F080",1*1024*1024,64*1024,MTD_CAP_NORFLASH},
    {0x01A4,"AMD Am29F040",512*1024,64*1024,MTD_CAP_NORFLASH},
    {0x20E3,"AMD Am29W040B",512*1024,64*1024,MTD_CAP_NORFLASH},
+   {0xC2AD,"Macronix MX29F016",2*1024*1024,64*1024,MTD_CAP_NORFLASH},
    {}};
 
 static void jedec_sync(struct mtd_info *mtd) {};
@@ -623,9 +625,23 @@
 	 /* During erase bit 7 is held low and bit 6 toggles, we watch this,
 	    should it stop toggling or go high then the erase is completed,
   	    or this is not really flash ;> */
-	 Last[0] = map->read32(map,(chip->base >> chip->addrshift) + chip->start + off);
-	 Last[1] = map->read32(map,(chip->base >> chip->addrshift) + chip->start + off);
-	 Last[2] = map->read32(map,(chip->base >> chip->addrshift) + chip->start + off);
+	 switch (map->buswidth) {
+	 case 1:
+	    Last[0] = map->read8(map,(chip->base >> chip->addrshift) + chip->start + off);
+	    Last[1] = map->read8(map,(chip->base >> chip->addrshift) + chip->start + off);
+	    Last[2] = map->read8(map,(chip->base >> chip->addrshift) + chip->start + off);
+	    break;
+	 case 2:
+	    Last[0] = map->read16(map,(chip->base >> chip->addrshift) + chip->start + off);
+	    Last[1] = map->read16(map,(chip->base >> chip->addrshift) + chip->start + off);
+	    Last[2] = map->read16(map,(chip->base >> chip->addrshift) + chip->start + off);
+	    break;
+	 case 3:
+	    Last[0] = map->read32(map,(chip->base >> chip->addrshift) + chip->start + off);
+	    Last[1] = map->read32(map,(chip->base >> chip->addrshift) + chip->start + off);
+	    Last[2] = map->read32(map,(chip->base >> chip->addrshift) + chip->start + off);
+	    break;
+	 }
 	 Count = 3;
 	 while (todo_left != 0)
 	 {
@@ -656,8 +672,18 @@
 /*	    if (NoTime == 0)
 	       Time += HZ/10 - schedule_timeout(HZ/10);*/
 	    NoTime = 0;
-	    
-	    Last[Count % 4] = map->read32(map,(chip->base >> chip->addrshift) + chip->start + off);
+
+	    switch (map->buswidth) {
+	    case 1:
+	       Last[Count % 4] = map->read8(map,(chip->base >> chip->addrshift) + chip->start + off);
+	      break;
+	    case 2:
+	       Last[Count % 4] = map->read16(map,(chip->base >> chip->addrshift) + chip->start + off);
+	      break;
+	    case 4:
+	       Last[Count % 4] = map->read32(map,(chip->base >> chip->addrshift) + chip->start + off);
+	      break;
+	    }
 	    Count++;
 	    
 /*	    // Count time, max of 15s per sector (according to AMD)


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
