Received: from c-24-1-171-57.client.comcast.net ([24.1.171.57]
	helo=zilding.zilding.net)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AHYQW-0004cU-D3
	for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2003 00:55:08 +0000
Message-ID: <3FA99B92.3030102@blueridge.net>
Date: Wed, 05 Nov 2003 18:53:38 -0600
From: Jim Duchek <jrduchek@blueridge.net>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <3FA9315E.2090508@genaero.com>
	<1068078256.11685.6.camel@imladris.demon.co.uk>
In-Reply-To: <1068078256.11685.6.camel@imladris.demon.co.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 + PPM-TX166 (PATCH)
Reply-To: Jim Duchek <jduchek@genaero.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'll take a look at getting you that backtrace -- I don't think we have 
one of our boxes with a keyboard/video on it right now, but next time I 
get the opportunity I'll get you that.  I haven't tried removing the 
udelay.  I didn't consider that the udelay might have been the problem 
until after I'd put the yield() in, and then later was discussing what 
the difference might have been and I thought of the TSC/non-TSC 
udelays.  I'll give that a shot tomorrow as well -- it really ought to 
be removed anyhow if a resched() is going to happen right after it.  We 
did try the latest CVS code (perhaps two weeks ago) and saw no 
difference, so reverted back to the 2.4.22 released version. 


Jim

David Woodhouse wrote:

>On Wed, 2003-11-05 at 11:20 -0600, Jim Duchek wrote:
>  
>
>>I traced the problem down to the cond_resched() in WaitReady in 
>>doc2000.c.  Removing cond_resched() made the problem go away (and the 
>>system unresponsive while doing any DoC access).  Replacing the 
>>udelay(1) and cond_resched() with a yield() fixes everything. 
>>    
>>
>
>Very strange. Calling yield() really isn't what we want there; we wanted
>cond_resched(). What if you leave the cond_resched() and remove the
>udelay()? What if you make the udelay() larger?
>
>When the system is locked up as you described, can you hit SysRq-T to
>see the backtrace of the stuck thread, and show me the (decoded) output.
>
>Does the same happen even with the current CVS code?
>
>  
>
