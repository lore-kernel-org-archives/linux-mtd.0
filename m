Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NSmcd-0006Yn-8Q
	for linux-mtd@lists.infradead.org; Thu, 07 Jan 2010 07:17:35 +0000
Subject: Re: Good stress test for UBIFS?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Jander <david.jander@protonic.nl>
In-Reply-To: <201001061159.59875.david.jander@protonic.nl>
References: <200912180900.51332.david.jander@protonic.nl>
	<4B388B2B.5080906@nokia.com>
	<201001061159.59875.david.jander@protonic.nl>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 07 Jan 2010 09:17:03 +0200
Message-Id: <1262848623.21915.45.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-01-06 at 11:59 +0100, David Jander wrote:
> On Monday 28 December 2009 11:40:43 am Adrian Hunter wrote:
> >[...]
> > Generally we test with debugging checks turned on because they will spot an
> > error the instant it happens.  On the other hand, you must also test the
> >  actual configuration you will deploy.
> > 
> > There are two approaches.  We use both of them.  They are:
> > 
> > 1. Set up a desktop machine with your kernel and test on nandsim.  This has
> >  the advantage that it can do very many more operations than a small
> >  device.
> > 
> > You can simulate power-off-recovery by using UBIFS "failure mode".  Set
> >  UBIFS debugging module parameter debug_tsts to 4.  There is a script I
> >  have used for that below.
> 
> Yes, but I did not consider this option, because it is a completely different 
> processor architecture (little-endian vs. big-endian), also it won't test the 
> hardware-driver, nor the nand-chip and interface which can potentially also be 
> (part of) the problem. Here I am trying to reproduce a situation that has 
> already occurred a few times in "real life", and I need to be sure it won't 
> happen ever again with the latest ubi/ubifs.
> 
> > 2. Run tests on the device.  There are tests in mtd-utils/tests/fs-tests
> >  but LTP's fsstress is good for stressing the file system during
> >  power-off-recovery testing.
> 
> Thanks a lot. I will try fsstress.
> I had already written my own test script, mimicking some suspicious scenarios, 
> in the hope it would reproduce what had happend on three of our boards 
> (corrupt fs), and eventually succeded, but it took several days running.
> Now I am re-running the test with latest UBI/UBIFS to see if it's gone.
> Hopefully fsstress will yield results more quickly.

Also, take a look at the MTD tests:

http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests

E.g., by running the torture test for a week we once found a very rare
and subtle problem in our OneNAND driver related to the DMA transfers.
Also, it is nice to run this test for few months and see how your NAND
HW behaves when you try to wear few of their blocks out. Also, if you
manage to make real faulty blocks, you can test how UBI handles them.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
