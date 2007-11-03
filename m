Received: from post-24.mail.nl.demon.net ([194.159.73.194])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IoK5Q-0008SL-Pj
	for linux-mtd@lists.infradead.org; Sat, 03 Nov 2007 10:35:03 -0400
Message-ID: <472C8723.1090303@m8.nl>
Date: Sat, 03 Nov 2007 15:35:15 +0100
From: "M8 (Servaes Joordens)" <Servaes.Joordens@m8.nl>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: address lines
References: <472C5368.3060306@m8.nl>	<1194090374.9405.42.camel@pmac.infradead.org>
	<472C6473.8020502@m8.nl>	<1194091981.9405.47.camel@pmac.infradead.org>
	<472C694C.7020103@m8.nl>
	<1194092966.9405.51.camel@pmac.infradead.org>
In-Reply-To: <1194092966.9405.51.camel@pmac.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: mtd-forum <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Sat, 2007-11-03 at 13:27 +0100, M8 (Servaes Joordens) wrote:
>   
>> How do I enable my own driver file based on sbc_gxx.c? I cannot find
>> an configuration option in the kernel by menuconfig.
>>     
>
> Copy sbc_gxx.c to create your own driver. Copy the configuration option
> in drivers/mtd/maps/Kconfig too, renaming it appropriately and giving it
> appropriate dependencies. Add an appropriate line in
> drivers/mtd/maps/Makefile, using your new config option and your new
> filename.
>
>   
physmap is still active next to my new driver with complex mappings. Is 
this correct, or should I disable the configuration option for physmap?



-- 

Servaes Joordens

-------------------------------------------
M8
Tappersweg 29
2031ET	Haarlem
The Netherlands
Tel:	+31 23 5311122
Mob:	+31 6 51183379
Fax:	+31 23 5322388

VAT-ID: nl-813029090B01
kvk:	34131430 Haarlem
