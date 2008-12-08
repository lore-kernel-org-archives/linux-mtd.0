Received: from moutng.kundenserver.de ([212.227.126.186])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L9ml4-0002fJ-5K
	for linux-mtd@lists.infradead.org; Mon, 08 Dec 2008 20:31:10 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Artem Bityutskiy <dedekind@yandex.ru>
Subject: Re: UBI/DVB ioctl conflict?
Date: Mon, 8 Dec 2008 21:30:13 +0100
References: <20081207095811.13b51cca@zod.rchland.ibm.com>
	<200812081650.54346.arnd@arndb.de> <493D4C63.5040502@yandex.ru>
In-Reply-To: <493D4C63.5040502@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200812082130.14420.arnd@arndb.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Laurent Pinchart <laurentp@cse-semaphore.com>,
	linux-mtd@lists.infradead.org, v4l-dvb-maintainer@linuxtv.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 08 December 2008, Artem Bityutskiy wrote:
> Arnd Bergmann wrote:
> > We try hard (but sometimes fail) to keep every ioctl number unique.
> > The reason for this is that the device drivers are not the only
> > pieces of code that look at them. Specifically, three other things
> > frequently cause problems here:
> 
> Thanks for the reply. Do you know the status of the
> Documentation/ioctl/ioctl-number.txt file - it does not seem to be up-to-date.
> Should I document add UBI ioctls there?

Yes, please. The best we can do is if everyone documents his own stuff.

	Arnd <><
