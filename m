Received: from mho-04-ewr.mailhop.org ([204.13.248.74]
 helo=mho-02-ewr.mailhop.org)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TBV4G-0002Vb-7m
 for linux-mtd@lists.infradead.org; Tue, 11 Sep 2012 18:20:12 +0000
Date: Tue, 11 Sep 2012 11:20:06 -0700
From: Tony Lindgren <tony@atomide.com>
To: "Mohammed, Afzal" <afzal@ti.com>
Subject: Re: [PATCH] mtd: nand: omap2: fix error path
Message-ID: <20120911182006.GJ23092@atomide.com>
References: <1347344934-28103-1-git-send-email-afzal@ti.com>
 <C8443D0743D26F4388EA172BF4E2A7A93E9E19C0@DBDE01.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C8443D0743D26F4388EA172BF4E2A7A93E9E19C0@DBDE01.ent.ti.com>
Cc: "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Mohammed, Afzal <afzal@ti.com> [120910 23:31]:
> +Tony
> 
> On Tue, Sep 11, 2012 at 11:58:54, Mohammed, Afzal wrote:
> > Let probe return error value if gpmc terminal
> > count interrupt could not be obtained

Thanks I'll just fold my fix and this fix into your original
patch and push them to new devel-gpmc-fixed branch because
of the copy paste UTF-8 issues in my fix.

Regards,

Tony
