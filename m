Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NTGem-0005Ps-LE
	for linux-mtd@lists.infradead.org; Fri, 08 Jan 2010 15:21:49 +0000
Date: Fri, 8 Jan 2010 16:21:22 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Maxim Levitsky <maximlevitsky@gmail.com>
Subject: Re: [PATCH 2/9] MTD: create lockless versions of {get, put}_mtd_device
Message-ID: <20100108152119.GB31872@logfs.org>
References: <1262963092.12577.14.camel@maxim-laptop>
	<1262963198.12577.16.camel@maxim-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1262963198.12577.16.camel@maxim-laptop>
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

On Fri, 8 January 2010 17:06:38 +0200, Maxim Levitsky wrote:
>
> +	err = __get_mtd_device(ret);

Function is called here, afaics not declared and defined...

> [...]
> +int __get_mtd_device(struct mtd_info *mtd)

...further below.  Didn't gcc complain about this?  Or am I missing
something?

Jörn

-- 
Luck is when opportunity meets good preparation.
-- Chinese proverb
