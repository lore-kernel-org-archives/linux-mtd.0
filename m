Received: from mail.bugwerft.de ([46.23.86.59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5QW6-00050n-EA
 for linux-mtd@lists.infradead.org; Thu, 27 Sep 2018 07:15:31 +0000
Subject: Re: [PATCH] mtd: rawnand: marvell: check for RDY bits after enabling
 the IRQ
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org,
 chris.packham@alliedtelesis.co.nz, stable@vger.kernel.org
References: <20180926212353.13399-1-daniel@zonque.org>
 <20180927082033.0b5295de@bbrezillon>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <be4d8ea3-a698-aaaa-05db-555580987830@zonque.org>
Date: Thu, 27 Sep 2018 09:14:46 +0200
MIME-Version: 1.0
In-Reply-To: <20180927082033.0b5295de@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On 27/9/2018 8:20 AM, Boris Brezillon wrote:
> On Wed, 26 Sep 2018 23:23:53 +0200
> Daniel Mack <daniel@zonque.org> wrote:

>>   	marvell_nfc_enable_int(nfc, NDCR_RDYM);
>> -	ret = wait_for_completion_timeout(&nfc->complete,
>> -					  msecs_to_jiffies(timeout_ms));
>> +
>> +	/*
>> +	 * Check if the NDSR_RDY bits have already been set before the
>> +	 * interrupt was enabled.
>> +	 */
>> +	st = readl_relaxed(nfc->regs + NDSR);
>> +	if (!(st & (NDSR_RDY(0) | NDSR_RDY(1))))
>> +		ret = wait_for_completion_timeout(&nfc->complete,
>> +						  msecs_to_jiffies(timeout_ms));
> 
> Or you can just do:
> 
> 	st = readl_relaxed(nfc->regs + NDSR);
> 	if (st & (NDSR_RDY(0) | NDSR_RDY(1)))
> 		complete(&nfc->complete);
> 
> 	ret = wait_for_completion_timeout(&nfc->complete,
> 					  msecs_to_jiffies(timeout_ms));
> 	...
> 

Ah, yes. Thanks.

> Of course, it's less efficient than your version, but I find it clearer
> than the -EALREADY approach.

Well, this issue usually takes minutes to trigger, so efficiency is not 
a good argument :)

I'll resend a v2.


Thanks,
Daniel
