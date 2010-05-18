Received: from mail.gmx.net ([213.165.64.20])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OELek-0004wF-TB
	for linux-mtd@lists.infradead.org; Tue, 18 May 2010 12:12:20 +0000
Message-ID: <4BF2841F.8000405@gmx.net>
Date: Tue, 18 May 2010 14:12:15 +0200
From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
MIME-Version: 1.0
To: Shachar Shemesh <shachar@shemesh.biz>
Subject: Re: Wrong flash type in m25p80 driver
References: <4BF011D7.4010907@shemesh.biz>	<AANLkTilU5vfVxCH9Ch7K6IUQAImLN83fewQdBptzeWiX@mail.gmail.com>	<4BF041A3.70304@shemesh.biz>	<AANLkTikIBhFudwi5DiiqROyhQjOSjJnyxxVoWLrE9ztj@mail.gmail.com>	<4BF04DBE.5020309@shemesh.biz>	<AANLkTikjeciIH0tdmWIlgstKjaiCw66KwIImc-kmM5hI@mail.gmail.com>
	<4BF173E5.2030304@gmx.net> <4BF235AE.3030903@shemesh.biz>
In-Reply-To: <4BF235AE.3030903@shemesh.biz>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18.05.2010 08:37, Shachar Shemesh wrote:
> Carl-Daniel Hailfinger wrote:
>> The ST M25P80 has a minimum write size of 1 bit (datasheet is a bit
>> unclear, could also be 1 byte) and a maximum write size of 256 bytes.
>>   
> I have not studies the M25P80 data sheet, but did the M25P32 and the
> MX25L6405D chips, and I believe all SPI flahses handled by the m25p80
> driver behave the same in that regard (which is why they were clamped
> together to begin with).
>
> The minimal "program" length is 1 byte, but since a program can only
> change a 1 bit into 0, effectively, setting a word to "11...101...11",
> where the zero is at the bit you want to set, will program 1 bit.

Yes. The situation is a bit complicated. Some flash chips will not
accept further writes to a location that has been written once even if
those further writes would only change more bits to 0. Such chips have
true 1 byte granularity. Other chips (and AFAIK the whole ST M25 series)
can do at least two writes per byte location as long as the second write
does not set any 0 bit to 1.


>> There's always the option of looking at how flashrom
>> <http://www.flashrom.org/> handles those chips. flashrom an
>> OS-independent userspace tool specialized on chips which are used for
>> BIOS/firmware, but it handles some other flash chips as well.
>>   
> It lists them as "SPI", and the chip support page claims, at least for
> most of them, that it does not know how to erase them
> (http://www.flashrom.org/Supported_hardware).

Thanks for pointing out that this page is misleading. The status "?"
means that it is untested and should work. Only a read "No" means
unsupported. I'll change the wiki to be more readable.

Regards,
Carl-Daniel

-- 
http://www.hailfinger.org/
