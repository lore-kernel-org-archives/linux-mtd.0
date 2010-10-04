Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P2gu1-0007ht-3Q
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2010 09:00:09 +0000
Received: by fxm15 with SMTP id 15so3807356fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Oct 2010 02:00:07 -0700 (PDT)
Subject: Re: [PATCH] nand: omap2: Missing arg to gpmc_prefetch_reset()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?ISO-8859-1?Q?Lo=EFc?= Minier <lool@dooz.org>
In-Reply-To: <20101004085222.GC4426@bee.dooz.org>
References: <1285364702-13922-1-git-send-email-loic.minier@linaro.org>
	<1286177945.11684.77.camel@localhost>
	<20101004085222.GC4426@bee.dooz.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 04 Oct 2010 11:57:21 +0300
Message-ID: <1286182641.11684.100.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
	linux-mtd@lists.infradead.org, Sukumar Ghorai <s-ghorai@ti.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-10-04 at 10:52 +0200, Loïc Minier wrote:
> On Mon, Oct 04, 2010, Artem Bityutskiy wrote:
> > FYI, a similar patch is already in Linus' tree, so I'm dropping it from
> > my tree
> 
>  Ok, thanks; is there something I should have done to get this patch
>  into Linus tree?

No, you did everything right. I guess that guy was just faster than you.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
