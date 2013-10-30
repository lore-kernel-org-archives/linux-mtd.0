Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbRM1-00072C-HO
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2013 08:42:18 +0000
Message-ID: <5270C644.1020405@ti.com>
Date: Wed, 30 Oct 2013 14:11:40 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCHv2] drivers: mtd: m25p80: Add quad read support.
References: <1383117765-31732-1-git-send-email-sourav.poddar@ti.com>
 <5270BC27.40000@freescale.com>
In-Reply-To: <5270BC27.40000@freescale.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: marex@denx.de, computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 balbi@ti.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 30 October 2013 01:28 PM, Huang Shijie wrote:
> 于 2013年10月30日 15:22, Sourav Poddar 写道:
>>     struct device_node __maybe_unused *np = spi->dev.of_node;
> you'd better rebase this patch on the latest l2-mtd.
>
> this line has been removed in the latest code.
>
Ok.
>
> thanks
> Huang Shijie
>
