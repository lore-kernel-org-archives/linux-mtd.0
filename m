Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OLWT9-0006eo-HE
	for linux-mtd@lists.infradead.org; Mon, 07 Jun 2010 07:10:00 +0000
Date: Mon, 7 Jun 2010 09:09:19 +0200
From: Anatolij Gustschin <agust@denx.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: nand: mpc5121_nfc.c: Fix build failures
Message-ID: <20100607090919.20129f51@wker>
In-Reply-To: <1275819308.17903.3099.camel@macbook.infradead.org>
References: <1275323836-15711-1-git-send-email-agust@denx.de>
	<1275819308.17903.3099.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Grant Likely <grant.likely@secretlab.ca>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 06 Jun 2010 11:15:08 +0100
David Woodhouse <dwmw2@infradead.org> wrote:

> On Mon, 2010-05-31 at 18:37 +0200, Anatolij Gustschin wrote:
> > Fixes build errors caused by the:
> >  - OF device_node pointer being moved into struct device
> >  - removal of the match_table field from struct of_platform_driver
> > 
> > Signed-off-by: Anatolij Gustschin <agust@denx.de>
> > Cc: Grant Likely <grant.likely@secretlab.ca>
> 
> Um, this isn't applicable to 2.6.35, is it?

Do you mean it isn't applicable to 2.6.34? This patch is needed and
applicable to 2.6.35-rc1. It has already been collected by Grant
and the breakage is fixed in 2.6.35-rc2.
