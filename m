Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cveot-0000hG-50
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 11:54:47 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e2.ny.us.ibm.com (8.12.10/8.12.10) with ESMTP id j0VGsV7F029376
	for <linux-mtd@lists.infradead.org>; Mon, 31 Jan 2005 11:54:31 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j0VGsVa6120162
	for <linux-mtd@lists.infradead.org>; Mon, 31 Jan 2005 11:54:31 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j0VGsUxM020769
	for <linux-mtd@lists.infradead.org>; Mon, 31 Jan 2005 11:54:30 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050131152943.GF6694@wohnheim.fh-wedel.de>
References: <1106946232.7542.33.camel@windu.rchland.ibm.com>
	<1106998793.17802.3.camel@sauron.oktetlabs.ru>
	<1107013860.10670.5.camel@windu.rchland.ibm.com>
	<20050131125613.GA6345@wohnheim.fh-wedel.de>
	<1107184238.7567.17.camel@windu.rchland.ibm.com>
	<20050131152943.GF6694@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Mon, 31 Jan 2005 10:54:25 -0600
Message-Id: <1107190465.7567.29.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: haverkam@de.ibm.com, linux-mtd@lists.infradead.org
Subject: Re: NAND partitioning
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-01-31 at 16:29 +0100, Jörn Engel wrote:
> 
> Not sure if there really is a problem that needs solving.
> 
> Your concern is that you need R blocks for the raw data, pick an
> arbitrary number A of blocks, but notice that A-R is less than B, the
> number of bad blocks in the area.  Sure.
> 
> So now you simply pick a sufficiently large A.  Let's say that your
> flashes have 5% bad blocks on average.  I'm too lazy to do the math
> properly, but if you pick A = 1.2*R, then well over 99% of all flash
> chips should have less than 20% bad blocks in you boot partition.

Blocks go bad during usage, and data sizes change.  Also, often times
one is given a specific chip size and told "make it work".  That can put
some more restrictions on how large of a static partition you can make
for a given set of data.

> 
> And for the remaining 0.something%, you are the one to argue why those
> chips have a sufficient quality to hit the field.  I'd be scared.

I don't make those decisions.  But when something goes bad, and
something always does, I have to deal with it.

josh
