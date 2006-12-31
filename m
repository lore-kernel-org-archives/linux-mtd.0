Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H14kI-0006pp-Fb
	for linux-mtd@lists.infradead.org; Sun, 31 Dec 2006 17:45:21 +0000
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1H14k1-000125-VP
	for linux-mtd@lists.infradead.org; Sun, 31 Dec 2006 18:45:01 +0100
Received: from cac94-1-81-57-151-96.fbx.proxad.net ([81.57.151.96])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sun, 31 Dec 2006 18:45:01 +0100
Received: from castet.matthieu by cac94-1-81-57-151-96.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sun, 31 Dec 2006 18:45:01 +0100
To: linux-mtd@lists.infradead.org
From: Matthieu CASTET <castet.matthieu@free.fr>
Subject: Re: [RFC] MTD driver for MMC cards
Date: Sun, 31 Dec 2006 17:40:13 +0000 (UTC)
Message-ID: <en8slt$i14$1@sea.gmane.org>
References: <200612281418.20643.arnd@arndb.de> <4597ADD2.90700@drzeus.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: news <news@sea.gmane.org>
Cc: linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 31 Dec 2006 13:32:18 +0100, Pierre Ossman wrote:

> Arnd Bergmann wrote:
 
 
> I'm a complete MTD noob, but what uses does the MTD layer have besides
> JFFS2. If it's none, than this advantage isn't that big of a deal.
> 
AFAIK MTD is for device where erase is need to managed in "software" :
http://www.linux-mtd.infradead.org/faq/general.html


For SD card, doesn't a microcontroller on the card hide this, and make the
sd card acts like a normal block device (no need to erase a block before
writing it)?
