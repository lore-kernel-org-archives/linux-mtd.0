Received: from ms-smtp-01.rdc-kc.rr.com ([24.94.166.115])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B6vUr-00088K-Ia
	for linux-mtd@lists.infradead.org; Fri, 26 Mar 2004 17:51:57 +0000
From: Dan Eisenhut <deisenhut@wi.rr.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1080222037.29835.50.camel@hades.cambridge.redhat.com>
References: <1080221409.21277.30.camel@localhost>
	 <1080222037.29835.50.camel@hades.cambridge.redhat.com>
Content-Type: multipart/mixed; boundary="=-h6SYHDlxhxbbfxO0HuV8"
Message-Id: <1080323446.25996.15.camel@localhost>
Mime-Version: 1.0
Date: Fri, 26 Mar 2004 11:50:46 -0600
cc: linux-mtd@lists.infradead.org
Subject: Re: do_erase_oneblock failing to detect lock-bit failure
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-h6SYHDlxhxbbfxO0HuV8
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2004-03-25 at 07:40, David Woodhouse wrote:
> On Thu, 2004-03-25 at 07:30 -0600, Dan Eisenhut wrote:
> > Is byte-lane swapping common?  
> 
> Not really. It's generally a symptom of hardware engineers who really
> don't understand the problem, and think it might help.

I looked into why they did this and apparently it was a recommendation
from Motorola.  We are using a MPC8270 processor.

> > Wouldn't this code fail for someone
> > without byte-lane swapping but requiring little endian enabled?  By
> > changing the if statements with (chipstatus & 0xNN) with (status &
> > CMD(0xNN)) appears to correct my problem, but I sure this is not the
> > best solution.
> 
> You made me think about it again and now my head hurts. I suspect that
> we should be using cfi_read_query() to read the status bits, not
> cfi_read(). 

I tried changing cfi_read to cfi_read_query, which sets status to
0x00a2.  But the immediate next check of "if (status & CMD(0x3a))" fails
since CMD(0x3a) resolves to 0x3a00.

Looking at it a little more, I made a couple changes which corrects the
problem for me.  (See attached diff)  How would this effect other boards
that are currently working on the existing code?  I'm not sure how
boards that do any kind of swapping were working in the first place. 
Maybe just never tested the return value on an erase to a locked block?

Dan

--=-h6SYHDlxhxbbfxO0HuV8
Content-Disposition: attachment; filename=mtd_cfi_erase.diff
Content-Type: text/x-patch; name=mtd_cfi_erase.diff; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

diff -uNr clean/drivers/mtd/chips/cfi_cmdset_0001.c mtd/drivers/mtd/chips/cfi_cmdset_0001.c
--- clean/drivers/mtd/chips/cfi_cmdset_0001.c	2004-03-26 10:33:48.000000000 -0600
+++ mtd/drivers/mtd/chips/cfi_cmdset_0001.c	2004-03-26 10:34:26.000000000 -0600
@@ -1373,8 +1373,8 @@
 
 	/* check for lock bit */
 	if (status & CMD(0x3a)) {
-		unsigned char chipstatus = status;
-		if (status != CMD(status & 0xff)) {
+		unsigned char chipstatus = cfi_to_cpu(status);
+		if (status != CMD(cfi_to_cpu(status) & 0xff)) {
 			int i;
 			for (i = 1; i<CFIDEV_INTERLEAVE; i++) {
 				      chipstatus |= status >> (cfi->device_type * 8);
diff -uNr clean/include/linux/mtd/cfi.h mtd/include/linux/mtd/cfi.h
--- clean/include/linux/mtd/cfi.h	2004-03-26 10:33:50.000000000 -0600
+++ mtd/include/linux/mtd/cfi.h	2004-03-26 10:35:42.000000000 -0600
@@ -473,6 +473,21 @@
 	}
 }
 
+static inline __u8 cfi_to_cpu(cfi_word val)
+{
+	if (cfi_buswidth_is_1()) {
+		return val;
+	} else if (cfi_buswidth_is_2()) {
+		return cfi16_to_cpu(val);
+	} else if (cfi_buswidth_is_4()) {
+		return cfi32_to_cpu(val);
+	} else if (cfi_buswidth_is_8()) {
+		return cfi64_to_cpu(val);
+	} else {
+		return 0;
+	}
+}
+
 static inline void cfi_udelay(int us)
 {
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)

--=-h6SYHDlxhxbbfxO0HuV8--
