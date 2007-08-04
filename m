Received: from wa-out-1112.google.com ([209.85.146.179])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IHNjF-000159-Vy
	for linux-mtd@lists.infradead.org; Sat, 04 Aug 2007 13:47:55 -0400
Received: by wa-out-1112.google.com with SMTP id v33so1210027wah
	for <linux-mtd@lists.infradead.org>;
	Sat, 04 Aug 2007 10:47:52 -0700 (PDT)
Message-ID: <6934efce0708041047x3ad53c8ev6c890428920c74b0@mail.gmail.com>
Date: Sat, 4 Aug 2007 10:47:52 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
In-Reply-To: <1186230794.22190.28.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
	<20070801121800.GB2747@lazybastard.org> <46B083B3.80009@de.ibm.com>
	<6934efce0708011337g32169212v329c778bb7700aea@mail.gmail.com>
	<46B18D89.1010207@de.ibm.com>
	<6934efce0708021455h29c9151aw7aab2245df0062e5@mail.gmail.com>
	<1186146543.2931.82.camel@pmac.infradead.org>
	<20070803131815.GG19344@lazybastard.org>
	<6934efce0708031245j5f292b17w64de8bb75435ea98@mail.gmail.com>
	<1186230794.22190.28.camel@shinybook.infradead.org>
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

On 8/4/07, David Woodhouse <dwmw2@infradead.org> wrote:
> On Fri, 2007-08-03 at 12:45 -0700, Jared Hulbert wrote:
> > We can't very well just wait seconds for the chip to become available.
> >  We could count waiting processes, but even it there is one process in
> > the queue, seconds is a long time to wait.
>
> Even if there's another runnable process which _isn't_ blocked on the
> chip?

Sure.  You can't just block a process that just wants a page full of
it's code, that has no dependencies to the file/page/block being
manipulated on chip, for several seconds.  You'd have all kinds of
potential badness.  I can picture someone trying to select an option
on a menu and waiting several seconds for a response.
