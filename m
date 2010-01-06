Received: from [213.84.116.84] (helo=protonic.prtnl)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NSTam-0003W5-Gq
	for linux-mtd@lists.infradead.org; Wed, 06 Jan 2010 10:58:25 +0000
From: David Jander <david.jander@protonic.nl>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: Re: Good stress test for UBIFS?
Date: Wed, 6 Jan 2010 11:59:59 +0100
References: <200912180900.51332.david.jander@protonic.nl>
	<4B388B2B.5080906@nokia.com>
In-Reply-To: <4B388B2B.5080906@nokia.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201001061159.59875.david.jander@protonic.nl>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 28 December 2009 11:40:43 am Adrian Hunter wrote:
>[...]
> Generally we test with debugging checks turned on because they will spot an
> error the instant it happens.  On the other hand, you must also test the
>  actual configuration you will deploy.
> 
> There are two approaches.  We use both of them.  They are:
> 
> 1. Set up a desktop machine with your kernel and test on nandsim.  This has
>  the advantage that it can do very many more operations than a small
>  device.
> 
> You can simulate power-off-recovery by using UBIFS "failure mode".  Set
>  UBIFS debugging module parameter debug_tsts to 4.  There is a script I
>  have used for that below.

Yes, but I did not consider this option, because it is a completely different 
processor architecture (little-endian vs. big-endian), also it won't test the 
hardware-driver, nor the nand-chip and interface which can potentially also be 
(part of) the problem. Here I am trying to reproduce a situation that has 
already occurred a few times in "real life", and I need to be sure it won't 
happen ever again with the latest ubi/ubifs.

> 2. Run tests on the device.  There are tests in mtd-utils/tests/fs-tests
>  but LTP's fsstress is good for stressing the file system during
>  power-off-recovery testing.

Thanks a lot. I will try fsstress.
I had already written my own test script, mimicking some suspicious scenarios, 
in the hope it would reproduce what had happend on three of our boards 
(corrupt fs), and eventually succeded, but it took several days running.
Now I am re-running the test with latest UBI/UBIFS to see if it's gone.
Hopefully fsstress will yield results more quickly.

Best regards,

-- 
David Jander
Protonic Holland.
