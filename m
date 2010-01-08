Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTIpB-0000ku-C2
	for linux-mtd@lists.infradead.org; Fri, 08 Jan 2010 17:40:41 +0000
Received: by bwz4 with SMTP id 4so12464903bwz.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Jan 2010 09:40:35 -0800 (PST)
Subject: Re: RFC: [PATCH V2 0/9 Integration of SmartMedia/xD into mtd subsystem
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20100108160404.GE31872@logfs.org>
References: <1262963092.12577.14.camel@maxim-laptop>
	<20100108160404.GE31872@logfs.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 08 Jan 2010 19:40:29 +0200
Message-ID: <1262972429.20060.4.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, Alex Dubov <oakad@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-01-08 at 17:04 +0100, Jörn Engel wrote: 
> On Fri, 8 January 2010 17:04:52 +0200, Maxim Levitsky wrote:
> > 
> > * Write speed is of course still very low, but like I said, it might be
> > hardware problem.
> 
> Iirc the alauda could do about 400kB/s.  Speed didn't change noticeably
> between 16M and 256M cards.  My conclusion back then was to blame the
> alauda chip.  If you get even less, the problem likely isn't in the
> cards but in the reader and/or your driver.
Who knows...
Like I said, I get around 330 Kbytes/s in card reader integrated in
printer. It is still much higher that what I get with this driver....

I will figure that out sooner or later.

Btw, your cards aren't Type M, right?
However I use here a Type M card, and its likely to include an FTL
inside, thus, it might explain the low speeds I get there partially...

Best regards,
Maxim Levitsky
