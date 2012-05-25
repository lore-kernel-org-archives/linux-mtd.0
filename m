Received: from mho-01-ewr.mailhop.org ([204.13.248.71])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SXrAd-0007QV-68
 for linux-mtd@lists.infradead.org; Fri, 25 May 2012 09:50:56 +0000
Date: Fri, 25 May 2012 02:50:49 -0700
From: Tony Lindgren <tony@atomide.com>
To: "Mohammed, Afzal" <afzal@ti.com>
Subject: Re: [PATCH v4 04/39] ARM: OMAP2+: gpmc: Acquire NAND CS value
Message-ID: <20120525095048.GO17852@atomide.com>
References: <cover.1335874494.git.afzal@ti.com>
 <10220de398d22fad5de783d8f58fc55ebac85338.1335874494.git.afzal@ti.com>
 <4FA05292.7030902@ti.com>
 <C8443D0743D26F4388EA172BF4E2A7A93E9829B0@DBDE01.ent.ti.com>
 <C8443D0743D26F4388EA172BF4E2A7A93E98BD5A@DBDE01.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C8443D0743D26F4388EA172BF4E2A7A93E98BD5A@DBDE01.ent.ti.com>
Cc: "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Mohammed, Afzal <afzal@ti.com> [120514 03:37]:
> 
> Hi Tony,
> 
> I am planning to provide actual CS # used for NAND on above boards instead of
> finding the value at runtime. Is there any reason that NAND CS# is found out
> at runtime ? (hence remove necessity of omap_nand_flash_init()).

Yes makes sense. All the board specific data like that should come from
device tree eventually.

Regards,

Tony
