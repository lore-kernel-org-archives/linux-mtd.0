Received: from imladris.demon.co.uk ([193.237.130.41] ident=exim)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eZAE-00047J-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2003 11:16:55 +0000
Date: Fri, 31 Jan 2003 11:47:51 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Stephane List <stephane.list@lilotux.net>
cc: linux-mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <20030131112500.GA18237@lilotux.net>
Message-ID: <Pine.LNX.4.44.0301311141550.7456-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Subject: Re: Howto handle 2 flashs with addresses not contiguous ?
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Fri, 31 Jan 2003, Stephane List wrote:

> My mtd drivers are not far from working..
> I've replaced CONFIG_ZLIB by CONFIG_ZLIB_DEFLATE and INFLATE
> It's compiled and linked in lib.a but I can't see the functions in
> System.map ! And when I insmod jffs2, I've got unresolved symbols..

The because lib/lib.a is a library, objects which aren't referenced are 
not pulled in to your vmlinux binary. If nothing in the kernel image 
itself uses zlib_inflate or zlib_deflate, they need to be built as 
modules too.

> I've got flash at physical address :
> 0x1000 0000 - 0x11FF FFFF
> and
> 0X2000 0000 - 0x21FF FFFF
> 
> what is the good method to handle this ? I don't thing it's a good
> solution to ioremap from the beginning of the first flash to the end of
> the second. Will it work if I copy physmap.c in a second file to have 2
> physmap drivers inserted in my kernel ?

Yes but then you'll have two separate MTD devices, although you can use 
the 'mtdconcat' code to merge them into one. You can also write your own 
map driver which ioremaps both and translates access requests from the 
chip driver so that offsets 0->0x1ffffff go to the first one at 
0x10000000, and offsets 0x2000000->0x3ffffff go to the second one at 
0x20000000. 

-- 
dwmw2
