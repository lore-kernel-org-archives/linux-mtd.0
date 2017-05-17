Received: from smtp5-g21.free.fr ([2a01:e0c:1:1599::14])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAxJH-0000c9-2M
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 11:40:08 +0000
Subject: Re: [PATCH] nand_base: optimize checking of erased buffers
From: Mason <slash.tmp@free.fr>
To: Pavel Machek <pavel@ucw.cz>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, mark.marshall@omicronenergy.com,
 b44839@freescale.com, prabhakar@freescale.com
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170419221507.GA24914@amd> <20170420002748.5c76c9b9@bbrezillon>
 <20170420114057.GA4705@amd> <20170421105107.GA7259@amd>
 <421c46b9-288f-42e9-5b2f-d93af1e8a418@free.fr>
Message-ID: <911d0a3d-1be8-31a6-3bd1-c173ec6435ad@free.fr>
Date: Wed, 17 May 2017 13:39:16 +0200
MIME-Version: 1.0
In-Reply-To: <421c46b9-288f-42e9-5b2f-d93af1e8a418@free.fr>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17/05/2017 13:27, Mason wrote:

> On 21/04/2017 12:51, Pavel Machek wrote:
> 
>> If we see ~0UL in flash, there's no need for hweight, and no need to
>> check number of bitflips. So this should be net win.
>>
>> Signed-off-by: Pavel Machek <pavel@denx.de>
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index b0524f8..96c27ec 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -1357,7 +1357,10 @@ static int nand_check_erased_buf(void *buf, int len, int bitflips_threshold)
>>  
>>  	for (; len >= sizeof(long);
>>  	     len -= sizeof(long), bitmap += sizeof(long)) {
>> -		weight = hweight_long(*((unsigned long *)bitmap));
> 
> I hadn't noticed this earlier. There is, obviously, an implicit
> requirement that 'buf' must be 4-byte aligned on 32-bit platforms,
> and 8-byte aligned on 64-bit platforms.
> 
> This is not true for my platform, as the ecc pointer is
> chip->oob_poi + 10

Doh! As Boris points out, the prologue/epilogue handle
all alignment & size issues.

Regards.
