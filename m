Subject: Re: [PATCH] [MTD] bcmring: mtd nand driver (v3)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Leo (Hao) Chen" <leochen@broadcom.com>
In-Reply-To: <20091010021308.GA13891@broadcom.com>
References: <20091010021308.GA13891@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 11 Oct 2009 16:55:04 +0300
Message-Id: <1255269304.16942.101.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-10-09 at 19:13 -0700, Leo (Hao) Chen wrote:
> Hi,
> 
> I've updated the mtd nand driver for bcmring machine.
> It is applicable to the latest kernel.org git tree.
> 
> Is it possible for this patch to be merged into the 2.6.32 git tree?
> 
> Thanks a lot for your review.
> 
> Best,

No idea about dwmw2's plans, but I've refreshed your driver in my
l2-mtd-2.6.git tree.
http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/005e0a0356c62edcc98ced43cf83d474df92202d

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
