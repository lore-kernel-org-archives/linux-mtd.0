Received: from wa-out-1112.google.com ([209.85.146.182])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IH23f-0000io-PK
	for linux-mtd@lists.infradead.org; Fri, 03 Aug 2007 14:39:33 -0400
Received: by wa-out-1112.google.com with SMTP id v33so910615wah
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Aug 2007 11:39:29 -0700 (PDT)
Message-ID: <6934efce0708031139o236838c0qd5be1bc3f9abc16f@mail.gmail.com>
Date: Fri, 3 Aug 2007 11:39:29 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
In-Reply-To: <1186146543.2931.82.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
	<1185882932.3083.98.camel@pmac.infradead.org>
	<6934efce0707311255k57b60d59y5a07d2812b37ca1a@mail.gmail.com>
	<20070801121800.GB2747@lazybastard.org> <46B083B3.80009@de.ibm.com>
	<6934efce0708011337g32169212v329c778bb7700aea@mail.gmail.com>
	<46B18D89.1010207@de.ibm.com>
	<6934efce0708021455h29c9151aw7aab2245df0062e5@mail.gmail.com>
	<1186146543.2931.82.camel@pmac.infradead.org>
Cc: carsteno@de.ibm.com, dhowells <dhowells@redhat.com>,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > Maybe I wasn't so clear.  Assuming the MTD is going to do an erase you would:
> >
> > (a) zap all page affected by block erase
> > (b) identify all pte's mapped to the affected region
> > (c) modify these pte's so they now trigger a fault
> > (d) wait for completion of erase
> > (c) reestablish valid pte mappings
>
> No need to reestablish them -- they'll fault when they need to, which
> means less work next time you erase. And it'll be a minor page fault,
> which is quite cheap -- it only needs to set up the pte and return.

Correct you don't _need_ to.  I'm not sure how cheap that fault is,
this is definitely just an optimization.

> > If you get a fault it gets routed to the filesystem .fault or
> > something like that.  The .fault routine can:
> > (a) suspend the erase
> > (b) copy the page to RAM
> > (c) update the pte to point to RAM
> > (d) resume the erase
>
> This could lead to all your data pages ending up in RAM, which kind of
> defeats the object of XIP.

Right, the assumption is that the number of fault would be low (not
sure how good that assumption is) and that you would push out all
those pages out of RAM at the end of the erase.
