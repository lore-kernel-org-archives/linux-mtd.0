Received: from [70.90.161.73] (helo=exchange.cnpriv.local)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FdpiE-0001ZN-9Y
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 10:31:11 -0400
From: Blair Barnett <bbarnett@circumnavnetworks.com>
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Message-Id: <1147271448.4649.63.camel@blairs-desktop>
Mime-Version: 1.0
Date: Wed, 10 May 2006 07:30:48 -0700
Content-Transfer-Encoding: 7bit
Subject: NAND write problem on a 400 MHz Xscale
Reply-To: blair@circumnavnetworks.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,


We're having problems writing from a 400 MHz Xscale to our nand chip, a
Samsung NAND 512MiB 3,3V 8-bit. Reading works.

I was wondering if we need to change the MSC0 register on the Xscale.
Currently it's set to 0x133924A8. Or maybe I'm looking in the wrong
place.

We've added an ndelay(150) in the writeb loop in nand_write_buf, which
works, but which I think is sub-optimal.

We're using the 4/22/2006 MTD source with the 2.6.15 kernel.

Anybody have a clue what we might try?

Thanks in advance,

Blair
