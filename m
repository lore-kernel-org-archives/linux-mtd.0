Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Nf8L-0005zS-Fh
	for <linux-mtd@lists.infradead.org>; Wed, 04 Jun 2003 21:45:22 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: David Woodhouse <dwmw2@infradead.org>,
	=?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>
Date: Thu, 5 Jun 2003 08:48:31 +1200
References: <1054715689.17921.183.camel@passion.cambridge.redhat.com>
	<20030604095754.GB27112@wohnheim.fh-wedel.de>
	<1054721184.17921.212.camel@passion.cambridge.redhat.com>
In-Reply-To: <1054721184.17921.212.camel@passion.cambridge.redhat.com>
MIME-Version: 1.0
Message-Id: <20030604204556.1B695154CB@desire.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Execute in place.
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 04 June 2003 22:06, David Woodhouse wrote:
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
>
> Someone with more knowledge of flash chip internals could possibly give
> a more coherent and informative answer -- but I was concerned about the
> possibility you raise and that's partly why I was doing the flood-ping
> testing.

That's the whole purpose of erase suspend/resume. Inside the flash there is a 
wee counter thing that drives the erase state machine. When you erase suspend 
it stops; when you resume it continues where it left off. 

Of course if you abort the erase (like you'd do for NAND and those NORs that 
might not have erase suspend), then the state machine starts from scratch. In 
this case you cannot guarantee termination since you might be forever 
restarting the erase and it never gets a chance to complete.

NAND does not bug me since NAND and XIP are mutually exclusive.

-- Charles
