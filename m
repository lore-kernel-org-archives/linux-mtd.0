Date: Sat, 30 Jun 2012 18:52:26 +0100
From: Mark Brown <broonie@opensource.wolfsonmicro.com>
To: Lothar Wa??mann <LW@KARO-electronics.de>
Subject: Re: [PATCH 3/3] mtd: gpmi: change the code for clocks
Message-ID: <20120630175225.GC21029@sirena.org.uk>
References: <1340941925-14591-1-git-send-email-shijie8@gmail.com>
 <1340941925-14591-3-git-send-email-shijie8@gmail.com>
 <20120629020650.GB28932@S2101-09.ap.freescale.net>
 <20120629063329.GE5844@shlinux2.ap.freescale.net>
 <20461.30070.771087.830745@ipc1.ka-ro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20461.30070.771087.830745@ipc1.ka-ro>
Cc: Dong Aisheng <aisheng.dong@freescale.com>, dedekind1@gmail.com,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Shawn Guo <shawn.guo@linaro.org>, Huang Shijie <shijie8@gmail.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 29, 2012 at 11:29:26AM +0200, Lothar Wa??mann wrote:

> Instead the driver should request the maximum number of clocks that
> the existing set of platforms provide and all platforms with fewer
> clocks should provide an appropriate number of dummy clocks.

Or the driver could handle missing clocks, that can make more sense in
some cases.
