Received: from d-200.linux2002.uq.net.au ([203.15.37.200] helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ZMUT-0003Xc-00
	for <linux-mtd@lists.infradead.org>; Sat, 09 Feb 2002 01:39:46 +0000
Date: Sat, 9 Feb 2002 11:19:47 +1000 (EST)
From: David Woodhouse <dwmw2@infradead.org>
To: Allen Curtis <acurtis@onz.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: Flash left in a write mode
In-Reply-To: <NCBBIINEHIPFGJPLBEIFMEBBDEAA.acurtis@onz.com>
Message-ID: <Pine.LNX.4.44.0202091114160.2394-100000@lapdancer.baythorne.internal>
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

On Thu, 7 Feb 2002, Allen Curtis wrote:

> I have observed a problem where the flash is left in a write mode even after
> the file-system is unmounted. (Intel Strata flash, cmdset_0001.c)
> 
> The problem is this: if the flash is written to and then the system is
> immediately rebooted, the flash is left in a write state. 

Define 'rebooted'? Hitting the reset button if you have one should reset 
the flash (although sometimes it doesn't - bogus f***wit points to whoever 
designed the Assabet for that one)

If you're implementing machine_restart() for your platform, then it should 
be ensuring that the hardware is in a state sufficiently close to the 
power-up state, for the benefit of the bootloader. That means turning off 
the MMU and jumping to the startup vector, at the very least. Often it 
means resetting bus controllers where we've moved around the physical 
memory map too - it could be argued that this preparation should include 
resetting the flash too.

I'm willing to entertain the notion that the flash driver should do this 
on close, or we should have a reboot notifier registered that calls a new 
method in the mtd_info to reset the flash. 

I'll consider if it a clean patch is presented - but I'm not going to go 
out of my way to fix it myself - I don't consider it particularly broken.

-- 
dwmw2
