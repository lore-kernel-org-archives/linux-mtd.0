Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Weq5-0007Bs-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2002 14:38:54 +0000
Subject: Re: chip drivers
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <31144.1012571348@redhat.com>
References: <1012571237.21594.8.camel@pcjonashg>
	<1012561603.21481.4.camel@pcjonashg> <29597.1012570470@redhat.com>  
	<31144.1012571348@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 01 Feb 2002 15:49:26 +0100
Message-Id: <1012574966.21595.10.camel@pcjonashg>
Mime-Version: 1.0
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

> > Because I don't think that will work without complex code that calls
> > the probes over and over again.
> 
> Look at drivers/mtd/maps/ocelot.c. It has two map structures and calls two 
> probe functions. 

But how would I be able to detect all chips if I had a configuration
like this:

0x00000000 - 0x003FFFFF 4MiB CFI chip
0x00400000 - 0x005FFFFF 2MiB jedec only chip
0x00600000 - 0x009FFFFF 4MiB CFI chip

I could call the cfi-probe first and it would find the first chip but it
would try to find the next chip at 0x00400000 and that's not a CFI chip
so it would continue to look at 0x00800000 and miss the chip at
0x00600000. And I would have to make the jedec_probe start looking at
0x00400000 because it wouldn't find any chip at 0x00000000.

Let's say that all chips above are 2MiB instead so that the can be
detected by the probes. Would it be possible to make a partition that is
located both in a CFI and in a non-CFI chip?
 
Can the cfi-driver really handle chips of different sizes and/or
eraseregion-layouts?

I noticed that the jedec_probe only accepts identical chips (IDs) and it
thinks that it has found a new chip if my window is bigger than all my
chips together (I'll have to fix that).

/Jonas (slightly confused)
