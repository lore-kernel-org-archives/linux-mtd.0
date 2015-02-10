Received: from smtp01.smtpout.orange.fr ([80.12.242.123]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YLGq2-0007l0-5V
 for linux-mtd@lists.infradead.org; Tue, 10 Feb 2015 19:51:15 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 5/9] mtd: pxa3xx_nand: add support for the Marvell Berlin
 nand controller
References: <1422367816-4257-1-git-send-email-antoine.tenart@free-electrons.com>
 <1422367816-4257-6-git-send-email-antoine.tenart@free-electrons.com>
 <20150209005503.3fad39c7@bbrezillon>
Date: Tue, 10 Feb 2015 20:50:41 +0100
In-Reply-To: <20150209005503.3fad39c7@bbrezillon> (Boris Brezillon's message
 of "Mon, 9 Feb 2015 00:55:03 +0100")
Message-ID: <871tlx7dgu.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: thomas.petazzoni@free-electrons.com, zmxu@marvell.com,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 ezequiel.garcia@free-electrons.com, jszhang@marvell.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

> On Tue, 27 Jan 2015 15:10:12 +0100
> Antoine Tenart <antoine.tenart@free-electrons.com> wrote:
>
>> The nand controller on Marvell Berlin SoC reuse the pxa3xx nand driver
>> as it quite close. The process of sending commands can be compared to
>> the one of the Marvell armada 370: read and write commands are done in
>> chunks.
>> 
>> But the Berlin nand controller has some other specificities which
>> require some modifications of the pxa3xx nand driver:
>> - there are no IRQ available so we need to poll the status register: we
>>   have to use our own cmdfunc Berlin function, and early on the probing
>>   function.
>> - PAGEPROG are very different from the one used in the pxa3xx driver,
>>   so we're using a specific process for this one
>> - the SEQIN command is equivalent to a READ0 command
>> - the RNDOUT command must be used to perform a read operation, and the
>>   command is not NAND_CMD_RNDOUT
>> - the ERASE1 command is specific (0xd060)
>> 
>> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>

Given all the differences, the PIO mode instead of the current interrupt model,
and the berlin specific functions (nand_start, ...), wouldn't it be an idea to :
 - extract the common functions to mrvl-nand-lib.c
 - the remaining would be in pxa3xx_nand.c
 - the new code will be in berlin_nand.c

All these ifs per variant will add complexity to the current driver, won't they
?

Cheers.

--
Robert
