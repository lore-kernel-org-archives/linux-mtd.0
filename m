Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16qE3e-0001gx-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2002 14:05:46 +0000
Message-Id: <200203271405.g2RE5fw10664@dagobert.svc.sysgo.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rkaiser@sysgo.de
To: Sanjay Kumar <sankumar73@yahoo.com>
Subject: Re: probing two non-contiguous cfi flash and  a single partition
Date: Wed, 27 Mar 2002 15:06:44 +0100
References: <20020327095756.90242.qmail@web13207.mail.yahoo.com>
In-Reply-To: <20020327095756.90242.qmail@web13207.mail.yahoo.com>
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Am Mittwoch, 27. März 2002 10:57 schrieben Sie:
> Hi David,
> I need to use two flash chips(Both AMD CFI flash and each of 4MB size)
> with the following mapping configuration -
>
> 1. starts at 0xbfa00000 and is of size 4MB
> 2. starts at 0xbfc00000 and is of 4MB size
>
> Previously I was having only one flash starting at 0xbfc00000
> with two partition, first 640k for bootloader and the rest for JFFS2
> and is working fine for me.
>
> Now still I want to have only two partition; the 640k at the address
> 0xbfc00000 for bootloader in first partition and remaining for JFFS2 in
> second partition. It means I need the following partition
> memory mapping -
> 4MB starting at 0xbfa00000 for JFFS2 -  second partition
> fisrt 640kB at 0xbfc00000 for bootloader - First Partition for bootlaoder
> remaining out of 4MB at 0xbfc00000 for JFFS2 - second partition
>
> So I need suggestions about how to probe the two flash and make the
> partition as per my requirements.
> I am using linux2.4.2. and MIPS processor.

Have a look at the mtd concat stuff. It allows you to concatenate multiple
chips into a single MTD device, which can then be arbitrarily partitioned.
Look at the sc520cdp.c map driver for an example.

Rob

----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
