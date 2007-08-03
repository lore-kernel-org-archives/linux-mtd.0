Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IH6EI-0003mi-Dp
	for linux-mtd@lists.infradead.org; Fri, 03 Aug 2007 19:06:48 -0400
Date: Sat, 4 Aug 2007 01:02:48 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
Message-ID: <20070803230248.GA22021@lazybastard.org>
References: <1185882932.3083.98.camel@pmac.infradead.org>
	<6934efce0707311255k57b60d59y5a07d2812b37ca1a@mail.gmail.com>
	<20070801121800.GB2747@lazybastard.org> <46B083B3.80009@de.ibm.com>
	<6934efce0708011337g32169212v329c778bb7700aea@mail.gmail.com>
	<46B18D89.1010207@de.ibm.com>
	<6934efce0708021455h29c9151aw7aab2245df0062e5@mail.gmail.com>
	<1186146543.2931.82.camel@pmac.infradead.org>
	<20070803131815.GG19344@lazybastard.org>
	<6934efce0708031245j5f292b17w64de8bb75435ea98@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6934efce0708031245j5f292b17w64de8bb75435ea98@mail.gmail.com>
Cc: carsteno@de.ibm.com, dhowells <dhowells@redhat.com>,
	=?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
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

On Fri, 3 August 2007 12:45:45 -0700, Jared Hulbert wrote:
> 
> > > Perhaps we want to set it up so that _if_ there is a process which can
> > > continue, it'll do so. Only when there's nothing runnable in userspace
> > > do we suspend an erase? In that case, perhaps we'd want some kind of
> > > hook in the idle loop?
> >
> > Or we could just always suspend the erase and resume it the next time we
> > enter the kernel, either via system call or interrupt.  Should allow the
> > process to make some progress without starving the erase.  Would need
> > hooks as well, just in different places.
> 
> Hmmm, we'd definitely benefit from having a hook in idle to trigger
> the erase to resume.  Having hooks for entry into kernel space sounds
> interesting, but if you leave it too quickly and suspend the erase you
> don't make forward progress.  However, I'm not sure how you'd
> determine whether a given process can continue without suspending the
> erase.

Does the system ever idle in a userspace process?  If not then you'd
have to come by one of my hooks before going into idle.

Even better, if the process does a system call, or an interrupt happens,
it will not access the XIP pages while the syscall/interrupt is
processed.  So the erase may as well resume for the time being.  And
potentially it can even run a little longer if no XIP faults happen.

The big question is how such a scheme would perform.  It may turn out so
bad that we should rather copy the data, hand out RAM and wait for
memory pressure to remove those pages again.

Jörn

-- 
I don't understand it. Nobody does.
-- Richard P. Feynman
