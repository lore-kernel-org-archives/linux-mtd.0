Received: from wallis.dolphinage.com ([64.81.254.189] helo=DolphinAge.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BBUrt-0002Sg-NV
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2004 09:26:37 +0100
Received: from [209.204.188.146] (209.204.188.146) by DolphinAge.com with
 ESMTP (Eudora Internet Mail Server 3.0.3) for
 <linux-mtd@lists.infradead.org>;
 Thu, 8 Apr 2004 01:26:30 -0700
Message-Id: <6.0.1.1.2.20040408011048.022daec0@mailhost.dolphinage.com>
Date: Thu, 08 Apr 2004 01:26:23 -0700
To: linux-mtd@lists.infradead.org
From: John Lewis <john@lewistotle.net>
In-Reply-To: <E1BBAmq-00077a-ED@pentafluge.infradead.org>
References: <E1BBAmq-00077a-ED@pentafluge.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: proposed patch for 16-bit AMD/Atmel flash chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm working on some hardware that uses some Atmel flash chips that are 
16-bit wide. They are close enough to the AMD command set that I can use it 
without difficulty, but I did have to make a change to the code since they 
are 16-bit wide instead of 8-bit.

After going through the code for the driver, I noticed that, in many cases, 
the bit-width sent to cfi_send_gen_cmd() was assumed to be 8 bit. This 
likely works for most people, but it would not work for me and my 16-bit 
flash until I changed the code as shown below.

I may be missing something here since, to be honest, I am a bit new to 
linux and MTD drivers, but it seems to me that you would always want to use 
the actual device_type rather than hard coding to 8-bit. If I am wrong on 
this point, and I freely admit the likely possibility, please feel free to 
shoot me down in flames but I do ask that you at least explain why this is 
the case first. ;-)

Thanks.


diff -Nru linux-2.6.5/drivers/mtd/chips/cfi_cmdset_0002.c 
linux-2.6.5-mx1/drivers/mtd/chips/cfi_cmdset_0002.c
--- linux-2.6.5/drivers/mtd/chips/cfi_cmdset_0002.c	2004-04-03 
19:36:57.000000000 -0800
+++ linux-2.6.5-mx1/drivers/mtd/chips/cfi_cmdset_0002.c	2004-04-05 
16:13:31.000000000 -0700
@@ -517,9 +517,9 @@
  		cfi_send_gen_cmd(0xA0, 0, chip->start, map, cfi, cfi->device_type, NULL);
  	}
  	else {
-	        cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
-	        cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
-	        cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
+	        cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, 
cfi->device_type, NULL);
+	        cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, 
cfi->device_type, NULL);
+	        cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, 
cfi->device_type, NULL);
  	}
  	cfi_write(map, datum, adr);

@@ -720,9 +720,9 @@
  	
  	if (cfi->fast_prog) {
  		/* Go into unlock bypass mode */
-		cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chipstart, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
-		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chipstart, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
-		cfi_send_gen_cmd(0x20, cfi->addr_unlock1, chipstart, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
+		cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chipstart, map, cfi, 
cfi->device_type, NULL);
+		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chipstart, map, cfi, 
cfi->device_type, NULL);
+		cfi_send_gen_cmd(0x20, cfi->addr_unlock1, chipstart, map, cfi, 
cfi->device_type, NULL);
  	}

  	/* We are now aligned, write as much as possible */
@@ -768,9 +768,9 @@
  			chipstart = cfi->chips[chipnum].start;
  			if (cfi->fast_prog){
  				/* Go into unlock bypass mode for next set of chips */
-				cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chipstart, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
-				cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chipstart, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
-				cfi_send_gen_cmd(0x20, cfi->addr_unlock1, chipstart, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
+				cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chipstart, map, cfi, 
cfi->device_type, NULL);
+				cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chipstart, map, cfi, 
cfi->device_type, NULL);
+				cfi_send_gen_cmd(0x20, cfi->addr_unlock1, chipstart, map, cfi, 
cfi->device_type, NULL);
  			}
  		}
  	}
@@ -850,12 +850,12 @@
  	 * the chip erase command.
  	 */
  	ENABLE_VPP(map);
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
-	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
-	cfi_send_gen_cmd(0x10, cfi->addr_unlock1, chip->start, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, 
cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, 
cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, 
cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, 
cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, 
cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x10, cfi->addr_unlock1, chip->start, map, cfi, 
cfi->device_type, NULL);
  	timeo = jiffies + (HZ*20);
  	adr = cfi->addr_unlock1;

@@ -1029,11 +1029,11 @@
  	       __func__, adr );

  	ENABLE_VPP(map);
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
-	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, 
CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, 
cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, 
cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, 
cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, 
cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, 
cfi->device_type, NULL);

  	cfi_write(map, CMD(0x30), adr);
  	
