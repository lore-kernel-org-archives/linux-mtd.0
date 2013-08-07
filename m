Message-ID: <1375857059.30770.187.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: atmel_nand: fix the warning when CONFIG_OF is not
 defined
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Wed, 07 Aug 2013 09:30:59 +0300
In-Reply-To: <1375846569-9499-1-git-send-email-josh.wu@atmel.com>
References: <1375846569-9499-1-git-send-email-josh.wu@atmel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: plagnioj@jcrosoft.com, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 nicolas.ferre@atmel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-08-07 at 11:36 +0800, Josh Wu wrote:
> This patch fix following warning:
> 
> drivers/mtd/nand/atmel_nand.c:2007: warning: 'atmel_nand_nfc_match' defined but not used
> 
> This patch add '#if defined(CONFIG_OF)' block to guard around the definition of
> atmel_nand_nfc_match, in order to avoid the warning when kernel is configurated
> as non-dt supported.
> 
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
