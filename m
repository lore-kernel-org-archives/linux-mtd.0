Received: from nameservices.net ([208.234.25.16] helo=opersys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cEG7-0007rA-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 01:01:03 +0100
Message-ID: <3D5063E2.C93342D8@opersys.com>
Date: Tue, 06 Aug 2002 20:03:46 -0400
From: Karim Yaghmour <karim@opersys.com>
Reply-To: karim@opersys.com
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Support for Intel 28F032SA
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I have an old board with an Intel 28F032SA which I would like to use
with Linux. The 28F032SA is actually 2 consecutively mapped 28F016SA
chips in the same packaging. They, however, cannot be modified
simultaneously, so they can't be dealt with as 2 independent devices.

The chip is non-CFI and the closest driver I've seen is the
drivers/mtd/chips/sharp.c driver which supports Sharp 28F016SCT chips.
I suppose I could hack it to create a driver for the 28F032SA. Before
I do so, nevertheless, I was wondering if someone on this list had any
experience with using this chip and/or if someone knew of another
driver I could use with this chip.

Any insight would be appreciated,

Karim

===================================================
                 Karim Yaghmour
               karim@opersys.com
      Embedded and Real-Time Linux Expert
===================================================
