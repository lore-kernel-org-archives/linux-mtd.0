Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ubmfq-0005Yb-88
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 06:55:55 +0000
Message-ID: <1368428287.5360.0.camel@sauron.fi.intel.com>
Subject: Re: [RESEND PATCH v2 1/7] mtd: nand-gpio: Convert driver to using
 resource-managed functions
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Alexander Shiyan <shc_work@mail.ru>
Date: Mon, 13 May 2013 09:58:07 +0300
In-Reply-To: <1367848434-28493-1-git-send-email-shc_work@mail.ru>
References: <1367848434-28493-1-git-send-email-shc_work@mail.ru>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-05-06 at 17:53 +0400, Alexander Shiyan wrote:
> Patch converts driver to using resource-managed functions.
> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Pushed the series to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
