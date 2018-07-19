Received: from gateway33.websitewelcome.com ([192.185.145.190])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgBVD-0005X9-VA
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2018 16:10:05 +0000
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway33.websitewelcome.com (Postfix) with ESMTP id DB8BD3AEA8
 for <linux-mtd@lists.infradead.org>; Thu, 19 Jul 2018 11:09:39 -0500 (CDT)
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Wan ZongShun <mcuos.com@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20180710132902.GA13541@embeddedor.com>
 <20180718100309.49c5452a@xps13>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] mtd: nuc900_nand: mark expected switch fall-through
Message-ID: <c789531d-809b-a921-252e-7c38c7821b55@embeddedor.com>
Date: Thu, 19 Jul 2018 11:09:37 -0500
MIME-Version: 1.0
In-Reply-To: <20180718100309.49c5452a@xps13>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel,

On 07/18/2018 03:03 AM, Miquel Raynal wrote:
> Hi Gustavo,
> 
> Prefix should be "mtd: rawnand: nuc900:"
> 

Oh OK. I'll fix it.

> "Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote on Tue, 10 Jul
> 2018 08:29:02 -0500:
> 
>> In preparation to enabling -Wimplicit-fallthrough, mark switch cases
>> where we are expecting to fall through.
>>
>> Addresses-Coverity-ID: 1471717 ("Missing break in switch")
>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>> ---
>>  drivers/mtd/nand/raw/nuc900_nand.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/raw/nuc900_nand.c b/drivers/mtd/nand/raw/nuc900_nand.c
>> index af5b32c9..53a9f6c 100644
>> --- a/drivers/mtd/nand/raw/nuc900_nand.c
>> +++ b/drivers/mtd/nand/raw/nuc900_nand.c
>> @@ -191,8 +191,9 @@ static void nuc900_nand_command_lp(struct mtd_info *mtd, unsigned int command,
>>  		return;
>>  
>>  	case NAND_CMD_READ0:
>> -
>>  		write_cmd_reg(nand, NAND_CMD_READSTART);
>> +		/* fall through */
> 
> Have you checked this is actually the right thing to do?
> 

Actually, no. My first impression was that due to the time this code has been
there, this might be a missing-break false positive. But, now that I'm double
checking, it may well be that this is an actual missing-break bug.

I can send a patch to fix this, but as I'm not familiar with the code, it'd be
of great help if someone could help me to verify this.

Thanks for the feedback.
--
Gustavo
