Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FQnjQ-0003AX-Pv
	for linux-mtd@lists.infradead.org; Tue, 04 Apr 2006 11:46:19 -0400
Date: Tue, 4 Apr 2006 17:46:03 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Message-ID: <20060404154603.GF25130@wohnheim.fh-wedel.de>
References: <1144163888.6441.48.camel@localhost.localdomain>
	<Pine.LNX.4.61.0604041737440.14611@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.61.0604041737440.14611@yvahk01.tjqt.qr>
Cc: Richard Purdie <richard@openedhand.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC/testing] Upgrade the zlib_inflate library code to a
	recent version
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 4 April 2006 17:38:56 +0200, Jan Engelhardt wrote:
> >
> >Upgrade the zlib_inflate implementation in the kernel from a patched
> >version 1.1.3 to a patched 1.2.3. 
> >
> >The code in the kernel is about seven years old and I noticed that the
> >external zlib library's inflate performance was significantly faster
> >(~50%) than the code in the kernel on ARM (and faster again on x86_32).
> >
> Any plans to move to something newer, e.g. bzip2 or LZMA?

For PPP?  Write a new RFC suggesting it and explaining how to deal
with the "chunkiness" and additional memory overhead.  For JFFS2?
Bzlib compresses worse than zlib when dealing with small blocks.
For...

There may be a couple of uses where zlib could be replaced by
something else.  But even ignoring the compatibility issue it isn't
always that simple.

Jörn

-- 
With a PC, I always felt limited by the software available. On Unix, 
I am limited only by my knowledge.
-- Peter J. Schoenster
