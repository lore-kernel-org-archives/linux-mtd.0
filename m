Received: from mo1500.tsb.2iij.net ([210.149.48.172] helo=mo.tsb.2iij.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIWAy-0003Pk-KO
 for linux-mtd@lists.infradead.org; Wed, 07 Jun 2017 08:18:50 +0000
Subject: Re: [PATCH -next] mtd: nand: Add support for Toshiba BENAND (Built-in
 ECC NAND)
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1495761335-20535-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
 <20170526182254.6a4f98c8@bbrezillon>
 <ea24c8c5-4607-6018-bca2-3eb7deaff5b9@toshiba.co.jp>
 <20170606231119.5f0fcf85@bbrezillon>
From: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Message-ID: <aaf3fd1a-1fcc-1b5f-cef8-cb28dc25be0b@toshiba.co.jp>
Date: Wed, 7 Jun 2017 17:17:29 +0900
MIME-Version: 1.0
In-Reply-To: <20170606231119.5f0fcf85@bbrezillon>
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

On 2017/06/07 6:11, Boris Brezillon wrote:
> On Mon, 5 Jun 2017 14:36:23 +0900
> KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp> wrote:
> 
>> Hi Boris,
>>
>> Thank you very much for your detailed review.
>> I just comming back from busy week for conference and started to look it.
>>
>> I have a question regarding to the following comment.
>>
>>>>  static int toshiba_nand_init(struct nand_chip *chip)
>>>>  {
>>>> +	struct mtd_info *mtd = nand_to_mtd(chip);
>>>> +
>>>>  	if (nand_is_slc(chip))
>>>>  		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
>>>>  
>>>> +	if (chip->ecc.mode == NAND_ECC_BENAND) {
>>>> +		chip->ecc.options = NAND_ECC_CUSTOM_PAGE_ACCESS;
>>>> +		chip->ecc.bytes = 0;  
>>>
>>> It should be set to 16 according to the datasheet. But I guess this is
>>> not exactly true. I'm pretty sure we can use some of these bytes to
>>> store real data. Assuming you're using BCH, only 13bytes are needed for
>>> 8bits/512bytes strength, and I guess the BBM region is also left
>>> untouched (first 2 bytes of the OOB region).  
>>
>> On BENAND, all OOB reginon can be used by user (driver). The calculated
>> ECC data stored into other isolated area which is ubable to access from user.
>> This is why chip->ecc.bytes = 0.
> 
> Oh, nice!
> 
>> To make sure this specification, I also checked the BENAND datasheet
>> but unfortunatelly it was undocumented. Sorry for this confusion.
> 
> No problem. Do you think you can update the datasheet (or ask someone
> who can) to clarify this aspect? As you said, it's really not clear
> that these ECC bytes are actually stored in a dedicated region that is
> invisible to users.

Thank you for your comment. I asked to the product department about this.
They say they are confirming whether they can update our product datasheet or not.

-- Yoshi
