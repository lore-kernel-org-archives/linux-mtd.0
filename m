Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OjodZ-00049L-Ig
	for linux-mtd@lists.infradead.org; Fri, 13 Aug 2010 07:25:10 +0000
Message-ID: <4C64F34F.8020402@parrot.com>
Date: Fri, 13 Aug 2010 09:25:03 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Florian Fainelli <ffainelli@freebox.fr>, Brian Norris <norris@broadcom.com>
Subject: Re: [PATCH 3/3] NAND: add support for reading ONFI parameters from
	NAND device
References: <201008121453.50207.ffainelli@freebox.fr>
	<4C644426.9010106@broadcom.com>
	<201008122147.54733.ffainelli@freebox.fr>
In-Reply-To: <201008122147.54733.ffainelli@freebox.fr>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Florian Fainelli a écrit :
> Hello Brian,
> 
> Le Thursday 12 August 2010 20:57:42, Brian Norris a écrit :
>> Hello,
>>
>> I've got a few comments and a patch; I cannot test them, though,
>> just build.
>>
>> On 08/12/2010 05:53 AM, Florian Fainelli wrote:
>>> +static u16 onfi_crc(u16 crc, unsigned char const *p, size_t len)
>>> +{
>>> +   int i;
>>> +   while (len--) {
>>> +           crc ^= *p++<<  8;
>>> +           for (i = 0; i<  8; i++)
>>> +                   crc = (crc<<  1) ^ ((crc&  0x8000) ? 0x8005 : 0);
>>> +   }
>>> +   return crc;
>>> +}
>> Can this function safely be replaced by the library function crc16?
>> #include <linux/crc16.h>
>> u16 crc16(u16 crc, u8 const *buffer, size_t len);
> 
> Certainly, thanks for noticing.
No it is not the same crc16 endianness, one is big the other is little.



>>
>>> +
>>> +   chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
>>> +
>>> +   /* Read entire ID string */
>>> +
>>> +   for (i = 0; i<  8; i++)
>>> +           id_data[i] = chip->read_byte(mtd);
>>> +
>>>
>>>     if (!type->name)
>>>
>>>             return ERR_PTR(-ENODEV);
>> Do we really need a third chance to read the ID bytes? It seems like we
>> can just read the whole string the second time instead of shortening it
>> to two bytes and waiting to reread all 8 bytes until after the ONFI scan.
Well onfi define only 2 bytes for id string, I though it was safer to 
not read beyond specification for onfi nand.



>>
>>> +                                   if (val&  (1<<  1))
>>> +                                           chip->onfi_version = 10;
>>> +                                   else if (val&  (1<<  2))
>>> +                                           chip->onfi_version = 20;
>>> +                                   else if (val&  (1<<  3))
>>> +                                           chip->onfi_version = 21;
>>> +                                   else
>>> +                                           chip->onfi_version = 22;
>> I cannot currently test ONFI on a real chip, but shouldn't the order of
>> these conditionals be switched? It seems possible that the bits could be
>> set high for more the one version (e.g., a chip supports 1.0 and 2.0, so
>> we have val = 00000110 (binary), so the current logic would succeed at 1.0,
>> not realizing that it supports 2.0. Again, I don't know about the actual
>> behavior in a real chip, but anyway, it seems harmless to reverse this.
> 
> I think you are right about this. We only have ONFI 1.0 compliant chips right
> now, so we can't know for sure, but as you say, this is harmless.
ok


Matthieu
