Received: from rv-out-0708.google.com ([209.85.198.246])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KAQtO-0000Jd-Lk
	for linux-mtd@lists.infradead.org; Sun, 22 Jun 2008 14:50:11 +0000
Received: by rv-out-0708.google.com with SMTP id b17so9496914rvf.42
	for <linux-mtd@lists.infradead.org>;
	Sun, 22 Jun 2008 07:50:08 -0700 (PDT)
Message-ID: <cd73a99e0806220750i2ac74193ke02dff14f1d78dc3@mail.gmail.com>
Date: Sun, 22 Jun 2008 16:50:08 +0200
From: "Andrew Victor" <avictor.za@gmail.com>
To: "Haavard Skinnemoen" <haavard.skinnemoen@atmel.com>
Subject: Re: [PATCH 1/3] atmel_nand speedup via {read,write}s{b,w}()
In-Reply-To: <1213948112-22348-1-git-send-email-haavard.skinnemoen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1213948112-22348-1-git-send-email-haavard.skinnemoen@atmel.com>
Cc: David Brownell <david-b@pacbell.net>, linux-mtd@lists.infradead.org,
	David Brownell <dbrownell@users.sourceforge.net>,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi Haavard,

> This uses __raw_{read,write}s{b,w}() primitives to access data on NAND
> chips for more efficient I/O.

This patch of David's has been in the AT91 tree for a while now.

So,
  Acked-by: Andrew Victor <linux@maxim.org.za>


Regards,
  Andrew
