Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Ix0BD-0005f4-7p
	for linux-mtd@lists.infradead.org; Tue, 27 Nov 2007 13:08:53 +0000
Date: Tue, 27 Nov 2007 14:03:33 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [RFC][PATCH][JFFS2] JFFS2 support for NOP 1
Message-ID: <20071127130333.GB29456@lazybastard.org>
References: <20071127073616.GA22556@party>
	<20071127095518.GA29456@lazybastard.org>
	<9c9fda240711270348q7798ddd5jfb7bf763b3497500@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c9fda240711270348q7798ddd5jfb7bf763b3497500@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	dwmw2@infradead.org, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 27 November 2007 20:48:33 +0900, Kyungmin Park wrote:
> >
> > NAK.  This does not describe the limitations of your chip, but a random
> > name.  In fact, the limitations appear to be identical to
> > (MTD_NORFLASH & !MTD_BIT_WRITEABLE).
> >
> > Maybe something like ALLOW_SEPERATE_OOB_WRITE with reversed logic?
> >
> 
> However MTD_NORFLASH doesn't have the write buffer. It means it can be
> write one more.

Some NOR flashes _do_ require write buffers.  The ones I know must be
written in aligned multiples of 8, 16 or 1024 bytes, respectively.  In
spite of being NOR, that sounds quite similar to what you try to achieve
for NAND.

Jörn

-- 
The wise man seeks everything in himself; the ignorant man tries to get
everything from somebody else.
-- unknown
