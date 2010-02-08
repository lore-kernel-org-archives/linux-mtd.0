Received: from mail.solarflare.com ([216.237.3.220]
	helo=exchange.solarflare.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NeWAT-00005i-Mw
	for linux-mtd@lists.infradead.org; Mon, 08 Feb 2010 16:09:02 +0000
Subject: Re: [PATCHv3 0/9] mtd: Remove static limit on device numbers
From: Ben Hutchings <bhutchings@solarflare.com>
To: dedekind1@gmail.com
In-Reply-To: <1265644474.2006.98.camel@localhost>
References: <1264798537.2785.25.camel@achroite.uk.solarflarecom.com>
	<1265644474.2006.98.camel@localhost>
Content-Type: text/plain
Date: Mon, 08 Feb 2010 16:08:52 +0000
Message-Id: <1265645332.2092.0.camel@achroite.uk.solarflarecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-net-drivers@solarflare.com,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-02-08 at 17:54 +0200, Artem Bityutskiy wrote:
> On Fri, 2010-01-29 at 20:55 +0000, Ben Hutchings wrote:
> > This is the third version of this patch series.  Please give me some
> > feedback, David?
> > 
> > Changes since v2:
> > - Export idr_get_next() to support building mtdcore as a module
> > - Correct the limit on block device numbers in mtd_blkdevs
> > - Register the full range of minor numbers in mtdchar
> 
> Looks good for me. I did not test mtdblock, but tested that this does
> not break UBIFS.
> 
> Pushed to my l2-mtd-2.6/master, thanks.

Thanks a lot, Artem.

Ben.

-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
