Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NTGml-0007ig-Pm
	for linux-mtd@lists.infradead.org; Fri, 08 Jan 2010 15:30:04 +0000
Date: Fri, 8 Jan 2010 16:29:45 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Maxim Levitsky <maximlevitsky@gmail.com>
Subject: Re: [PATCH 9/9] mtd: Add new SmartMedia/xD FTL
Message-ID: <20100108152945.GC31872@logfs.org>
References: <1262963092.12577.14.camel@maxim-laptop>
	<1262963524.12577.23.camel@maxim-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1262963524.12577.23.camel@maxim-laptop>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, Alex Dubov <oakad@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 8 January 2010 17:12:04 +0200, Maxim Levitsky wrote:
> 
> This implements new readwrite SmartMedia/xd FTL.
> 
> It depends on nand driver to define proper oob layout that excludes
> all ecc areas and nothing more.
> 
> Support for very old 256 byte/page devices is not yet enabled/complete.
> For these devices, all ecc handling will be done inside this FTL
> due to wierd oob layout.
> 
> Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
> ---
>  drivers/mtd/Kconfig  |   12 +
>  drivers/mtd/Makefile |    1 +
>  drivers/mtd/sm_ftl.c | 1043 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/sm_ftl.h |   75 ++++

sm_ftl is certainly nicer than ssfdc.c - at least I can decrypt the
acronym.  But I am missing a reason why ssfdc is not sufficient and we
need yet another implementation of the same ftl.

Or maybe ssfdc is sufficient or barely sufficient and just needs a small
patch?

Jörn

-- 
He that composes himself is wiser than he that composes a book.
-- B. Franklin
