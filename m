Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fIpz-00036j-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2002 10:58:31 +0000
Date: Mon, 25 Feb 2002 12:09:46 +0100 (MET)
From: Robert Kaiser <rob@sysgo.de>
To: David Woodhouse <dwmw2@infradead.org>
cc: linux-mtd@lists.infradead.org, Jonas Holmberg <jonas.holmberg@axis.com>
Subject: Re: Re-entrancy of flash erase/write 
In-Reply-To: <Pine.LNX.4.21.0202221824060.8843-100000@dagobert.svc.sysgo.de>
Message-ID: <Pine.LNX.4.21.0202251153370.8474-100000@dagobert.svc.sysgo.de>
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


On Fri, 22 Feb 2002, Robert Kaiser wrote:

> 
> On Fri, 22 Feb 2002, David Woodhouse wrote:
> 
> > 
> > rob@sysgo.de said:
> > > .., where is the lock in the MTD code that would prevent concurrent
> > > execution of erase/write on the same chip by multiple processes ? 
> > 
> > In the chip drivers themselves. Grep for TASK_UNINTERRUPTIBLE in 
> > cfi_cmdset_0001.c, for example.
> 
> .. What happened was that at some point, JFFS's
> garbage collector started erasing blocks while tar was continuing
> to write to flash. In that situation, it ocassionally happened that
> VPP was turned off by one of the threads while the other one was
> still busy writing/erasing, causing that operation to fail.
> I was able to fix this by introducing a counter in my map driver's
> set_vpp() function and doing the actual disable/enable of VPP only
> when the counter reaches zero. Now I'm wondering if this is a flaw
> in MTD or in my new code.

I looked into this a little further: it seems that the erase
functions in cfi_cmdset_000?.c and amd_flash.c temporarily release
the chip->mutex while VPP is on. Won't that allow other threads
to get hold of the mutex and fiddle with VPP, possibly turning it
off ?

That would explain the behavior I'm observing here. Only why doensn't
anyone else see this problem ?

A proper solution IMHO would be to use a counter (similar to what I
now have in my mapping driver) in the ENABLE/DISABLE_VPP() macros.

Any ideas ?


Rob

----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10
