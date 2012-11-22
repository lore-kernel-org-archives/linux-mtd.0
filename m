Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TbatA-00048M-HK
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 17:48:39 +0000
Message-ID: <50AE6571.5030100@parrot.com>
Date: Thu, 22 Nov 2012 18:48:33 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH 3/3] omap3 nand : use NAND_BUSWIDTH_AUTO
References: <1352199105-30215-1-git-send-email-matthieu.castet@parrot.com>	
 <1352199105-30215-3-git-send-email-matthieu.castet@parrot.com>	
 <50990473.2090300@compulab.co.il> <50993F16.8070908@parrot.com>	
 <20121106184019.GI6801@atomide.com>
 <1353054136.3618.2.camel@sauron.fi.intel.com>
In-Reply-To: <1353054136.3618.2.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: Tony Lindgren <tony@atomide.com>, Afzal Mohammed <afzal@ti.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Igor Grinberg <grinberg@compulab.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy a écrit :
> On Tue, 2012-11-06 at 10:40 -0800, Tony Lindgren wrote:
>>> Where such tree could be found ?
>> You should be able to use omap-for-v3.8/cleanup-headers-gpmc
>> branch as a base for your patches [1].
> 
> Is this a stable branch which I may pull into l2-mtd.git? Then I could
> merge Matthieu's patches.
> 

patch 1 and 2 are not controller dependent.

I added the support for the omap controller because I can easily test on it (and
 beagleboard got a x16 onfi flash).

What a shame that omap workflow is so complex :
- I think Artem want support for at least one controller before merging generic code
- I can rebase on omap-for-v3.8/cleanup-headers-gpmc, but this is weird to add
generic code for nand that is not specific to omap on it ?


Matthieu
