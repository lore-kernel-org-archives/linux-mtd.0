Subject: Re: [patch v2] mtd: pxa3xx_nand: NULL dereference in pxa3xx_nand_probe
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dan Carpenter <error27@gmail.com>
In-Reply-To: <20110106140536.GB1717@bicker>
References: <1294227801.3996.62.camel@sven> <20110106124525.GA1717@bicker>
	<1294321502.2218.5.camel@sven>  <20110106140536.GB1717@bicker>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 06 Jan 2011 17:08:20 +0200
Message-ID: <1294326500.2219.8.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem.Bityutskiy@nokia.com, eric.y.miao@gmail.com,
	David.Woodhouse@intel.com, leiwen@marvell.com,
	Sven Neumann <s.neumann@raumfeld.com>,
	linux-kernel@vger.kernel.org, haojian.zhuang@marvell.com,
	linux-mtd@lists.infradead.org, Daniel Mack <daniel@caiaq.de>,
	linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-01-06 at 17:05 +0300, Dan Carpenter wrote:
> "info->cmdset" gets dereferenced in __readid() so it needs to be
> initialized earlier in the function.  This bug was introduced in 
> 18c81b1828f8 "mtd: pxa3xx_nand: remove the flash info in driver
> structure".
> 
> Cc: stable@kernel.org [2.6.37+]
> Reported-and-tested-by: Sven Neumann <s.neumann@raumfeld.com>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> v2:  changed the commit text.  added stable@kernel.org and a reported-by tag.

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
