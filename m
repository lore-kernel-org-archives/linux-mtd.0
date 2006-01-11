Received: from orchid.cspi.com ([192.41.172.77])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ewkpw-0002tL-92
	for linux-mtd@lists.infradead.org; Wed, 11 Jan 2006 13:36:46 -0500
From: ghannon@cspi.com
To: alfred hitch <alfred.hitch@gmail.com>
Message-ID: <852570F3.00522FB1.00@pine.cspi.com>
Mime-Version: 1.0
Content-type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, Peter Wippich <pewi@gw-instruments.de>
Subject: Re: sector locks handling for J3 flashes?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Wed, 11 Jan 2006 18:36:50 -0000


On Wed, 11 Jan 2006, alfred hitch wrote:

> I am actually surprised that noone is running his / her boards with
> flash sectors locked ?

> I am new to embedded designs, but wont this be a pretty standard /
> accepted practice to lock your flash sectors ?

We are also using that same part and we were having some flash
corruption at reboot, although I think it was due to an
error in the reset timing on the board.

I keep the flash locked at all times except to reflash our firmware.
The locking and unlocking is all handled  by a userspace tool
we wrote up and the reflashing script takes care of doing the
unlock/lock around the programming step.

I could send you the code if you would like.

Also, one thing about the J3 part is that any "unlock" of
a block unlocks the whole flash, and a lock only locks one block.
The linux mtd drivers do not take this into consideration.
Although I think the lazy unlock mentioned would not have a
problem with it, it would just never find anything locked once
it unlocked the first block.

The rev D of J3 allows you to make certain sectors permanently locked,
so that an unlock of one area will not unlock sectors that are
setup to not allow unlocking.   Be careful though, or your can turn your
flash into rom very easily if you have no way of stopping the code
before it sets up these bits.

Gary Hannon
