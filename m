Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZffU-0005Hn-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2002 23:40:41 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <002801c233ad$a2d39810$5501a8c0@synso.com.tw> 
References: <002801c233ad$a2d39810$5501a8c0@synso.com.tw> 
To: "Steve Tsai" <startec@ms11.hinet.net>
Cc: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: Re: nand_write_ecc 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 30 Jul 2002 23:40:05 +0100
Message-ID: <14950.1028068805@redhat.com>
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

startec@ms11.hinet.net said:
> I am using NAND flash as a root file system. When I and flash a new
> root image to NAND flash and reboot the system. I copy a file to flash
> and the system halt.  I got the following message when I operate the
> board.  When nand_write_ecc  was called, I will print out message as,
> "nand_write_ecc: col=%d last=%d page=%x ecc_code=%x %x %x %x %x %x". I
> think the first nand_write_ecc was called by GC and when I copy the
> file nand_write_ecc was called again. But as the following message,
> the two calls write to the same page 0x18FF. Why they write the same
> page? 

Does this still happen with the latest code in CVS?

--
dwmw2
