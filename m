Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16eJYC-0006Km-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2002 17:32:04 +0000
Date: Fri, 22 Feb 2002 18:43:17 +0100 (MET)
From: Robert Kaiser <rob@sysgo.de>
To: David Woodhouse <dwmw2@infradead.org>
cc: linux-mtd@lists.infradead.org, Jonas Holmberg <jonas.holmberg@axis.com>
Subject: Re: Re-entrancy of flash erase/write 
In-Reply-To: <23802.1014397612@redhat.com>
Message-ID: <Pine.LNX.4.21.0202221824060.8843-100000@dagobert.svc.sysgo.de>
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

On Fri, 22 Feb 2002, David Woodhouse wrote:

> 
> rob@sysgo.de said:
> >  Am I right in assuming that it is not possible to erase and/or write
> > different blocks of the same flash chip concurrently ?
> 
> No - on some chips you can. Not most though.
> 
> > If so, where is the lock in the MTD code that would prevent concurrent
> > execution of erase/write on the same chip by multiple processes ? 
> 
> In the chip drivers themselves. Grep for TASK_UNINTERRUPTIBLE in 
> cfi_cmdset_0001.c, for example.


OK, thanks!

The reason I'm asking is that I have observed some strange behaviour
while testing my new concat_erase function and I'm wondering wether
it is a bug in my code or a general conceptual problem with MTD:

In my test, I was repeatedly extracting a large tar archive unto a
JFFS2-mounted device, deleting all the files again, then doing
another tar extract. What happened was that at some point, JFFS's
garbage collector started erasing blocks while tar was continuing
to write to flash. In that situation, it ocassionally happened that
VPP was turned off by one of the threads while the other one was
still busy writing/erasing, causing that operation to fail.
I was able to fix this by introducing a counter in my map driver's
set_vpp() function and doing the actual disable/enable of VPP only
when the counter reaches zero. Now I'm wondering if this is a flaw
in MTD or in my new code.

Any ideas ?


Rob

----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10
