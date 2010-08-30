Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq3xc-00087j-4y
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 12:59:40 +0000
Received: by vws11 with SMTP id 11so5536654vws.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 05:59:39 -0700 (PDT)
Subject: Re: [PATCH] mtd: Blackfin NFC: fix invalid free in remove()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1283173086.12995.74.camel@brekeke>
References: <1283028125-6027-1-git-send-email-vapier@gentoo.org>
	<1283173086.12995.74.camel@brekeke>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 15:59:33 +0300
Message-ID: <1283173173.12995.75.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	uclinux-dist-devel@blackfin.uclinux.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-08-30 at 15:58 +0300, Artem Bityutskiy wrote:
> On Sat, 2010-08-28 at 16:42 -0400, Mike Frysinger wrote:
> > Since info->mtd isn't dynamically allocated, we shouldn't attempt to
> > kfree() it.  Otherwise we get random fun corruption when unloading
> > the driver built as a module.
> > 
> > Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> > ---
> > note: this should be merged for 2.6.36 and probably sent to stable trees
> 
> You send the same patch 2 times once with this note and the other time
> without this note. Which one should be ignored?

I guess it is 2.6.36 material. Also, if you want this in -stable, add
corresponding CC please.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
