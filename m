Received: from imladris.demon.co.uk ([193.237.130.41]
	helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ALVJQ-0001kb-LQ
	for <linux-mtd@lists.infradead.org>; Sun, 16 Nov 2003 22:24:11 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Joshua Wise <joshua@joshuawise.com>
In-Reply-To: <200311150109.39539.joshua@joshuawise.com>
References: <200311150109.39539.joshua@joshuawise.com>
Message-Id: <1069021350.3450.65.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Sun, 16 Nov 2003 22:22:31 +0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: "Eric W. Biederman" <ebiederman@lnxi.com>
cc: Thayne Harbaugh <tharbaugh@lnxi.com>
Subject: Re: JEDEC probing redux
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2003-11-15 at 01:09 -0500, Joshua Wise wrote:
> But first, some background. On the iPAQ h1910, we have an LV400BT chip (id 
> 0001/22B9) that we probe by JEDEC. The chip expects unlock addresses of 
> 0x555/0x2AA in word mode.

> However, HP had to throw a twist in - they shifted the address lines over one. 
> A1 on the CPU is connected to A0 on the flash chip, etcetera, so we have to 
> left-shift the unlock addresses.

No. The chip manufacturer did that. Its 'A0' line is what normal people
would call 'A1', and that's why when you put them in byte mode they also
have an 'A-1' line, for which someone really deserves to burn in hell.

The chip in question wants to see a logical '1' on its A1, A3, A5 etc.
lines for the first unlock cycle, then on A0, A2, A4 etc. for the
second.

That corresponds to the CPU's addresses 0xAAA and 0x554, as you've
observed. In byte mode it's just the _same_, only it also wants a logic
'1' on its 'A-1' address line too, so the latter address is 0x555.

Looking at the tables in jedec_probe.c, mostly of the form...

		.name		= "Fujitsu MBM29LV400BC",
		.uaddr		= {
			[0] = MTD_UADDR_0x0AAA_0x0555,  /* x8 */
			[1] = MTD_UADDR_0x0555_0x02AA,  /* x16 */
		},
... it looks like they're supposed to be shifted by cfi->device_type
before actually being used. But, aside from a brief experiment of
Thayne's, they aren't actually being shifted. So the [1] /* x16 */ entry
is wrong, and should be identical to the [0] /* x8 */ one.

In fact, I assert that the entries for each device_type should _always_
be the same. We shouldn't need an array for uaddr; just a single int
should suffice. Although we do need to mask out the lower bits (0x555
vs. 0x554).

I'm going to assert it thusly...

Thayne? Eric?

Index: jedec_probe.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/jedec_probe.c,v
retrieving revision 1.40
diff -u -r1.40 jedec_probe.c
--- jedec_probe.c	16 Nov 2003 21:42:44 -0000	1.40
+++ jedec_probe.c	16 Nov 2003 22:11:23 -0000
@@ -1510,6 +1510,12 @@
 
 	uaddr = finfo->uaddr[uaddr_idx];
 
+	if (uaddr != MTD_UADDR_NOT_SUPPORTED ) {
+		/* ASSERT("The unlock addresses for non-8-bit mode
+		   are bollocks. We don't really need an array."); */
+		uaddr = finfo->uaddr[0];
+	}
+
  uaddr_done:
 	return uaddr;
 }
@@ -1518,6 +1524,7 @@
 static int cfi_jedec_setup(struct cfi_private *p_cfi, int index)
 {
 	int i,num_erase_regions;
+	unsigned long mask;
 	__u8 uaddr;
 
 	printk("Found: %s\n",jedec_table[index].name);
@@ -1551,8 +1558,11 @@
 		kfree( p_cfi->cfiq );
 		return 0;
 	}
-	p_cfi->addr_unlock1 = unlock_addrs[uaddr].addr1;
-	p_cfi->addr_unlock2 = unlock_addrs[uaddr].addr2;
+
+	/* Mask out address bits which are smaller than the device type */
+	mask = ~((1<<p_cfi->device_type)-1);
+	p_cfi->addr_unlock1 = unlock_addrs[uaddr].addr1 & mask;
+	p_cfi->addr_unlock2 = unlock_addrs[uaddr].addr2 & mask;
 
 	return 1; 	/* ok */
 }

-- 
dwmw2
