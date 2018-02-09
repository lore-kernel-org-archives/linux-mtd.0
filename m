Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ek4rW-0005Nn-Ir
 for linux-mtd@lists.infradead.org; Fri, 09 Feb 2018 09:20:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Fri, 09 Feb 2018 10:20:37 +0100
From: Stefan Agner <stefan@agner.ch>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: warn if hamming layout is used with too large
 ECC
In-Reply-To: <20180209095027.63da257d@bbrezillon>
References: <20180208233305.20583-1-stefan@agner.ch>
 <20180209095027.63da257d@bbrezillon>
Message-ID: <7ec8aa6337c59550f335957a34658a65@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09.02.2018 09:50, Boris Brezillon wrote:
> On Fri,  9 Feb 2018 00:33:05 +0100
> Stefan Agner <stefan@agner.ch> wrote:
> 
>> Warn in case a driver uses too large ECC with hamming layout.
>> This is especially helpful since hamming layout is the default
>> layout when using hardware ECC and no specific OOB layout is
>> specified.
>>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> ---
>>  drivers/mtd/nand/nand_base.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index 96c97588e1ba..2f3f43d0e288 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -197,6 +197,8 @@ static int nand_ooblayout_free_lp_hamming(struct mtd_info *mtd, int section,
>>  		return -EINVAL;
>>  	}
>>
>> +	WARN_ON(mtd->oobsize - ecc_offset < ecc->total);
>> +
> 
> Did you hit this problem? Anyway, if there's a case where the number of
> ECC bytes does not fit in the space reserved for ECC, there's a bug
> before this point, and this should be checked at init/probe time.
> 

Yes, I realized that vf610_nfc.c, which is currently is using the
hamming ooblayout. This probably crept in with commit 3cf32d180227
("mtd: nand: vf610: switch to mtd_ooblayout_ops").

When using 32-bit ECC mode the driver uses 60 bytes out of 64 bytes OOB,
so it actually fits into the OOB.

The layout is just bogus for that case. Surprisingly the oobavail
calculation ends up being correct, but only because the calculation
overflows twice:

mtd_ooblayout_count_bytes calls first with section 0, which results in
38. the second call leads to an overflow ("-36").
mtd_ooblayout_count_bytes then adds 38 to that overflow, which then
overflows again to the correct value of overall free bytes of 2... I did
not try actually using the free OOB area, I guess this would fail....

Of course the underlying issue that ooblayout for vf610_nfc.c is bogus
needs to be fixed, I will send a patch for that.

But some kind of sanity check somewhere might be worthwhile, I was a bit
surprised that this overflowing happens on a driver in operational use
and goes unnoticed. I realize that this patch is not ideal. Maybe making
length signed, then we could sanity check in
mtd_ooblayout_count_bytes...

--
Stefan

>>  	if (section == 0) {
>>  		oobregion->offset = 2;
>>  		oobregion->length = ecc_offset - 2;
