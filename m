Received: from ptb-relay03.plus.net ([212.159.14.214])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CfLrg-0007MI-Oy
	for linux-mtd@lists.infradead.org; Fri, 17 Dec 2004 12:26:06 -0500
From: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <41C31307.70909@us.ibm.com>
References: <1103152743.15913.33.camel@squizzey.bult.co.uk>
	<41C0D3AC.3050801@us.ibm.com>
	<1103158974.15929.37.camel@squizzey.bult.co.uk>
	<1103201631.25765.7.camel@weaponx.rchland.ibm.com>
	<1103232128.15927.70.camel@squizzey.bult.co.uk>
	<41C1FDFF.3020308@us.ibm.com>
	<1103233669.15929.81.camel@squizzey.bult.co.uk>
	<1103288058.3018.4.camel@weaponx.rchland.ibm.com>
	<1103297611.15917.184.camel@squizzey.bult.co.uk>
	<41C3030D.8040607@us.ibm.com>
	<1103302002.15927.198.camel@squizzey.bult.co.uk>
	<41C31307.70909@us.ibm.com>
Content-Type: text/plain
Date: Fri, 17 Dec 2004 17:26:00 +0000
Message-Id: <1103304360.15914.210.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-12-17 at 11:10 -0600, Josh Boyer wrote:
> That's the problem.  There is no filesystem for these "abominations" 
> really.  They pretend to be IDE, SCSI, etc. but are really flash 
> underneath.  Neither the MTD driver or the IDE drivers (for example) 
> deal with them really well, but I'm not sure that they can.
> 
> Did you try ext3 on the device with a native driver (IDE, SCSI, USB 
> specific) instead of via blkmtd.c?

Sure, ext2 and ext3 work just fine .. however .. as far as I'm aware,
although ext3 is log structured, it's not optimised to run in a linear
fashion and doesn't worry about repeatedly writing to the same block ..
which is likely to cause the USB flash controller to execute an erase
prior to write .. which will quickly wear down the device [?!]

(Am I wrong? in which case why isn't everyone using ext3 instead of
JFFS?)

The other requirement of course is inline compression, which last time I
looked ext3 didn't do out of the box (?)

I'm going to deliberately wear down some blocks on a key a little later
(at block level) to see what the OS makes of it ... (and whether it
takes 100,000 or 1,000,000 cycles .. I see conflicting specs ..

I guess the basic spec for a USB flash key (you may call them
abominations, but you should see the sales stats!) would be;

a. purely log structured fs with linear / circular operation
b. write blocks aligned to 2k (or 4k might be smarter to fit with buffer
page sizes)
c. erase blocks @ 128k
d. inline compression

Strikes me JFFS2 does all this, possibly bar the generic device
support ..

Gareth.
