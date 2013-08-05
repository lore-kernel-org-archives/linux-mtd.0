Message-ID: <1375696834.14869.422.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: atmel_nand: fix pmecc selction for ecc requirement
 typo
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Mon, 05 Aug 2013 13:00:34 +0300
In-Reply-To: <1372845379-5958-1-git-send-email-josh.wu@atmel.com>
References: <1372845379-5958-1-git-send-email-josh.wu@atmel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: plagnioj@jcrosoft.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-07-03 at 17:56 +0800, Josh Wu wrote:
> Atmel PMECC support 2, 4, 8, 12, 24 bit error correction.
> So if the ecc requirement in ONFI is <= 2, 4, 8, 12, 24.
> We will use 2, 4, 8, 12, 24.
> 
> This patch fix the typo. Use '<=' replace '<'.
> 
> Reported-by: Scott Wood <scottwood@freescale.com>
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
