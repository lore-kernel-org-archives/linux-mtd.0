Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TLVQO-00052j-1r
 for linux-mtd@lists.infradead.org; Tue, 09 Oct 2012 08:44:26 +0000
Date: Tue, 9 Oct 2012 10:44:18 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] [RFC] mtd/uclinux: support ROM and allow passing the
 base address
Message-ID: <20121009084418.GH18531@pengutronix.de>
References: <1349709952-4332-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <50739A2A.9070405@snapgear.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50739A2A.9070405@snapgear.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Greg,

On Tue, Oct 09, 2012 at 01:29:46PM +1000, Greg Ungerer wrote:
> On 09/10/12 01:25, Uwe Kleine-König wrote:
> >This allows to put the filesystem at a defined address in ROM allowing
> >to save more precious RAM.
> >
> >I think it's save to default to ROM because the intention of using the
> >uclinux map is to use a romfs and so mtd-ram doesn't give you anything
> >that mtd-rom doesn't.
> >
> >Signed-off-by: Uwe Kleine-KÃ·nig <u.kleine-koenig@pengutronix.de>
> 
> Looks good to me, so:
> 
> Acked-by: Greg Ungerer <gerg@uclinux.org>
> 
> Couple of things to be aware of. Artem currently has a couple of
> patches against this file (looks like at least 1 of them is currently
> in linux-next). It will probably conflict with your changes, should
> be easy enough to fix up.
If you tell me a branch to test, I can do so.

Thanks
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
