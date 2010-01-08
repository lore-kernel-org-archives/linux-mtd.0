Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NTGoC-0002Km-Gl
	for linux-mtd@lists.infradead.org; Fri, 08 Jan 2010 15:31:33 +0000
Date: Fri, 8 Jan 2010 16:31:15 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Maxim Levitsky <maximlevitsky@gmail.com>
Subject: Re: [PATCH 2/9] MTD: create lockless versions of {get, put}_mtd_device
Message-ID: <20100108153114.GD31872@logfs.org>
References: <1262963092.12577.14.camel@maxim-laptop>
	<1262963198.12577.16.camel@maxim-laptop>
	<20100108152119.GB31872@logfs.org>
	<1262964444.12577.29.camel@maxim-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1262964444.12577.29.camel@maxim-laptop>
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

On Fri, 8 January 2010 17:27:24 +0200, Maxim Levitsky wrote:
> 
> Yep, you miss this:
> 
> +extern int __get_mtd_device(struct mtd_info *mtd);
> +extern void __put_mtd_device(struct mtd_info *mtd);
> 
> I put that into the header, so these functions can be used outside.
> 
> When I compiled the kernel, there were no warnings.

Maxim: 1
Joern: 0

Jörn

-- 
But this is not to say that the main benefit of Linux and other GPL
software is lower-cost. Control is the main benefit--cost is secondary.
-- Bruce Perens
