Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13mGlT-0006kH-00
	for mtd-list@infradead.org; Thu, 19 Oct 2000 15:33:51 +0100
Date: Thu, 19 Oct 2000 10:30:04 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: cfi_cmdset_0001 unaligned write problems.
In-Reply-To: <21991.971964332@redhat.com>
Message-ID: <Pine.LNX.4.10.10010191023540.29348-100000@xanadu.vipswitch.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Thu, 19 Oct 2000, David Woodhouse wrote:

> Either this code is suspect or I need more caffeine. Probably both.
> Scenario: Buswidth is 2. CPU is big-endian. Writing '5a' to an odd address.
> 
> 	/* If it's not bus-aligned, do the first byte write */
> 	if (ofs & (CFIDEV_BUSWIDTH-1)) {
> 		unsigned long bus_ofs = ofs & ~(CFIDEV_BUSWIDTH-1);
> 		int i = 0, n = 0;
> 		u_char tmp_buf[4];
> 		__u32 datum;
> 
> 		while (bus_ofs++ < ofs)
> 			tmp_buf[i++] = 0xff;
> 		while (len && i < CFIDEV_BUSWIDTH)
> 			tmp_buf[i++] = buf[n++], len--;
> 		while (i < CFIDEV_BUSWIDTH)
> 			tmp_buf[i++] = 0xff;
> 
> // now tmp_buf is 0xff,0x5a,xx,yy
> 
> 		if (cfi_buswidth_is_2()) {
> 			datum = *(__u16*)tmp_buf;
> 
> // now datum is 0xff5a (stored as 0,0,ff,5a)
> 
> 		} else if (cfi_buswidth_is_4()) {
> 			datum = *(__u32*)tmp_buf;
> 		} else {
> 			return -EINVAL;  /* should never happen, but be safe */
> 		}
> 
> 		ret = do_write_oneword(map, &cfi->chips[chipnum],
> 					       ofs, datum);
> // do_write_oneword writes 2 bytes at &datum, which is 0,0.
> // What's more, it writes it to 'ofs' (and faults on the unaligned access)
> //  instead of to buf_ofs, which was presumably the intention.

Yeah...  I just fixed that one...  Wonder why it worked for me till now...

However I suspect that there might be an issue with __u16 promoted to
__u32 then back to __u16 on big endian CPUs.  What is the expected
behavior?

On LE, 0x1234 becomes 0x00001234 the back to 0x1234 which is fine...


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
