Received: from [212.112.238.170] (helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NMioj-00089c-S7
	for linux-mtd@lists.infradead.org; Mon, 21 Dec 2009 14:01:02 +0000
Date: Mon, 21 Dec 2009 15:00:03 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Maxim Levitsky <maximlevitsky@gmail.com>
Subject: Re: Few problems in mtd system
Message-ID: <20091221140003.GA13316@logfs.org>
References: <290458.39840.qm@web37604.mail.mud.yahoo.com>
	<1261342795.4798.14.camel@maxim-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1261342795.4798.14.camel@maxim-laptop>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, arnd <arnd@arndb.de>,
	Alex Dubov <oakad@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 20 December 2009 22:59:55 +0200, Maxim Levitsky wrote:
> 
> I suspect that older non type M cards didn't have such emulation, but
> were real nand chips, bacause there are some references on the web about
> using XD card as a nand chip replacement.
> Such card as I have will really will make very poor nand replacement...

If you want to know whether the cards or the readers are to blame, you
can try to buy an old alauda reader on ebay.  It is too slow to be
useful for most purposes, but I believe it did give me full access with
my cards.

> Folks, could you review my other questions about bugs in mtd core, and
> tell your opinion?

I didn't quite understand the 32bit DMA question and am next to clueless
wrt. hotplug.  Sorry.

Jörn

-- 
Joern's library part 6:
http://www.gzip.org/zlib/feldspar.html
