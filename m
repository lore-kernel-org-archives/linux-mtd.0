Date: Wed, 13 May 2015 08:12:02 +0300
From: Baruch Siach <baruch@tkos.co.il>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 3/4] mtd: mxc_nand: fix truncate of unaligned oob
 copying
Message-ID: <20150513051202.GI2558@tarshish>
References: <cover.1430636819.git.baruch@tkos.co.il>
 <ff526c6b889682e36e7d086dd5e6dec8936f86d9.1430636819.git.baruch@tkos.co.il>
 <20150508072432.GJ12671@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150508072432.GJ12671@pengutronix.de>
Cc: Fabio Estevam <Fabio.Estevam@freescale.com>,
 Shawn Guo <shawn.guo@linaro.org>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Uwe,

On Fri, May 08, 2015 at 09:24:32AM +0200, Uwe Kleine-König wrote:
> On Sun, May 03, 2015 at 10:18:53AM +0300, Baruch Siach wrote:
> > Copy to/from oob io area might not be aligned to 4 bytes. When 8 bit ECC is
> > used, the buffer size is 26. Add memcpy16_{to,from}io, and use them to avoid
> > truncating the buffer. Prefer memcpy32_{to,from}io when the buffer is properly
> > aligned for better performance.
> Did you measure this performance difference? I doubt it's worth the
> complexity given that we're talking about buffers with a size of up to
> 26 bytes.

We'll need both memcpy16_{to,from}io and memcpy32_{to,from}io anyway. So by 
"complexity" you refer to the additional alignment check and memcpy32 
fallback?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
