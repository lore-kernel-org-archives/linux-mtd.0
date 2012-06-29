Date: Fri, 29 Jun 2012 20:14:38 +0800
From: Dong Aisheng <aisheng.dong@freescale.com>
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 3/3] mtd: gpmi: change the code for clocks
Message-ID: <20120629121437.GQ5844@shlinux2.ap.freescale.net>
References: <1340941925-14591-1-git-send-email-shijie8@gmail.com>
 <1340941925-14591-3-git-send-email-shijie8@gmail.com>
 <20120629020650.GB28932@S2101-09.ap.freescale.net>
 <20120629063329.GE5844@shlinux2.ap.freescale.net>
 <20461.30070.771087.830745@ipc1.ka-ro>
 <20120629093437.GK5844@shlinux2.ap.freescale.net>
 <20461.30991.63507.369439@ipc1.ka-ro>
 <20120629095433.GO5844@shlinux2.ap.freescale.net>
 <20120629111334.GB29197@S2101-09.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20120629111334.GB29197@S2101-09.ap.freescale.net>
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

On Fri, Jun 29, 2012 at 07:13:36PM +0800, Shawn Guo wrote:
> On Fri, Jun 29, 2012 at 05:54:33PM +0800, Dong Aisheng wrote:
> > > > > No, that's silly. You would have to change the driver for each
> > > > > new platform that the driver can support.
> > > > > 
> > > > If the new platform is fully compatible with exist platforms, then no.
> > > > If need more clocks, then in either way, we have to add support in driver.
> > > > 
> > > Even if it had fewer clocks you would have to change the driver!
> > > 
> > Yes.
> > For your case, you need create some dummy clock, right?
> > If yes, i would intend to explictly to define it for a new type
> > of IP.
> > 
> I'm with Lothar on this.  At least for imx28 case, we do not even need
> dummy clock, because NULL con_id in clkdev lookup will have all those
> clocks match the only one gpmi-nand clock on imx28, as I already said.
> 
I'm not quite understand. Can you clarify a bit more?
For extra clocks need by mx6q like "gpmi_bch", they're indeed have con_id.
Getting them will not fail on imx28 without dummy clock?

Regards
Dong Aisheng
