Received: from d-200.linux2002.uq.net.au ([203.15.37.200] helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ZMg3-0003ZA-00
	for <linux-mtd@lists.infradead.org>; Sat, 09 Feb 2002 01:51:44 +0000
Date: Sat, 9 Feb 2002 11:31:48 +1000 (EST)
From: David Woodhouse <dwmw2@infradead.org>
To: Derek Ross <dross@iders.ca>
cc: linux-mtd@lists.infradead.org
Subject: Re: Is realtime logging possible?
In-Reply-To: <007701c1b0e8$c90a9620$87657bc8@athlon>
Message-ID: <Pine.LNX.4.44.0202091129030.2394-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Fri, 8 Feb 2002, Derek Ross wrote:

> Hello,
> 
> Our product will have a slow-realtime logging
> component in it, and I'm trying to find out if
> flash will be capable of handling it.
> 
> We'll be logging about 6 bytes once a second into
> flash.  The maximum blocking duration for a write
> should be 0.1 second or less.

Does the write to flash really have to be done in the context of the 
realtime process? 

You probably don't want to use a filesystem for this - just log to the raw 
flash, using the mtd chardevice and issuing MEMERASE calls manually when 
necessary. 

> background, so that if you organize the writes not
> to interfere with the erases (always different sectors)
> you won't have long blocking issues.

IIRC that's not implemented completely for the Intel chips atm. Our state 
machine thinks the whole chip is busy whenever it's erasing any part, and 
won't attempt to write to it. We should fix the state machine so it keeps 
state for each individual region of the flash.

-- 
dwmw2
