Received: from mail-ie0-x22d.google.com ([2607:f8b0:4001:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ViVVY-0006QH-VC
 for linux-mtd@lists.infradead.org; Mon, 18 Nov 2013 20:33:21 +0000
Received: by mail-ie0-f173.google.com with SMTP id x13so9336732ief.4
 for <linux-mtd@lists.infradead.org>; Mon, 18 Nov 2013 12:33:00 -0800 (PST)
Date: Mon, 18 Nov 2013 12:32:55 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH v2] mtd: nand: diskonchip: Request memory region prior
 ioremap()
Message-ID: <20131118203255.GF9468@ld-irv-0074.broadcom.com>
References: <1384343965-29682-1-git-send-email-shc_work@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1384343965-29682-1-git-send-email-shc_work@mail.ru>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 13, 2013 at 03:59:25PM +0400, Alexander Shiyan wrote:
> This patch adds request_mem_region() prior ioremap() for diskonchip
> driver. This will allow to check if memory region is occupied by any
> other device, for example in case if we have memory region for several
> optional devices and only one device can be used at once.
> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Looks good. Pushed to l2-mtd.git/next. Thanks!

Brian
