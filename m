Received: from post-26.mail.nl.demon.net ([194.159.73.196])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1Iobnf-00025y-Q7
	for linux-mtd@lists.infradead.org; Sun, 04 Nov 2007 04:29:55 -0500
Message-ID: <472D9122.8010501@m8.nl>
Date: Sun, 04 Nov 2007 10:30:10 +0100
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
David,

I got everything working now, except for the fact that when I write 
anything to my jffs2 partition, it fails. The error report states that 
the disk is full. Do you have any idea's?

In the configuration, I disabled the map_funcs file and replace it with 
my own version.I had to write some code to distiguish between flash 
memory and ram. This works fine now.

regards,
Servaes





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
