Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 177C9Q-00078E-00
	for <linux-mtd@lists.infradead.org>; Mon, 13 May 2002 10:29:52 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3CDF6922.9A0A870F@netbricks.com> 
References: <3CDF6922.9A0A870F@netbricks.com> 
To: franck.fleter@netbricks.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: Boot from NAND flash ??? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 13 May 2002 10:29:36 +0100
Message-ID: <16389.1021282176@redhat.com>
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

franck.fleter@netbricks.com said:
> I read in mails archive that Linux kernel can't boot from NAND flash.
> It can  boot from NOR flash. Does Linux  kernel not able to boot  from
> NAND flash because :
>     1) a NAND flash is connected to an I/O controller and not to a BUS. 

That's the one. You cannot just put a NAND flash chip at the CPU's startup 
vector and let it boot from it. You need _something_ for the CPU to start 
with, be that SROM, a tiny NOR flash or ROM, or something else. All you 
need is a few bytes to set up your DRAM and start pulling the real 
bootloader off the NAND flash.

--
dwmw2
