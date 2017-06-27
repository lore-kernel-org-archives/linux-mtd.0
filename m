Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dPnbN-000084-BZ
 for linux-mtd@lists.infradead.org; Tue, 27 Jun 2017 10:20:35 +0000
Received: by mail-wm0-x242.google.com with SMTP id j85so4909165wmj.0
 for <linux-mtd@lists.infradead.org>; Tue, 27 Jun 2017 03:19:50 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: parse Serial Flash Discoverable
 Parameters (SFDP) tables
To: Cyrille Pitchen <cyrille.pitchen@microchip.com>
References: <cover.1498481714.git.cyrille.pitchen@microchip.com>
 <bd2526cb6d08011ba2e5e6ef8282b6d68d888b88.1498481714.git.cyrille.pitchen@microchip.com>
Cc: computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <4b3ce0e4-c610-d3a9-a9a9-02bf2004e3bd@gmail.com>
Date: Tue, 27 Jun 2017 12:14:18 +0200
MIME-Version: 1.0
In-Reply-To: <bd2526cb6d08011ba2e5e6ef8282b6d68d888b88.1498481714.git.cyrille.pitchen@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/26/2017 03:10 PM, Cyrille Pitchen wrote:
> This patch adds support to the JESD216 rev B standard and parses the SFDP
> tables to dynamically initialize the 'struct spi_nor_flash_parameter'.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>

Changelog is missing. And for such a huge patch, the description is
really tiny.

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 775 +++++++++++++++++++++++++++++++++++++++++-
>  include/linux/mtd/spi-nor.h   |   6 +
>  2 files changed, 768 insertions(+), 13 deletions(-)

Otherwise,
Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
