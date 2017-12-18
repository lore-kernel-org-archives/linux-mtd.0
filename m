Received: from mail01.prevas.se ([62.95.78.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eQunV-0000Jw-Qv
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 12:45:37 +0000
Subject: Re: [PATCH] mtd: nand: pxa3xx: Fix READOOB implementation
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
CC: Richard Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Greg Cook <greg@morpheus.ws>,
 Miquel RAYNAL <miquel.raynal@free-electrons.com>, <stable@kernel.vger.org>
References: <20171218103245.22516-1-boris.brezillon@free-electrons.com>
 <CAAEAJfBXbWPTU3s=oyiRrxegvq7g0+HquUdehbd8pRi3hEJQ8Q@mail.gmail.com>
From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Message-ID: <4827ded9-a430-d6cf-4241-9d31ce2a89cd@prevas.dk>
Date: Mon, 18 Dec 2017 13:45:16 +0100
MIME-Version: 1.0
In-Reply-To: <CAAEAJfBXbWPTU3s=oyiRrxegvq7g0+HquUdehbd8pRi3hEJQ8Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 2017-12-18 13:33, Ezequiel Garcia wrote:
> On 18 December 2017 at 07:32, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
>> In the current driver, OOB bytes are accessed in raw mode, and when a
>> page access is done with NDCR_SPARE_EN set and NDCR_ECC_EN cleared, the
>> driver must read the whole spare area (64 bytes in case of a 2k page,
>> 16 bytes for a 512 page). The driver was only reading the free OOB
>> bytes, which was leaving some unread data in the FIFO and was somehow
>> leading to a timeout.
>>
>> We could patch the driver to read ->spare_size + ->ecc_size instead of
>> just ->spare_size when READOOB is requested, but we'd better make
>> in-band and OOB accesses consistent.
>> Since the driver is always accessing in-band data in non-raw mode (with
>> the ECC engine enabled), we should also access OOB data in this mode.
>> That's particularly useful when using the BCH engine because in this
>> mode the free OOB bytes are also ECC protected.
>>
>> Fixes: 43bcfd2bb24a ("mtd: nand: pxa3xx: Add driver-specific ECC BCH support")
>> Cc: <stable@kernel.vger.org>
>> Reported-by: Sean Nyekjær <sean.nyekjaer@prevas.dk>
>> Tested-by: Willy Tarreau <w@1wt.eu>
>> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>> ---
>>   drivers/mtd/nand/pxa3xx_nand.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
>> index 021374fe59dc..d1979c7dbe7e 100644
>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> @@ -961,6 +961,7 @@ static void prepare_start_command(struct pxa3xx_nand_info *info, int command)
>>
>>          switch (command) {
>>          case NAND_CMD_READ0:
>> +       case NAND_CMD_READOOB:
>>          case NAND_CMD_PAGEPROG:
>>                  info->use_ecc = 1;
>>                  break;
>> --
>> 2.11.0
>>
> Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>
> Thanks a lot Boris!

Tested-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>

Thanks
