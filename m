Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15tVJg-0001cD-00
	for <linux-mtd@lists.infradead.org>; Tue, 16 Oct 2001 15:35:36 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <7C0E66E1B97BD5119B120002A50A63D22E419F@hasmsx101.iil.intel.com> 
References: <7C0E66E1B97BD5119B120002A50A63D22E419F@hasmsx101.iil.intel.com> 
To: "Kremer, Alex" <alex.kremer@intel.com>
Cc: "'Larry Doolittle'" <ldoolitt@recycle.lbl.gov>,
    linux-mtd@lists.infradead.org
Subject: Re: Bug in chip alias detection! (jedec_probe, possibly cfi_probe) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 16 Oct 2001 15:44:41 +0100
Message-ID: <9339.1003243481@redhat.com>
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

alex.kremer@intel.com said:
>  I think I have found the problem. When scanning over previously found
> chips *THEY* (chips[i].start) should be checked if they also  switched
> to autoselect mode when we switched the one we are checking now (base)

Thanks. Please could you test this slightly edited fix:

Index: drivers/mtd/chips/jedec_probe.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/jedec_probe.c,v
retrieving revision 1.5
diff -u -r1.5 jedec_probe.c
--- drivers/mtd/chips/jedec_probe.c	2001/10/06 15:56:57	1.5
+++ drivers/mtd/chips/jedec_probe.c	2001/10/16 14:44:31
@@ -583,8 +583,11 @@
 		
 		for (i=0; i<sizeof(jedec_table)/sizeof(jedec_table[0]); i++) {
 			if (mfr == jedec_table[i].mfr_id &&
-			    id == jedec_table[i].dev_id)
-				return cfi_jedec_setup(cfi, i);
+			    id == jedec_table[i].dev_id) {
+				if (!cfi_jedec_setup(cfi, i))
+					return 0;
+				goto ok_out;
+			}
 		}
 		if (!retried++) {
 			/* Deal with whichever strange chips these were */
@@ -599,8 +602,8 @@
 	for (i=0; i<cfi->numchips; i++) {
 		/* This chip should be in read mode if it's one
 		   we've already touched. */
-		if (jedec_read_mfr(map, base, osf) == cfi->mfr &&
-		    jedec_read_id(map, base, osf) == cfi->id) {
+		if (jedec_read_mfr(map, chips[i].start, osf) == cfi->mfr &&
+		    jedec_read_id(map, chips[i[.start, osf) == cfi->id) {
 			/* Eep. This chip also looks like it's in autoselect mode.
 			   Is it an alias for the new one? */
 			
@@ -640,6 +643,7 @@
 	chips[cfi->numchips].state = FL_READY;
 	cfi->numchips++;
 		
+ok_out:
 	/* Put it back into Read Mode */
 	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0xff, 0, base, map, cfi, cfi->device_type, NULL);


--
dwmw2
