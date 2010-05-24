Subject: Re: [PATCH 03/20] mtd: pxa3xx_nand: remove the flash info in
	driver structure
From: David Woodhouse <dwmw2@infradead.org>
To: Lei Wen <adrian.wenl@gmail.com>
In-Reply-To: <AANLkTil9Toz4DU7YJ2B3Qtw3S1LCr90R7tlri7KC_NCC@mail.gmail.com>
References: <AANLkTikU9yabdwx_a5SzpC11v9nowW_zglNHLaswaToB@mail.gmail.com>
	<4BFA2A02.2040605@compulab.co.il>
	<AANLkTil9Toz4DU7YJ2B3Qtw3S1LCr90R7tlri7KC_NCC@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 24 May 2010 10:45:05 +0100
Message-ID: <1274694305.20576.2854.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Eric Miao <eric.y.miao@gmail.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-05-24 at 09:41 +0100, Lei Wen wrote:
> For this patch set change the original c file greatly, more than half
> of original code is changed,
> I cannot create a patch for each change. (If so, this patch set would
> grow to be a very large one. Maybe 30+?)

Yes you can -- large patch sets are fine. If email becomes cumbersome,
feel free to just publish it as a git tree. Once Mike approves I can
pull from it.

Let me have a SSH public key if you want to be able to publish a git
tree on git.infradead.org.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
