From: David Woodhouse <dwmw2@infradead.org>
To: Armelle Potier <armelle.potier@elios-informatique.fr>
In-Reply-To: <NFBBKFLAIMMPNKJONACNKEAECEAA.armelle.potier@elios-informatique.fr>
References: 
	 <NFBBKFLAIMMPNKJONACNKEAECEAA.armelle.potier@elios-informatique.fr>
Content-Type: text/plain
Message-Id: <1066981701.29915.594.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 24 Oct 2003 08:48:22 +0100
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2  on Ecos: multi task access and defragmentation
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-10-23 at 10:52 +0100, Armelle Potier wrote:
> 2 questions:
> 1 - How must be used jffs2 with many task calling it for read-write-erase
> operations on different or same files or directory
> Is it managed correctly by jffs2 and how (tasks blocked if necessary for
> example) or have the task to care for multi access and then how?

JFFS2 does locking internally, using semaphore and spinlock primitives
under Linux.

In the eCos build, I believe those locking primitives should also work;
they're mapped to mutexes (mutices?) and NOP respectively -- but they're
largely untested because the eCos tests so far have all been
single-threaded.

> 2 - does jffs2 need defragmentation functionnality ? If yes how to use this
> service if it's exist.

JFFS2 doesn't need defragmentation. However, if you're using a
thread-capable build of eCos you could usefully implement the background
garbage collection thread for eCos. Take a look at background.c and make
a background-ecos.c which does something similar.

-- 
dwmw2
