Received: from web13206.mail.yahoo.com ([216.136.174.191])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16rK9W-0005hT-00
	for <linux-mtd@lists.infradead.org>; Sat, 30 Mar 2002 14:48:22 +0000
Message-ID: <20020330144820.46572.qmail@web13206.mail.yahoo.com>
Date: Sat, 30 Mar 2002 06:48:20 -0800 (PST)
From: Sanjay Kumar <sankumar73@yahoo.com>
Subject: Re: probing two non-contiguous cfi flash and  a single partition
To: rkaiser@sysgo.de
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <200203271405.g2RE5fw10664@dagobert.svc.sysgo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Hi Robert,
I read the mtd concatnate stuffs which seems to be made for concatnating
different indedpendent CFI/no-cfi mtd devices. So basically in example 
file of sc520cdp.c, there are three probes for the three devices and then 
concatnating the two flash devices in one. 

But my problem seems to be somewhat different. See the follwoing diagrams -

 _________
|         |<--   First flash starts at 0xbf800000
|4MB      |
|         |
|         |
|         |
|_________|
 _________
| 640K    | <-- Second flash starts at 0xbfc00000
|_________|     out of which first 640KB is needed 
|         |     for boot loader.
|         |
| 3360K   |
|_________|


So there will be two probes for the two flashes. But now I want 
to keep the 640KB(for bootloader) of the second flash to be 
in first partition and the first flash and remaining portion of the second flash to
be in second partition to be used for JFFS2 mounting. 


May be I am not able to fully understand how to use the concept of
concatnating the mtd devices for my case. 
I am still trying to solve my problem but I would happy to get your 
suggestions on this problem.

Thanks & Regards,
Sanjay
--- Robert Kaiser <rob@sysgo.de> wrote:
> Am Mittwoch, 27. März 2002 10:57 schrieben Sie:
> > Hi David,
> > I need to use two flash chips(Both AMD CFI flash and each of 4MB size)
> > with the following mapping configuration -
> >
> > 1. starts at 0xbf800000 and is of size 4MB
> > 2. starts at 0xbfc00000 and is of 4MB size
> >
> > Previously I was having only one flash starting at 0xbfc00000
> > with two partition, first 640k for bootloader and the rest for JFFS2
> > and is working fine for me.
> >
> > Now still I want to have only two partition; the 640k at the address
> > 0xbfc00000 for bootloader in first partition and remaining for JFFS2 in
> > second partition. It means I need the following partition
> > memory mapping -
> > 4MB starting at 0xbf800000 for JFFS2 -  second partition
> > fisrt 640kB at 0xbfc00000 for bootloader - First Partition for bootlaoder
> > remaining out of 4MB at 0xbfc00000 for JFFS2 - second partition
> >
> > So I need suggestions about how to probe the two flash and make the
> > partition as per my requirements.
> > I am using linux2.4.2. and MIPS processor.
> 
> Have a look at the mtd concat stuff. It allows you to concatenate multiple
> chips into a single MTD device, which can then be arbitrarily partitioned.
> Look at the sc520cdp.c map driver for an example.
> 
> Rob
> 
> ----------------------------------------------------------------
> Robert Kaiser                         email: rkaiser@sysgo.de
> SYSGO RTS GmbH
> Am Pfaffenstein 14                    phone: (49) 6136 9948-762
> D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10


__________________________________________________
Do You Yahoo!?
Yahoo! Greetings - send holiday greetings for Easter, Passover
http://greetings.yahoo.com/
