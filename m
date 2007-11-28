Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1IxD2j-0007Ox-7I
	for linux-mtd@lists.infradead.org; Wed, 28 Nov 2007 02:52:59 +0000
Date: Wed, 28 Nov 2007 03:47:43 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [RFC][PATCH][JFFS2] JFFS2 support for NOP 1
Message-ID: <20071128024743.GA4767@lazybastard.org>
References: <20071127073616.GA22556@party>
	<20071127095518.GA29456@lazybastard.org>
	<9c9fda240711270348q7798ddd5jfb7bf763b3497500@mail.gmail.com>
	<1196164758.20132.6.camel@sauron>
	<9c9fda240711271528j5dd89cacg9b1b1c11e700b16b@mail.gmail.com>
	<20071127233108.GC29456@lazybastard.org>
	<9c9fda240711271808gcbd0964jf73d564d56ebccc4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c9fda240711271808gcbd0964jf73d564d56ebccc4@mail.gmail.com>
Cc: dwmw2@infradead.org, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	linux-mtd@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 28 November 2007 11:08:30 +0900, Kyungmin Park wrote:
> 
> sub-page: possible write size(?)
> MTD usually write data with 'page size' (1KiB, 2KiB, and 4KiB) but
> some upper layer such as UBI can write it with 'sub-page size (sector
> size)'.
> 
> Number Of Program (NOP): How many times flash can be programed.
> In general SLC NAND has 4 but this value will be smaller as the
> technology is advanced and MLC NAND has 1.
> 
> The problem is that current JFFS2 implementation uses the NOP 2, data
> area and oob area in NAND case. It breaks the NOP 1 limitation in MLC
> case.
> 
> If the description is wrong, please let me know.

Sounds plausible.  And reading up on the subpage code I start to doubt
its robustness wrt. newer SLC flashes as well.  If the NOP is lower than
the number of ECC steps, trouble is brewing.

But back to your original patch, you want JFFS2 to behave on MLC flashes
just as it already behaves on Sibley and those dreaded STMicro NORs.
And I claim that you should not only reach identical behaviour, but also
share the same code.  There is no point in having two sets of "special"
initializations with the exact same effect.

Maybe add a flag MTD_OOB_WRITEABLE (or some better name) to SLC flashes
and have the nand initializations in JFFS2 depend on those.  Without
this flag, the nor_wbuf_* code is called.  "nor_wbuf" could use a better
name as well, since it extends to more than just NOR flash.

Jörn

-- 
The grand essentials of happiness are: something to do, something to
love, and something to hope for.
-- Allan K. Chalmers
