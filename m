Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aw5ai-0001WI-Ah
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2004 20:25:12 +0000
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HTN00KR8Q1BMN@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 25 Feb 2004 21:24:47 +0100 (MET)
Date: Wed, 25 Feb 2004 21:22:42 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <a06002001bc6281361918@[130.161.115.44]>
To: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>,
	linux-mtd@lists.infradead.org
Message-id: <200402252023.47907.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <a06002001bc6281361918@[130.161.115.44]>
Subject: Re: Handling multiple NAND chips -- take 2
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 25 February 2004 18:44, J.D. Bakker wrote:

> * Assumption: all devices are the same type and size.
> * No support (yet) for building a wider data bus through putting
> multiple devices in parallel
> * All detected devices are concatenated and represented as one large
> linear array of pages
> * All devices are soldered to a motherboard. We are not interested in
> taking devices out of the array.
> * No optimizations (yet) wrt accessing device n while device m is
> busy. Easier to get working code fast than to get fast code working,
> and I don't see a way to take advantage of parallelism without
> modifying higher layers
If all devices share the same control lines (except CS) then an optimization 
of accessing device n while m is busy can be rather complex. 

I have already done some tests with 4 chips on a board. The scenario is, that 
all bus /  control lines except the CS lines are shared over all devices.

The idea is to add 3 pointers to the nand structure. 
p_state		points to state 
p_chip_lock	points to chip_lock
p_wq			points to wq

The pointers can either be initialized in the chip driver or are initialized 
by the nand_scan function to the default fields (state, chip_lock, wq). This 
would not break any existing chipdrivers.

All accesses to state, chiplock and wq must be modified so the access happens 
through the pointers instead of accessing the fields directly.

For your case you must initialize the pointers of chip 2 - 8 to share the 
state, chip_lock and wq field of the first chip. The hwcontrol function is 
shared for all chips.

Then you can use the existing mtdconcat layer to build partition(s) over 
several chips. 

This solution supports 
* different chip type / sizes
* removable devices 
* flexible partitioning

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
