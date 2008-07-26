Subject: [PATCH 0/3] [MTD] mtdoops updates
From: Richard Purdie <rpurdie@rpsys.net>
To: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain
Date: Sat, 26 Jul 2008 10:08:35 +0100
Message-Id: <1217063315.5463.14.camel@dax.rpnet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've realised the mtdoops driver in mainline has a couple of bugs. The
following three patches address these and also add a magic number to the
logs which significantly improves the usefulness of the driver.

The patches can also be pulled from the following git tree which is
based on top of the mtd tree:

git://git.o-hand.com/linux-rpurdie-mtd master

Cheers,

Richard
