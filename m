Date: Fri, 29 Jun 2012 20:53:49 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Dong Aisheng <aisheng.dong@freescale.com>
Subject: Re: [PATCH 3/3] mtd: gpmi: change the code for clocks
Message-ID: <20120629125346.GI29197@S2101-09.ap.freescale.net>
References: <20120629020650.GB28932@S2101-09.ap.freescale.net>
 <20120629063329.GE5844@shlinux2.ap.freescale.net>
 <20461.30070.771087.830745@ipc1.ka-ro>
 <20120629093437.GK5844@shlinux2.ap.freescale.net>
 <20461.30991.63507.369439@ipc1.ka-ro>
 <20120629095433.GO5844@shlinux2.ap.freescale.net>
 <20120629111334.GB29197@S2101-09.ap.freescale.net>
 <20120629121437.GQ5844@shlinux2.ap.freescale.net>
 <20120629124154.GG29197@S2101-09.ap.freescale.net>
 <20120629124158.GA32473@shlinux2.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20120629124158.GA32473@shlinux2.ap.freescale.net>
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Huang Shijie <shijie8@gmail.com>, Huang Shijie-B32955 <B32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Dong Aisheng-B29396 <B29396@freescale.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 29, 2012 at 08:41:59PM +0800, Dong Aisheng wrote:
> I know this.
> You may missed my point.
> I mean extra clocks introduced for imx6q which is not exist on imx28.
> For your proposal, the gpmi driver will acquire all clocks including
> imx6q's.
> So when get imx6q's gpmi clock like "gpmi-bch" like clk_get(dev, "gpmi-bch"),
> it may fail for imx28.
> 
What I was saying is it will not fail.

-- 
Regards,
Shawn
