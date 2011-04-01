Subject: Re: [PATCH 3/3] MTD/atmel_nand: Fix support for CPUs that do not
	support DMA access
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Hong Xu <hong.xu@atmel.com>
In-Reply-To: <1301473601-29570-3-git-send-email-hong.xu@atmel.com>
References: <1301473601-29570-1-git-send-email-hong.xu@atmel.com>
	<1301473601-29570-3-git-send-email-hong.xu@atmel.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Apr 2011 15:54:30 +0300
Message-ID: <1301662470.2789.59.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org,
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

On Wed, 2011-03-30 at 16:26 +0800, Hong Xu wrote:
> use_dma was always "1" even if the CPU does not support DMA
> 
> Tested on AT91SAM9261EK by Jean-Christophe PLAGNIOL-VILLARD
> 
> Reported-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> Signed-off-by: Hong Xu <hong.xu@atmel.com>

Pushed to l2-mtd-2.6.git tree. This looks like a candidate for the
stable tree - should it be sent there?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
