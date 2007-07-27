Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IEQd4-00037y-Rg
	for linux-mtd@lists.infradead.org; Fri, 27 Jul 2007 10:17:20 -0400
Date: Fri, 27 Jul 2007 15:48:25 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
Message-ID: <20070727134825.GA9122@lazybastard.org>
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 26 July 2007 17:04:56 -0700, Jared Hulbert wrote:
> 
> This is necessary to XIP applications because vm_insert_pfn() requires
> a physical address.  Allows AXFS to get the physical address on the
> flash of it's partition.  Second try, see
> (www.infradead.org/pipermail/linux-mtd/2006-August/016342.html)

I believe this is wrong.  For XIP you need two things:
o the physical address and
o play nicely with other (possibly rw) users.

Your patch still allows a JFFS2 on the other partition, corrupting any
XIP pages AXFS has handed out.  No cookies.

Is there a reason you haven't used point() and unpoint()?  What is wrong
with those functions?

Jörn

-- 
This above all: to thine own self be true.
-- Shakespeare
