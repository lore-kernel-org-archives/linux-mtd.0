Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fOma-0003Wc-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2002 17:19:24 +0000
Date: Mon, 25 Feb 2002 18:30:34 +0100 (MET)
From: Robert Kaiser <rob@sysgo.de>
To: David Woodhouse <dwmw2@infradead.org>
cc: Adam Wozniak <awozniak@comdev.cc>, linux-mtd@lists.infradead.org,
   Jonas Holmberg <jonas.holmberg@axis.com>
Subject: Re: Re-entrancy of flash erase/write 
In-Reply-To: <22009.1014656857@redhat.com>
Message-ID: <Pine.LNX.4.21.0202251817100.12881-100000@dagobert.svc.sysgo.de>
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


On Mon, 25 Feb 2002, David Woodhouse wrote:

> 
> rob@sysgo.de said:
> >  [David, OK to apply this ?] 
> 
> I'd rather it was done in the map driver's set_vpp function itself. 
> Sometimes you have more than one map driver, because you have different 
> regions of flash - but they all share the same Vpp control. In which case 
> you need to do the counting in the map driver anyway. 

Agreed. I'll modify the dilnetpc driver then.

> 
> 
> >  I looked into this a little further: it seems that the erase
> > functions in cfi_cmdset_000?.c and amd_flash.c temporarily release the
> > chip->mutex while VPP is on. Won't that allow other threads to get
> > hold of the mutex and fiddle with VPP, possibly turning it off ? 
> 
> I see the possibility, but surely that would only _actually_ happen if we 
> started to support writes during erase suspend? Otherwise, the only thing 
> that should happen during an erase is a _read_, which doesn't set and clear 
> vpp.

What mechanism is there to avoid writes during erase suspend ? I have
seen the problem in situations where the JFFS2 GC thread was erasing
while another process (tar in my case) was writing to a *different
partition* in the same chip. (Maybe that is a hint ?) Introducing the 
set_vpp counter reliably solved this.

Rob

----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10
