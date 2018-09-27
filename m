Received: from mail.bugwerft.de ([2a03:6000:1011::59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5QUr-0004uT-HY
 for linux-mtd@lists.infradead.org; Thu, 27 Sep 2018 07:14:03 +0000
Subject: Re: [PATCH] mtd: rawnand: marvell: check for RDY bits after enabling
 the IRQ
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20180926212353.13399-1-daniel@zonque.org>
 <55f805fcf236481b869ba097a7db0194@svr-chch-ex1.atlnz.lc>
 <9b6db42cceb5424b9e0eca2704e0f2f2@svr-chch-ex1.atlnz.lc>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <a3846a05-ba03-87ac-12ab-3986723fc0e0@zonque.org>
Date: Thu, 27 Sep 2018 09:13:28 +0200
MIME-Version: 1.0
In-Reply-To: <9b6db42cceb5424b9e0eca2704e0f2f2@svr-chch-ex1.atlnz.lc>
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

Hi,

On 27/9/2018 1:42 AM, Chris Packham wrote:
> On 27/09/18 11:33, Chris Packham wrote:
>> On 27/09/18 09:24, Daniel Mack wrote:

>>> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
>>> index 666f34b58dec..e96ec7b9a152 100644
>>> --- a/drivers/mtd/nand/raw/marvell_nand.c
>>> +++ b/drivers/mtd/nand/raw/marvell_nand.c
>>> @@ -613,7 +613,8 @@ static int marvell_nfc_wait_cmdd(struct nand_chip *chip)
>>>     static int marvell_nfc_wait_op(struct nand_chip *chip, unsigned int timeout_ms)
>>>     {
>>>     	struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
>>> -	int ret;
>>> +	int ret = -EALREADY;
>>
>> Won't this cause us to hit the if (!ret) below if we don't end up
>> calling wait_for_completion_timeout()?
> 
> Nope boolean logic fail.

Yup :)

>> In fact I did just hit something
>> like this on my Armada-385 based board
>>
>> marvell-nfc f10d0000.nand-controller: Timeout waiting for RB signal
>> ubi0 warning: do_sync_erase: error -5 while erasing PEB 755, retry
>>
> 
> But this still might be something else, it doesn't happen regularly. For
> what it's worth
> 
> Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Thanks. Did you see the issue that I described without that patch?


Cheers,
Daniel
