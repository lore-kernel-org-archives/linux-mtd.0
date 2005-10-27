Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EV30c-0005aC-WF
	for linux-mtd@lists.infradead.org; Thu, 27 Oct 2005 04:21:21 -0400
Date: Thu, 27 Oct 2005 10:21:08 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Bernhard Priewasser <priewasser@gmail.com>
Message-ID: <20051027082108.GC24422@wohnheim.fh-wedel.de>
References: <436089F3.806@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <436089F3.806@gmail.com>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: NOR "bad blocks"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 27 October 2005 10:04:03 +0200, Bernhard Priewasser wrote:
> 
> just a thought...
> Same as NAND, NOR flashes mostly have an endurance of guaranted 100K 
> program/erase cycles.
> If a block reaches this (theoretical) value, it should be recognized as 
> bad block if erase fails; e.g. not conaining only 0xFF after erase on 
> NAND. (I don't know if the "100K" erase cycle boundary is mostly 
> responsible for this)
> But obviously a block can wear out on NOR too after the max. number of 
> erase cycles. (How) can this be recognized, handled?

Not easily.  I haven't done the experiments myself, but wear-out
effects were described to me.  Basically, you can write to a block and
read it back out in a tight loop and things will never fail.  Not
after 100k, not after 1M erases.  But if you write to the block and
wait long enough, bits will flip.

Bit-flipping will always happen from 0 to 1, similar to erases.
Problem should be that the insulation around a flash cell has eroded
and the charge will leak out over time - this cell is self-erasing
now.

And if you want to check whether all this is actually true, you can
try a testrun like this:

for (int i=1; ; i++) {
	for (int j=0; j<1000; j++)
		erase(block);
	write(block);
	sleep(10);
	read(block);
	if (read doesn't match write) {
		printf("block died at %d000 erases\n", i);
		break;
	}
}

Jörn

-- 
Geld macht nicht glücklich.
Glück macht nicht satt.
