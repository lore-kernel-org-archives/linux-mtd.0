Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17SzZv-0003Rr-00
	for <linux-mtd@lists.infradead.org>; Fri, 12 Jul 2002 13:31:19 +0100
Date: Fri, 12 Jul 2002 14:30:46 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Steve Tsai <startec@ms11.hinet.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: ECC in Nand_write_page
Message-ID: <20020712123046.GA10639@wohnheim.fh-wedel.de>
References: <A4461AAE-94D1-11D6-A71C-000393467F1A@arlut.utexas.edu> <003701c2294d$5dcd6e40$5501a8c0@synso.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <003701c2294d$5dcd6e40$5501a8c0@synso.com.tw>
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

On Fri, 12 July 2002 10:39:36 +0800, Steve Tsai wrote:
> I don't think nand_write_page can write partial page, if someone enable
> ECC. For example, when I write the partial page to the page 100, it will
> write ECC code into the page also, but when I write the other data to
> the empty area of the same page, I can write data into  the empty area
> of the page, but I can not write the ECC code, because the area storing
> ECC code was written at the previous time.  

You are right. I've had a similar problem with ECC flash lately - NOR
flash, but the principle is the same. The ECC checksum is written to
the flash. By writing the same page twice, the checksum would have to
toggle some bits from 0 to 1, which is impossible for flash.
Thus you have a constraint to write any given page but once between
two erase cycles.

Joern
