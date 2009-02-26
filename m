Received: from 2605ds1-ynoe.1.fullrate.dk ([90.184.12.24] helo=shrek.krogh.cc)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LcmGL-0005iM-Vu
	for linux-mtd@lists.infradead.org; Thu, 26 Feb 2009 19:51:20 +0000
Message-ID: <49A6EE17.4070102@krogh.cc>
Date: Thu, 26 Feb 2009 20:31:35 +0100
From: Jesper Krogh <jesper@krogh.cc>
MIME-Version: 1.0
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Linux 2.6.29-rc6
References: <alpine.LFD.2.00.0902222023520.3111@localhost.localdomain>
	<49A679E8.1010301@krogh.cc>
	<alpine.LFD.2.00.0902260941090.3111@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.00.0902260941090.3111@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Ryan Jackson <rjackson@lnxi.com>, Dave Olsen <dolsen@lnxi.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linus Torvalds wrote:
> Dave Olsen <dolsen@lnxi.com>,
>     Ryan Jackson <rjackson@lnxi.com>, David.Woodhouse@intel.com, 
> linux-mtd@lists.infradead.org
> 
> 
> On Thu, 26 Feb 2009, Jesper Krogh wrote:
>>
>> Booting up 2.6.29-rc6 gave me this one in dmesg...
>>
>> [   21.136149] ck804xrom ck804xrom_init_one(): Unable to register resource 0x00000000ff000000-0x00000000ffffffff - kernel bug?
> 
> Well, it _is_ a kernel bug, but it's in that stupid driver. It does 
> everything wrong, including printing out a scary message.

I've seen that before.. (even reported it before). It just "slipped" 
into the cut'n'paste It was the following stuff that I intended to report.

>> [   21.136269] WARNING: at arch/x86/mm/ioremap.c:208 __ioremap_caller+0x359/0x390()
> 
> This is a different, but related warning, since the driver is doing an 
> ioremap across different resources. The warning is directly related to the 
> fact that the resource wasn't actually valid to begin with.
> 
> What does "cat /proc/iomem" say?

http://krogh.cc/~jesper/iomem.txt

>> System is fully operational, but I didnt get it in 2.6.26.8 (most recent
>> kernel tried on this hardware).
> 
> The ioremap() warning is newish, and may be what made you notice the 
> previous (just one-line) crappy warning.
> 
> Quite frankly, having looked at that horrible driver, I would seriously 
> consider disabling it. Stuff like that should not be allowed to exist.

Being a "stupid" user, I pick the easy way to build a fresh kernel:
1) pick the distro .config
2) make oldconfig
3) Let the kernel load what it think it needs.
4) Report if I see and strange stuff (warnings / bugs / oops) or 
misbehaviour.

So I dont know if I need that driver for anything vital. Should I care? 
Or shouldn't it "just work"?

-- 
Jesper
