Received: from exprod6og103.obsmtp.com ([64.18.1.185])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JbKRN-0001wW-Mj
	for linux-mtd@lists.infradead.org; Mon, 17 Mar 2008 18:52:11 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Generic NAND driver - plat_nand.c
Date: Mon, 17 Mar 2008 14:51:47 -0400
Message-ID: <1CF6EDDF0820924DA43C9A52FE73259509908B08@MI8NYCMAIL17.Mi8.com>
From: "hartleys" <hartleys@visionengravers.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

Just a curiosity question about the Generic NAND driver.

During the "Probe for the NAND device" shouldn't the memory region be
requested/
reserved using request_mem_region() before the ioremap()?

I wrote a custom NAND driver for the Cirrus EP93xx that I was using with
an
older kernel. I just updated to the 2.6.24.3 kernel and saw the Generic
NAND
driver and decided to try it. It works fine on my platform but I was
curious
about the missing request_mem_region().

Thanks,
Hartley Sweeten
