Subject: Re: [PATCH 1/3 v2] MTD: atmel_nand: modify test case for using DMA
	operations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Nicolas Ferre <nicolas.ferre@atmel.com>
In-Reply-To: <1301668844-4500-1-git-send-email-nicolas.ferre@atmel.com>
References: <1301662188.2789.57.camel@localhost>
	<1301668844-4500-1-git-send-email-nicolas.ferre@atmel.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Apr 2011 16:36:42 +0300
Message-ID: <1301665002.2789.75.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: hong.xu@atmel.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-04-01 at 16:40 +0200, Nicolas Ferre wrote:
> We have better performances not using DMA for oob operations.
> Modify size test so that it is using DMA for size greater than oobsize.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Pushed to l2-mtd-2.6.git, thank you!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
