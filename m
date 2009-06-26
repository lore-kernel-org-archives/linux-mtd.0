Received: from mx3.acantho.net ([213.174.182.196])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MK8mH-0001EP-8k
	for linux-mtd@lists.infradead.org; Fri, 26 Jun 2009 10:35:35 +0000
Received: (from root@localhost)
	by mx3.acantho.net (8.13.4/8.13.4/Debian-3sarge1) id n5QAZNMN001050
	for <linux-mtd@lists.infradead.org>; Fri, 26 Jun 2009 12:35:23 +0200
Message-ID: <4A44A465.7020802@eptar.com>
Date: Fri, 26 Jun 2009 12:35:17 +0200
From: Claudio Lanconelli <lanconelli.claudio@eptar.com>
MIME-Version: 1.0
To: javier Martin <javier.martin@vista-silicon.com>
Subject: Re: mxc_nand: Problem with K9F1G08X0A Samsung flash
References: <eedb5540906260204u518d564o9d862485379eedfe@mail.gmail.com>
In-Reply-To: <eedb5540906260204u518d564o9d862485379eedfe@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Javier,
you can find the patch here:
http://lists.infradead.org/pipermail/linux-mtd/2009-May/025740.html

javier Martin ha scritto:
> Hello, I am using a Samsung K9F1G08X0A NAND flash with my i.mx27 based
> board and last stable 2.6.30 kernel.
> 
> I am experimenting the same problem as Alberto Panizzo
> (http://lists.infradead.org/pipermail/linux-mtd/2009-May/025704.html).
> Linux does not detect any correct block in my NAND flash.
> 
> Scanning device for bad blocks
> Bad eraseblock 0 at 0x000000000000
> Bad eraseblock 1 at 0x000000020000
> Bad eraseblock 2 at 0x000000040000
> Bad eraseblock 3 at 0x000000060000
> Bad eraseblock 4 at 0x000000080000
> Bad eraseblock 5 at 0x0000000a0000
> Bad eraseblock 6 at 0x0000000c0000
> Bad eraseblock 7 at 0x0000000e0000
> .... all blocks ...
> Bad eraseblock 2045 at 0x00000ffa0000
> Bad eraseblock 2046 at 0x00000ffc0000
> Bad eraseblock 2047 at 0x00000ffe0000
> RedBoot partition parsing not available
> Registering mxc_nand as whole device
> 
> I read some people saying that it is due to the lack of 2KB page
> support. Also Vladimir Barinov said he would post a patch for this in
> a separate thread but I couldn't find it.
> 
> Have you already solved this problem?
> 
> Thank you.
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
