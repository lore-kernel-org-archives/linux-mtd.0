Message-ID: <528D18EC.6000501@ti.com>
Date: Wed, 20 Nov 2013 22:17:48 +0200
From: Grygorii Strashko <grygorii.strashko@ti.com>
MIME-Version: 1.0
To: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Santosh Shilimkar
 <santosh.shilimkar@ti.com>, Rob Landley <rob@landley.net>, Russell King
 <linux@arm.linux.org.uk>
Subject: Re: [PATCH 0/3] Reuse davinci-nand driver for Keystone arch
References: <1384964699-15134-1-git-send-email-ivan.khoronzhuk@ti.com>
In-Reply-To: <1384964699-15134-1-git-send-email-ivan.khoronzhuk@ti.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/20/2013 06:24 PM, Ivan Khoronzhuk wrote:
> This series contains updates of Davinci nand driver, in order to be
> reused for Keystone platform.
>
> Depends on:
> - Davinci nand driver fixes and updates:
>    https://lkml.org/lkml/2013/11/20/271

^^^^ I suggest to merge this series with above one as it
should not break anything.

>
> - Introduce AEMIF driver for Davinci/Keystone archs:
>    http://lkml.org/lkml/2013/11/11/352
>
> V1:
> https://lkml.org/lkml/2013/11/11/352
>
> Ivan Khoronzhuk (3):
>    mtd: nand: davinci: reuse driver for Keystone arch
>    mtd: nand: davinci: don't set timings if AEMIF is used
>    mtd: nand: davinci: don't request AEMIF address range

For patches:
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

>
>   .../devicetree/bindings/mtd/davinci-nand.txt       |    8 +--
>   drivers/mtd/nand/Kconfig                           |    6 +--
>   drivers/mtd/nand/davinci_nand.c                    |   57 +++++++++++++-------
>   3 files changed, 45 insertions(+), 26 deletions(-)
>
