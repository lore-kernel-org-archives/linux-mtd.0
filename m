Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SvkVJ-0005NQ-I2
 for linux-mtd@lists.infradead.org; Mon, 30 Jul 2012 07:35:01 +0000
Date: Mon, 30 Jul 2012 09:34:54 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Dirk Behme <dirk.behme@googlemail.com>
Subject: Re: [PATCH] mtd: mxc_nand: Fix compiler warnings
Message-ID: <20120730073454.GI1528@pengutronix.de>
References: <1343466310-14584-1-git-send-email-dirk.behme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1343466310-14584-1-git-send-email-dirk.behme@gmail.com>
Cc: linux-mtd@lists.infradead.org, shawn.guo@linaro.org, shijie8@gmail.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Sat, Jul 28, 2012 at 11:05:10AM +0200, Dirk Behme wrote:
> From: Dirk Behme <dirk.behme@googlemail.com>
> 
> Fix the compiler warnings
> 
> drivers/mtd/nand/mxc_nand.c:1267: warning: initialization discards qualifiers from pointer target type
> drivers/mtd/nand/mxc_nand.c:1270: warning: initialization discards qualifiers from pointer target type
> drivers/mtd/nand/mxc_nand.c:1273: warning: initialization discards qualifiers from pointer target type
> drivers/mtd/nand/mxc_nand.c:1276: warning: initialization discards qualifiers from pointer target type
These should be gone in next already.

Best regards,
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
