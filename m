Received: from d-200.linux2002.uq.net.au ([203.15.37.200] helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ZMkz-0003Zs-00
	for <linux-mtd@lists.infradead.org>; Sat, 09 Feb 2002 01:56:50 +0000
Date: Sat, 9 Feb 2002 11:34:05 +1000 (EST)
From: David Woodhouse <dwmw2@infradead.org>
To: Chris Fowler <cfowler@outpostsentinel.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: msys/fla and load tims
In-Reply-To: <200202081322.g18DMQY32394@skylab.outpostsentinel.com>
Message-ID: <Pine.LNX.4.44.0202091132220.2394-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Fri, 8 Feb 2002, Chris Fowler wrote:

> It appears that the device I'm building has hight load averages.  
> Around 1.  I notice that the msys/fla process is running with a priority
> of -10.  What I can not understand is what this process is doing. I
> mount my flash temporarily in r/o mode to load software. I also read
> about 30k of data from a raw partition.  The only time the flash is
> mounted r/w is during a flash.  Top shows all my processes idle.  This
> would be normal oreration for my system. Could the msys process be
> looping or doing something not needed?

We don't know. We don't have the source. I recommend you either ask 
M-Systems or use the driver in the kernel tree instead. I doubt that's 
perfect either - but at least we can improve that one.

-- 
dwmw2
