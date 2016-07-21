Date: Thu, 21 Jul 2016 10:09:55 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Yunhui Cui <yunhui.cui@nxp.com>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "han.xu@freescale.com" <han.xu@freescale.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Yao Yuan <yao.yuan@nxp.com>, Yang-Leo Li <leoyang.li@nxp.com>,
 Stuart Yoder <stuart.yoder@nxp.com>, york sun <york.sun@nxp.com>
Subject: Re: [PATCH v2 1/9] mtd:fsl-quadspi:use the property fields of SPI-NOR
Message-ID: <20160721170955.GA91127@google.com>
References: <1461307192-866-1-git-send-email-B56489@freescale.com>
 <DB5PR0401MB191200E18A336E0BE5318D1694240@DB5PR0401MB1912.eurprd04.prod.outlook.com>
 <VI1PR0401MB26403FE955617EFEB3DD809294090@VI1PR0401MB2640.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR0401MB26403FE955617EFEB3DD809294090@VI1PR0401MB2640.eurprd04.prod.outlook.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 21, 2016 at 05:58:48AM +0000, Yunhui Cui wrote:
> Could you please help to review this patch set.
> This patch set is very importmant for fsl-quadspi driver. 

I didn't want this to be my only comment, but since you're pinging
again...

Your patchset doesn't build on the latest. You need to refresh.

Also, has Han Xu reviewed this?
