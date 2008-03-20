Received: from mk-filter-4-a-1.mail.uk.tiscali.com ([212.74.100.55])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JcR6f-0006y3-1V
	for linux-mtd@lists.infradead.org; Thu, 20 Mar 2008 20:11:21 +0000
Subject: Re: [Fwd: Re: [PATCH] 2/2 mtd: Add support for the Dreamcast VMU
	flash]
From: Adrian McMenamin <adrian@newgolddream.dyndns.info>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20080320123139.GE1355@logfs.org>
References: <1205961641.6276.6.camel@localhost.localdomain>
	<20080320100353.GA409@logfs.org>
	<21996.85.118.17.158.1206014214.squirrel@newgolddream.dyndns.info>
	<20080320112029.GB1355@logfs.org>
	<47111.85.118.17.158.1206017802.squirrel@newgolddream.dyndns.info>
	<20080320123139.GE1355@logfs.org>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Mar 2008 20:11:01 +0000
Message-Id: <1206043861.6274.8.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 2008-03-20 at 13:31 +0100, Jörn Engel wrote:
> On Thu, 20 March 2008 12:56:42 -0000, Adrian McMenamin wrote:
> > On Thu, March 20, 2008 11:20 am, JÃ¶rn Engel wrote:
> > > On Thu, 20 March 2008 11:56:54 -0000, Adrian McMenamin wrote:
> > >> >> +
> > >> >> +	((unsigned long *)sendbuf)[0] = cpu_to_be32(MAPLE_FUNC_MEMCARD);
> > >> >> +	((unsigned long *)sendbuf)[1] = cpu_to_be32(partition << 24 | num);
> > > So why do you use void* for data you actually dereference?
> > 
> > Because for other devices data can be passed as 16 bit structures as well
> > as 32 bit ones.
> 
> Hogwash!  If you ever deal with 16bit structures here you have a bug.
> cpu_to_be32() only makes sense when actually dealing with __be32.
> Either your variable is and should be called __be32, or it isn't and you
> have a bug right in front of you.

You don't seem to have grasped that this is one type of device on a
proprietary bus which has other (types of) devices. I keep the code
consistent so that the API runs the same across the different devices -
makes the code easier to understand and maintain.

And given that this is also the variable that points to the memory block
that also includes the 8 bit based date that gets read in for block
writes I it makes perfect sense to have this as a void*.
