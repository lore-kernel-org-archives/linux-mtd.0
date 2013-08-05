Message-ID: <1375707846.14869.453.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/6] MTD: atmel_nand: use devm_xxx gpio kzalloc, gpio
 and ioremap
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Mon, 05 Aug 2013 16:04:06 +0300
In-Reply-To: <1375701279-11495-2-git-send-email-josh.wu@atmel.com>
References: <1375701279-11495-1-git-send-email-josh.wu@atmel.com>
 <1375701279-11495-2-git-send-email-josh.wu@atmel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: sergei.shtylyov@cogentembedded.com, nicolas.ferre@atmel.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-08-05 at 19:14 +0800, Josh Wu wrote:
> From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> 
> this will allow to simply the error and remove path
> 
> Cc: linux-mtd@lists.infradead.org
> Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> [josh.wu@atmel.com: fix checkpatch warnings and rebase to latest mtd git tree]
> [josh.wu@atmel.com: replace devm_request_and_ioremap with devm_ioremap_resource]
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

Pushed to l2-mtd.git. I did not review it much, though, so extra eyes
would not hurt. But it generally looks good.

-- 
Best Regards,
Artem Bityutskiy
