Received: from mo1501.tsb.2iij.net ([210.149.48.173] helo=mo.tsb.2iij.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2dA9-0001j6-LW
 for linux-mtd@lists.infradead.org; Thu, 12 Oct 2017 13:04:36 +0000
Subject: Re: [PATCH -next v2] mtd: nand: Add support for Toshiba BENAND
 (Built-in ECC NAND)
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, dwmw2@infradead.org
References: <1505971922-4994-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
 <20170921092849.6f1ba4b8@bbrezillon>
 <34d612f6-a479-21e7-f0aa-734e647d5942@toshiba.co.jp>
 <20170926231549.40c09c5d@bbrezillon>
 <fa307950-6085-acf9-aae3-725b9c2a60af@toshiba.co.jp>
 <20171005093126.78616d74@bbrezillon>
From: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Message-ID: <484831d8-1bd7-f714-7934-863f2ad0b200@toshiba.co.jp>
Date: Thu, 12 Oct 2017 22:03:23 +0900
MIME-Version: 1.0
In-Reply-To: <20171005093126.78616d74@bbrezillon>
Content-Type: text/plain; charset=utf-8
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

On 2017/10/05 16:31, Boris Brezillon wrote:
> On Thu, 5 Oct 2017 16:24:08 +0900
> KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp> wrote:
>>>>>> @@ -39,9 +105,43 @@ static void toshiba_nand_decode_id(struct nand_chip *chip)
>>>>>>  
>>>>>>  static int toshiba_nand_init(struct nand_chip *chip)
>>>>>>  {
>>>>>> +	struct mtd_info *mtd = nand_to_mtd(chip);
>>>>>> +
>>>>>>  	if (nand_is_slc(chip))
>>>>>>  		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
>>>>>>  
>>>>>> +	if (nand_is_slc(chip) && (chip->id.data[4] & 0x80)) {
>>>>>> +		/* BENAND */
>>>>>> +
>>>>>> +		/*
>>>>>> +		 * We can't disable the internal ECC engine, the user
>>>>>> +		 * has to use on-die ECC, there is no alternative.
>>>>>> +		 */
>>>>>> +		if (chip->ecc.mode != NAND_ECC_ON_DIE) {
>>>>>> +			pr_err("On-die ECC should be selected.\n");
>>>>>> +			return -EINVAL;
>>>>>> +		}    
>>>>>
>>>>> According to your previous explanation that's not exactly true. Since
>>>>> ECC bytes are stored in a separate area, the user can decide to use
>>>>> another mode without trouble. Just skip the BENAND initialization when
>>>>> mode != NAND_ECC_ON_DIE and we should be good, or am I missing something?    
>>>>
>>>> I am asking to product department to confirm it.  
>>>
>>> I'm almost sure this is the case ;-).  
>>
>> According to the command sequence written in BENAND's datasheet, the status
>> of the internal ECC must be checked after reading. To do that, ecc.mode has been
>> set to NAND_ECC_ON_DIE and the status of the internal ECC is checked through 
>> the 0x70 or 0x7A command. That's the reason we are returning EINVAL here.
> 
> But the status will anyway be retrieved, and what's the point of
> checking the ECC flags if the user wants to use its own ECC engine? I
> mean, since you have the whole OOB area exposed why would you prevent
> existing setup from working (by existing setup I mean those that already
> have a BENAND but haven't modified their driver to accept ON_DIE_ECC).
> 
> Maybe I'm missing something, but AFAICT it's safe to allow users to
> completely ignore the on-die ECC engine and use their own, even if
> that means duplicating the work since on-die ECC cannot be disabled on
> BENAND devices.

If user host controller ECC engine can support 8bit ECC or more ,
Toshiba offers 24nm SLC NAND products (not BENAND).  If user host
controller ECC engine is less that 8bit ECC (for example: 1bit or
4bit ECC) Toshiba offers BENAND.  When using BENAND, checking
BENAND own ECC status (ECC flag) is required as per BENAND
product datasheet. Ignoring BENAND on-die ECC operation status,
and rely only on host 1 bit ECC or 4 bit ECC status, is not
recommended because the host ECC capability is inferior to BENAND
8bit ECC and data refresh or other operations may not work
properly.  Also when using BENAND, turning off Host ECC is
recommended because this can eliminate the latency due to double
ECC operation(by both host & BENAND).

-- YOSHI
