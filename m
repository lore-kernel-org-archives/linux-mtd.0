Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19NV9O-00042F-BG
	for <linux-mtd@lists.infradead.org>; Wed, 04 Jun 2003 11:05:46 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20030604095754.GB27112@wohnheim.fh-wedel.de>
References: <1054715689.17921.183.camel@passion.cambridge.redhat.com>
	 <20030604095754.GB27112@wohnheim.fh-wedel.de>
Message-Id: <1054721184.17921.212.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 04 Jun 2003 11:06:25 +0100
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

On Wed, 2003-06-04 at 10:57, Jörn Engel wrote:
> For my flash chips, an erase operation is in the ballpark of a second.
> That is very long for interrupts, so I would assume, we never complete
> an erase without being interrupted.  Does this mean that a formerly
> suspended and resumed erase operation completes quicker than a fresh
> one? 

That appears to be the case, yes. Certainly, in the common case of it
being 10ms before you get the next timer tick and consider rescheduling,
the chip's made enough progress that it doesn't have to start again from
scratch.

Someone with more knowledge of flash chip internals could possibly give
a more coherent and informative answer -- but I was concerned about the
possibility you raise and that's partly why I was doing the flood-ping
testing.

-- 
dwmw2
