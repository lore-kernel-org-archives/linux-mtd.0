Received: from mail.dot4.com ([216.57.134.36])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BiHMl-0004G5-IC
	for linux-mtd@lists.infradead.org; Wed, 07 Jul 2004 14:42:00 -0400
Received: from [192.168.200.101] (unknown [192.168.200.101])
	by mail.dot4.com (Postfix) with SMTP id 37A1A40DC
	for <linux-mtd@lists.infradead.org>;
	Wed,  7 Jul 2004 14:41:58 -0400 (EDT)
Message-ID: <40EC43ED.6090401@dot4.com>
Date: Wed, 07 Jul 2004 14:41:49 -0400
From: "Thomas W. Nelson" <twn@dot4.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <40EB0D28.60309@dot4.com>
	<1089196350.5577.22.camel@localhost.localdomain>
In-Reply-To: <1089196350.5577.22.camel@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: MTD support on Motorola Hawk ASIC-based boards
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:

>Our code doesn't currently handle the case where you have more chips
>than you can address in a single bus cycle, and there are different sets
>of chips at different bus addresses.
>
>I've just encountered a board slightly more pathological than this --
>the Dy-4 SVME/DMV-182 seems to have eight 32-bit chips, arranged
>interleaved so that the word at 0x0000 is the first chip, as is the word
>at 0x0020... You then find your CFI 'Q' at 0x200, 'R' at 0x220, etc...
>
>There's a hack in the TimeSys kernel which was never discussed or shown
>here, which makes the code handle the concept that the repetition
>interval (the address at which you start talking to chip 0 again) may be
>a _multiple_ of the buswidth. They call this multiple
>'extra_interleave'.
>
>When I first looked at it I thought it was a horrifically ugly hack, but
>having looked for alternative approaches I don't think it's their fault
>--  _all_ the CFI code gives me the same kind of skullache.
>
>Alternative suggestions for handling this are most definitely welcome.
>
>A simple alternative in your case might be to say your buswidth is 64,
>and hack your write64 to do it in 2 32-bit accesses. But we need to
>address this properly anyway.
>
>The patch is against an old snapshot of MTD code but should serve to
>illustrate the concept. The CVS Ids of the files it's based on are
>present in the diff.
>  
>
Thanks for the info and insight on this, Dave.  Your assistance is 
sincerely appreciated.

We did some preliminary work for TimeSys on the SVME182 (since we had 
already ported their 4.1 release to the '181), and I was rather 
surprised when our initial shot at the MTD code didn't work on it.  Now 
I know why.

Just as a sanity check (since I have so little left :-), will these 
modifications also correctly deal with the 32-bit only write limitation 
during probes?  Getting the chips into query mode appears to be the real 
challenge here; I haven't been able to perform the correct incantation 
to get them to respond in any way, CFI or JEDEC.  BTW, despite the 
apparent chip labeling, there's a possibility that the devices on the 
Mot boards may actually be a pre-CFI version released by AMD for them.  
Sigh...

I'd also like to inject some personal observations about the more 
complex flash geometries that are appearing.  On higher-end boards, such 
as those from Dy4, Pentek, etc., these multibank interleaved 
configurations are becoming very common as their customers want high 
performance flash access for their XIP or flash filesystem-based 
application environments.  We are seeing an increasing number of our 
clients in the avionics, machine vision, and other demanding 
high-performance environments using this class of hardware migrating 
from proprietary to embedded Linux solutions for all the well-publicized 
reasons I won't repeat here.  Therefore, it will become increasingly 
important for the credibility of Linux in these higher-end embedded 
systems to provide adequate support for these configurations.

That said, I'll certainly assist with this effort whenever I can slice 
off some spare cycles and we have access to this type of hardware for 
testing.  First, I have to finish wrapping my brain around the current 
MTD design/implementation.

Best regards...
-- 
Thomas W. Nelson
Sr. Consulting Engineer, Dot4, Inc.
twn@dot4.com <mailto:twn@dot4.com>
