Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13mGKF-0006dK-00
	for mtd-list@infradead.org; Thu, 19 Oct 2000 15:05:43 +0100
Received: from dyna252.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13mGKD-0006dE-00
	for mtd@infradead.org; Thu, 19 Oct 2000 15:05:42 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: nico@cam.org
Cc: mtd@infradead.org
Subject: cfi_cmdset_0001 unaligned write problems.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 19 Oct 2000 15:05:32 +0100
Message-ID: <21991.971964332@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Either this code is suspect or I need more caffeine. Probably both.
Scenario: Buswidth is 2. CPU is big-endian. Writing '5a' to an odd address.

	/* If it's not bus-aligned, do the first byte write */
	if (ofs & (CFIDEV_BUSWIDTH-1)) {
		unsigned long bus_ofs = ofs & ~(CFIDEV_BUSWIDTH-1);
		int i = 0, n = 0;
		u_char tmp_buf[4];
		__u32 datum;

		while (bus_ofs++ < ofs)
			tmp_buf[i++] = 0xff;
		while (len && i < CFIDEV_BUSWIDTH)
			tmp_buf[i++] = buf[n++], len--;
		while (i < CFIDEV_BUSWIDTH)
			tmp_buf[i++] = 0xff;

// now tmp_buf is 0xff,0x5a,xx,yy

		if (cfi_buswidth_is_2()) {
			datum = *(__u16*)tmp_buf;

// now datum is 0xff5a (stored as 0,0,ff,5a)

		} else if (cfi_buswidth_is_4()) {
			datum = *(__u32*)tmp_buf;
		} else {
			return -EINVAL;  /* should never happen, but be safe */
		}

		ret = do_write_oneword(map, &cfi->chips[chipnum],
					       ofs, datum);
// do_write_oneword writes 2 bytes at &datum, which is 0,0.
// What's more, it writes it to 'ofs' (and faults on the unaligned access)
//  instead of to buf_ofs, which was presumably the intention.

		if (ret) 
			return ret;
		
		ofs += n;
		buf += n;
		(*retlen) += n;

		if (ofs >> cfi->chipshift) {
			chipnum ++; 
			ofs = 0;
			if (chipnum == cfi->numchips)
				return 0;
		}
	}




--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
