Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19NVBh-00048Q-Ps
	for <linux-mtd@lists.infradead.org>; Wed, 04 Jun 2003 11:08:09 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <1054721184.17921.212.camel@passion.cambridge.redhat.com>
References: <1054715689.17921.183.camel@passion.cambridge.redhat.com>
	 <20030604095754.GB27112@wohnheim.fh-wedel.de>
	 <1054721184.17921.212.camel@passion.cambridge.redhat.com>
Message-Id: <1054721328.17921.214.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 04 Jun 2003 11:08:48 +0100
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Execute in place.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-06-04 at 11:06, David Woodhouse wrote:
> On Wed, 2003-06-04 at 10:57, Jörn Engel wrote:
> > For my flash chips, an erase operation is in the ballpark of a second.
> > That is very long for interrupts, so I would assume, we never complete
> > an erase without being interrupted.  Does this mean that a formerly
> > suspended and resumed erase operation completes quicker than a fresh
> > one? 
> 
> That appears to be the case, yes. Certainly, in the common case of it
> being 10ms before you get the next timer tick and consider rescheduling,
> the chip's made enough progress that it doesn't have to start again from
> scratch.

Oh, and bear in mind that if erases were happening and you were trying
to read from the filesystem, that was causing many many erase suspends
to happen too anyway -- if this was a problem, it would have bitten us
as soon as we started suspending erases to permit reads to happen.

-- 
dwmw2
