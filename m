Received: from devils.ext.ti.com ([198.47.26.153])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTRXH-0001w3-3b
 for linux-mtd@lists.infradead.org; Mon, 15 Sep 2014 08:21:24 +0000
Message-ID: <5416A168.2040604@ti.com>
Date: Mon, 15 Sep 2014 11:20:56 +0300
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH 0/3] nand: Renaming, moving and fixing NAND and ELM drivers
References: <1410443224-18477-1-git-send-email-ezequiel@vanguardiasur.com.ar>	<5412B4C0.505@ti.com>
 <CAAEAJfCJNN_rOm7dp1crohuD7or1D7RN3bLqu6WzLW32goX8kA@mail.gmail.com>
In-Reply-To: <CAAEAJfCJNN_rOm7dp1crohuD7or1D7RN3bLqu6WzLW32goX8kA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Tony Lindgren <tony@atomide.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/12/2014 07:46 PM, Ezequiel Garcia wrote:
> On 12 September 2014 09:54, Roger Quadros <rogerq@ti.com> wrote:
>> Hi Ezequiel,
>>
>> On 09/11/2014 04:47 PM, Ezequiel Garcia wrote:
>>> Following the recent discussion with Roger, here's a few patches that
>>> (hopefully) fix all the issues.
>>>
>>> The first patches rename the OMAP NAND drivers, so they are now called
>>> omap2_nand and omap_elm.
>>>
>>> The last patch picks an idea from Yann E. Morin and fixes the build issue
>>> reported by Roger. Quoting Roger:
>>>
>>> ""
>>> I still get the following error if I set CONFIG_MTD_NAND_OMAP2 to y and
>>> CONFIG_MTD_NAND_OMAP_BCH to m.
>>>
>>> CONFIG_MTD_NAND_OMAP_BCH is used to select the ELM driver and it must be limited to
>>> be built-in if CONFIG_MTD_NAND_OMAP2 is built-in.
>>>
>>> Maybe it should be a sub option of CONFIG_MTD_NAND_OMAP2.
>>> IMHO the elm.c file must be moved from mtd/devices to mtd/nand and renamed to omap_elm.c
>>>
>>> drivers/built-in.o: In function `omap_nand_probe':
>>> /work/linux-2.6/drivers/mtd/nand/omap2.c:2010: undefined reference to `elm_config'
>>> /work/linux-2.6/drivers/mtd/nand/omap2.c:1980: undefined reference to `elm_config'
>>> /work/linux-2.6/drivers/mtd/nand/omap2.c:1927: undefined reference to `elm_config'
>>> drivers/built-in.o: In function `omap_elm_correct_data':
>>> /work/linux-2.6/drivers/mtd/nand/omap2.c:1444: undefined reference to `elm_decode_bch_error_page'
>>> make: *** [vmlinux] Error 1
>>> ""
>>>
>>> [1] https://lkml.org/lkml/2013/5/4/84
>>>
>>> Ezequiel Garcia (3):
>>>   mtd: nand: Move ELM driver and rename as omap_elm
>>>   mtd: nand: Rename OMAP NAND driver
>>>   mtd: nand: Force omap_elm to be built as a module if omap2_nand is a
>>>     module
>>
>> Thanks for the patches. I see a lot of errors reported by checkpatch.pl which need fixing.
>>
> 
> You mean on these patches or across the file?
> 
Just in these patches.

cheers,
-roger
