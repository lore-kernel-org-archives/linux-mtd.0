Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IGx6V-0005KK-LW
	for linux-mtd@lists.infradead.org; Fri, 03 Aug 2007 09:22:10 -0400
Date: Fri, 3 Aug 2007 15:18:15 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
Message-ID: <20070803131815.GG19344@lazybastard.org>
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
	<1185882932.3083.98.camel@pmac.infradead.org>
	<6934efce0707311255k57b60d59y5a07d2812b37ca1a@mail.gmail.com>
	<20070801121800.GB2747@lazybastard.org> <46B083B3.80009@de.ibm.com>
	<6934efce0708011337g32169212v329c778bb7700aea@mail.gmail.com>
	<46B18D89.1010207@de.ibm.com>
	<6934efce0708021455h29c9151aw7aab2245df0062e5@mail.gmail.com>
	<1186146543.2931.82.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1186146543.2931.82.camel@pmac.infradead.org>
Cc: carsteno@de.ibm.com, dhowells <dhowells@redhat.com>,
	=?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 3 August 2007 14:09:03 +0100, David Woodhouse wrote:
> 
> > If you get a fault it gets routed to the filesystem .fault or
> > something like that.  The .fault routine can:
> > (a) suspend the erase
> > (b) copy the page to RAM
> > (c) update the pte to point to RAM
> > (d) resume the erase
> 
> This could lead to all your data pages ending up in RAM, which kind of
> defeats the object of XIP.
> 
> > -or-
> > (a) suspend the erase
> > (b) reenable the pte
> > (c) wait a short time
> > (d) disable pte again
> > (e) resume the erase
> 
> Alternatively, just wait for the chip to become available. Or increment
> a count of 'waiters' and only interrupt the erase when there are a
> certain number of people waiting.
> 
> Perhaps we want to set it up so that _if_ there is a process which can
> continue, it'll do so. Only when there's nothing runnable in userspace
> do we suspend an erase? In that case, perhaps we'd want some kind of
> hook in the idle loop?

Or we could just always suspend the erase and resume it the next time we
enter the kernel, either via system call or interrupt.  Should allow the
process to make some progress without starving the erase.  Would need
hooks as well, just in different places.

Jörn

-- 
This above all: to thine own self be true.
-- Shakespeare
