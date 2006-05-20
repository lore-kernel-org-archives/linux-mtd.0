Received: from smtp.osdl.org ([65.172.181.4])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FhYrR-0008Gp-82
	for linux-mtd@lists.infradead.org; Sat, 20 May 2006 17:20:03 -0400
Date: Sat, 20 May 2006 14:19:24 -0700
From: Andrew Morton <akpm@osdl.org>
To: "Josh Boyer" <jwboyer@gmail.com>
Message-Id: <20060520141924.2f2e5289.akpm@osdl.org>
In-Reply-To: <625fc13d0605201411kb7f40e1sd6cfe8ebf50a6e38@mail.gmail.com>
References: <E1FhOEg-0003dX-4R@pentafluge.infradead.org>
	<625fc13d0605201411kb7f40e1sd6cfe8ebf50a6e38@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [MTD] Avoid 64-bit division in mtdconcat
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"Josh Boyer" <jwboyer@gmail.com> wrote:
>
> On 5/20/06, Linux-MTD Mailing List <linux-mtd@lists.infradead.org> wrote:
> > Commit:     6c8b44abc86a3e23dd1a22c0ee187f06bd7c7f5d
> > Parent:     5fc3dbc418e01345e25e96b3192a1c46051c3fdc
> > Author:     Andrew Morton <akpm@osdl.org>
> > AuthorDate: Sat May 20 10:17:21 2006 +0100
> > Commit:     David Woodhouse <dwmw2@infradead.org>
> > CommitDate: Sat May 20 10:17:21 2006 +0100
> >
> >     [MTD] Avoid 64-bit division in mtdconcat
> >
> >     WARNING: "__moddi3" [drivers/mtd/mtdconcat.ko] undefined!
> >
> >     Signed-off-by: Andrew Morton <akpm@osdl.org>
> >     Signed-off-by: David Woodhouse <dwmw2@infradead.org>
> 
> NAK.  asm-ppc/div64.h doesn't exist.

It must exist.  Things like mm/vmscan.c include it.
