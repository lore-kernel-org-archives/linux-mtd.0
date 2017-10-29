Subject: Re: [PATCH v2 3/3] mtd: spi-nor: stm32-quadspi: change license text
To: Ludovic Barre <ludovic.Barre@st.com>, Marek Vasut <marek.vasut@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
References: <1509030755-19044-1-git-send-email-ludovic.Barre@st.com>
 <1509030755-19044-4-git-send-email-ludovic.Barre@st.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <6d132904-bea7-2ecc-f9d9-73c7cc5f0c3d@wedev4u.fr>
Date: Sun, 29 Oct 2017 18:51:25 +0100
MIME-Version: 1.0
In-Reply-To: <1509030755-19044-4-git-send-email-ludovic.Barre@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 26/10/2017 à 17:12, Ludovic Barre a écrit :
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> -Change the license text with long template.
> -Change Copyright to STMicroelectronics.
> 
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>

Applied to the spi-nor/next branch of l2-mtd

Thanks!
> ---
>  drivers/mtd/spi-nor/stm32-quadspi.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/stm32-quadspi.c b/drivers/mtd/spi-nor/stm32-quadspi.c
> index 70710be..b3c7f6a 100644
> --- a/drivers/mtd/spi-nor/stm32-quadspi.c
> +++ b/drivers/mtd/spi-nor/stm32-quadspi.c
> @@ -1,9 +1,22 @@
>  /*
> - * stm32_quadspi.c
> + * Driver for stm32 quadspi controller
>   *
> - * Copyright (C) 2017, Ludovic Barre
> + * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
> + * Author(s): Ludovic Barre author <ludovic.barre@st.com>.
>   *
> - * License terms: GNU General Public License (GPL), version 2
> + * License terms: GPL V2.0.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License version 2 as published by
> + * the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
> + * details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * This program. If not, see <http://www.gnu.org/licenses/>.
>   */
>  #include <linux/clk.h>
>  #include <linux/errno.h>
> 
