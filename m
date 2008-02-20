Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JRs24-0002KH-TX
	for linux-mtd@lists.infradead.org; Wed, 20 Feb 2008 16:42:57 +0000
Date: Wed, 20 Feb 2008 17:42:27 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Stephane Chazelas <stephane.chazelas@emerson.com>
Subject: Re: [PATCH 2.6.24] block2mtd: removing a device and typo fixes
Message-ID: <20080220164226.GF5539@lazybastard.org>
References: <chaz20080212134751.GI30304@artesyncp.com>
	<20080212152124.GA21878@lazybastard.org>
	<chaz20080212161034.GJ30304@artesyncp.com>
	<20080219150822.GA29587@lazybastard.org>
	<chaz20080220143646.GJ4539@artesyncp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <chaz20080220143646.GJ4539@artesyncp.com>
Cc: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 20 February 2008 14:36:46 +0000, Stephane Chazelas wrote:
> 
> At the moment, when we bind a mtd device to a block device, we
> don't increase the refcount. When a mtdblock on a block2mtd, the
> refcount is not increased either (the mtdblock's one is I
> guess).

That is a bug then.

Jörn

-- 
The story so far:
In the beginning the Universe was created.  This has made a lot
of people very angry and been widely regarded as a bad move.
-- Douglas Adams
