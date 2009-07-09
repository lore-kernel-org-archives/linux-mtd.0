Received: from buzzloop.caiaq.de ([212.112.241.133])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MOysH-0002EC-W6
	for linux-mtd@lists.infradead.org; Thu, 09 Jul 2009 19:01:51 +0000
Date: Thu, 9 Jul 2009 21:01:37 +0200
From: Daniel Mack <daniel@caiaq.de>
To: linux-arm-kernel@lists.arm.linux.org.uk
Subject: PXA3xx NAND driver trouble with 'conservative' CPU govenor
Message-ID: <20090709190137.GW19257@buzzloop.caiaq.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, Eric Miao <eric.y.miao@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With the cpu govenor set to 'conservative', the PXA3xx NAND driver fails
the tests from drivers/mtd/tests:

sh-3.2# modprobe mtd_torturetest dev=3
[  386.367730]
[  386.369296] =================================================
[  386.375258] mtd_torturetest: Warning: this program is trying to wear out your flash, stop it if this is not wanted.
[  386.385811] mtd_torturetest: MTD device: 3
[  386.390021] mtd_torturetest: torture 32 eraseblocks (8-39) of mtd3
[  386.396238] mtd_torturetest: write verify enabled
[  388.675993] double bit error @ page 00000b79
[  388.680406] timed out writing command
[  388.687925] mtd_torturetest: error -74 while reading EB 36, read 131072
[  388.694536] mtd_torturetest: verify failed for 0xFF... pattern
[  388.700364] mtd_torturetest: finished after 0 erase cycles
[  388.705885] mtd_torturetest: error -74 occurred during torturing
[  388.711908] =================================================
modprobe: Failed to load module mtd_torturetest: Bad message.

When setting the govenor to 'performance', the test passes. Has anyone
seen similar issues? Any idea, anyone?

Daniel
