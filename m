Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IYYCp-00040X-V7
	for linux-mtd@lists.infradead.org; Thu, 20 Sep 2007 22:25:26 -0400
Date: Fri, 21 Sep 2007 04:20:59 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Matteo Croce <technoboy85@gmail.com>
Subject: Re: [PATCH][MIPS][2/7] AR7: mtd partition map
Message-ID: <20070921022059.GG1692@lazybastard.org>
References: <200709201728.10866.technoboy85@gmail.com>
	<20070920193547.GA911@lst.de>
	<20070920200058.GB1692@lazybastard.org>
	<200709210409.23521.technoboy85@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200709210409.23521.technoboy85@gmail.com>
Cc: linux-mips@linux-mips.org, Felix Fietkau <nbd@openwrt.org>,
	Eugene Konev <ejka@imfi.kspu.ru>,
	=?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>, dwmw2@infradead.org,
	Christoph Hellwig <hch@lst.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 21 September 2007 04:09:22 +0200, Matteo Croce wrote:
> 
> I use little endian since 99% of AR7s are little endian. Dunno if
> le/be32_to_cpu does some runtime calculations. Do they?

Only if they have to convert endianness.  And even in that case I doubt
that you will notice it in any benchmarks.

Jörn

-- 
The story so far:
In the beginning the Universe was created.  This has made a lot
of people very angry and been widely regarded as a bad move.
-- Douglas Adams
