From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 1/7] mtd: spi-nor: copy the SPI NOR commands to a new
 header file
Date: Tue, 17 Dec 2013 14:01:56 +0100
References: <1387184330-14448-1-git-send-email-b32955@freescale.com>
 <1387184330-14448-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1387184330-14448-2-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201312171401.56683.marex@denx.de>
Cc: angus.clark@st.com, shawn.guo@linaro.org, b44548@freescale.com,
 broonie@linaro.org, dwmw2@infradead.org, linux-doc@vger.kernel.org,
 b18965@freescale.com, linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 pekon@ti.com, sourav.poddar@ti.com, computersforpeace@gmail.com,
 lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, December 16, 2013 at 09:58:44 AM, Huang Shijie wrote:
> This patch adds a new header :spi-nor.h,
> and copies all the SPI NOR commands and relative macros into this new
> header.
> 
> This hearder can be used by the m25p80.c and other spi-nor controller,
> such as Freescale's Quadspi.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

It would be much nicer if you also removed the commands in this same patch from 
the m25p80.c file.

Best regards,
Marek Vasut
