Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189h7R-0004oQ-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2002 07:30:25 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20021106204530.GE12743@pc.ilinx> 
References: <20021106204530.GE12743@pc.ilinx>  <D99C1FB421989A40818B6370E3187094040A3A91@tayexc19.americas.cpqcorp.net> <20021030185507.GA31547@wohnheim.fh-wedel.de> <20021030193834.GE27880@pc.ilinx> <20021030201608.GA28523@wohnheim.fh-wedel.de> <20021030204937.GG27880@pc.ilinx> <200211041 
To: "Brian J. Murrell" <f327b61d4f54c7b54025800b32e2ac7c@interlinx.bc.ca>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD Config.in items not escaped by bus availability 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 07 Nov 2002 08:00:36 +0000
Message-ID: <6557.1036656036@passion.cambridge.redhat.com>
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

f327b61d4f54c7b54025800b32e2ac7c@interlinx.bc.ca said:
> You are absolutely right!  That is what I get for patching my vendor's
> kernel-source rather than working with a virgin kernel.org tree.  Find
> attached a new patch, covering all 16 architectures.  I don't know
> what some of them are (i.e. "sh, "cris") but I am assuming they are
> all hardware an all have memory busses. 

What happens when someone makes a mapping driver for UML which mmaps part 
of /dev/kmem from the host?

--
dwmw2
