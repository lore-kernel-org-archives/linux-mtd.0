Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1520ia-0008Tt-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 May 2001 02:12:12 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F1BD619B2A58D41197990050DA2C08E40258E3@SLINK12> 
References: <F1BD619B2A58D41197990050DA2C08E40258E3@SLINK12> 
To: Jan Rovins <Jan.Rovins@radisys.com>
Cc: linux-mtd@lists.infradead.org, Steve Ferri <steve.ferri@radisys.com>
Subject: Re: MTD on a Motorola MPCN765 ? (32 bit linux and 64 bit flash) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 22 May 2001 02:16:20 +0100
Message-ID: <31007.990494180@redhat.com>
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

Jan.Rovins@radisys.com said:
> But the recommendations I was given assume I am running Linux in 64
> bit mode,  which I am not. My longs are still 32 bit,
>  and I can now read the flash through MTD, but can't yet form commands
> to write and erase the upper two 16 bit flash devices. (To access
> those upper two devices I would have to add 0x04 to the unlock1,&2
> addresses) When using interleaved chips, are the commands always given
> to the whole bank simultaneously? Could I fake a 64 bit write by doing
> two 32 bit writes? Basically I will be reading & writing flash as a 32
> bit machine would, but faking up 64 bit commands.  Would this work?

That should work.

But if you're doing that, why not just pretend that you have two entirely 
separate chip mappings, with two entirely independent pairs of 16-bit chips 
in them? Then you don't need to muck about with the 64-bit flash command 
stuff. You just need to be aware that your bootloader will probably then be 
split between the first erase block of each device. But that's easy enough 
to deal with.



--
dwmw2
