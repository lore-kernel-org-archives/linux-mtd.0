Received: from 3.mo1.mail-out.ovh.net ([46.105.60.232])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNJY3-0004Jf-EU
 for linux-mtd@lists.infradead.org; Tue, 20 Jun 2017 13:50:28 +0000
Received: from player691.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 3CB8C7E331
 for <linux-mtd@lists.infradead.org>; Tue, 20 Jun 2017 15:49:46 +0200 (CEST)
Subject: Re: [PATCH 4/4] mtd: spi-nor: aspeed: use command mode for reads
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
References: <1492689397-4704-1-git-send-email-clg@kaod.org>
 <1492689397-4704-5-git-send-email-clg@kaod.org>
 <b28c97cc-1daf-c1dd-4a86-4f8bf6c46b2b@gmail.com>
 <66e385ec-6688-9ce7-1250-ec840201147e@kaod.org>
 <9c60f3f9-3f74-930d-07f9-9cb7cb8ba8f4@gmail.com>
 <d86528a8-7189-427b-dab7-69bc526c8fb0@kaod.org>
 <2bd0b105-7652-8917-4a1d-6f218eaf848e@atmel.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e360b04d-1eba-b9e1-5327-36d236182848@kaod.org>
Date: Tue, 20 Jun 2017 15:49:36 +0200
MIME-Version: 1.0
In-Reply-To: <2bd0b105-7652-8917-4a1d-6f218eaf848e@atmel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/20/2017 03:42 PM, Cyrille Pitchen wrote:
> Hi Cédric,
> 
> Le 20/06/2017 à 11:07, Cédric Le Goater a écrit :
>> [ fixing Cyrille email ] 
>>
>> On 04/20/2017 03:58 PM, Marek Vasut wrote:
>>> On 04/20/2017 03:53 PM, Cédric Le Goater wrote:
>>>> On 04/20/2017 03:31 PM, Marek Vasut wrote:
>>>>> On 04/20/2017 01:56 PM, Cédric Le Goater wrote:
>>>>>> When reading flash contents, try to use the "command mode" if the AHB
>>>>>> window configured for the flash module is big enough. Else, just fall
>>>>>> back to the "user mode" to perform the read.
>>>>>>
>>>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>>>> ---
>>>>>>
>>>>>>  Changes since initial version :
>>>>>>
>>>>>>  - rebased on current patchset which removed DMA support
>>>>>>
>>>>>>  drivers/mtd/spi-nor/aspeed-smc.c | 27 ++++++++++++++++++++++++++-
>>>>>>  1 file changed, 26 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>>>>>> index 60c020482946..43015aec4557 100644
>>>>>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>>>>>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>>>>>> @@ -394,6 +394,31 @@ static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
>>>>>>  
>>>>>>  	aspeed_smc_read_from_ahb(read_buf, chip->ahb_base, len);
>>>>>>  	aspeed_smc_stop_user(nor);
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static ssize_t aspeed_smc_read(struct spi_nor *nor, loff_t from, size_t len,
>>>>>> +			       u_char *read_buf)
>>>>>> +{
>>>>>> +	struct aspeed_smc_chip *chip = nor->priv;
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * The AHB window configured for the chip is too small for the
>>>>>> +	 * read offset. Use the "User mode" of the controller to
>>>>>> +	 * perform the read.
>>>>>> +	 */
>>>>>> +	if (from >= chip->ahb_window_size) {
>>>>>> +		aspeed_smc_read_user(nor, from, len, read_buf);
>>>>>> +		goto out;
>>>>>
>>>>> What about turning this into dumb if () {} else {} and dropping the goto ?
>>>>
>>>> yes, well, this is because I have other patches adding DMAs :
>>>>
>>>> 	https://github.com/legoater/linux/commit/6880924dc2cf7a47c446a708df528b72d9bf9134#diff-e466368d609006970aab53a7b840221fR575
>>>>
>>>> but as of today, the benefits in speed are to be proven and the current 
>>>> implementation does not support vmalloc'ed buffers. So I can drop the 
>>>> goto without too much regrets (if you insist :)
>>>
>>> Nah, if you have further plans with this code, I don't mind either way.
>>>
>>
>> OK let's keep that way.
>>
>> Do you think we can merge these four patches in the next window ? 
>>
> 
> I've planned to merge them in the spi-nor/next branch of l2-mtd within
> the next days if everything is OK.

That's the git repo : git://github.com/spi-nor/linux.git  ? 
 
> Last Friday I saw on patchwork that your patches were still waiting to
> be merged. I've just forgotten them sorry and last week-end I was not
> available to catch up.
> 
> I add a quick overview of the series, everything looks good. patch 2
> won't apply as is since flash_read no longer exists in 'struct spi_nor'
> so I will try to adapt your patch myself if I can.

Ah. I work on mainline generally, so I missed it.

> Otherwise I will ask you help to rebase it but I guess the modification
> will be quite straight forward.

Sure. Please don't hesitate to ping me. I will take a quick look
anyway.

Thanks,

C.
