Received: from smtp6-g19.free.fr ([212.27.42.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LDbLX-0001Lj-93
	for linux-mtd@lists.infradead.org; Fri, 19 Dec 2008 09:08:36 +0000
Message-ID: <494B38E7.1090307@free.fr>
Date: Fri, 19 Dec 2008 07:02:15 +0100
From: Chris Moore <moore@free.fr>
MIME-Version: 1.0
To: Marc Oscar Singer <elf@synapse.com>
Subject: Re: [PATCH] Revised the detection for broken boot-region detection.
	MACRONIX parts have a custom implementation of
	the	fixup.	AMD	implemtation
	restore to original version that has worked fine since	2001.
References: <20081216205650.GA13729@zealous.synapse.com>	<49497440.7050204@free.fr>	<49499FDA.4010000@synapse.com>
	<4949C730.9050906@free.fr> <494A7DE8.6010404@synapse.com>
In-Reply-To: <494A7DE8.6010404@synapse.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Marc Oscar Singer a écrit :
> IMHO, it would be better to leave the AMD fixup code as it was.  It 
> works fine for the AMD parts.  My comment about
> changing what was already working has to do with the fact that editing 
> the AMD fixup code is modifying working code.
> The number of bytes saved because we don't have to check bit 7 twice in 
> the default is nominal. 

The savings are certainly not enormous but they are greater than you 
suggest.
Your patch also duplicates the fixup function and the CFI PRI V1.0 test.

>  The fixup table
> was changed to call the same function for two different manufacturers, 
> so we had to add an explicit check for the manufacturer
> in the fixup routine.  Why bother? 

The explicit manufacturer check is in fact unnecessary because:-
AMD also use the 0xBA/0x22BA device ID for their Am29LV400B part.
(As do Fujitsu, Spansion, EON and ESI.for their 29LV400B equivalents.)
However AFAIK none of these have CFI.
(And no new version is likely to have CFI V1.0.)
And, as I said previously, the fact that in practice different 
manufacturers use the same device ID for their clones was one of my 
major reasons for choosing a common CFI V1.0 fixup routine.

For the record:
I chose to add the manufacturer check in order to make it obvious that 
my patch could not break any AMD part.
I am a newbie to MTD but I wanted MX29LV400C B support.to be added 
quickly as I maintain a NAS which uses this part.
To get my patch accepted I figured that I had to make it clear:
a) that it supported my part,
b) that it broke nothing,
c) that I had done my homework (concerning which parts were supported or 
not).
In the end David Woodhouse kindly integrated my patch extremely quickly.
(I thought I had missed the merge window but it scraped into 2.6.28-rc1.)

>  The AMD fixup is stable and 
> working.  As far as I know, AMD isn't making more NOR flash,
> so we are in a good position for *not* breaking support for AMD parts.
>
>   

I find it ironic that you mention breaking support for parts since:
a) we both seem to agree that my patch broke no AMD parts,
b) OTOH your patch breaks support for the following Macronix parts:

MX28F640C3B T
MX29LV004C  T
MX29LV800C  T
MX29LV160C  T
MX29SL800C  T
MX29SL802C  T


> So, instead, lets write a new fixup for the Macronix part.  Yes, we have 
> to duplicate the bit 7 test, but the routine, overall, can
> be a straightforward switch on the exceptional IDs with the default 
> still checking bit 7.
>
> So, the principles are
>
>  1) leave working code alone.
>   

I agree that working code should not be modified gratuitously
However IMHO modification of working code is permissible when the 
purpose is to add functionality (or even as a clean up) provided it is 
obvious that nothing is broken.

>  2) use existing mechanisms as they were intended (i.e. the fixup table 
> that selects by manufacturer)
>
>   

I do see your point on this one.
However, as I said previously, it seemed to me that there were 
advantages in handling the fixup table by CFI PRI type rather than by 
the actual manufacturer of the part.
I admit that this is dubious with the existing fixup function name and I 
suggested changing the name.
Nevertheless fixup tables by manufacturer are OK with me.

> If you agree, then you should be able to make your changes on top of the 
> patch that I already submitted.
>
>   

Yes, of course.
Do you want your patch in 2.6.29-rc1?
How much time do I have to get my patch on top?
Do you think that my patches would be accepted later in the rc cycle?

However frankly IMHO your patch needs some changes first.
I shall indicate these more clearly in a parallel thread.
In particular IMHO the unnecessary case statements will be NACKed in 
mainline.

Do you know who maintains cfi_cmdset_0002.c?
The file says it is Thayne Harbaugh but AFAICS he has not posted to the 
list for four years.
Is it David Woodhouse?
Is it you?

I am afraid that I shall probably not be able even to reply in the next 
ten days.

Cheers,
Chris
