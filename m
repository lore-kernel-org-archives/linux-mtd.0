Message-ID: <50B79979.1090406@newsguy.com>
Date: Thu, 29 Nov 2012 09:20:57 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH v2] MTD: at91: atmel_nand: return bit flips for the PMECC
 read_page()
References: <1354013431-13598-1-git-send-email-josh.wu@atmel.com>
 <50B50D81.3060401@newsguy.com> <50B51605.9040703@newsguy.com>
 <50B71292.4020604@atmel.com>
In-Reply-To: <50B71292.4020604@atmel.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: plagnioj@jcrosoft.com, nicolas.ferre@atmel.com,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/28/2012 11:45 PM, Josh Wu wrote:
> Hi, Mike
> 
> On 11/28/2012 3:35 AM, Mike Dunn wrote:
>>
>> BTW, with such a wide range for ecc strength - up to 24 bits, according to the
>> commit message for the pmecc patch - you may want to think about setting an
>> appropriate bitflip_threshold in the driver.  I'm not a nand expert, and I don't
>> know much about the atmel_nand specifically, but I would think that if 23 bits
>> are corrected on a page of size 2k (or less), maybe a return code of -EUCLEAN
>> from mtd_read() might be appropriate.
> 
> After checking the nand_base.c, I saw it will set the mtd.bitflip_threshold to
> mtd->ecc.strength during nand_scan_tail().
> in the atmel_nand code, the ecc strength will be set correctly, that means
> bitflip_threashold should be set up correctly by default.
> so I think I don't need set up the the bitflip_threshold anymore if I set ecc
> strength correctly. Am I missing any point here?


No, you are correct; bitflip_threshold is set to ecc.strength by default if the
driver has not assigned it a value already.  I just wondered if the default
value is too liberal given the possibility of such high ecc strength in your
case.  With bitflip_threshold == 24 (default for the greatest possible
ecc.strength on atmel_nand with pmecc) mtd_read() will not return -EUCLEAN until
24 bitflips are corrected on a page that is no greater than 2k in size, and may
be as small as 512 bytes (if I read the code correctly).

The -EUCLEAN return code is used by higher layers as an indication that a block
may be going bad.  I don't know whether or not a block bears scrutiny when 23
bitflips are corrected on a page.  I guess it depends on the particular flash
device.  It was just a thought.

Hope this makes sense.
Mike
