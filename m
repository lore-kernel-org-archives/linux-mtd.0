Subject: Re: [PATCH V5 6/6] pxa3xx_nand: clean the keep configure code
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lei Wen <leiwen@marvell.com>
In-Reply-To: <1298860335-18638-7-git-send-email-leiwen@marvell.com>
References: <1298019428-7809-1-git-send-email-leiwen@marvell.com>
	<1298860335-18638-7-git-send-email-leiwen@marvell.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 28 Feb 2011 15:57:43 +0200
Message-ID: <1298901463.2809.27.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Eric Miao <eric.y.miao@gmail.com>,
	Haojian Zhuang <haojian.zhuang@marvell.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-02-28 at 10:32 +0800, Lei Wen wrote:
> Signed-off-by: Lei Wen <leiwen@marvell.com>
> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
> Cc: Eric Miao <eric.y.miao@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> ---
>  arch/arm/plat-pxa/include/plat/pxa3xx_nand.h |    2 +-
>  drivers/mtd/nand/pxa3xx_nand.c               |  103 +++++++++-----------------
>  2 files changed, 36 insertions(+), 69 deletions(-)

Similarly, could you please improve the commit message a bit?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
