From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] ARM: dts: mxs: add the `clock-names` for gpmi-nand
Date: Wed, 10 Oct 2012 12:37:13 +0200
References: <CAOMZO5A0UX6y3MtHdzZ8V2Z52qsH8Yy-BVtOYEN_OpBezEsvQw@mail.gmail.com>
 <1349849740-14090-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1349849740-14090-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201210101237.13640.marex@denx.de>
Cc: linux-mtd@lists.infradead.org, shawn.guo@linaro.org, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

> The current DT nodes for mx23/mx28 miss the `clocks-names` item for
> gpmi-nand. So the gpmi-nand driver could not find the proper clock.
> 
> This patch fixes this issue.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
[...]

One more rant: Can you discard that weird backtick in the patch subject? Maybe 
use '' ?

Best regards,
Marek Vasut
