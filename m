Received: from smtprelay03.ispgateway.de ([80.67.18.15])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EV3Ah-0005q3-My
	for linux-mtd@lists.infradead.org; Thu, 27 Oct 2005 04:31:45 -0400
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.97.128])
	(envelope-sender <priewasser@gmail.com>)
	by smtprelay03.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 27 Oct 2005 08:31:37 -0000
Message-ID: <43609066.1010805@gmail.com>
Date: Thu, 27 Oct 2005 10:31:34 +0200
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <436089F3.806@gmail.com>
	<20051027082108.GC24422@wohnheim.fh-wedel.de>
In-Reply-To: <20051027082108.GC24422@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
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

> Not easily.  I haven't done the experiments myself, but wear-out
> effects were described to me.  Basically, you can write to a block and
> read it back out in a tight loop and things will never fail.  Not
> after 100k, not after 1M erases.  But if you write to the block and
> wait long enough, bits will flip.
> 
> Bit-flipping will always happen from 0 to 1, similar to erases.
> Problem should be that the insulation around a flash cell has eroded
> and the charge will leak out over time - this cell is self-erasing
> now.

So this means that you have to hope that no block will wear out. And 
count on JFFS2's wear levelling.

What are the reasons that cause NAND blocks to die before they would 
"officially" wear out?
Dou you have a hint for good literature on this stuff (OK, let's better 
say NAND and NOR flash memory in general)?

-- 
Bernhard
