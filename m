Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CuPLV-0008Oe-Hz
	for linux-mtd@lists.infradead.org; Fri, 28 Jan 2005 01:11:06 -0500
To: Jared Hulbert <jaredeh@gmail.com>
References: <6934efce05012717207271fb10@mail.gmail.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 27 Jan 2005 23:11:02 -0700
In-Reply-To: <6934efce05012717207271fb10@mail.gmail.com>
Message-ID: <m33bwmw0ax.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
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

Jared Hulbert <jaredeh@gmail.com> writes:

> I plan on creating a unit test based on cutest.sourceforge.net for
> cfi_cmdset_0001.c.
> In order to stub out the various functions inside I will have to:
> 
> 1. Manually strip out functions for each version.
> 2. Add #if''s
> 3. fork this file into 2-3 files.
> 
> I prefer option 3.  As it seems cleaner to me and more maintainable. 

Why would you even need to split the file into multiple pieces to
provide test wrappers?  cutest does not seem to add that requirement.
I'm not certain what value cutest actually provides.  A test harness
that  would require the source file to be split into multiple pieces
seems to indicate a flaw in the test harness.

> The reason for the unit tests is to help us find bugs in the code
> paths not easily tested and to enable more rapid updates for new flash
> or features mtd doesn't currently support.

The hardest code paths to test are code paths for hardware that
is usable but not quite right.  How do you plan on testing that?

Which features for flash chips are you thinking about supporting that
are not currently supported? 

Eric
