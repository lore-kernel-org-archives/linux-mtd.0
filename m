Received: from main.gmane.org ([80.91.224.249])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BiF1A-0003pq-6I
	for linux-mtd@lists.infradead.org; Wed, 07 Jul 2004 12:11:32 -0400
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1BiF0z-00065M-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Jul 2004 18:11:24 +0200
Received: from calvin.codito.com ([203.199.140.162])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Jul 2004 18:11:21 +0200
Received: from amitshah by calvin.codito.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Jul 2004 18:11:21 +0200
To: linux-mtd@lists.infradead.org
From: Amit Shah <amitshah@gmx.net>
Date: Wed, 07 Jul 2004 21:39:08 +0530
Message-ID: <cch7b6$i3g$1@sea.gmane.org>
References: <ccdut4$do6$2@sea.gmane.org>
	<1089175560.27262.13.camel@thomas.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Sender: news <news@sea.gmane.org>
Subject: Re: Accessing flash on a PCI card
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:

> On Tue, 2004-07-06 at 12:26, Amit Shah wrote:
>> I have a PCI card that has Intel Flash. I've cooked up a small driver
>> (the host kernel is 2.6.6) that iomaps the base address exported by the
>> PCI BARs and can verify that it's an intel flash by doing some config-
>> write and read sequences.
>> 
>> I now want to export the flash to userspace for reading / writing to the
>> flash. I guess it would be better to let MTD handle the stuff than me
>> doing things all over again. So, how can I access that flash memory over
>> the PCI with MTD?
> 
> Look at
> drivers/mtd/maps/pci.c and other files using PCI in the same folder

Thanks, Thomas!

-- 
Amit Shah
http://amitshah.nav.to/
