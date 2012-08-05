Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SxwN3-0006x6-0d
 for linux-mtd@lists.infradead.org; Sun, 05 Aug 2012 08:39:35 +0000
Date: Sun, 5 Aug 2012 10:39:26 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Dirk Behme <dirk.behme@gmail.com>
Subject: Re: [PATCH] mtd: mxc_nand: Fix compiler warnings
Message-ID: <20120805083926.GL2626@pengutronix.de>
References: <1343466310-14584-1-git-send-email-dirk.behme@gmail.com>
 <20120730073454.GI1528@pengutronix.de>
 <501D4405.6030900@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <501D4405.6030900@googlemail.com>
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

On Sat, Aug 04, 2012 at 05:47:17PM +0200, Dirk Behme wrote:
> On 30.07.2012 09:34, Uwe Kleine-König wrote:
> >Hello,
> >
> >On Sat, Jul 28, 2012 at 11:05:10AM +0200, Dirk Behme wrote:
> >>From: Dirk Behme<dirk.behme@googlemail.com>
> >>
> >>Fix the compiler warnings
> >>
> >>drivers/mtd/nand/mxc_nand.c:1267: warning: initialization discards qualifiers from pointer target type
> >>drivers/mtd/nand/mxc_nand.c:1270: warning: initialization discards qualifiers from pointer target type
> >>drivers/mtd/nand/mxc_nand.c:1273: warning: initialization discards qualifiers from pointer target type
> >>drivers/mtd/nand/mxc_nand.c:1276: warning: initialization discards qualifiers from pointer target type
> >These should be gone in next already.
> 
> Hmm, which next?
> 
> I tried linux-next [1] from today (next-20120803, 55fa9961f) and still get
next-20120725 contained 98d7bbb9929bcc14e11ac8a55245a4f2dc174e17, don't
konw why it isn't included in the newer next snapshorts.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
