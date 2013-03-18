Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHVYo-0004nm-Cl
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 08:36:51 +0000
Message-ID: <1363595862.20738.36.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v6 0/3] mtd: use the full-id as the keyword for some
 nand chips
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Huang Shijie <b32955@freescale.com>
Date: Mon, 18 Mar 2013 10:37:42 +0200
In-Reply-To: <1363316461-10592-1-git-send-email-b32955@freescale.com>
References: <1363316461-10592-1-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-03-15 at 11:00 +0800, Huang Shijie wrote:
> As time goes on, we begin to meet the situation that we can not
> get enough information from some nand chips's id data.
> Take some Toshiba's nand chips for example.
> I have 4 Toshiba's nand chips in my hand:
> 	TC58NVG2S0F, TC58NVG3S0F, TC58NVG5D2, TC58NVG6D2

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
