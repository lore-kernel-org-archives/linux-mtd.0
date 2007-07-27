Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IETvF-00080k-71
	for linux-mtd@lists.infradead.org; Fri, 27 Jul 2007 13:48:22 -0400
Date: Fri, 27 Jul 2007 19:44:31 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
Message-ID: <20070727174431.GB11189@lazybastard.org>
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
	<20070727134825.GA9122@lazybastard.org>
	<6934efce0707271005w2d8ba5cs4aa9ff66c69e9c2a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6934efce0707271005w2d8ba5cs4aa9ff66c69e9c2a@mail.gmail.com>
Cc: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 27 July 2007 10:05:22 -0700, Jared Hulbert wrote:
> 
> > Is there a reason you haven't used point() and unpoint()?
> 
> No.  In fact, I do use them.  They give me a virtual address and
> protect the AXFS volume from the inevitable impolite rw filesystems on
> the same chip.

Protection makes sense.  Do you also need the virtual address?

> > What is wrong with those functions?
> 
> They don't get me the physical address.

Might be an idea to extent point() to pass a physical address as well.
Not sure.

Jörn

-- 
Everything should be made as simple as possible, but not simpler.
-- Albert Einstein
