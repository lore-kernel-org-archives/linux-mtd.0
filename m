Received: from node3.inaccessnetworks.com ([212.205.200.118]
	helo=inaccessnetworks.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fxjvs-0001ZR-3W
	for linux-mtd@lists.infradead.org; Tue, 04 Jul 2006 08:23:29 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by inaccessnetworks.com (8.13.6/8.13.5) with ESMTP id k64CMrO9017185
	for <linux-mtd@lists.infradead.org>; Tue, 4 Jul 2006 15:22:53 +0300
Received: from inaccessnetworks.com ([127.0.0.1])
	by localhost (host11.inaccessnetworks.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 16936-07 for <linux-mtd@lists.infradead.org>;
	Tue,  4 Jul 2006 15:22:53 +0300 (EEST)
Received: from priv.inaccessnetworks.com (orion.priv.inaccessnetworks.com
	[192.168.1.2])
	by inaccessnetworks.com (8.13.6/8.13.5) with ESMTP id k64CMlIm017177
	for <linux-mtd@lists.infradead.org>; Tue, 4 Jul 2006 15:22:48 +0300
Received: from [192.168.1.3] (draco.priv.inaccessnetworks.com [192.168.1.3])
	by priv.inaccessnetworks.com (8.12.1/8.12.1) with ESMTP id
	k64CMfBJ001638
	for <linux-mtd@lists.infradead.org>; Tue, 4 Jul 2006 15:22:46 +0300
Message-ID: <44AA5D91.5000806@inaccessnetworks.com>
Date: Tue, 04 Jul 2006 15:22:41 +0300
From: Angelos Manousarides <amanous@inaccessnetworks.com>
MIME-Version: 1.0
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: MTD device with multiple regions & JFFS2
References: <44A519A8.4030800@inaccessnetworks.com>	<625fc13d0606300613q770a7f8cq57d90eea42255df@mail.gmail.com>	<20060630135646.GA12360@inaccessnetworks.com>
	<625fc13d0606300736x17b65cday54aa633cd08db257@mail.gmail.com>
In-Reply-To: <625fc13d0606300736x17b65cday54aa633cd08db257@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------020109040502090203030206"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------020109040502090203030206
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Josh Boyer wrote:
> On 6/30/06, Angelos Manousarides <amanous@inaccessnetworks.com> wrote::
> 
>>The code in mtdpart.c does not propagate erase region information to the
>>slave device. I have ckeched with the git repository online and it is
>>still the same. Here is the code I am talking about, it is the only reference
>>in regions in mtdpard.c:
>>
>>    if (master->numeraseregions>1) {
>>      /* Deal with variable erase size stuff */
>>      int i;
>>      struct mtd_erase_region_info *regions = master->eraseregions;
>>
>>      /* Find the first erase regions which is part of this partition. */
>>      for (i=0; i < master->numeraseregions && slave->offset >= regions[i].offset; i++)
>>        ;
>>
>>      for (i--; i < master->numeraseregions && slave->offset + slave->mtd.size > regions[i].offset; i++) {
>>        if (slave->mtd.erasesize < regions[i].erasesize) {
>>          slave->mtd.erasesize = regions[i].erasesize;
>>        }
>>      }
>>    } else {
>>      /* Single erase size */
>>      slave->mtd.erasesize = master->erasesize;
>>    }
>>
>>I have changed this to allocate slave->mtd.eraseregions and set
>>slave->mtd.numeraseregions properly.
>>
>>If this is not needed, then definately I am missing something here.
> 
> 
> It should really only make a difference if a partition actually spans
> two different erase regions.  And even then I'm not sure it really
> matters much.  But I suppose there is nothing bad about doing it
> correctly.

Here is the patch. Identation sucks, but it sucked in the original file 
as well.

-- 
Angelos Manousaridis

--------------020109040502090203030206
Content-Type: text/x-patch;
 name="l.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="l.patch"

--- drivers/mtd/mtdpart.c	2006-06-18 04:49:35.000000000 +0300
+++ /home/u0/amanous/sbx/linux/drivers/mtd/mtdpart.c	2006-07-04 15:02:18.000000000 +0300
@@ -465,10 +465,9 @@
 		if (slave->offset == MTDPART_OFS_APPEND)
 			slave->offset = cur_offset;
 		if (slave->offset == MTDPART_OFS_NXTBLK) {
-			slave->offset = cur_offset;
-			if ((cur_offset % master->erasesize) != 0) {
-				/* Round up to next erasesize */
-				slave->offset = ((cur_offset / master->erasesize) + 1) * master->erasesize;
+			u_int32_t emask = master->erasesize-1;
+			slave->offset = (cur_offset + emask) & ~emask;
+			if (slave->offset != cur_offset) {
 				printk(KERN_NOTICE "Moving partition %d: "
 				       "0x%08x -> 0x%08x\n", i,
 				       cur_offset, slave->offset);
@@ -496,24 +495,97 @@
 		}
 		if (master->numeraseregions>1) {
 			/* Deal with variable erase size stuff */
-			int i;
-			struct mtd_erase_region_info *regions = master->eraseregions;
+			struct mtd_erase_region_info *mreg = master->eraseregions;
+			int firstr, lastr;
+			int r;
 
-			/* Find the first erase regions which is part of this partition. */
-			for (i=0; i < master->numeraseregions && slave->offset >= regions[i].offset; i++)
+			/* find the starting region */
+			for (r=0; r < master->numeraseregions && slave->offset >= mreg[r].offset; r++)
+				;
+			firstr = r - 1;
+			/* find the ending region */
+			for (r = firstr; r < master->numeraseregions &&
+				slave->offset + slave->mtd.size > 
+				mreg[r].offset + mreg[r].numblocks * mreg[r].erasesize; r++)
 				;
+			lastr = r;
+			if ( lastr == firstr ) {
+				/* Master device has multiple regions, but this partition is contained within one region */
+				slave->mtd.numeraseregions = 0;
+				slave->mtd.erasesize = mreg[firstr].erasesize;
+				printk(KERN_NOTICE "  single erase region with size 0x%08x and erasesize 0x%08x\n",
+					slave->mtd.size, slave->mtd.erasesize);
+			} else {
+				/* partition does span across multiple regions */
+				u_int32_t soff, max_erasesize;
+				struct mtd_erase_region_info *sreg;
+				int mr, sr;
+
+				if ( (slave->offset - mreg[firstr].offset) % mreg[firstr].erasesize ) {
+					printk("mtd: ignoring partition \"%s\", "
+						"doesn't start on an erase block boundary\n", parts[i].name);
+					continue;
+				}
+				if ( (slave->offset + slave->mtd.size - mreg[lastr].offset) % mreg[lastr].erasesize ) {
+					printk("mtd: ignoring partition \"%s\", "
+						"doesn't end on an erase block boundary\n", parts[i].name);
+					continue;
+				}
 
-			for (i--; i < master->numeraseregions && slave->offset + slave->mtd.size > regions[i].offset; i++) {
-				if (slave->mtd.erasesize < regions[i].erasesize) {
-					slave->mtd.erasesize = regions[i].erasesize;
+				slave->mtd.numeraseregions = lastr - firstr + 1;
+				slave->mtd.eraseregions = sreg = kmalloc(slave->mtd.numeraseregions *
+					sizeof(struct mtd_erase_region_info), GFP_KERNEL);
+				if  ( ! slave->mtd.eraseregions ) {
+					printk("memory allocation error while creating erase region list"
+						" for partition \"%s\"\n", slave->mtd.name);
+					return -ENOMEM;
 				}
+
+				max_erasesize = 0;
+				mr = firstr;
+				sr = 0;
+
+				while ( mr <= lastr ) {
+					sreg[sr].erasesize = mreg[mr].erasesize;
+					sreg[sr].offset = mreg[mr].offset - slave->offset;
+					sreg[sr].numblocks = mreg[mr].numblocks;
+				
+					if ( sreg[sr].erasesize > max_erasesize )
+						max_erasesize = sreg[sr].erasesize;
+					mr++; sr++;
+				}
+
+				if ( slave->offset > mreg[firstr].offset ) {
+					/* fix first region if it is not on sector boundary */
+					sreg[0].offset = 0;
+					sreg[0].numblocks = mreg[firstr].numblocks -
+						(slave->offset - mreg[firstr].offset) / mreg[firstr].erasesize;
+				}
+
+				soff = mreg[lastr].offset + mreg[lastr].erasesize * mreg[lastr].numblocks
+					- slave->offset - slave->mtd.size;
+				if ( soff ) {
+					/* fix last region if it is not on sector boundary */
+					sreg[slave->mtd.numeraseregions-1].numblocks -= soff / mreg[lastr].erasesize;
+				}
+
+				slave->mtd.erasesize = max_erasesize;
+
+				for ( sr = 0; sr < slave->mtd.numeraseregions; sr++ )
+					printk("  region %d : offset 0x%08x erasesize 0x%08x blocks %d\n", sr,
+						slave->mtd.eraseregions[sr].offset,
+						slave->mtd.eraseregions[sr].erasesize,
+						slave->mtd.eraseregions[sr].numblocks);
 			}
 		} else {
 			/* Single erase size */
+			slave->mtd.numeraseregions = 0;
 			slave->mtd.erasesize = master->erasesize;
+			printk(KERN_NOTICE "  single erase region with size 0x%08x and erasesize 0x%08x\n",
+				slave->mtd.size, slave->mtd.erasesize);
 		}
 
-		if ((slave->mtd.flags & MTD_WRITEABLE) &&
+		if (!slave->mtd.numeraseregions && (slave->mtd.flags & MTD_WRITEABLE) && 
 		    (slave->offset % slave->mtd.erasesize)) {
 			/* Doesn't start on a boundary of major erase size */
 			/* FIXME: Let it be writable if it is on a boundary of _minor_ erase size though */
@@ -521,7 +593,7 @@
 			printk ("mtd: partition \"%s\" doesn't start on an erase block boundary -- force read-only\n",
 				parts[i].name);
 		}
-		if ((slave->mtd.flags & MTD_WRITEABLE) &&
+		if (!slave->mtd.numeraseregions && (slave->mtd.flags & MTD_WRITEABLE) && 
 		    (slave->mtd.size % slave->mtd.erasesize)) {
 			slave->mtd.flags &= ~MTD_WRITEABLE;
 			printk ("mtd: partition \"%s\" doesn't end on an erase block -- force read-only\n",

--------------020109040502090203030206--
