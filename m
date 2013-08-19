Message-ID: <1376919501.2089.465.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: atmel_nand: pmecc: fix bug fail to correct bit
 error in 1024-bytes sector
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Mon, 19 Aug 2013 16:38:21 +0300
In-Reply-To: <1376906744-4711-1-git-send-email-josh.wu@atmel.com>
References: <1376906744-4711-1-git-send-email-josh.wu@atmel.com>
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

On Mon, 2013-08-19 at 18:05 +0800, Josh Wu wrote:
> The PMECC use BCH algorithm to correct error. In BCH algorithm, the primitive
> polynomial value is GF(2^13) for 512-bytes sector size. And it is GF(2^14) for
> 1024-bytes sector size.
> 
> This patch will choose correct degree of the remainders(13 or 14) for
> different sector size.
> Tested in AT91SAM9X5-EK with MLC nand flash.
> 
> More detail can be refered to section 5.4.1 of:
>   AT91SAM ARM-based Embedded MPU Application Note
>   <http://www.atmel.com/Images/doc11127.pdf>
> 
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
