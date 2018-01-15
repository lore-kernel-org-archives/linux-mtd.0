Message-ID: <1515981514.8823.3.camel@mhfsdcap03>
Subject: Re: [PATCH] mtd: mtk-nor: modify functions' name more generally
From: Guochun Mao <guochun.mao@mediatek.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
CC: Marek Vasut <marek.vasut@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Richard
 Weinberger <richard@nod.at>, Mark Rutland <mark.rutland@arm.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Date: Mon, 15 Jan 2018 09:58:34 +0800
In-Reply-To: <5348c8dd-dc78-bdeb-f9d0-5ce20616d69b@wedev4u.fr>
References: <1513561655-10570-1-git-send-email-guochun.mao@mediatek.com>
 <1513561655-10570-2-git-send-email-guochun.mao@mediatek.com>
 <5348c8dd-dc78-bdeb-f9d0-5ce20616d69b@wedev4u.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Cyrille,

Thank you very much.

BR,
Guochun Mao


On Sun, 2018-01-14 at 16:23 +0100, Cyrille Pitchen wrote:
> Le 18/12/2017 à 02:47, Guochun Mao a écrit :
> > Since more and more Mediatek's SoC can use this driver to
> > control spi-nor flash, functions' name with "mt8173_" is
> > no longer properly. Replacing "mt8173_" with "mtk_" will
> > be more accurate to describe these functions' usable scope.
> > 
> > Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> 
> Applied to the spi-nor/next branch of linux-mtd
> 
> Thanks!
> 
> > ---
> >  drivers/mtd/spi-nor/mtk-quadspi.c |  240 ++++++++++++++++++-------------------
> >  1 file changed, 120 insertions(+), 120 deletions(-)
> > 
