Received: from dns01.mail.yahoo.co.jp ([211.14.15.204])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19MrqC-0005Al-Bi
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jun 2003 17:07:20 +0100
Message-ID: <006001c32921$0be01400$570486da@w0a3t0>
From: "matsunaga" <matsunaga_kazuhisa@yahoo.co.jp>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: 
	<20030530144959.GA4736@wohnheim.fh-wedel.de><002901c32919$ddc37000$570486da@w0a3t0>
	<20030602153656.GA679@wohnheim.fh-wedel.de>
Date: Tue, 3 Jun 2003 01:07:20 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: David Woodhouse <dwmw2@infradead.org>
cc: linux-mtd@lists.infradead.org
cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] 1/2 central workspace for zlib
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Not bad.  We can even do a little better.  Since only one workspace is
> really absolutely necessary (ignoring the siftirq case), there is no
> need to fail anymore.  If we don't get enough memory for all
> workspaces, initialize the semaphore to be a little lower and live
> with fewer workspaces.
> 
> I like your ideas, really! :)

Thanks.
 
> ...that is not trivial to get rid of.  Image the case where two
> processes are writing to two devices.  With two buffers, we do rmew
> whenever switching blocks for one device.  With one buffer, we have to
> do it for every context switch between those two processes, which will
> wear down the flash a lot faster.
> 
> Considering that mtdblock should not be performance critical in
> production use anyway, this is a very hard problem.  What do you
> think?

I understand the difficulty. It is difficult to be hard coded for multi devices.
There maybe other things to be modified to improve perforamance.

BR.
Matsunaga
