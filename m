Message-ID: <4D95D517.30002@atmel.com>
Date: Fri, 01 Apr 2011 15:37:27 +0200
From: Nicolas Ferre <nicolas.ferre@atmel.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 3/3] MTD/atmel_nand: Fix support for CPUs that do not
	support DMA access
References: <1301473601-29570-1-git-send-email-hong.xu@atmel.com>	
	<1301473601-29570-3-git-send-email-hong.xu@atmel.com>
	<1301662470.2789.59.camel@localhost>
In-Reply-To: <1301662470.2789.59.camel@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
	Hong Xu <hong.xu@atmel.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 01/04/2011 14:54, Artem Bityutskiy :
> On Wed, 2011-03-30 at 16:26 +0800, Hong Xu wrote:
>> use_dma was always "1" even if the CPU does not support DMA
>>
>> Tested on AT91SAM9261EK by Jean-Christophe PLAGNIOL-VILLARD
>>
>> Reported-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
>> Signed-off-by: Hong Xu <hong.xu@atmel.com>
> 
> Pushed to l2-mtd-2.6.git tree. This looks like a candidate for the
> stable tree - should it be sent there?

Well, definitively the whole series is a candidate for .39-xx (also with
the "[PATCH] MTD: atmel_nand: Fall back to CPU I/O when buffer is in
vmalloc(ed) region" that follows.

But, as DMA access was not included in .38, stable tree should not be
impacted.

Best regards,
-- 
Nicolas Ferre
