Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Kwok-0001qy-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2001 07:52:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B4E4E40.5300A2DD@sun.com> 
References: <3B4E4E40.5300A2DD@sun.com> 
To: Tim Hockin <thockin@sun.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: hacking - need feedback 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 13 Jul 2001 07:58:23 +0100
Message-ID: <24388.995007503@redhat.com>
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

thockin@sun.com said:
>  Would life be easier if all maps just called do_map_probe_all() and
> that would walk down the list of supported chiptypes?

Maybe, but to be honest most map driver authors know what type of chip is 
going to be found. No harm in providing it, as long it remains possible to 
call the other probes individually.

> 	cfi_probe
> 	jedec_probe (new)
> 	jedec
> 	amd_flash
> 	ram
> 	rom

I think there'll be an intel_probe in there too, passing control to 
cfi_cmdset_000[13]. 


>  Is it true that the code in cfi_probe.c (for doing things like
> interleave, multiple chips etc) should be common for CFI and JEDEC
> (and others?)  If so, it should be shared, but it hardly makes sense
> that do_map_probe("cfi") would find jedec chips...

A lot of the required magic is actually in include/linux/mtd/cfi.h. to the 
extent that the contents of cfi_probe.c end up duplicated in jedec_probe.c, 
I think we should just live with it.


>  Sorry I'm rambling.  I'm still trying to wrap my head around the lot
> of it, and being new to the codebase, it is easy for me to say "rip
> out the old stuff" :)

Believe me, it's still easy to say "rip out the old stuff". :)


--
dwmw2
