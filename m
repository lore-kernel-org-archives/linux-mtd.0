Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkMPs-00061p-Mt
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2012 21:06:05 +0000
Received: by eekc13 with SMTP id c13so2799848eek.36
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jan 2012 13:06:02 -0800 (PST)
Subject: Re: [PATCH] pmc551: fix signedness bug in init_pmc551()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Xi Wang <xi.wang@gmail.com>
Date: Mon, 09 Jan 2012 23:05:59 +0200
In-Reply-To: <1325019256-5171-1-git-send-email-xi.wang@gmail.com>
References: <1325019256-5171-1-git-send-email-xi.wang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1326143161.4463.2.camel@koala>
Mime-Version: 1.0
Cc: Lucas De Marchi <lucas.demarchi@profusion.mobi>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-12-27 at 15:54 -0500, Xi Wang wrote:
> Since "length" is a u32, the error handling below didn't work when
> fixup_pmc551() returns -ENODEV.
> 
> 	if ((length = fixup_pmc551(PCI_Device)) <= 0)
> 
> This patch changes fixup_pmc551() by separating the error handling
> and the size.
> 
> Signed-off-by: Xi Wang <xi.wang@gmail.com>
> ---
>  drivers/mtd/devices/pmc551.c |    7 ++++---
>  1 files changed, 4 insertions(+), 3 deletions(-)

You can just change the type to int without introducing a separate
argument. I think the length cannot be too large anyway. E.g., because
it is compared to "asize" which is int.

Artem.
