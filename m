Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUZyE-0000CJ-RP
 for linux-mtd@lists.infradead.org; Tue, 02 Aug 2016 13:43:00 +0000
Subject: Re: [mtd-next:master 30/33]
 drivers/mtd/spi-nor/cadence-quadspi.c:529:4: error: implicit declaration of
 function 'readsl'
To: Stefan Roese <sr@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 kbuild test robot <fengguang.wu@intel.com>
References: <201607190315.0nkQuD2W%fengguang.wu@intel.com>
 <20160718202026.GB137880@google.com> <578DC294.5090605@denx.de>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, kbuild-all@01.org,
 Graham Moore <grmoore@opensource.altera.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <a73e745b-06c0-fb83-b058-b59c645323fe@denx.de>
Date: Tue, 2 Aug 2016 14:54:54 +0200
MIME-Version: 1.0
In-Reply-To: <578DC294.5090605@denx.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/19/2016 08:03 AM, Stefan Roese wrote:
> On 18.07.2016 22:20, Brian Norris wrote:
>> On Tue, Jul 19, 2016 at 03:43:17AM +0800, kbuild test robot wrote:
>>> tree:   git://git.infradead.org/linux-mtd-next.git master
>>> head:   f78921b9020c510ed222a6c2402e2aa126432415
>>> commit: 140623410536905fa6ab737b625decfde6c64a72 [30/33] mtd:
>>> spi-nor: Add driver for Cadence Quad SPI Flash Controller
>>> config: x86_64-allmodconfig (attached as .config)
>>> compiler: gcc-6 (Debian 6.1.1-1) 6.1.1 20160430
>>> reproduce:
>>>          git checkout 140623410536905fa6ab737b625decfde6c64a72
>>>          # save the attached .config to linux build tree
>>>          make ARCH=x86_64
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>     drivers/mtd/spi-nor/cadence-quadspi.c: In function
>>> 'cqspi_indirect_read_execute':
>>>>> drivers/mtd/spi-nor/cadence-quadspi.c:529:4: error: implicit
>>>>> declaration of function 'readsl'
>>>>> [-Werror=implicit-function-declaration]
>>>         readsl(ahb_base, rxbuf, DIV_ROUND_UP(bytes_to_read, 4));
>>>         ^~~~~~
>>>     drivers/mtd/spi-nor/cadence-quadspi.c: In function
>>> 'cqspi_indirect_write_execute':
>>>>> drivers/mtd/spi-nor/cadence-quadspi.c:613:3: error: implicit
>>>>> declaration of function 'writesl'
>>>>> [-Werror=implicit-function-declaration]
>>>        writesl(cqspi->ahb_base, txbuf, DIV_ROUND_UP(write_bytes, 4));
>>>        ^~~~~~~
>>>     cc1: some warnings being treated as errors
>>
>> Hmm, does x86 not define readsl()/writesl()? I can never tell what
>> accessors are supposed to be "standard" across architectures.
>>
>> Either we need to drop the COMPILE_TEST or maybe make it (!X86 &&
>> COMPILE_TEST).
> 
> iowrite32_rep() etc should work for x86 as well.

Indeed, they should and they were used to fix other drivers too.
I'll send a patch in a bit.

-- 
Best regards,
Marek Vasut
