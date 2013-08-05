Message-ID: <1375696588.14869.421.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v5 0/6] mtd: atmel_nand: enable Nand Flash Controller
 (NFC) support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Mon, 05 Aug 2013 12:56:28 +0300
In-Reply-To: <1372845034-5579-1-git-send-email-josh.wu@atmel.com>
References: <1372845034-5579-1-git-send-email-josh.wu@atmel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: plagnioj@jcrosoft.com, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, sergei.shtylyov@cogentembedded.com,
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

On Wed, 2013-07-03 at 17:50 +0800, Josh Wu wrote:
> This patch series enable NFC support for SAMA5 soc. It can send command,
> address cycles automaticly. Also when enable NFC sram, NFC will transfer
> data to sram. Which can save lots of cpu time.
> 
> The mtd speed test results (non-NFC vs NFC), run in sama5d3x-ek with DMA
> enable, is in the end of this patch.

Please, also all all the acks to the patches.

-- 
Best Regards,
Artem Bityutskiy
