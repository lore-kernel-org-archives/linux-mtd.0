Received: from lo.gmane.org ([80.91.229.12])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N00jy-00041j-Rh
	for linux-mtd@lists.infradead.org; Mon, 19 Oct 2009 22:30:15 +0000
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N00jv-00084E-GK
	for linux-mtd@lists.infradead.org; Tue, 20 Oct 2009 00:30:07 +0200
Received: from pool-74-104-159-210.bstnma.fios.verizon.net ([74.104.159.210])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Oct 2009 00:30:07 +0200
Received: from jim by pool-74-104-159-210.bstnma.fios.verizon.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Oct 2009 00:30:07 +0200
To: linux-mtd@lists.infradead.org
From: Jim Duda <jim@duda.tzo.com>
Subject: Advice on New Hardware Platform
Date: Sun, 18 Oct 2009 12:27:40 -0400
Message-ID: <hbffls$lic$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have designed a new NAND Flash Controller which supports ECC at the hardware layer.
It can be programmed to support between 6-30 bits of Reed Solomon correction over 512 or 1024K bytes of data.
The controller supports the following four main functions in hardware:

1.CLE cycles of 1 to 15 bytes of information
2. ALE cycles of 1 to 15 bytes of information
3. Page Write with DMA calculating ECC on the fly
4. Page Read with DMA correcting bytes using ECC on the fly.

ECC is stored intermixed with data, using main and spare data as one piece.
The combination of the four main functions can be used to support most devices.
I'm now investigating how to map this design to the MTD layer.

I've read all of the documentation I can find.
Since my new hardware does ECC on the fly, I'm struggling to determine which "model" to use.

Can anyone suggest an example driver to use as a starting point?

Any advice appreciated.

Thanks,

Jim
