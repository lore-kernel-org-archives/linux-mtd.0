Received: from moutng.kundenserver.de ([212.227.126.186])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HNrZr-0001pG-PI
	for linux-mtd@lists.infradead.org; Sun, 04 Mar 2007 09:20:45 -0500
From: Arnd Bergmann <arnd@arndb.de>
To: Richard Purdie <rpurdie@openedhand.com>
Subject: Re: [PATCH 8/9] mtd: Allow mtd block device drivers to have a custom
	ioctl function
Date: Sun, 4 Mar 2007 15:20:42 +0100
References: <1172850902.11149.130.camel@localhost.localdomain>
In-Reply-To: <1172850902.11149.130.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200703041520.43245.arnd@arndb.de>
Cc: Nick Piggin <nickpiggin@yahoo.com.au>, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org, kernel list <linux-kernel@vger.kernel.org>,
	Hugh Dickins <hugh@veritas.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 02 March 2007 16:55:02 Richard Purdie wrote:
> Allow mtd block drivers to customise their ioctl functions. Also
> allow the drivers to obtain the gendisk struct since ioctl
> functions can need this.

Are you sure that this is a good idea? I'd rather not open
up this method of letting the individual drivers to bad things.

> This also moves the mtd ioctl functions from locked to unlocked.
> As far as I can see, nothing in the mtd code has locking problems.

This part looks fine to me.

	Arnd <><
