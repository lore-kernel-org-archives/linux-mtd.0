Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 168ftm-0004RF-00
	for <linux-mtd@lists.infradead.org>; Tue, 27 Nov 2001 10:55:34 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20011123130136.A94932@idiom.com> 
References: <20011123130136.A94932@idiom.com>  <E1669aI-0001iv-00@pentafluge.infradead.org> 
To: Geoffrey Espin <espin@idiom.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: 4 x AMD29LV800B CFI? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 27 Nov 2001 11:05:28 +0000
Message-ID: <16214.1006859128@redhat.com>
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

espin@idiom.com said:
>  Perhaps my h/w setup is insisting that all 4 parts are programmed at
> once?  I see ifdef SOMEONE_ACTUALLY... for width 4 type 32 interleave
> 4; maybe this means generate the right pattern? 

That's around the code for 32-bit flash chips. You don't have 32-bit chips, 
you have 16-bit chips, in 8-bit mode.

I've used the 29LV160, and it's definitely CFI-compliant. Strangely, the 
29LV800 isn't. But the jedec_probe code doesn't yet recognise it. Try 
this...

Index: drivers/mtd/chips/jedec_probe.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/jedec_probe.c,v
retrieving revision 1.6
diff -u -r1.6 jedec_probe.c
--- drivers/mtd/chips/jedec_probe.c	2001/10/22 10:16:08	1.6
+++ drivers/mtd/chips/jedec_probe.c	2001/11/27 11:04:56
@@ -35,6 +35,8 @@
 #define AM29LV800BT	0x22DA
 #define AM29LV160DT	0x22C4
 #define AM29LV160DB	0x2249
+#define AM29LV800BT	0x22DA
+#define AM29LV800BB	0x225B
 
 /* Atmel */
 #define AT49BV16X4	0x00c0
@@ -97,6 +99,30 @@
 #define SIZE_8MiB   23
 
 static const struct amd_flash_info jedec_table[] = {
+	{
+		mfr_id: MANUFACTURER_AMD,
+		dev_id: AM29LV800BT,
+		name: "AMD AM29LV800BT",
+		DevSize: SIZE_1MiB,
+		CmdSet:	P_ID_AMD_STD,
+		NumEraseRegions: 4,
+		regions: {ERASEINFO(0x10000,15),
+			  ERASEINFO(0x08000,1),
+			  ERASEINFO(0x02000,2),
+			  ERASEINFO(0x04000,1)
+		}
+	}, {
+		mfr_id: MANUFACTURER_AMD,
+		dev_id: AM29LV800BB,
+		name: "AMD AM29LV800BB",
+		DevSize: SIZE_1MiB,
+		CmdSet:	P_ID_AMD_STD,
+		NumEraseRegions: 4,
+		regions: {ERASEINFO(0x04000,1),
+			  ERASEINFO(0x02000,2),
+			  ERASEINFO(0x08000,1),
+			  ERASEINFO(0x10000,15)
+		}
 	{
 		mfr_id: MANUFACTURER_AMD,
 		dev_id: AM29LV160DT,



--
dwmw2
