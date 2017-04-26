Received: from [167.98.27.226] (helo=rainbowdash.ducie.codethink.co.uk)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d3RfJ-0001Su-K7
 for linux-mtd@lists.infradead.org; Wed, 26 Apr 2017 18:27:51 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: RFC: fixup for mtdblock issue with erase warnings
Date: Wed, 26 Apr 2017 18:46:08 +0100
Message-Id: <20170426174609.29433-1-ben.dooks@codethink.co.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We have been running into a warning from __might_sleep() in the cfi erase
code. We think this is due to the mtdblock driver trying to sleep when an
operation is going to complete from the _erase callback.

If this patch is acceptable, it should probably go into stable as well as
the current release.

Note, currently being tested on v4.4.y
