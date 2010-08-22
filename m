Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1On5nX-0003ZY-MH
	for linux-mtd@lists.infradead.org; Sun, 22 Aug 2010 08:21:00 +0000
Received: by fxm12 with SMTP id 12so2989717fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 22 Aug 2010 01:20:57 -0700 (PDT)
Subject: Re: [PATCH v2] mtd/nand: Support Micron chips, pagesize >= 4KB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <4C4F3691.9020505@broadcom.com>
References: <4C4DEA3D.5070208@broadcom.com>  <4C4F3691.9020505@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 22 Aug 2010 11:20:55 +0300
Message-ID: <1282465255.16502.52.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-07-27 at 12:42 -0700, Brian Norris wrote:
> I found some newer Micron parts that introduce an 8K page size, and so
> need a modification on the algorithm. Here's the updated list and a
> revision to my patch.
> 
> Part			ID String		Block	Page	OOB
> MT29F16G08ABABA		2C 48 00 26 89 00 00	512K	4K	224
> MT29F16G08CBABA		2C 48 04 46 85 00 00	1024K	4K	224
> MT29F16G08MAA		2C D5 94 3E 74 00 00	512K	4K	218
> MT29F32G08CBACA		2C 68 04 4A A9 00 00	1024K	4K	224
> MT29F64G08CBAAA		2C 88 04 4B A9 00 00	2048K	8K	448
> MT29F256G08CJAAA	2C A8 05 CB A9 00 00	2048K	8K	448
> 
> Signed-off-by: Brian Norris <norris@broadcom.com>

I'm not picking this patch to my l2-mtd-2.6.git, since AFAICS the chips
support ONFI should be detected properly.

The "older chips" which do not support reading ONFI data can then be
detected using special quirks. But using heuristics even for the chips
which do support reading ONFI data sounds bad.

Is this ok? :-)

Artem.
