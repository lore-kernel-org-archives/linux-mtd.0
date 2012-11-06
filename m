Received: from mho-04-ewr.mailhop.org ([204.13.248.74]
 helo=mho-02-ewr.mailhop.org)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TVo4X-000206-5y
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2012 18:40:26 +0000
Date: Tue, 6 Nov 2012 10:40:20 -0800
From: Tony Lindgren <tony@atomide.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH 3/3] omap3 nand : use NAND_BUSWIDTH_AUTO
Message-ID: <20121106184019.GI6801@atomide.com>
References: <1352199105-30215-1-git-send-email-matthieu.castet@parrot.com>
 <1352199105-30215-3-git-send-email-matthieu.castet@parrot.com>
 <50990473.2090300@compulab.co.il> <50993F16.8070908@parrot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50993F16.8070908@parrot.com>
Cc: Afzal Mohammed <afzal@ti.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Igor Grinberg <grinberg@compulab.co.il>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Matthieu CASTET <matthieu.castet@parrot.com> [121106 08:49]:
> Igor Grinberg a écrit :
> > Cc: Tony Lindgren, Afzal Mohammed,
> > 
> > On 11/06/12 12:51, Matthieu CASTET wrote:
> >> This allow to clean the omap nand driver that were trying in x8 and x16 bits mode.
> >>
> >> This also make work onfi detection on beagleboard :
> >>
> >> Before :
> >> [    1.954803] NAND device: Manufacturer ID: 0x2c, Chip ID: 0xba (Micron NAND 256MiB 1,8V 16-bit), page size: 2048, OOB size: 64
> >>
> >> After :
> >> [    1.914825] ONFI param page 0 valid
> >> [    1.919158] ONFI flash detected
> >> [    1.922515] NAND device: Manufacturer ID: 0x2c, Chip ID: 0xba (Micron MT29F2G16ABD), page size: 2048, OOB size: 64
> >>
> >> platform data devsize is renamed bussize. It now indicate the maximun size of the nand bus.
> >>
> >> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
> > 
> > I think, you should base on one of Tony's branches with that kind of patches.
> > Because, for example the omap_nand_flash_init() function does not exist anymore
> > in Tony's master and may be several more things will need to have adjustments.
> > Also, the GPMC related stuff inside the NAND driver
> > should probably be coordinated with Afzal, as he is reworking the whole
> > GPMC related code.
> 
> Thanks for the info.
> 
> Where such tree could be found ?

You should be able to use omap-for-v3.8/cleanup-headers-gpmc
branch as a base for your patches [1].

Eventually once when we're done with all the clean up, the MTD
driver should be completely separated from the core omap code
and I'll be out of the way.

Regards,

Tony

[1] http://git.kernel.org/?p=linux/kernel/git/tmlind/linux-omap.git;a=shortlog;h=refs/heads/omap-for-v3.8/cleanup-headers-gpmc
