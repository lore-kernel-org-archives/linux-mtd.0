Received: from blackbird.intercode.com.au ([203.32.101.10]
	ident=[aUBoayhVyGsxAnlEsH1AfT1N7gHCEotM])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19M3wr-0002ye-TC
	for <linux-mtd@lists.infradead.org>; Sat, 31 May 2003 11:50:54 +0100
Date: Sat, 31 May 2003 20:51:04 +1000 (EST)
From: James Morris <jmorris@intercode.com.au>
To: "David S. Miller" <davem@redhat.com>
In-Reply-To: <20030530.232004.115919834.davem@redhat.com>
Message-ID: <Mutt.LNX.4.44.0305312025270.6696-100000@excalibur.intercode.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: dwmw2@infradead.org
cc: matsunaga_kazuhisa@yahoo.co.jp
cc: joern@wohnheim.fh-wedel.de
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

On Fri, 30 May 2003, David S. Miller wrote:

>    From: James Morris <jmorris@intercode.com.au>
>    Date: Sat, 31 May 2003 01:29:42 +1000 (EST)
>    
>    This won't work for the bh lock protected case outlined above, and
>    will cause contention between different users of zlib.
> 
> My understanding is that these are just scratchpads.  The contents
> while a decompress/compress operation is not occuring does not
> matter.

It depends on how the zlib library is used.  The filesystems and crypto
code use it so that each operation is distinct, although it is possible to
maintain compression history between operations: PPP does this via a
sliding compression window, and there are other potential users such as
ROHC.

One way of addressing this would to allow the user to supply their own 
workspace if compression history needs to be maintained.

> So if we have 2 such scratchpads per cpu, one for normal and one for
> BH context, his idea truly can work and be useful to everyone.
> It would also be lockless on SMP.

And perhaps implement with a lazy allocation scheme so that these
scratchpads are only allocated if needed (i.e. a caller does not provide
its own workspace).


- James
-- 
James Morris
<jmorris@intercode.com.au>
