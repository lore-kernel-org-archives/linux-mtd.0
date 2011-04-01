Subject: Re: [PATCH 1/3] MTD: atmel_nand: modify test case for using DMA
	operations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Hong Xu <hong.xu@atmel.com>
In-Reply-To: <1301473601-29570-1-git-send-email-hong.xu@atmel.com>
References: <1301473601-29570-1-git-send-email-hong.xu@atmel.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Apr 2011 15:49:48 +0300
Message-ID: <1301662188.2789.57.camel@localhost>
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
> From: Nicolas Ferre <nicolas.ferre@atmel.com>
> 
> We have better performances not using DMA for oob operations.

Would it be possible to have this comment in the code, not only in the
commit message?

> Modify size test so that it is using DMA for size greater than oobsize.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
