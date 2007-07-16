Received: from mail.dsa-ac.de ([62.112.80.99])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IAQAR-0005BZ-9E
	for linux-mtd@lists.infradead.org; Mon, 16 Jul 2007 08:59:12 -0400
Date: Mon, 16 Jul 2007 14:58:57 +0200 (CEST)
From: Guennadi Liakhovetski <gl@dsa-ac.de>
To: Nicolas Pitre <nico@cam.org>
Subject: Re: Bogus usage of HZ in cfi_cmdset_0001.c
In-Reply-To: <alpine.LFD.0.999.0707051121090.26459@xanadu.home>
Message-ID: <Pine.LNX.4.63.0707161457250.8578@pcgl.dsa-ac.de>
References: <Pine.LNX.4.63.0707051445440.8578@pcgl.dsa-ac.de>
	<alpine.LFD.0.999.0707050934570.26459@xanadu.home>
	<Pine.LNX.4.63.0707051552270.8578@pcgl.dsa-ac.de>
	<alpine.LFD.0.999.0707051121090.26459@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 5 Jul 2007, Nicolas Pitre wrote:

> Let's see.
> 
> drivers/mtd/chips/cfi_cmdset_0001.c from line 1029:
> 
> |                } else if (usec >= 1000000/HZ) {
> |                        /*
> |                         * Try to save on CPU power when waiting delay
> |                         * is at least a system timer tick period.
> |                         * No need to be extremely accurate here.
> |                         */
> |                        xip_cpu_idle();
> 
> The important clue here is: "at least a system timer tick period".

[snip]

Thanks for explaning, Nicolas.

Guennadi
---------------------------------
Guennadi Liakhovetski, Ph.D.
DSA Daten- und Systemtechnik GmbH
Pascalstr. 28
D-52076 Aachen
Germany
