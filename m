Received: from mail-bw0-f43.google.com ([209.85.214.43])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PVPsd-0000xc-5b
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2010 14:41:27 +0000
Received: by bwz14 with SMTP id 14so5515295bwz.30
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Dec 2010 06:41:25 -0800 (PST)
Subject: Re: [PATCH] mtd: allow mtd and jffs2 when ARCH=um
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jason Lunz <lunz@acm.org>
In-Reply-To: <20101220140454.GA26229@falooley.org>
References: <20101207072919.GA8511@falooley.org>
	<AANLkTineLxHdcDKZEUGiqVNAauSX_xyQrs49kKaqhiWo@mail.gmail.com>
	<20101207182012.GA10546@falooley.org>
	<1292343878.2538.80.camel@localhost>
	<20101214195124.GA6010@falooley.org> <20101216230110.65156c55@wker>
	<20101217042759.GA3148@falooley.org> <1292777276.2140.1.camel@koala>
	<20101219190720.GA16710@falooley.org> <1292844216.13362.19.camel@koala>
	<20101220140454.GA26229@falooley.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 22 Dec 2010 16:40:42 +0200
Message-ID: <1293028842.12773.15.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Anatolij Gustschin <agust@denx.de>, linux-mtd@lists.infradead.org,
	lkml <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-12-20 at 09:04 -0500, Jason Lunz wrote:
> On Mon, Dec 20, 2010 at 01:23:36PM +0200, Artem Bityutskiy wrote:
> > Ok, could you please re-sent the final patch with the commit message
> > etc?
> 
> Sure, here's everything as a single patch.
> 
> ------------------------------------->8
> Allow parts of drivers/mtd to compile on uml by pushing the HAS_IOMEM
> dependencies down closer to the parts of mtd that actually need it.
> This allows enough of mtd to build to let jffs2 be used on uml.
> 
> Signed-off-by: Jason Lunz <lunz@acm.org>

OK, taken this one, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
