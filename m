Received: from mail-pz0-f197.google.com ([209.85.222.197])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MZRF4-0005jx-Tw
	for linux-mtd@lists.infradead.org; Fri, 07 Aug 2009 15:20:32 +0000
Received: by pzk35 with SMTP id 35so1731345pzk.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 07 Aug 2009 08:20:25 -0700 (PDT)
Date: Fri, 7 Aug 2009 23:28:46 +0800
From: JiSheng Zhang <jszhang3@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: Re: [UBI UBIFS] replace vmalloc with kmalloc
Message-ID: <20090807232846.34bffdeb@ustc>
In-Reply-To: <4A7BF1C3.4050602@nokia.com>
References: <2df346410908070202i6c16008ckc145559a474129c6@mail.gmail.com>
	<4A7BF1C3.4050602@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rmk@arm.linux.org.uk" <rmk@arm.linux.org.uk>,
	"Bityutskiy Artem \(Nokia-D/Helsinki\)" <Artem.Bityutskiy@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adrian Hunter <adrian.hunter@nokia.com> wrote:
> 
> vmalloc allows large (> 128KiB) buffers, but kmalloc doesn't.
> So we presently have no choice but to use vmalloc.

But vmalloced buffer can't be easily passed to DMA, is there better choice?

> 
> I do not know what hardware you have or exactly what driver you
> are using, but we have UBIFS on OneNAND using DMA.

An arm soc board, the controller driver hasn't been merged upstream.
> See drivers/mtd/onenand/omap2.c
>

One limit of the omap2.c is that the buffer passed to DMA can't be larger than
PAGESIZE?

Jisheng
