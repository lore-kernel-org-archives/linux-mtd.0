Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ubmz9-00064E-C6
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 07:15:51 +0000
Message-ID: <1368429484.5360.9.camel@sauron.fi.intel.com>
Subject: Re: Re[2]: [RESEND PATCH v2 1/7] mtd: nand-gpio: Convert driver to
 using resource-managed functions
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Alexander Shiyan <shc_work@mail.ru>
Date: Mon, 13 May 2013 10:18:04 +0300
In-Reply-To: <1368428869.40956565@f27.mail.ru>
References: <1367848434-28493-1-git-send-email-shc_work@mail.ru>
 <1368428287.5360.0.camel@sauron.fi.intel.com>
 <1368428869.40956565@f27.mail.ru>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-05-13 at 11:07 +0400, Alexander Shiyan wrote:
> > On Mon, 2013-05-06 at 17:53 +0400, Alexander Shiyan wrote:
> > > Patch converts driver to using resource-managed functions.
> > > 
> > > Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> > 
> > Pushed the series to l2-mtd.git, thanks!
> 
> This series should be applied with one more patch for nand_base:
> http://comments.gmane.org/gmane.linux.drivers.mtd/46206 

Why is this one dependent on the series? To me it looked completely
independent.

> So, please, apply this one if it possible.

In case of a dependency, why it was not a part of the series?

-- 
Best Regards,
Artem Bityutskiy
