Received: from host31-220.pool21757.interbusiness.it ([217.57.220.31]
	helo=wawnet.biz)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19kirT-00012b-SW
	for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2003 12:23:16 +0100
Message-Id: <5.1.1.6.0.20030807130525.0246b1f0@192.168.2.1>
Date: Thu, 07 Aug 2003 13:23:02 +0200
To: manningc2@actrix.gen.nz,"Nick Bane" <nick@cecomputing.co.uk>,
 David Woodhouse <dwmw2@infradead.org>,yaffs@toby-churchill.org,
 linux-mtd@lists.infradead.org
From: llandre <r&d@wawnet.biz>
In-Reply-To: <1060251988.25209.22.camel@passion.cambridge.redhat.com>
References: <20030806194320.68FDE14DF8@desire.actrix.co.nz>
 <5.2.1.1.0.20030804110326.00c65950@dns.struinfo.it>
 <5.2.1.1.0.20030805091433.00c4e370@192.168.2.1>
 <20030806194320.68FDE14DF8@desire.actrix.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: Re: Can't load yaffs.o (unresolved symbol __get_mtd_device)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>On Sun, 2003-09-07 at 20:47, Charles Manning wrote:
> > I would suggest you resolve the real problem.
>
>  <...>
>
> > Thus it seems the  mtd header files you are including are inconsistent 
> with
> > the mtd you have in the kernel. Likely the cure is just fixing up your
> > include paths.
>
>It's not just include paths which are broken, Charles. The CFLAGS are
>randomly different too. Take a look at the way the MTD makefiles build
>-- using 'make -C $KERNELDIR SUBDIRS=`pwd` modules'. That's basically
>the only way to get it right consistently.

I solved the problem. I was building the YAFFS module on the target that 
unfortunately has no working RTC device yet. So the system clock is 
initialized to Dec, 31st 1969 every time system boots. I don't know why 
this caused this erroneous build (the yaffs.o file was built anyway but gcc 
warned about the clock skew).
Then I tried to build the module on the development host trough the 
cross-compiler ppc-linux-gcc (the source files are the same because I use a 
NFS to share the sources between the host and the target).
After building it this way, I can load it on the target without any problem.

Many thanks again for the help.


llandre
