Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pWjV-0001Ei-00
	for mtd-list@infradead.org; Tue, 17 Apr 2001 15:45:33 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14pWjU-0001Ec-00
	for mtd@infradead.org; Tue, 17 Apr 2001 15:45:32 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F1BD619B2A58D41197990050DA2C08E40258D8@SLINK12> 
References: <F1BD619B2A58D41197990050DA2C08E40258D8@SLINK12> 
To: Jan Rovins <jrovins@ss7-link.com>
Cc: mtd@infradead.org, Steve Ferri <sferri@ss7-link.com>
Subject: Re: MTD on a Motorola MPCN765 ? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 17 Apr 2001 15:45:11 +0100
Message-ID: <25732.987518711@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


jrovins@ss7-link.com said:
> I tried some guesses at AMD CFI configuration, but it looks like our
> board has exotic flash chips & geometry that are not currently
> supported in MTD. (Time to roll up my sleeves & start hacking code)

> The MPCN765 has a 16MB bank of flash that is 64 bits wide (Ugh!) and
> is comprised of four 16 bit devices.

Hmmm. This isn't currently supported, but it should be on 64-bit platforms.

In a few places, we currently assume that __u32 is big enough to hold the 
largest word for accessing flash - when building commands, etc. 

If we change that to 'unsigned long' and put all the 64-bit stuff inside 
"#ifdef BITS_PER_LONG >= 64" we should be OK. 


jrovins@ss7-link.com said:
> Right now I am looking for some general guidance as to which direction
> to proceed. my gut feel is to do a board specific Mapping
> implementation, because of the strange geometry. The other alternative
> would be to expand the generic AMD/CFI stuff so that it could
> accommodate our board's flash geometry.

You need both - you'll need to provide a board-specific mapping driver, and 
you also need to extend the generic code a little so it can cope with 
64-bit busses.

Roughly:
 1. Provide cfi64_to_cpu and cpu_to_cfi64 in include/linux/mtd/cfi_endian.h
 2. Add the necessary 64-bit parts to the inline routines in cfi.h - 
	cfi_write(), cfi_read(), cfi_read_query(), cfi_build_cmd(), etc.,
	and make them use 'unsigned long' instead of __u32 for holding
	a bus word. 
	Also add the CFIDEV_BUSWIDTH_8 definitions. You can leave out 
	CFIDEV_INTERLEAVE_8 for now unless you're feeling virtuous.
 3. Fix up the CFI command set drivers to use unsigned long too, and add the
	64-bit cases where appropriate. 

Remember to surround all 64-bit stuff with #ifdef CFIDEV_BUSWIDTH_8 (which 
in turn is dependent on BITS_PER_LONG >= 64). 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
