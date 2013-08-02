Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5FwD-0003ew-16
 for linux-mtd@lists.infradead.org; Fri, 02 Aug 2013 14:02:37 +0000
Message-ID: <1375452445.14869.324.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: omap2: Fix compilation warning
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: "Gupta, Pekon" <pekon@ti.com>
Date: Fri, 02 Aug 2013 17:07:25 +0300
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9ED5F3@DBDE04.ent.ti.com>
References: <1374681392-6183-1-git-send-email-olof@lixom.net>
 <20980858CB6D3A4BAE95CA194937D5E73E9ED5F3@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Olof Johansson <olof@lixom.net>, David Woodhouse <dwmw2@infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-07-24 at 17:48 +0000, Gupta, Pekon wrote:
> Hi Olof,
> 
> > 
> > fb1585bc13b (mtd: nand: omap2: clean-up BCHx_HW and BCHx_SW ECC
> > configurations in device_probe) introduced a warning when the new option
> > is disabled, i.e. with omap2plus_defconfig:
> > 
> > drivers/mtd/nand/omap2.c:1075:13: warning: 'omap3_enable_hwecc_bch'
> > defined but not used [-Wunused-function]
> > 
> > Fix this by rescoping the ifdef. Also remove a redudant #endif/#ifdef
> > pair.
> > 
> > Signed-off-by: Olof Johansson <olof@lixom.net>
> > ---
> 
> Thanks much..
> But just to remind, this commit fb1585b in linux-next needs to be reverted.
> This patch is leftover by mistake because other dependent patches of 
> this series were dropped. This will not only break omap2-nand driver,
> but might also break the build.

Just dropped it, thanks!

-- 
Best Regards,
Artem Bityutskiy
