Received: from [213.39.233.138] (helo=wohnheim.fh-wedel.de)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19euHh-0003hG-4L
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jul 2003 11:22:17 +0100
Date: Tue, 22 Jul 2003 12:21:48 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: andrzej.mialkowski@inetia.pl
Message-ID: <20030722102148.GD29430@wohnheim.fh-wedel.de>
References: <1058792691.3f1be4f31ca98@imail.internetia.pl>
	<20030721160453.GA3677@wohnheim.fh-wedel.de>
	<1058823245.3f1c5c4da93b0@imail.internetia.pl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1058823245.3f1c5c4da93b0@imail.internetia.pl>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: hardcoded maximum number of CFI chips - continued
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 21 July 2003 23:34:05 +0200, andrzej.mialkowski@inetia.pl wrote:
> 
> Yes, linked list is nice solution; I would also prefer it while writing a new 
> module. 
> Problem is that module exist and works pretty well. My priorities are time to 
> solution and risk of bug avoidance. You must agree that this is big difference 
> between changing number 8 to 10 and rewriting even only module initialization 
> to linked lists. 
> Compromise solution may be leave runtime structures as they are, and change 
> chips table to be 'reallocated' for instance in 4-16 chip increments. This 
> solution reduces to reasonable amount of copying and memory allocations (still 
> not critical during initialization), supports 'unlimited' number of chips and 
> may be implemented and tested in period of few hours. I can do this tomorrow.

In that case, why don't you just crank up the number from 8 to 16?  It
is the simpler solution to your problem at hand.

Jörn

-- 
Correctness comes second.
Features come third.
Performance comes last.
Maintainability is needed for all of them.
