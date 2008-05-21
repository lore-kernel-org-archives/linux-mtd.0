Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JyvBa-0005PP-0g
	for linux-mtd@lists.infradead.org; Wed, 21 May 2008 20:45:22 +0000
Date: Wed, 21 May 2008 22:45:06 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alex Dubov <oakad@yahoo.com>
Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
Message-ID: <20080521204505.GA1268@logfs.org>
References: <1211383329.21380.358.camel@pmac.infradead.org>
	<546240.79105.qm@web36703.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <546240.79105.qm@web36703.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 21 May 2008 08:41:38 -0700, Alex Dubov wrote:
> 
> (Current ssfdc.ko implementation is junk, sorry. Joern's driver has its own
> implementation built-in).

Mine doesn't, I ripped it all out.  But the original driver from Daniel
Drake does, along with several others in drivers/usb/storage/.  And
those are almost as bad as vendor code - from which they likely evolved.

Jörn

-- 
Fools ignore complexity.  Pragmatists suffer it.
Some can avoid it.  Geniuses remove it.
-- Perlis's Programming Proverb #58, SIGPLAN Notices, Sept.  1982
