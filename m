Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15qqSU-0007lh-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Oct 2001 07:33:42 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <NEBBJKADBKFNCJOMHOAKAEFBCNAA.hamishl@dplanet.ch> 
References: <NEBBJKADBKFNCJOMHOAKAEFBCNAA.hamishl@dplanet.ch> 
To: hamishl@dplanet.ch
Cc: brendan.simon@bigpond.com, "mtd" <linux-mtd@lists.infradead.org>
Subject: Re: mtd: looking for serial flash storage 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 09 Oct 2001 07:42:47 +0100
Message-ID: <29826.1002609767@redhat.com>
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

hamishl@dplanet.ch said:
> You need 13 address lines for a DoC (A0..A12). 

That's only for backwards-compatibility with the DiskOnChip1000 sockets.

You should be able to omit half of them - just make sure you have A11 and
A12 connected, and also the bottom six lines. 

Take a look at the addresses in include/linux/mtd/doc2000.h and observe 
that we never address the chip such that (addr & 0x7c0). So you can just 
tie those address lines (A6-A10) low from the DiskOnChip. Connect your 
CPU's A6 and A7 to the DiskOnChip's A11 and A12, and make your ReadDOC_ and 
WriteDOC_ macros use (adr & 0x3f | ((adr |0x1800)>>4) as the offset they 
use.

If you want to boot from it, then use a DiskOnChip Millennium where you can 
change its firmware to deal with this setup, and wire as many of the extra 
address lines as you can so you can use as much of the IPL SRAM as possible. 
If you're only missing one address line, you should be able to see the 
whole of the IPL SRAM without problems too - wire up A0-A9 normally, and 
A10,A11 to the DiskOnChip's A11,12. 


--
dwmw2
