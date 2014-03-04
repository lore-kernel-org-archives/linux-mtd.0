From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v5 1/8] mtd: spi-nor: copy the SPI NOR commands to a new
 header file
Date: Tue, 4 Mar 2014 23:13:14 +0100
References: <1393238262-8622-1-git-send-email-b32955@freescale.com>
 <1393238262-8622-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1393238262-8622-2-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201403042313.14353.marex@denx.de>
Cc: angus.clark@st.com, computersforpeace@gmail.com, b44548@freescale.com,
 broonie@linaro.org, lee.jones@linaro.org, linux-doc@vger.kernel.org,
 b18965@freescale.com, linux-spi@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, devicetree@vger.kernel.org, pekon@ti.com,
 sourav.poddar@ti.com, shawn.guo@linaro.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, February 24, 2014 at 11:37:35 AM, Huang Shijie wrote:
> This patch adds a new header :spi-nor.h,
> and copies all the SPI NOR commands and relative macros into this new
> header.
> 
> This hearder can be used by the m25p80.c and other spi-nor controller,
> such as Freescale's Quadspi.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Please keep me on CC ;-)

I honestly have to wonder ... why do you not 'move' these definitions instead of 
copying them ?

Best regards,
Marek Vasut
