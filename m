Received: from hex.linuxgrrls.org ([212.18.228.73] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15f1M6-0004zM-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Sep 2001 16:46:14 +0100
Date: Thu, 6 Sep 2001 16:52:09 +0100 (BST)
From: kira brown <kira@hex.linuxgrrls.org>
To: Herman Oosthuysen <herman@wirelessnetworksinc.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: DiskOnChip write performance
In-Reply-To: <01090609533800.00800@grosmorne.wirelessnetworksinc.com>
Message-ID: <Pine.LNX.4.33.0109061649230.9437-100000@hex.linuxgrrls.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


On Thu, 6 Sep 2001, Herman Oosthuysen wrote:

> You may be able to speed the system up a little by optimizing the code, but the
> improvement will be insignificant compared to the erase cycle time.

There are basically two ways to speed this situation up:

1)  Write to a RAM buffer and do the actual Flash write in the background.
(I'm sure you've thought of this).

2)  Make sure there are always freshly erased blocks on the Flash when you
come to need to do a fast write.

Either way, DOC2000 is never going to be any great shakes of speed-  it's
just not a very fast device.

kira.
