Received: from rv-out-0910.google.com ([209.85.198.190])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IGidq-0000Mj-CU
	for linux-mtd@lists.infradead.org; Thu, 02 Aug 2007 17:55:37 -0400
Received: by rv-out-0910.google.com with SMTP id g11so509213rvb
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Aug 2007 14:55:32 -0700 (PDT)
Message-ID: <6934efce0708021455h29c9151aw7aab2245df0062e5@mail.gmail.com>
Date: Thu, 2 Aug 2007 14:55:32 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: carsteno@de.ibm.com
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
In-Reply-To: <46B18D89.1010207@de.ibm.com>
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
Cc: dhowells <dhowells@redhat.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> That does'nt work on smp machines, does it?

Probably not.  That code is machine specific, and only implemented for
a couple of ARM targets.

> Sounds like a hack to me.

:)  Yes but it works where it needs to.  It's done a lot in the cellular world.

> How do you know a user app that has a valid pte to your flash media
> accesses it? Userspace may do so at any time it wants, and as far as I
> understand Joerns and Davids explanations on flash it will just see
> invalid data rather than raising a page fault.

Maybe I wasn't so clear.  Assuming the MTD is going to do an erase you would:

(a) zap all page affected by block erase
(b) identify all pte's mapped to the affected region
(c) modify these pte's so they now trigger a fault
(d) wait for completion of erase
(c) reestablish valid pte mappings


If you get a fault it gets routed to the filesystem .fault or
something like that.  The .fault routine can:
(a) suspend the erase
(b) copy the page to RAM
(c) update the pte to point to RAM
(d) resume the erase
-or-
(a) suspend the erase
(b) reenable the pte
(c) wait a short time
(d) disable pte again
(e) resume the erase
