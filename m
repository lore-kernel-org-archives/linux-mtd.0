Received: from modemcable096.213-200-24.mc.videotron.ca ([24.200.213.96]
	helo=localhost.localdomain)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CuLcI-0006P7-I7
	for linux-mtd@lists.infradead.org; Thu, 27 Jan 2005 21:12:11 -0500
Date: Thu, 27 Jan 2005 21:12:04 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <6934efce05012717207271fb10@mail.gmail.com>
Message-ID: <Pine.LNX.4.61.0501272035260.22434@localhost.localdomain>
References: <6934efce05012717207271fb10@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: Unit test for cfi_cmdset_0001.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 27 Jan 2005, Jared Hulbert wrote:

> I plan on creating a unit test based on cutest.sourceforge.net for
> cfi_cmdset_0001.c.
> In order to stub out the various functions inside I will have to:
> 
> 1. Manually strip out functions for each version.
> 2. Add #if''s
> 3. fork this file into 2-3 files.
> 
> I prefer option 3.  As it seems cleaner to me and more maintainable. 
> But I want to know which option is more "commitable."   Of course the
> test be made availiable, I would hope we can get the tests commited
> too.

I'm skeptical.  How cutest is going to be of any benefit here?

> CuTest is zlib licenced.  Is that a problem?

It would if not GPL compatible.

> The reason for the unit tests is to help us find bugs in the code
> paths not easily tested and to enable more rapid updates for new flash
> or features mtd doesn't currently support.

You will have to show me that cutest can really test such code.  It's 
not just algorithmic code we're talking about but a kernel driver for 
hardware.  Hardware has subtle but random timing variations, and a 
kernel driver needs to cope with scheduling, sleeping, locking, etc.  I 
don't see cutest able to verify that proper locking against real life 
concurrent access is correctly implemented while being as efficient as 
possible for example.  IMHO it would only give you a false sense of 
confidence.


Nicolas
