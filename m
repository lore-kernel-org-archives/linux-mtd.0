Received: from mail.lingnu.com ([199.203.56.105])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OEGPi-000872-Os
	for linux-mtd@lists.infradead.org; Tue, 18 May 2010 06:36:28 +0000
Message-ID: <4BF235AE.3030903@shemesh.biz>
Date: Tue, 18 May 2010 09:37:34 +0300
From: Shachar Shemesh <shachar@shemesh.biz>
MIME-Version: 1.0
To: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
Subject: Re: Wrong flash type in m25p80 driver
References: <4BF011D7.4010907@shemesh.biz>	<AANLkTilU5vfVxCH9Ch7K6IUQAImLN83fewQdBptzeWiX@mail.gmail.com>	<4BF041A3.70304@shemesh.biz>	<AANLkTikIBhFudwi5DiiqROyhQjOSjJnyxxVoWLrE9ztj@mail.gmail.com>	<4BF04DBE.5020309@shemesh.biz>	<AANLkTikjeciIH0tdmWIlgstKjaiCw66KwIImc-kmM5hI@mail.gmail.com>
	<4BF173E5.2030304@gmx.net>
In-Reply-To: <4BF173E5.2030304@gmx.net>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

I should point out that I have sent a retraction to the patch, but my 
messages got held up for moderation with "suspicious header" and no 
further explanation. I'm taking a wild guess as to the reason, in the 
hope that this message does get through. If it does, holding messages 
with "list does not support HTML or mixed format mail" will be a more 
useful error report.

Carl-Daniel Hailfinger wrote:
>   
>   
>
> The ST M25P80 has a minimum write size of 1 bit (datasheet is a bit
> unclear, could also be 1 byte) and a maximum write size of 256 bytes.
>
>   
I have not studies the M25P80 data sheet, but did the M25P32 and the 
MX25L6405D chips, and I believe all SPI flahses handled by the m25p80 
driver behave the same in that regard (which is why they were clamped 
together to begin with).

The minimal "program" length is 1 byte, but since a program can only 
change a 1 bit into 0, effectively, setting a word to "11...101...11", 
where the zero is at the bit you want to set, will program 1 bit.
>
> There's always the option of looking at how flashrom
> <http://www.flashrom.org/> handles those chips. flashrom an
> OS-independent userspace tool specialized on chips which are used for
> BIOS/firmware, but it handles some other flash chips as well.
>   
It lists them as "SPI", and the chip support page claims, at least for 
most of them, that it does not know how to erase them 
(http://www.flashrom.org/Supported_hardware).

Shachar

-- 
Shachar Shemesh
Lingnu Open Source Consulting Ltd.
http://www.lingnu.com
