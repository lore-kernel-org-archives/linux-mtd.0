Received: from pizda.ninka.net ([216.101.162.242] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Lzjh-0001UE-Ev
	for <linux-mtd@lists.infradead.org>; Sat, 31 May 2003 07:21:01 +0100
Date: Fri, 30 May 2003 23:20:04 -0700 (PDT)
Message-Id: <20030530.232004.115919834.davem@redhat.com>
To: jmorris@intercode.com.au
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <Mutt.LNX.4.44.0305310101550.30969-100000@excalibur.intercode.com.au>
References: <20030530144959.GA4736@wohnheim.fh-wedel.de>
	<Mutt.LNX.4.44.0305310101550.30969-100000@excalibur.intercode.com.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

   From: James Morris <jmorris@intercode.com.au>
   Date: Sat, 31 May 2003 01:29:42 +1000 (EST)
   
   This won't work for the bh lock protected case outlined above, and
   will cause contention between different users of zlib.

My understanding is that these are just scratchpads.  The contents
while a decompress/compress operation is not occuring does not
matter.

So if we have 2 such scratchpads per cpu, one for normal and one for
BH context, his idea truly can work and be useful to everyone.
It would also be lockless on SMP.
