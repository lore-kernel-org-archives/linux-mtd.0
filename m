Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16kx9t-0007nN-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2002 01:02:25 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <002201c1ca2b$00ca7fc0$0101a8c0@dellc800> 
References: <002201c1ca2b$00ca7fc0$0101a8c0@dellc800>  <AEA9DCA73595D411A6D4009027DE9C5E019BFA74@MSI-EX6> <4513.1015976946@redhat.com> 
To: "Mark Meade" <mark@lakeshoremicro.com>
Cc: "Vadim Khmelnitsky" <VadimK@m-sys.com>,
    linux-mtd@lists.infradead.org
Subject: Re: UnitSizeFactor of != 1 yet? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 13 Mar 2002 01:13:49 +0000
Message-ID: <6602.1015982029@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

mark@lakeshoremicro.com said:
> Yes, that was the message I got with the latest cvs code, after
> relocating the ReplUnitTable assignment.

> Just to make sure I didn't have something else screwed up, I went back
> to the source in 2.4.18, and added a printk of the UnitSizeFactor.  In
> that case, it also said 0. 

Eep. OK, if you put a check in just before we deal with UnitSizeFactor, 
setting it to 0xFF if it was 0x00 - does that make it work? Don't break the 
memcmp with the later MediaHeader - use a local variable of something.

Vadim, is this expected? Is a UnitSizeFactor of zero _always_ going to mean 
that the Virtual Unit size matches the physical unit size?

--
dwmw2
