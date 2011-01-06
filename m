Received: from mail.multitech.com ([65.126.90.84])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PaxV3-0004L7-6d
	for linux-mtd@lists.infradead.org; Thu, 06 Jan 2011 21:36:01 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: New NAND flash die rev recommends 4 bit ECC
Date: Thu, 6 Jan 2011 15:34:31 -0600
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E6149861DA@mtsexchange.dc.multitech.prv>
From: "Tim Barr" <tbarr@multitech.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I just got a notice from Micron that they are making changes to the
29F2G08/16 (2 Gbit SLC device). For instance, the 29F2G0816AAD is going
EOL this month and is being replaced by the MT29F2G08ABAEA. The problem
is that the new data sheet is recommending 4 bit per 526 byte ECC
instead of 1 bit per 526 byte ECC. As far as I can tell, the processor
we are using (AT91SAM9G20) only does 1 bit HW ECC and the software ECC
code for MTD is also 1 bit. The new NAND Flash die does have a HW 4 bit
ECC engine added in, which probably would need to have code written to
support it in order to be able to use it.

So, is anyone working on a 4 bit software ECC code or code modifications
to utilize the on chip HW ECC engine?

Right now we can use a part from an alternate vendor or do a lifetime
buy, but I am wondering if this is a trend as die size shrinks and other
vendors will soon require higher level ECC as well.

Tim Barr=20
Development Engineer=20
Multi-Tech Systems, Inc.=20
=20
