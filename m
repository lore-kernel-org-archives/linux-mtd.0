Subject: Re: [PATCH 3/4] [MTD] compat_ioctl cleanup
From: David Woodhouse <dwmw2@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <200904141643.48345.arnd@arndb.de>
References: <a95a62fe0904082253i119f8660y6a73835a163394f5@mail.gmail.com>
	<200904141643.48345.arnd@arndb.de>
Content-Type: text/plain
Date: Fri, 29 May 2009 16:04:29 +0100
Message-Id: <1243609469.19886.180.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-04-14 at 16:43 +0200, Arnd Bergmann wrote:
> This looks correct, but I think it would be better to just remove all
> those lines from fs/compat_ioctl.c and add a default: statement in
> mtd_compat_ioctl that calls mtd_ioctl for all ioctl numbers that
> don't have an explicit handler.

He did that already; I've just committed it to my local tree and will be
pushing it out as soon as I fix the compat_ptr() thing.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
