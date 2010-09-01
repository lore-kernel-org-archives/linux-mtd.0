Subject: Re: [PATCH] ARM: pxa3xx: fix build error when
	CONFIG_MTD_PARTITIONS is not defined
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Mark F. Brown" <mark.brown314@gmail.com>
In-Reply-To: <1282813011-6187-2-git-send-email-mark.brown314@gmail.com>
References: <1282813011-6187-1-git-send-email-mark.brown314@gmail.com>
	<1282813011-6187-2-git-send-email-mark.brown314@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Sep 2010 02:20:14 +0300
Message-ID: <1283383214.2209.63.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Eric Miao <eric.y.miao@gmail.com>,
	Haojian Zhuang <haojian.zhuang@marvell.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-08-26 at 04:56 -0400, Mark F. Brown wrote:
> Signed-off-by: Mark F. Brown <mark.brown314@gmail.com>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)

Pushed to l2-mtd-2.6 / for-2.6.36, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
