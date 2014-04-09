Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXl9M-0000is-JS
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 05:34:17 +0000
Date: Wed, 9 Apr 2014 13:31:40 +0800
From: Fengguang Wu <fengguang.wu@intel.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [l2-mtd:spinor 125/128] ERROR: "spi_nor_ids"
 [drivers/mtd/devices/m25p80.ko] undefined!
Message-ID: <20140409053140.GB29432@localhost>
References: <5344c1be.z3phCxZtgQ0NsWcF%fengguang.wu@intel.com>
 <5344CE4A.2000003@freescale.com>
 <20140409050515.GA4400@brian-ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140409050515.GA4400@brian-ubuntu>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 kbuild-all@01.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 08, 2014 at 10:05:15PM -0700, Brian Norris wrote:
> On Wed, Apr 09, 2014 at 12:36:26PM +0800, Huang Shijie wrote:
> > 于 2014年04月09日 11:42, kbuild test robot 写道:
> > 
> > >tree:   git://git.infradead.org/users/dedekind/l2-mtd.git spinor
> 
> Wow, you build every branch, not just those in -next?

Yes, the 0day robot tests virtually every branch in ~400 git trees to
catch bugs as early as possible.

Thanks,
Fengguang
