Received: from [145.253.187.130] (helo=proxy.baslerweb.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A9iaK-0001iE-Ug
	for <linux-mtd@lists.infradead.org>; Wed, 15 Oct 2003 11:08:53 +0100
From: Thomas Koeller <thomas.koeller@baslerweb.com>
To: ecos-discuss@sources.redhat.com
Date: Wed, 15 Oct 2003 12:11:29 +0200
References: <1065598642.12197.6.camel@famine>
	<20031008115231.7d1f012f.jani@iv.ro>
In-Reply-To: <20031008115231.7d1f012f.jani@iv.ro>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200310151211.29172.thomas.koeller@baslerweb.com>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: [ECOS] Stress testing JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In an attempt to understand what's really going on inside JFFS2, I
spent a day analyzing the code. Here's what I found. Please everybody
comment on this and correct any errors on my side.

- Every operation that changes the contents of the FLASH (even deleting files!)
  is performed by writing new nodes to the FLASH. Every such node is represented
  in RAM by a struct jffs2_raw_node_ref. The memory occupied by these structs
  is never freed unless the file system is unmounted or garbage collection
  takes place. Garbage collection starts when there are only five empty
  erase blocks left. Since every data node on the flash can hold at most one
  page (4KB) worth of data (uncompressed), the number of in-core instances of
  struct jffs2_raw_node_ref can grow very large. So in order to support a larger
  JFFS2 file system, an appropriate amount of RAM is absolutely required.

- The size of a single struct jffs2_raw_node_ref is 16 bytes. In ecos, these
  structs are allocated through calls to malloc(). If the underlying implementation
  is dlmalloc, as is probably the case most often, the minimum allocation size is
  24 bytes, so some memory is wasted here. A fixed-size block allocator would be
  more appropriate.

- In http://lists.infradead.org/pipermail/linux-mtd/2003-August/008372.html,
  David Woodhouse comments on this, suggesting possible improvements. I do not
  know if any work is going on to implement one of these (probably not).

When I originally decided to design my system around JFFS2 I was totally unaware
of these topics. Although everything I found is implicit in David Woodhouse's
paper 'JFFS : The Journalling Flash File System', it is not stated explicitly
anywhere, so I'm doing it here and now: Do not use large JFFS2 file systems if
RAM is a scarce resource!

tk
--------------------------------------------------

Thomas Koeller, Software Development

Basler Vision Technologies
An der Strusbek 60-62
22926 Ahrensburg
Germany

Tel +49 (4102) 463-162
Fax +49 (4102) 463-239

mailto:thomas.koeller@baslerweb.com
http://www.baslerweb.com

==============================
