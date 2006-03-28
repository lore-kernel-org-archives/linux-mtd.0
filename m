Received: from smtp.osdl.org ([65.172.181.4])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FO1uv-0006Bu-EL
	for linux-mtd@lists.infradead.org; Mon, 27 Mar 2006 19:18:40 -0500
Date: Mon, 27 Mar 2006 16:20:53 -0800
From: Andrew Morton <akpm@osdl.org>
To: "Randy.Dunlap" <rdunlap@xenotime.net>
Message-Id: <20060327162053.5d84ae59.akpm@osdl.org>
In-Reply-To: <20060327161402.06eaa84b.rdunlap@xenotime.net>
References: <20060327161402.06eaa84b.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MTD: m25p80: fix printk format warning
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"Randy.Dunlap" <rdunlap@xenotime.net> wrote:
>
> Fix printk format warning:
> drivers/mtd/devices/m25p80.c:189: warning: format '%zd' expects type 'signed size_t', but argument 6 has type 'u_int32_t'

Thanks, this is already fixed in one of the oft-sent, oft-ignored MTD
patches in -mm.
