Received: from nz-out-0506.google.com ([64.233.162.234])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IEWoh-0002Bh-Oy
	for linux-mtd@lists.infradead.org; Fri, 27 Jul 2007 16:53:44 -0400
Received: by nz-out-0506.google.com with SMTP id z3so776579nzf
	for <linux-mtd@lists.infradead.org>;
	Fri, 27 Jul 2007 13:53:42 -0700 (PDT)
Message-ID: <6934efce0707271353t18885fc8j61a3be8a4513d7b@mail.gmail.com>
Date: Fri, 27 Jul 2007 13:53:42 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
In-Reply-To: <20070727174431.GB11189@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
	<20070727134825.GA9122@lazybastard.org>
	<6934efce0707271005w2d8ba5cs4aa9ff66c69e9c2a@mail.gmail.com>
	<20070727174431.GB11189@lazybastard.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Protection makes sense.  Do you also need the virtual address?

Yes all kernel domain read would use that address range.  In the end
it is only the vm_insert_pfn() call that needs the physical.

> > > What is wrong with those functions?
> >
> > They don't get me the physical address.
>
> Might be an idea to extent point() to pass a physical address as well.
> Not sure.

I thought about that.  I don't think it's worth it.  Point() does it's
job fine.  I could add a peer to point called physaddr() that returns
an address instead of a pointer.  That really doesn't doesn't help me.
 I named it mtd_get_partition_physaddr() because all I need is to get
the physical address of the mtd partition.  And if I get around to
doing an acceptable port of XIP cramfs thats all it would need too.
