Received: from web36705.mail.mud.yahoo.com ([209.191.85.39])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jyq6w-0006RS-C1
	for linux-mtd@lists.infradead.org; Wed, 21 May 2008 15:20:14 +0000
Date: Wed, 21 May 2008 08:20:12 -0700 (PDT)
From: Alex Dubov <oakad@yahoo.com>
Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
To: linux-mtd@lists.infradead.org
In-Reply-To: <20080521092925.GA20358@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <692775.60359.qm@web36705.mail.mud.yahoo.com>
Cc: Jörn Engel <joern@logfs.org>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for the comments. At this point it's enough for me to see that you're ok
with the idea.

I'll try to implement a working prototype of the proposal, supporting block
device emulation over smartmedia and memorystick (these are the only mtd
devices I have). Hopefully, it should take no more than couple of weeks. Then
we will be able to play with the working prototype to see what features it must
actually have.

I'll try to take care of the device node mess, to the possible extent.



      
