Subject: Re: jffs2: -ENOSPC when truncating file?!
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20080224065751.GA31293@lazybastard.org>
References: <20080223235742.GE2202@elf.ucw.cz>
	<1203813368.5771.174.camel@shinybook.infradead.org>
	<20080224065751.GA31293@lazybastard.org>
Content-Type: text/plain; charset=UTF-8
Date: Sun, 24 Feb 2008 18:57:32 +0800
Message-Id: <1203850653.13749.9.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, kernel list <linux-kernel@vger.kernel.org>,
	Pavel Machek <pavel@ucw.cz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sun, 2008-02-24 at 07:57 +0100, Jörn Engel wrote:
> Could a naïve implementation of this get exploited by doing a large
> number of truncates that just shave single bytes off various files?

Yeah, which is why _my_ naïve implementation would do it for
truncate-to-zero instead of just _any_ truncate (which could even be
truncate-to-larger).

A more complex version might allow _any_ transaction to eat into the
ALLOC_DELETION pool if it is ultimately going to reduce the amount of
space taken on the file system -- even overwriting 'real' data with
zeroes which compress better. That's going to be hard to calculate in
the general case though.

If allowing only truncate-to-zero isn't good enough, perhaps we could
allow truncation to use the ALLOC_DELETION pool when it's going to
obsolete at least one full data node. That's not so hard to check.

-- 
dwmw2
