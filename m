Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16GPp7-0004pW-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Dec 2001 19:22:45 +0000
Date: Tue, 18 Dec 2001 14:33:24 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Russ Dill <Russ.Dill@asu.edu>
cc: <linux-mtd@lists.infradead.org>
Subject: Re: semi-raw access to flash
In-Reply-To: <1008703371.12999.0.camel@timmy>
Message-ID: <Pine.LNX.4.33.0112181432120.1241-100000@xanadu.home>
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

On 18 Dec 2001, Russ Dill wrote:

> I'm trying to get semi-raw access to flash in userspace. I'd like to be
> able to mmap the flash and write to it (with mtd handling the unlock
> commands) but not have mtd automatically cache and erase blocks, etc for
> me. /dev/mtd? would be great, but its only a char device, so I can't
> mmap it. 

Nothing prevents you from mmap()'ing a char device.  In the MTD case it's 
only not implemented in the driver.


Nicolas
