Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14ScWd-0004ts-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 10:17:35 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14ScWc-0004sU-00
	for mtd@infradead.org; Tue, 13 Feb 2001 10:17:34 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <151F3D2AE9F0D3119E480004ACB8EA3701DEC945@cluster01.axis.se> 
References: <151F3D2AE9F0D3119E480004ACB8EA3701DEC945@cluster01.axis.se> 
To: Jonas Holmberg <jonas.holmberg@axis.com>
Cc: mtd@infradead.org
Subject: Re: Problems with cfi_cmdset_0002.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 13 Feb 2001 10:15:25 +0000
Message-ID: <18719.982059325@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


jonas.holmberg@axis.com said:
>  It looks like the eigth bit in the last byte of the device ID. It is
> 1 for top boot chips and 0 for bottom boot chips! Does anyone have the
> device IDs for any other chips? In that case, please confirm this
> theory. 

Looks like as good a heuristic as any. Just wrap it in an ifdef and we can 
remove it or make it a config option if it causes trouble.

	__u8 maj,min;
	int swap = 0;

	maj = cfi_read_query(map, (adr+3)*ofs_factor);
	min = cfi_read_query(map, (adr+4)*ofs_factor);

	cfi_send_gen_cmd(0xaa, 0x555, base, map, cfi->interleave, cfi->device_type, NULL);
	cfi_send_gen_cmd(0x55, 0x2aa, base, map, cfi->interleave, cfi->device_type, NULL);
	cfi_send_gen_cmd(0x90, 0x555, base, map, cfi->interleave, cfi->device_type, NULL);

       	cfi->mfr = cfi_read_query(map, base);
       	cfi->id = cfi_read_query(map, base + ofs_factor);

	bootloc = if (maj << 8 + min >= 0x0101 /* Is this right? */) {
		if (cfi_read_query(map, (adr+3)*ofs_factor) == 3)
			swap = 1;
	}
#ifdef FTSO_AMD
	else {
		/* Eep. Need to check JEDEC ID */
		if (cfi->id & 0x80) {
			printk(KERN_WARNING "JEDEC Device ID is 0x%02X. Assuming broken CFI table.\n" cfi->id);
			swap = 1;		
		}
	}
#endif
	if (swap) {
		printk(KERN_WARNING "Swapping erase regions for broken CFI table\n");
		/* Do the swap as before ... */
	}

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
