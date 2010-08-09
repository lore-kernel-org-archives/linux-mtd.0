Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OiObk-0002h1-EC
	for linux-mtd@lists.infradead.org; Mon, 09 Aug 2010 09:25:25 +0000
Message-ID: <4C5FC97E.3030506@parrot.com>
Date: Mon, 9 Aug 2010 11:25:18 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Florian Fainelli <ffainelli@freebox.fr>
Subject: Re: [PATCH] NAND: add support for reading ONFI parameters from NAND
	device
References: <201007290047.06394.ffainelli@freebox.fr>
	<201007291051.38278.ffainelli@freebox.fr>
	<4C568F1D.4020007@parrot.com>
	<201008021355.52744.ffainelli@freebox.fr>
In-Reply-To: <201008021355.52744.ffainelli@freebox.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Brian Norris <norris@broadcom.com>, Maxime Bizon <mbizon@freebox.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Florian,

Florian Fainelli a écrit :
> Hi Matthieu,
> 
> On Monday 02 August 2010 11:25:49 Matthieu CASTET wrote:
>> Florian Fainelli a écrit :
>>> Hi Matthieu,
>>>
>>> On Thursday 29 July 2010 09:54:20 Matthieu CASTET wrote:
>>>> Hi,
>>>>
>>>>
>>>> Also you don't handle endianness (integer are little endian) for value
>>>> in nand_onfi_params.
>>> Yes, so far the drivers using those values were doing the correct endian
>>> conversion when they need to use them.
>> In that case use le16, le32, ... type. Also prefer kernel type over
>> uintx_t type.
>>
>>>> This won't work this unknown nand, and not work with some LP nand that
>>>> doesn't provide additional id bytes.
>>> So how do you see things regarding the provisioning of the relevant ONFI
>>> parameters?
>> I will see something like in the patch attached in
>> http://article.gmane.org/gmane.linux.drivers.mtd/30935.
>>
>> ONFI parsing is done early in nand_get_flash_type (unknow chip or LP nand).
>> If the ONFI parsing is ok we bypass the old identification method
>> (additional id bytes).
> 
> Looks ok to me.
> 
>> As an example I attach a patch that mix your patch and mine.
>>
>>
>> Matthieu
>>
>> PS : the NAND_ONFI flags seems useless, we can use onfi_version (0 means
>> no onfi).
> 
> Right, thanks for noticing that.
> 
> I got a couple of comments on your patch that I inlined, the rest looks
> good.
> --

> +#if 1
> +       chip->onfi_version = 0;
> +       if (!type->name || !type->pagesize) {
> +               /* try ONFI for unknow chip or LP */
> +               chip->cmdfunc(mtd, NAND_CMD_READID, 0x20, -1);
> +               if (chip->read_byte(mtd) == 'O' &&
> +                       chip->read_byte(mtd) == 'N' &&
> +                       chip->read_byte(mtd) == 'F' &&
> +                       chip->read_byte(mtd) == 'I') {
> 
> Why not use what was in our original patch and do the memcmp? That looks
> cleaner to me and allows to invert the logic on the if statement to get the
> code cleaner. That's just cosmetic anyway.
I wanted to avoid to use read_buf, because some advanced controller 
(those who implement cmdfunc) need to overrides all io access.
But some driver assumed  that nand_scan_ident only used read_byte. That 
the case of the denali driver [1]. Using it will cause random read in 
memory and likely a kernel panic.

But we need read_buf for reading onfi page. Also these advanced 
controllers will break because they won't handle correctly in cmdfunc 
new NAND_CMD_READID and NAND_CMD_PARAM.

I don't know what the best way to handle them.


> +                       if (i < 3) {
> +                               /* check version */
> +                               int val = le16_to_cpu(p->revision);
> +                               if (!is_power_of_2(val) || val == 1 || val > (1 << 4)) {
> 
> the !is_power_of_2 check does not work for ONFI version 2.1 (3), so I would only
> keep the two other checks.
> 
Ok.

Will you take care to post a new patch ?


Matthieu


[1]
/* register the driver with the NAND core subsystem */
     denali->nand.select_chip = denali_select_chip;
     denali->nand.cmdfunc = denali_cmdfunc;
     denali->nand.read_byte = denali_read_byte;
     denali->nand.waitfunc = denali_waitfunc;

     /* scan for NAND devices attached to the controller
      * this is the first stage in a two step process to register
      * with the nand subsystem */
     if (nand_scan_ident(&denali->mtd, LLD_MAX_FLASH_BANKS, NULL))
