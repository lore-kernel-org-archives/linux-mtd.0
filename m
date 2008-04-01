Received: from mail8.sea5.speakeasy.net ([69.17.117.10])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jgcda-000715-V4
	for linux-mtd@lists.infradead.org; Tue, 01 Apr 2008 09:18:39 +0000
Date: Tue, 1 Apr 2008 02:18:44 -0700 (PDT)
From: Trent Piepho <xyzzy@speakeasy.org>
To: Laurent Pinchart <laurentp@cse-semaphore.com>
Subject: Re: [PATCHv2] powerpc: Describe memory-mapped RAM&ROM chips OF
	bindings
In-Reply-To: <200804011047.42971.laurentp@cse-semaphore.com>
Message-ID: <Pine.LNX.4.64.0804010217470.3571@t2.domain.actdsltmp>
References: <200803311839.10519.laurentp@cse-semaphore.com>
	<47F11A19.4050305@ru.mvista.com>
	<200804011047.42971.laurentp@cse-semaphore.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: Sergei Shtylyov <sshtylyov@ru.mvista.com>, linuxppc-dev@ozlabs.org,
	MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 1 Apr 2008, Laurent Pinchart wrote:
> On Monday 31 March 2008 19:06, Sergei Shtylyov wrote:
>>>        p) Freescale Synchronous Serial Interface
>>> -	  q) USB EHCI controllers
>>> +      q) USB EHCI controllers
>>> +      r) Memory-mapped RAM & ROM
>>
>>     Memory-mapped RA/RO Memory again? Should better drop this. :-)
>
> You're quite picky, aren't you ? :-)
>
> I suppose "Memory-mapped RA & RO" won't be accepted, so what about "Auxiliary
> RAM & ROM" ?

Direct-mapped?
