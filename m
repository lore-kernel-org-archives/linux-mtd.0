Received: from mail-ew0-f220.google.com ([209.85.219.220])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MK7Me-0006Kq-OA
	for linux-mtd@lists.infradead.org; Fri, 26 Jun 2009 09:05:02 +0000
Received: by ewy20 with SMTP id 20so484579ewy.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Jun 2009 02:04:54 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 26 Jun 2009 11:04:53 +0200
Message-ID: <eedb5540906260204u518d564o9d862485379eedfe@mail.gmail.com>
Subject: mxc_nand: Problem with K9F1G08X0A Samsung flash
From: javier Martin <javier.martin@vista-silicon.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, I am using a Samsung K9F1G08X0A NAND flash with my i.mx27 based
board and last stable 2.6.30 kernel.

I am experimenting the same problem as Alberto Panizzo
(http://lists.infradead.org/pipermail/linux-mtd/2009-May/025704.html).
Linux does not detect any correct block in my NAND flash.

Scanning device for bad blocks
Bad eraseblock 0 at 0x000000000000
Bad eraseblock 1 at 0x000000020000
Bad eraseblock 2 at 0x000000040000
Bad eraseblock 3 at 0x000000060000
Bad eraseblock 4 at 0x000000080000
Bad eraseblock 5 at 0x0000000a0000
Bad eraseblock 6 at 0x0000000c0000
Bad eraseblock 7 at 0x0000000e0000
.... all blocks ...
Bad eraseblock 2045 at 0x00000ffa0000
Bad eraseblock 2046 at 0x00000ffc0000
Bad eraseblock 2047 at 0x00000ffe0000
RedBoot partition parsing not available
Registering mxc_nand as whole device

I read some people saying that it is due to the lack of 2KB page
support. Also Vladimir Barinov said he would post a patch for this in
a separate thread but I couldn't find it.

Have you already solved this problem?

Thank you.
