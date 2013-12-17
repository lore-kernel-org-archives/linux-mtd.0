Date: Tue, 17 Dec 2013 12:02:11 +0800
From: Huang Shijie <b32955@freescale.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v3 0/7] mtd: spi-nor: add a new framework for SPI NOR
Message-ID: <20131217040209.GA27091@shlinux2.ap.freescale.net>
References: <1387184330-14448-1-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA56ADC@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA56ADC@DBDE04.ent.ti.com>
Cc: "marex@denx.de" <marex@denx.de>, "angus.clark@st.com" <angus.clark@st.com>,
 "shawn.guo@linaro.org" <shawn.guo@linaro.org>,
 "b44548@freescale.com" <b44548@freescale.com>,
 "broonie@linaro.org" <broonie@linaro.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "b18965@freescale.com" <b18965@freescale.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Poddar,
 Sourav" <sourav.poddar@ti.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 17, 2013 at 04:08:33AM +0000, Gupta, Pekon wrote:
> 
> As much base code is copied from m25p90.c,
> Do you mind keeping the sign-offs of the original contributors of m25p80.c
> at-least in patches where much code is ported ?
I have added the lines in the spi-nor.c:

 " Cloned most of the code from the m25p80.c"

> This would at-least give some credit to original authors and contributors.
I do not change any authors information of m25p80.c.

If it is not enough?  Could you remind me what to do ?

thanks
Huang Shijie
