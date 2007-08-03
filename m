Received: from wa-out-1112.google.com ([209.85.146.177])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IH35n-0001X2-BW
	for linux-mtd@lists.infradead.org; Fri, 03 Aug 2007 15:45:50 -0400
Received: by wa-out-1112.google.com with SMTP id v33so924989wah
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Aug 2007 12:45:45 -0700 (PDT)
Message-ID: <6934efce0708031245j5f292b17w64de8bb75435ea98@mail.gmail.com>
Date: Fri, 3 Aug 2007 12:45:45 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
In-Reply-To: <20070803131815.GG19344@lazybastard.org>
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
	<20070803131815.GG19344@lazybastard.org>
Cc: carsteno@de.ibm.com, dhowells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > > (a) suspend the erase
> > > (b) reenable the pte
> > > (c) wait a short time
> > > (d) disable pte again
> > > (e) resume the erase
> >
> > Alternatively, just wait for the chip to become available. Or increment
> > a count of 'waiters' and only interrupt the erase when there are a
> > certain number of people waiting.

We can't very well just wait seconds for the chip to become available.
 We could count waiting processes, but even it there is one process in
the queue, seconds is a long time to wait.

> > Perhaps we want to set it up so that _if_ there is a process which can
> > continue, it'll do so. Only when there's nothing runnable in userspace
> > do we suspend an erase? In that case, perhaps we'd want some kind of
> > hook in the idle loop?
>
> Or we could just always suspend the erase and resume it the next time we
> enter the kernel, either via system call or interrupt.  Should allow the
> process to make some progress without starving the erase.  Would need
> hooks as well, just in different places.

Hmmm, we'd definitely benefit from having a hook in idle to trigger
the erase to resume.  Having hooks for entry into kernel space sounds
interesting, but if you leave it too quickly and suspend the erase you
don't make forward progress.  However, I'm not sure how you'd
determine whether a given process can continue without suspending the
erase.
