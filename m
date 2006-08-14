Received: from ibawizard.net ([82.208.44.173])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GCXxt-0001Ya-TC
	for linux-mtd@lists.infradead.org; Mon, 14 Aug 2006 04:38:34 -0400
Date: Mon, 14 Aug 2006 10:38:45 +0200
From: Petr Stetiar <ynezz@true.cz>
To: linux-mtd@lists.infradead.org
Subject: Obsolete ioctl MEMSETOOBSEL in nandwrite
Message-ID: <20060814083845.GA18948@ibawizard.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: ynezz@true.cz
Reply-To: ynezz@true.cz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I think, that nandwrite is using already obsolete MEMSETOOBSEL ioctl. I've
fixed it for myself just by removing these ioctl calls and it seems to work.
Sorry, that I'm not sending a patch, but I don't feel familiar enough with mtd
to do so.

Just for info, I'm using 2.6.18-rc4 kernel with latest mtd-utils.git in
buildroot on ep93xx ARM platform, 32MB Samsung NAND flash.

-- ynezz
