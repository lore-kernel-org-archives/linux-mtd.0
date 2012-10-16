Message-ID: <507D0323.6010207@atmel.com>
Date: Tue, 16 Oct 2012 14:48:03 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] MTD: atmel_nand: fix compile error when use
 avr32-atstk1006_defconfig
References: <1349678809-12092-1-git-send-email-josh.wu@atmel.com>
 <1350308938.5769.7.camel@sauron.fi.intel.com>
In-Reply-To: <1350308938.5769.7.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: fengguang.wu@intel.com, egtvedt@samfundet.no, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, hskinnemoen@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/15/2012 9:48 PM, Artem Bityutskiy wrote:
> On Mon, 2012-10-08 at 14:46 +0800, Josh Wu wrote:
>> fixed the following compile error when use avr32 config:
>> drivers/mtd/nand/atmel_nand.c: In function 'pmecc_err_location':
>> drivers/mtd/nand/atmel_nand.c:639: error: implicit declaration of function 'writel_relaxed'
>>
>> Since in ARCH avr32, there is no macro "writel_relaxed" defined. In this patch we use macro "writel" instead.
>>
>> Signed-off-by: Josh Wu <josh.wu@atmel.com>
> Why not to provide writel_relaxed() in AVR instead?
>
OK, I can send another patch to add writel_relaxed() in AVR. Since I 
don't have any AVR board in my hand, I need someone test it. thank you.

Best Regards,
Josh Wu
