Subject: Re: [PATCH 01/06] pxa3xx_nand: update ns2cycle calculation method
From: David Woodhouse <dwmw2@infradead.org>
To: Haojian Zhuang <haojian.zhuang@gmail.com>
In-Reply-To: <AANLkTikzdVAwOZcLhgHsDQGNhW4_-420XodbxSUmfDRW@mail.gmail.com>
References: <AANLkTikzdVAwOZcLhgHsDQGNhW4_-420XodbxSUmfDRW@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 18 Aug 2010 13:30:53 +0100
Message-ID: <1282134653.13405.15.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Eric Miao <eric.y.miao@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-08-17 at 13:29 +0100, Haojian Zhuang wrote:
> From 9064b2c877cad560fda7577564b3369c0025b7df Mon Sep 17 00:00:00 2001
> From: Lei Wen <leiwen@marvell.com>
> Date: Tue, 17 Aug 2010 17:24:06 +0800
> Subject: [PATCH 01/06] pxa3xx_nand: update ns2cycle calculation method
> 
> For the original method change from plus 1 to minus 1,
> this way make the default timing like tCS become 0 after calculation,
> although we set the timing as 0xa...
> 
> Change the method to no plus and minus, and make the result
> closer to what the timing specified in the NAND chip spec.
> 
> Signed-off-by: Lei Wen <leiwen@marvell.com>

I have an identical patch queued for -stable and 2.6.36 already, from
Axel Lin (but with a slightly better changelog).

I'll add your signed-off-by to that and send it on today.

The other five I'll apply to the mtd-2.6.git on top, once I have Eric's
ack.

Thanks.

By the way, please could you use my dwmw2@infradead.org address instead
of @intel.com -- the latter has taken to corrupting incoming mail again,
and they're being extremely slow to fix it.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
