Received: from mu-out-0910.google.com ([209.85.134.187])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IrUOh-0000O3-If
	for linux-mtd@lists.infradead.org; Mon, 12 Nov 2007 03:12:01 -0500
Received: by mu-out-0910.google.com with SMTP id i2so2011551mue
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Nov 2007 00:11:54 -0800 (PST)
Message-ID: <fe810cf0711120011qaa37776o4496c294799025a4@mail.gmail.com>
Date: Mon, 12 Nov 2007 11:11:53 +0300
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH] [CFI] Prevent erase command invocation on suspended chip
In-Reply-To: <alpine.LFD.0.9999.0711070843430.21255@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <fe810cf0711070058obc3c3fdm4a34f956e5ff4a96@mail.gmail.com>
	<alpine.LFD.0.9999.0711070843430.21255@xanadu.home>
Cc: Nicolas Pitre <nico@cam.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Nov 7, 2007 4:44 PM, Nicolas Pitre <nico@cam.org> wrote:
> On Wed, 7 Nov 2007, Alexander Belyakov wrote:
> >
> > The patch below fixes that issue.
> >
> > Signed-off-by: Alexander Belyakov <alexander.belyakov@intel.com>
>
> Acked-by: Nicolas Pitre <nico@cam.org>
>

Hello David,

Please apply this patch.

Thanks,
Alexander
