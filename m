Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14cjBb-0008HR-00
	for mtd-list@infradead.org; Tue, 13 Mar 2001 07:25:39 +0000
Received: from roma.axis.se ([193.13.178.2])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14cjBZ-0008HL-00
	for mtd@infradead.org; Tue, 13 Mar 2001 07:25:37 +0000
Message-ID: <E6FE4E054F02D511818E00025558B61D429E89@cluster01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'Kevin Jacobs'" <jacobs@penguin.theopalgroup.com>
Cc: mtd@infradead.org
Subject: RE: Oh, the many joys of MTD...
Date: Tue, 13 Mar 2001 08:24:52 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> On Thu, 8 Mar 2001, Nicolas Pitre wrote:
> > > My first questions is likely something fairly basic.  
> I've read over much of
> > > the MTD source and it seems that many of the erase and 
> write functions do
> > > not deal with concurrent access and CPU cache issues.  
> What happens when a
> > > {read,write,erase} request comes in for a sector that is being
> > > {written,erased}?
> > 
> > Those are exclusively protected by state machines and 
> locks.  For example,
> > see the usage of chip->state in cfi_cmdset_0001.c.
> 
> Only cfi_cmdset_* does this.  jedec, amd_flash, etc. do not.

amd_flash: I think it does (or have you found a bug?).

/Jonas


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
