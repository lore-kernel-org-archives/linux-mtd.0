Subject: Re: [PATCH 0/2] mxc_nand: fixes for purposed updates
From: David Woodhouse <dwmw2@infradead.org>
To: Baruch Siach <baruch@tkos.co.il>
In-Reply-To: <cover.1281353601.git.baruch@tkos.co.il>
References: <1281102791-8089-1-git-send-email-s.hauer@pengutronix.de>
	<cover.1281353601.git.baruch@tkos.co.il>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 09 Aug 2010 12:53:25 +0100
Message-ID: <1281354805.26440.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-mtd@lists.infradead.org, John Ogness <john.ogness@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-08-09 at 14:38 +0300, Baruch Siach wrote:
> With these patches applied I've tested mxc-nand-pu on a i.MX25 based system.
> 
> Baruch Siach (2):
>   mxc_nand: fix build error
>   mxc_nand: remove unused variables
> 
>  drivers/mtd/nand/mxc_nand.c |    9 +++------
>  1 files changed, 3 insertions(+), 6 deletions(-)

These patches don't apply to the mtd-2.6.git tree.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
