Received: from modemcable166.48-200-24.mc.videotron.ca ([24.200.48.166]
	helo=xanadu.home)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkQW1-0005H5-Jv
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2004 12:52:26 -0400
Date: Tue, 13 Jul 2004 12:52:13 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Dan Post <djp.mtd@onemyth.net>
In-Reply-To: <20040713163622.M68171@onemyth.net>
Message-ID: <Pine.LNX.4.44.0407131248030.18865-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, "Eric W. Biederman" <ebiederman@lnxi.com>
Subject: Re: [RFC] refactoring MTD cmdset ops, jedec_probe, and cfi_probe
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 13 Jul 2004, Dan Post wrote:

> I don't know how deep you plan on getting into the driver, but there are some
> things to take into consideration when you refactor...  L18 has multiple
> hardware "partitions"--you can read one section and be writing the other
> section at the same time, essentially.  i.e. for a 32MiB chip you have 16
> state machines, each for 2MiB of the chip.

I committed support for that a while ago already.  SMP and preemption safe 
too.  Anything you think might be missing (besides the crude probing code
that certainly could benefit from more work)?


Nicolas
