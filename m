Received: from moutng.kundenserver.de ([212.227.17.9])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R1gUW-0007Rm-01
	for linux-mtd@lists.infradead.org; Thu, 08 Sep 2011 15:26:12 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: dedekind1@gmail.com
Subject: Re: [PATCHv3] UBI: new module ubiblk: block layer on top of UBI
Date: Thu, 8 Sep 2011 17:26:00 +0200
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	<1315280704.19067.14.camel@sauron>
	<1315282208.19067.24.camel@sauron>
In-Reply-To: <1315282208.19067.24.camel@sauron>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201109081726.00769.arnd@arndb.de>
Cc: linux-embedded <linux-embedded@vger.kernel.org>,
	david.wagner@free-electrons.com, lkml <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>, Tim Bird <tim.bird@am.sony.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 06 September 2011, Artem Bityutskiy wrote:
> Not sure about the bus approach - David, could you take a look at it
> please? If we can handle errors there - then we could indeed re-use the
> UBI control device. We could even re-use the ioctl data structures for
> UBI volumes creation/removal - we have plenty of space there reserved
> for future extensions.

I would generally recommend using new ioctl commands. ioctl numbers
are cheap, but complexity in data structures is not, because every
user who wants to deal with the data structures has to understand
them. Also, changing the ABI is always tricky since you have to
provide backward and forwards compatibility with existing kernels
and with existing user space.

	Arnd
