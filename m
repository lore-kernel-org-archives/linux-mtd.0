Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KvUCr-0001Db-9L
	for linux-mtd@lists.infradead.org; Thu, 30 Oct 2008 09:52:46 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KvUCm-00035s-O7
	for linux-mtd@lists.infradead.org; Thu, 30 Oct 2008 09:52:40 +0000
Received: from 194.95.133.35 ([194.95.133.35])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Oct 2008 09:52:40 +0000
Received: from andre.puschmann by 194.95.133.35 with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Oct 2008 09:52:40 +0000
To: linux-mtd@lists.infradead.org
From: Andre Puschmann <andre.puschmann@imms.de>
Subject: Re: flash read performance
Date: Thu, 30 Oct 2008 10:52:33 +0100
Message-ID: <gec051$efd$1@ger.gmane.org>
References: <ge6old$oo3$1@ger.gmane.org>	<20081029114256.GA2239@yoda.jdub.homelinux.org>	<gea0sh$j97$1@ger.gmane.org>
	<49097176.5010506@thomson.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <49097176.5010506@thomson.net>
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> I was faced with the same wondering in the past : bootloader NOR access 
> was really much faster that Linux one.

About how much faster? It really depends on the access method. I am
using u-boot and if I use the basic cp.b routine its about the same
_slow_ speed. I tried to use the asm-optimised memcpy routine that the 
kernel has. This is much faster, around 5MB/s.

> Yes, no DMA was used (but the same on bootloader, and anyway that 
> doesn't impact the data rate, only the CPU load), but even worse, Linux 
> code was using memcpy_fromio which a basic byte by byte loop copy in the 
> default ARM implementation.

Yes, memcpy_fromio is quite slow. But using normal memcpy is not 
suggested, only use writel()/readl() and memcpy_[from|to]io().

I am not sure about the right _fast_ way to to such copies.


Regards,
Andre
