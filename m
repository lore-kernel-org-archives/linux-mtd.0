Subject: Re: [PATCH] Add armflash support for multiple blocks of flash
From: Artem Bityutskiy <dedekind@infradead.org>
To: Catalin Marinas <catalin.marinas@arm.com>
In-Reply-To: <20090423164110.31264.42300.stgit@pc1117.cambridge.arm.com>
References: <20090423164110.31264.42300.stgit@pc1117.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 25 Apr 2009 10:47:05 +0300
Message-Id: <1240645625.22645.93.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Russell King <linux@arm.linux.org.uk>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-04-23 at 17:41 +0100, Catalin Marinas wrote:
> This patch adds MTD concatenation support to integrator-flash.c for
> platforms with more than one block of flash memory (e.g. RealView
> PB11MPCore). The implementation is based on the sa1100-flash.c one.
> 
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: David Woodhouse <dwmw2@infradead.org>

I've added your patch to l2-mtd-2.6.git with Russell's Ack.
This means that it will probably be pulled to the mtd-2.6.git
tree at some point.

http://git.infradead.org/users/dedekind/l2-mtd-2.6.git?a=commit;h=62e7c70ea2b8d99c3d39bd64a937408a239cb1bb

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
