Received: from e35.co.us.ibm.com ([32.97.110.133])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CuLgb-0006ZZ-2h
	for linux-mtd@lists.infradead.org; Thu, 27 Jan 2005 21:16:38 -0500
Received: from westrelay01.boulder.ibm.com (westrelay01.boulder.ibm.com
	[9.17.195.10])
	by e35.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id j0S2GZZ7113208
	for <linux-mtd@lists.infradead.org>; Thu, 27 Jan 2005 21:16:35 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by westrelay01.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j0S2GYXb248412
	for <linux-mtd@lists.infradead.org>; Thu, 27 Jan 2005 19:16:34 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11/8.12.11) with ESMTP id
	j0S2GY9x010151
	for <linux-mtd@lists.infradead.org>; Thu, 27 Jan 2005 19:16:34 -0700
From: Josh Boyer <jdub@us.ibm.com>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <6934efce05012717207271fb10@mail.gmail.com>
References: <6934efce05012717207271fb10@mail.gmail.com>
Content-Type: text/plain
Date: Thu, 27 Jan 2005 20:16:29 -0600
Message-Id: <1106878589.10729.12.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Thu, 2005-01-27 at 17:20 -0800, Jared Hulbert wrote:
> I plan on creating a unit test based on cutest.sourceforge.net for
> cfi_cmdset_0001.c.

How feasible is a framework like that for things that deal with
hardware?  Are you planning on emulating flash chips somehow?

> In order to stub out the various functions inside I will have to:
> 
> 1. Manually strip out functions for each version.

Not sure what you mean.  Could be partially due to my ignorance of
cuTest, so bear with me :).

> 2. Add #if''s
> 3. fork this file into 2-3 files.
> 
> I prefer option 3.  As it seems cleaner to me and more maintainable. 

Maybe an example of what you intend here?

> But I want to know which option is more "commitable."   Of course the
> test be made availiable, I would hope we can get the tests commited
> too.  CuTest is zlib licenced.  Is that a problem?
> 
> The reason for the unit tests is to help us find bugs in the code
> paths not easily tested and to enable more rapid updates for new flash
> or features mtd doesn't currently support.
> 
> Thoughts, flames, jokes?

I'm all for a test suite for MTD/JFFS[23].  Maybe cuTest could help,
maybe not.  Artem has a NAND flash simulator.  Maybe that would help
testing as well.

josh
