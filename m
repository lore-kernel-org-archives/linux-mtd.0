Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IJFei-0004Wq-Lh
	for linux-mtd@lists.infradead.org; Thu, 09 Aug 2007 17:35:15 -0400
Date: Thu, 9 Aug 2007 22:03:42 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Patch 16/18] fs/Kconfig
Message-ID: <20070809200342.GD9036@lazybastard.org>
References: <20070808161234.GB15319@lazybastard.org>
	<20070808162339.GR15319@lazybastard.org>
	<200708090101.27226.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200708090101.27226.arnd@arndb.de>
Cc: akpm@osdl.org, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 9 August 2007 01:01:26 +0200, Arnd Bergmann wrote:
> On Wednesday 08 August 2007, Jörn Engel wrote:
> > +config LOGFS
> > +       bool "Log Filesystem (EXPERIMENTAL)"
> > +       depends on MTD && BLOCK && EXPERIMENTAL
> 
> The dependency on MTD _and_ BLOCK looks correct for your code, but
> not necessary. How about making it 
> 
> 	depends on (MTD || BLOCK) && EXPERIMENTAL
> 
> and allowing to build without the mtd/bdev specific code?

Would be useful, yes.

Jörn

-- 
Data expands to fill the space available for storage.
-- Parkinson's Law
