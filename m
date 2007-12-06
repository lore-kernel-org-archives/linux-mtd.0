Received: from va-65-40-217-47.sta.embarqhsd.net ([65.40.217.47]
	helo=CVAEX1.VERTICAL.COM)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J0MRN-0005Hd-G0
	for linux-mtd@lists.infradead.org; Thu, 06 Dec 2007 19:31:27 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Banking flash
Date: Thu, 6 Dec 2007 14:17:19 -0500
Message-ID: <4DD3AF7ECBBC43409BA36508938D01852CE779@CVAEX1.VERTICAL.COM>
From: "Jon Ringle" <JRingle@vertical.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We are in the process of designing a new board around the IXP435. The
IXP435 has 4 Expansion bus chip selects with an address space of 16MB
per chip select. I can only use CS0 for flash because the other 3 CSs
are being used for other purposes. The challenge that we have is that we
require 32MB of flash storage. One of the options that we are
considering is to use a GPIO pin to bank 16MB of a 32MB Intel Strata
flash chip at any given time to CS0's 16MB address space. I am trying to
access the scope of work to be done in Linux to accomplish this and I am
asking for feedback on this idea.

Thanks,
Jon
