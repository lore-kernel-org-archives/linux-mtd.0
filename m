Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LqYFp-00087J-A9
	for linux-mtd@lists.infradead.org; Sun, 05 Apr 2009 19:43:48 +0000
Date: Sun, 5 Apr 2009 21:43:35 +0200
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [RFC/PATCH] flash_eraseall: extra care if NOR flash is not
	BIT_WRITEABLE
Message-ID: <20090405194335.GA10484@Chamillionaire.breakpoint.cc>
References: <1237848138-18157-1-git-send-email-sebastian@breakpoint.cc>
	<1237848138-18157-4-git-send-email-sebastian@breakpoint.cc>
	<1237874727.14602.95.camel@localhost.localdomain>
	<20090324085530.GA21444@Chamillionaire.breakpoint.cc>
	<1237962807.14602.99.camel@localhost.localdomain>
	<20090326134418.GB21993@shareable.org>
	<20090326154142.GA15963@Chamillionaire.breakpoint.cc>
	<Pine.LNX.4.64.0903261650100.9213@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0903261650100.9213@lnxricardw.se.axis.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Jamie Lokier <jamie@shareable.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Ricard Wanderlof | 2009-03-26 16:54:21 [+0100]:

> On Thu, 26 Mar 2009, Sebastian Andrzej Siewior wrote:
>
>> I'm sorry. That is actually my point. The layout of the cleanmarker (which 
>> are used only by JFFS2) depends on a specific kernel switch in case of NOR 
>> flash which is not BIT_WRITEABLE and userland can't know that. I've sent a 
>> patch to remove the -j option because the generated cleanmaker *may* be 
>> wrong. Artem replied that he would like to see this fixed. So here is an 
>> attempt to fix this: black listed ubi & data flash but I dunno how fix the 
>> NOR case where does not have BIT_WRITEABLE bit. A commandline switch for 
>> those who know what they do? Why don't rip out -j and let the kernel 
>> create clean marker if it needs it?
>
> There can be a performance benefit to having the image contain cleanmarkers 
> rather than the kernel having to do it. Specifically, if a cleanmarker is 
> missing, the kernel doesn't know if it's because it's a virgin image or 
> because a previous erase failed (typically because of a power fail during 

okay. So providing clean-markers is here a one-time optimization.


> erase). In the case of a failed erase, the sector might not be properly 
> erased (i.e. even though the bytes might read 0xFF they might not be 
> properly erase, resulting in spurious bitflips later). So, the kernel must 
> erase the sector (which for a NOR flash is a slow operation) before writing 
> the cleanmarker.

and this can happen anyway so your clean-marker support in
flash_eraseall does not help here.

>
> For a given application it may be possible to skip the 
> erase-before-writing-cleanmarker, but in the general case it is necessary, 
> which slows system startup (the flash cannot be used while it is being 
> erased).

Please don't get me wrong. I don't want to rip clean-markers out from
jffs2. I just thought, that it is enough to have it in kernel since it is
the only place where the final layout is known. 


> /Ricard
Sebastian
