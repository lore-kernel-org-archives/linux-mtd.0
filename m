Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ArFV-0002LL-QN
	for <linux-mtd@lists.infradead.org>; Wed, 30 Apr 2003 14:03:49 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <200304301557.04691.tglx@linutronix.de>
References: <Law11-F625OmHBewRNS00016c03@hotmail.com>
	 <200304301557.04691.tglx@linutronix.de>
Message-Id: <1051707840.18316.452.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 30 Apr 2003 14:04:00 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: J B <mad_flasher@hotmail.com>
Subject: Re: moving MTD partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-04-30 at 14:57, Thomas Gleixner wrote:
> On Wednesday 30 April 2003 13:29, J B wrote:
> > "The basic question is if it is feasible to resize (smaller or larger) a
> > jffs2 filesystem / mtd block device over flash and maintain the existing
> > contents. Copying the contents out and then back again is not an option
> > (not enough space)."
> 
> First answer is no.
> On second thought could be a possibility to do so. 

Well, making it _larger_ is trivial. Just extend the partition with
empty erase blocks, and they'll get used.

Making it smaller is of course more of a problem -- you need to force
garbage collection until there's at least one block which is completely
free, then unmount, move the last block of the fs into the newly-freed
block, reduce the size by one block and remount it. Repeat.

You used to be able to force GC by repeatedly sending SIGHUP to the
kernel's GC daemon process, but I think Thomas is right that you can't
do that any more and you have to hack it. You'd probably do better to do
it offline with a special tool. 

-- 
dwmw2
