Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19M4Cw-00037c-34
	for <linux-mtd@lists.infradead.org>; Sat, 31 May 2003 12:07:30 +0100
Date: Sat, 31 May 2003 13:07:43 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: James Morris <jmorris@intercode.com.au>
Message-ID: <20030531110743.GA24300@wohnheim.fh-wedel.de>
References: <20030530.232004.115919834.davem@redhat.com>
	<Mutt.LNX.4.44.0305312025270.6696-100000@excalibur.intercode.com.au>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Mutt.LNX.4.44.0305312025270.6696-100000@excalibur.intercode.com.au>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: "David S. Miller" <davem@redhat.com>
cc: matsunaga_kazuhisa@yahoo.co.jp
cc: dwmw2@infradead.org
cc: linux-kernel@vger.kernel.org
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH RFC] 1/2 central workspace for zlib
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 31 May 2003 20:51:04 +1000, James Morris wrote:
> On Fri, 30 May 2003, David S. Miller wrote:
> 
> > My understanding is that these are just scratchpads.  The contents
> > while a decompress/compress operation is not occuring does not
> > matter.
> 
> It depends on how the zlib library is used.  The filesystems and crypto
> code use it so that each operation is distinct, although it is possible to
> maintain compression history between operations: PPP does this via a
> sliding compression window, and there are other potential users such as
> ROHC.
> 
> One way of addressing this would to allow the user to supply their own 
> workspace if compression history needs to be maintained.

Agreed.  How much memory is needed for the history?  Most of the
workspace or substancially less?

> > So if we have 2 such scratchpads per cpu, one for normal and one for
> > BH context, his idea truly can work and be useful to everyone.
> > It would also be lockless on SMP.
> 
> And perhaps implement with a lazy allocation scheme so that these
> scratchpads are only allocated if needed (i.e. a caller does not provide
> its own workspace).

Disagreed.  Two scratchpads per cpu won't hurt in the mean case much
and lazy allocation wouldn't improve the worst case either.  Keep them
static and simple.

Jörn

-- 
With a PC, I always felt limited by the software available. On Unix, 
I am limited only by my knowledge.
-- Peter J. Schoenster
