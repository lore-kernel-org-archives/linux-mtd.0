Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1Dwmo1-0005hY-Lx
	for linux-mtd@lists.infradead.org; Sun, 24 Jul 2005 16:10:46 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DwmnX-0001fJ-VR
	for linux-mtd@lists.infradead.org; Sun, 24 Jul 2005 22:10:08 +0200
Received: from 212.242.189.63 ([212.242.189.63])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sun, 24 Jul 2005 22:10:07 +0200
Received: from martin by 212.242.189.63 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sun, 24 Jul 2005 22:10:07 +0200
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Date: Sun, 24 Jul 2005 22:09:58 +0200
Message-ID: <dc0sin$spr$1@sea.gmane.org>
References: <dbl42b$hcn$1@sea.gmane.org>	<1121867130.12903.15.camel@localhost.localdomain>	<dblm4l$802$1@sea.gmane.org>	<1121869156.12903.19.camel@localhost.localdomain>	<dblne1$cgd$1@sea.gmane.org>	<1121887042.20077.1.camel@localhost.localdomain>	<dbr0tp$87s$1@sea.gmane.org>
	<1122131239.12630.34.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <1122131239.12630.34.camel@localhost.localdomain>
Sender: news <news@sea.gmane.org>
Subject: Re: JFFS2 garbage collector blocking for minutes after mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>47695   idled                   384,63710
>>2997    nand_read_buf           62,43750
>>1122    nand_calculate_ecc      5,84380
>>677     __delay                 33,85000
>>502     nand_do_read_ecc        0,26370
> Right, so we're spending most of that time actually reading the flash.
> If you just read the entire flash device, how long does that take?
>  (time dd if=/dev/mtd0 of=/dev/null) 
This takes some 22 secs - so that explains the half of the time (~45s), 
yes... I guess some of the time has to do with the fact that I used the 
NAND for my root fs - unfortunately also when I did the profiling...

> Artem's patch will improve things further by building up the fragtree
> from newest to oldest node instead of from oldest to newest as we
> currently do -- which actually means we don't need to check the CRC on
> the oldest nodes before they never get added to the tree; we don't
> actually need to read their data payload at all.
Looking forward to the patch leaving the preliminary state...

// Martin
