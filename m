Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C05sT-00045b-In
	for linux-mtd@lists.infradead.org; Wed, 25 Aug 2004 18:04:25 -0400
Message-ID: <412D0CD5.3030104@mvista.com>
Date: Wed, 25 Aug 2004 15:04:05 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Der Herr Hofrat <der.herr@hofr.at>
References: <200408250608.i7P68x004504@hofr.at>
In-Reply-To: <200408250608.i7P68x004504@hofr.at>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: Can jffs2 support XIP extensions?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Der Herr Hofrat wrote:

> there are a number of examples of boot times and runtime performance posted
> on the web and ALL of them show that the boot times of XIP
> enabled kernels are primarily lower due to the kernel
> not being decompressed and other steps actually being slower.
> 
>    Table of bootup times:
> 
>    Boot Stage                         Non-XIP  Time XIP Time
>    Copy kernel to RAM                 85 ms    12 ms 
>    Decompress kernel                  453 ms   0 ms
>    Kernel time to initialize
>    (time to first user space program) 819 ms   882 ms
>    Total kernel boot time             1357 ms  894 ms
>    Reduction:                         -        463 ms
> 
> (from: http://tree.celinuxforum.org/pubwiki/moin.cgi/KernelXIP)

Yes, those are the numbers I measured on a PPC405LP.  The step of 
copying the necessary kernel image is also slower non-XIP, since XIP 
copies only the initialized data sections.  If an uncompressed non-XIP 
image is used then that particular number will increase, partially 
offseting the gain due to skipping the decompression.  Depending on the 
sizes involved XIP will likely be faster by a few tens or hundreds of 
milliseconds.  When combined with application XIP of several executables 
and shared libraries from a CramFS filesystem this can add up to a 
significant gain; if ROMFS is used to avoid compression then the 
difference is less but still significant.

> The execution times of most system calls are clearly longer (not sure if
> it was a 405/266 or a OMAP/168) fork was reported at 7.1 vs 4.8 us , trivial 
> system calls will be about the same time (did not find the reference - if of 
> interest I can dig it out).

Should be 7.1ms vs. 4.7ms, on OMAP (and 4.1ms vs. 1.1ms on PPC405LP, 
which seems to have a lower locality of reference or some other 
uninvestigated disadvantage running XIP).  I've got the full LMbench 
runs and some additional experimentation that produced those numbers as 
well.  The system will definitely run overall slower due to the slower 
memory, but certain operations such as the first exec of an image will 
be faster -- subsequent exec's of the same image may be as fast or 
faster after the block cache is warmed.

> The only (?) real argument for XIP is system RAM requirements on very small 
> systems (see: http://www.denx.de/twiki/publish/DULG/ConfigureLinuxForXIP.htm) 

System startup time reduction (including applications) is certainly a 
consideration as well.  After evaluating unit production cost, power 
consumption, startup time, and performance, some cell phone designers 
have chosen to go the XIP route, although no word on whether they'd 
choose it again the next time. ;)

-- 
Todd Poynor
MontaVista Software
