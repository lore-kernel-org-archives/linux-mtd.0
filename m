Received: from utopia.booyaka.com ([74.50.51.50])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TqoJ9-0005Ek-P9
 for linux-mtd@lists.infradead.org; Thu, 03 Jan 2013 17:10:22 +0000
Date: Thu, 3 Jan 2013 17:10:17 +0000 (UTC)
From: Paul Walmsley <paul@pwsan.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH 1/3] mtd nand : onfi need to be probed in 8 bits mode
In-Reply-To: <50E40336.2080008@parrot.com>
Message-ID: <alpine.DEB.2.00.1301031704460.8721@utopia.booyaka.com>
References: <1352199105-30215-1-git-send-email-matthieu.castet@parrot.com>
 <1354530053.30168.183.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1212240023100.17282@utopia.booyaka.com>
 <50E40336.2080008@parrot.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

On Wed, 2 Jan 2013, Matthieu CASTET wrote:

> I put a warning in order we fix drivers instead of a silent failure.
> 
> The omap driver was fixed in the same series with
> http://article.gmane.org/gmane.linux.ports.arm.omap/88551 and

... which got merged by Artem.

> http://article.gmane.org/gmane.linux.ports.arm.omap/88549

... which did not get merged because Tony requested that it should be 
based on top of his cleanup work (which takes priority over adding new 
features):

http://thread.gmane.org/gmane.linux.ports.arm.omap/88550/focus=88549

Could you please update this "omap3 nand : use NAND_BUSWIDTH_AUTO" patch 
on v3.8-rc2 and repost?

> For drivers that can't support ONFI, I don't know what to do.
> May we should be replace the WARN_ON by a printk and early return.

That sounds like a good idea to me.  The traceback seems excessive, since 
the NAND was usable before this series.


- Paul
