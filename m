Received: from mail.gmx.net ([213.165.64.20])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OE3Wm-0000xH-H0
	for linux-mtd@lists.infradead.org; Mon, 17 May 2010 16:50:54 +0000
Message-ID: <4BF173E5.2030304@gmx.net>
Date: Mon, 17 May 2010 18:50:45 +0200
From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
MIME-Version: 1.0
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: Wrong flash type in m25p80 driver
References: <4BF011D7.4010907@shemesh.biz>	<AANLkTilU5vfVxCH9Ch7K6IUQAImLN83fewQdBptzeWiX@mail.gmail.com>
	<4BF041A3.70304@shemesh.biz>	<AANLkTikIBhFudwi5DiiqROyhQjOSjJnyxxVoWLrE9ztj@mail.gmail.com>
	<4BF04DBE.5020309@shemesh.biz>
	<AANLkTikjeciIH0tdmWIlgstKjaiCw66KwIImc-kmM5hI@mail.gmail.com>
In-Reply-To: <AANLkTikjeciIH0tdmWIlgstKjaiCw66KwIImc-kmM5hI@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Shachar Shemesh <shachar@shemesh.biz>,
	Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17.05.2010 06:54, Mike Frysinger wrote:
> On Sun, May 16, 2010 at 15:55, Shachar Shemesh wrote:
>   
>> Mike Frysinger wrote:
>>     
>>> so your answer is "there is no problem with calling it NOR flash"
>>>
>>> if it looks like a duck, quacks like a duck, and walks like a duck,
>>> then why waste time calling it a DataDuck ?  for all intents and
>>> purposes, all the kernel code/utilities that work with the flashes can
>>> treat these SPI flashes as NOR flashes and everything works fine.
>>>       
>> Actually, that is not the case. Not even remotely.
>>
>> NOR flashes (and the m25p80 driver broadcasts it this way) have the ability
>> to change individual bytes (and, some flashes, individual bits). The SPI
>> flashes need to erase an entire block. NOR flashes are accessible via the
>> data bus, these require complicated SPI transactions. They neither quack nor
>> look anywhere near the same.
>>     
>
> you havent shown how the current behavior results in non-working
> flashes.  you probably can claim that things dont work as optimally as
> possible according to the hardware, but as you noted, people work on
> what interests/annoys them rather than what other people report.
>   

ST M25P80 can change individual bytes.


>> You might want to claim that they are NAND flashes, but, again, those are
>> somewhat different. Dataflashes are the closest these come to, as far as I
>> can tell.
>>     
>
> it doesnt make sense to lump SPI and NAND together because NAND allows
> for bad blocks.  both NOR and SPI are guaranteed to be good throughout
> or the device is dead.  so for all practical uses thus far, SPI and
> NOR operate the same way.
>   

Yes.


>> I am not so sure about the "properties which other SPI flashes do not". Not,
>> at least, according to my research (which does not beat experience, but does
>> beat obscure abstract statements).
>>     
>
> iirc, dataflashes allow programming on individual bytes just like NOR
> flashes.  most serial flashes (like the ST micro that started the SPI
> flash driver in the first place) have to be programmed on a page
> basis.  dataflashes also have more flexible erase structures (4kb,
> 32kb, or 64kb) while ST micro can only be erased at 64kb sectors.
>   

The ST M25P80 has a minimum write size of 1 bit (datasheet is a bit
unclear, could also be 1 byte) and a maximum write size of 256 bytes.


> my point is just that calling all SPI flashes "dataflashes" is
> inherently wrong since only Atmel makes dataflashes.  it's also a bit
> funny since you started off the thread with the complaint that calling
> SPI flashes NOR flashes was wrong because SPI flashes arent NOR
> flashes.  if you're going to declare a new category for SPI flashes,
> then it should be something that applies to all the current SPI
> flashes (just look in the m25p80.c driver to see all the ones
> supported).
>   

DataFlash is special because some of the chips have a user configurable
page size: 512 or 528 Bytes per page.

There's always the option of looking at how flashrom
<http://www.flashrom.org/> handles those chips. flashrom an
OS-independent userspace tool specialized on chips which are used for
BIOS/firmware, but it handles some other flash chips as well.


Regards,
Carl-Daniel

-- 
http://www.hailfinger.org/
