Subject: Re: [PATCH V5 1/6] pxa3xx_nand: make scan procedure more clear
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lei Wen <leiwen@marvell.com>
In-Reply-To: <1299121710-6263-1-git-send-email-leiwen@marvell.com>
References: <AANLkTinb7oZDzvD94RWLZqnLnaX5kY97CxJ+34eVJNmU@mail.gmail.com>
	<1299121710-6263-1-git-send-email-leiwen@marvell.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 07 Mar 2011 11:49:31 +0200
Message-ID: <1299491371.2746.14.camel@localhost>
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

On Thu, 2011-03-03 at 11:08 +0800, Lei Wen wrote:
> The previous probe function is some kind of big part.
> This patch seperate the resource allocation to keep the probe process
> more clear than before.
> 
> Signed-off-by: Lei Wen <leiwen@marvell.com>
> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>

It is a bit confusing that you sent 2 patches 1 and 6. What is in the
middle? Is it save to apply these 2 only?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
