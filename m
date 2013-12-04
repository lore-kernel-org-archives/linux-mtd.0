Message-ID: <529ED29C.1030208@st.com>
Date: Wed, 4 Dec 2013 06:58:36 +0000
From: Angus Clark <angus.clark@st.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 0/4] mtd: spi-nor: add a new framework for SPI NOR
References: <1385447575-23773-1-git-send-email-b32955@freescale.com>
 <20131127043253.GA9468@ld-irv-0074.broadcom.com> <5298AA23.7080404@st.com>
 <529E976E.4050104@freescale.com>
In-Reply-To: <529E976E.4050104@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: marex@denx.de, broonie@linaro.org, dwmw2@infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, sourav.poddar@ti.com,
 Brian Norris <computersforpeace@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/04/2013 02:46 AM, Huang Shijie wrote:
> 于 2013年11月29日 22:52, Angus Clark 写道:
>>     int (*write_reg)(struct spi_nor_info *info,
>>              uint8_t cmd, uint8_t *reg, int len,
>>              int wren, int wtr);
> I guess you add the 'wren' for the issuing write-enable before issuing
> the 'cmd'.
> 
> but what's 'wtr' for? i do not know what's the meaning of the 'wtr'.
> 

'wtr' is for "Wait 'til Ready".  Some register writes are instant, while others
require polling of the "Write In Progress" bit.

Cheers,

Angus
