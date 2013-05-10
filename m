Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ualh8-0004RS-DD
 for linux-mtd@lists.infradead.org; Fri, 10 May 2013 11:41:02 +0000
Message-ID: <1368186208.26780.119.camel@sauron.fi.intel.com>
Subject: Re: i.MX28 gpmi-nand underlying geometry
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Fri, 10 May 2013 14:43:28 +0300
In-Reply-To: <514FFA64.6000205@freescale.com>
References: <514FC1F1.8040500@acm.org> <514FFA64.6000205@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, "Paul B. Henson" <henson@acm.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-03-25 at 15:19 +0800, Huang Shijie wrote:
> 于 2013年03月25日 11:18, Paul B. Henson 写道:
> > kernel. Ideally I'd like to be able to read the necessary information 
> > directly from the NAND while booted with a current kernel.
> The current code really does not print out the geometry information 
> directly.
> 
> But it's easy to implement it. we can add the dynamic debug code for the 
> gpmi.
> If you want to see the geometry infor, you can enable the dynamic debug, 
> and enable it in the kernel cmdline.

It is really evil to suggest user-space people to use kernel printk's
for fetching NAND geometry information. Printk's may change at any time.
Tomorrow there may be a clean-up patch which fixes a spelling or improve
the grammar, and this may break the apps. Printk's are really not
intended to be the kernel<->user-space ABI.

-- 
Best Regards,
Artem Bityutskiy
