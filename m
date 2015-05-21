Date: Thu, 21 May 2015 07:11:28 +0300
From: Baruch Siach <baruch@tkos.co.il>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 4/4] mtd: mxc_nand: generate nand_ecclayout for 8 bit
 ECC
Message-ID: <20150521041128.GI2586@tarshish>
References: <cover.1431504091.git.baruch@tkos.co.il>
 <95e2a17d74da5a0415ab93e060f6efc681216313.1431504091.git.baruch@tkos.co.il>
 <20150520224120.GS11598@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150520224120.GS11598@ld-irv-0074>
Cc: Fabio Estevam <Fabio.Estevam@freescale.com>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Shawn Guo <shawn.guo@linaro.org>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Wed, May 20, 2015 at 03:41:20PM -0700, Brian Norris wrote:
> On Wed, May 13, 2015 at 11:17:39AM +0300, Baruch Siach wrote:
> > +		if (get_eccsize(mtd) == 8)
> > +			ecc_8bit_layout_4k(this->ecc.layout);
> 
> So you're overwriting an existing layout (e.g., nandv2_hw_eccoob_4k).
> What if you have more than one NAND chip? You might do better by
> dynamically allocating the memory.

It would take a quite a bit more code changes then that to have the mxc_nand 
driver support more than one NAND chip, not to mention the DT binding. As Uwe 
has indicated on a previous version of this series, ecclayout handling in this 
driver could use some cleanup. This patch just fixes bug, trying to break 
anything else while doing so.

Thanks for reviewing, and for applying the rest of this series.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
