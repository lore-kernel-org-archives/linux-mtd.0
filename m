Received: from xena.bway.net ([216.220.96.26] helo=mail.bway.net)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E5DOE-0001II-Gc
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2005 22:10:53 -0400
Message-ID: <43029CAF.5000509@bway.net>
Date: Wed, 17 Aug 2005 02:10:55 +0000
From: "Ryan B. Lynch" <rlynch@bway.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Subject: removing block2mtd devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A while back, Jorn was kind enough to help me out with using the
"block2mtd" driver.  He explained that once the driver has been loaded
(either as a built-in driver or a module), it's possible to setup new
devices with:

    echo "/dev/sda1" > /sys/module/block2mtd/parameters/block2mtd

Which gives you new mtdblock* and new mtd* devices.

So my question is:  Is it possible to stop "block2mtd" devices after
they've been loaded?  Is there a mechanism like the sysfs one shown
above, or do you have to remove the module, or reboot, or something like
that?  I'm using the entire MTD subsystem, including the block2mtd
driver, as built-in, to avoid having to screw around with initrds, so
I'd be interested in knowing what the deal is.

-Ryan
