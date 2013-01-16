Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TvTz0-0002JB-7Z
 for linux-mtd@lists.infradead.org; Wed, 16 Jan 2013 14:28:50 +0000
Message-ID: <50F6B904.5000600@parrot.com>
Date: Wed, 16 Jan 2013 15:28:20 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Paul Walmsley <paul@pwsan.com>
Subject: Re: [PATCH 1/3] mtd nand : onfi need to be probed in 8 bits mode
References: <1352199105-30215-1-git-send-email-matthieu.castet@parrot.com>
 <1354530053.30168.183.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1212240023100.17282@utopia.booyaka.com>
 <50E40336.2080008@parrot.com>
 <alpine.DEB.2.00.1301031704460.8721@utopia.booyaka.com>
In-Reply-To: <alpine.DEB.2.00.1301031704460.8721@utopia.booyaka.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
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

Hi,

Paul Walmsley a écrit :
> Hi
> 
> On Wed, 2 Jan 2013, Matthieu CASTET wrote:

> .... which did not get merged because Tony requested that it should be 
> based on top of his cleanup work (which takes priority over adding new 
> features):
> 
> http://thread.gmane.org/gmane.linux.ports.arm.omap/88550/focus=88549
> 
> Could you please update this "omap3 nand : use NAND_BUSWIDTH_AUTO" patch 
> on v3.8-rc2 and repost?

Do you know when this patchset will be submited to mtd ?
I think I will wait it is merged in mtd and redo my patch after that.

> 
>> For drivers that can't support ONFI, I don't know what to do.
>> May we should be replace the WARN_ON by a printk and early return.
> 
> That sounds like a good idea to me.  The traceback seems excessive, since 
> the NAND was usable before this series.
> 
I submited a patch for doing that.

Matthieu
