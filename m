Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189o07-0005iQ-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2002 14:51:20 +0000
Date: Thu, 7 Nov 2002 16:21:25 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Brian J. Murrell" <e88cd5ffd87e620fdc30b3e6db510d03@interlinx.bc.ca>,
   linux-mtd@lists.infradead.org
Subject: Re: MTD Config.in items not escaped by bus availability
Message-ID: <20021107152125.GA31118@wohnheim.fh-wedel.de>
References: <20021106204530.GE12743@pc.ilinx> <D99C1FB421989A40818B6370E3187094040A3A91@tayexc19.americas.cpqcorp.net> <20021030185507.GA31547@wohnheim.fh-wedel.de> <20021030193834.GE27880@pc.ilinx> <20021030201608.GA28523@wohnheim.fh-wedel.de> <20021107135052.GA13914@pc.ilinx>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20021107135052.GA13914@pc.ilinx>
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

On Thu, 7 November 2002 08:50:53 -0500, Brian J. Murrell wrote:
> On Thu, Nov 07, 2002 at 08:00:36AM +0000, David Woodhouse wrote:
> > 
> > What happens when someone makes a mapping driver for UML which mmaps part 
> > of /dev/kmem from the host?
> 
> I hope I am understanding the question/scenario you are proposing, but
> the answer seems to simple, so I am sure I am missing something.

Yupp. The actual NOR chip is connected to the memory bus and can be
accessed by reading/writing to some memory addresses. /dev/kmem gives
you access to all physical memory, so any user space program with
permissions to write /dev/kmem could act as a device driver.

This userspace program is uml. It maps host memory to uml memory and
can use all the hardware device drivers that were useless until then.

I hope, I didn't miss too much, David. Hit me, I can take it. :-)

Jörn

-- 
Fantasy is more important than knowlegde. Knowlegde is limited,
while fantasy embraces the whole world.
-- Albert Einstein
