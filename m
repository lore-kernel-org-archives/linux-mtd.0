Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HPdkv-0004Mp-Jt
	for linux-mtd@lists.infradead.org; Fri, 09 Mar 2007 06:59:33 -0500
Date: Fri, 9 Mar 2007 12:42:46 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
Subject: Re: Does mtd support two-plane page program for nand flash?
Message-ID: <20070309114246.GA4897@lazybastard.org>
References: <49eab5c80703062257m7b26d09cha8c996aa2c8d5e07@mail.gmail.com>
	<20070307143414.GA16439@lazybastard.org>
	<45F11641.1010507@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45F11641.1010507@nokia.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 9 March 2007 10:09:37 +0200, Adrian Hunter wrote:
> 
> OneNAND DDP does this too (google: onenand "2x program")

Thanks!

> I presume the possibility exists to have the driver pretend that the
> page size is twice as large and there are half as many erase blocks.
> It would have to map the addressses accordingly - and everything
> else would have to be willing to accept a 4KiB page with 8
> subpages and 128 bytes of oob.

That would be the quick way to get extra bandwidth.

Interleaving writes to both planes can also help latency.  It is
possible to write to one plane while the other is erasing.  It is
possible to do two writes in parallel.  Keeping things seperate would
keep writesize and erasesize low.  And by combining two or more planes,
the slowest of them always decides how long a write/erase will take.

So in the long run, I would prefer to keep planes seperate and add
intelligence to filesystems, LogFS in particular.

Jörn

-- 
It does not matter how slowly you go, so long as you do not stop.
-- Confucius
