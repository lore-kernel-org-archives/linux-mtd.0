Received: from 263.net.cn ([211.150.96.21] helo=smtp.263.net)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I6Kzs-0005n8-4N
	for linux-mtd@lists.infradead.org; Thu, 05 Jul 2007 02:39:29 -0400
From: "Eric" <liuhxshanghai@263.net>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Subject: RE: Nand dump Jffs2
Date: Thu, 5 Jul 2007 14:38:10 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1183616192.2797.1.camel@shinybook.infradead.org>
Message-Id: <20070705063927.E85B615DF8A@smtp.263.net>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


A quick response, thanks first. 

I believe we will move to Kernel v2.6.21 eventually. But I am still curious
about the kernel v2.4.27.

Currently we are using kernel v2.4.27. Sometimes the JFFS2 on the flash will
become corrupted probably due to JFFS2 GC. I am studing it and I find that
the cleanmarker of the two kernels locates at different position on Nand
flash. It seems that  kernel v2.4.27 does not take the advantage of Nand
flash OOB area at all. I donnot know if this is true.

Another interesting thing:
I create JFFS2 filesystem under v2.6.21. Turn to v2.4.27, mount the nand
flash successfully, but kernel says:
jffs2_scan_dirent_node(): Node CRC failed on node at 0x01c737f4: Read
0xffffffff, calculated 0x2322e93d 
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01c737f8:
0x0034 instead 
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01c737fc:
0x292f instead 
Unknown but compatible feature node (0x2004) found at offset 0x01ccbf50 
Unknown but compatible feature node (0x2004) found at offset 0x01d03f68 
Unknown but compatible feature node (0x2004) found at offset 0x01d23f74 
Unknown but compatible feature node (0x2004) found at offset 0x01d9bfd8 
Unknown but compatible feature node (0x2004) found at offset 0x01df7fc4 
Unknown but compatible feature node (0x2004) found at offset 0x01f93f54 
Unknown but compatible feature node (0x2004) found at offset 0x01ff82b8

It seems that kernel v2.4.27 is forward compatible with v2.6.21.

> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org] 
> Sent: Thursday, 5 July 2007 2:17 PM
> To: Eric
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: Nand dump Jffs2
> 
> On Thu, 2007-07-05 at 09:14 +0800, Eric wrote:
> > I think this is OK.
> > 
> > Any idea?
> 
> I've ignored the offtopic bits about some prehistoric kernel. 
> Yes, what you see in the sensible part about 2.6.21 looks OK. 
> What kind of ideas were you expecting?
> 
> --
> dwmw2
> 
> 
