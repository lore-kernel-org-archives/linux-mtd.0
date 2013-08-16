Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VAKPN-0002k3-FH
 for linux-mtd@lists.infradead.org; Fri, 16 Aug 2013 13:49:43 +0000
Message-ID: <1376661291.2089.361.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] m25p80 / fast read
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Date: Fri, 16 Aug 2013 16:54:51 +0300
In-Reply-To: <1376302946-11534-1-git-send-email-s.hauer@pengutronix.de>
References: <1376302946-11534-1-git-send-email-s.hauer@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-08-12 at 12:22 +0200, Sascha Hauer wrote:
> The following adds support for the mr25h10 chip to to the m25p80
> driver.
> 
> This driver currently has the problem that it unconditionally uses
> the fast_read command once it's enabled in Kconfig which of course
> leads to problems with multiboard kernels. This series adds a flag
> to the chip specific data to solve this. Also some unnecessary ifdefs
> are removed.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

I'll let Biran take a look, and tomorrow apply, unless he applies
himself or has objections.

-- 
Best Regards,
Artem Bityutskiy
