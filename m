Date: Thu, 9 Aug 2007 03:45:24 +0100
From: Christoph Hellwig <hch@infradead.org>
To: J??rn Engel <joern@logfs.org>
Subject: Re: [Patch 18/18] include/linux/Kbuild
Message-ID: <20070809024524.GB18792@infradead.org>
References: <20070808161234.GB15319@lazybastard.org>
	<20070808162447.GT15319@lazybastard.org>
	<20070809001913.GA10044@infradead.org>
	<20070809023217.GA3321@lazybastard.org>
	<20070809023906.GA18792@infradead.org>
	<20070809023920.GB3321@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20070809023920.GB3321@lazybastard.org>
Cc: akpm@osdl.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 09, 2007 at 04:39:20AM +0200, J??rn Engel wrote:
> Fair enough.  Does the file still make sense in include/linux/ then?

I don't think so.  Except for the one filesystem that's out there to repeat
past mistakes all recent ones keep their headers in their impleementation
directories.
