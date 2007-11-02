Received: from post-23.mail.nl.demon.net ([194.159.73.193])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1Insqn-0001pE-M8
	for linux-mtd@lists.infradead.org; Fri, 02 Nov 2007 05:30:08 -0400
Message-ID: <472AEE28.9030103@m8.nl>
Date: Fri, 02 Nov 2007 10:30:16 +0100
From: "M8 (Servaes Joordens)" <Servaes.Joordens@m8.nl>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>,
	mtd-forum <linux-mtd@lists.infradead.org>
Subject: Re: bank switching
References: <472606D2.7020709@m8.nl>
	<1193749064.2915.169.camel@shinybook.infradead.org>
In-Reply-To: <1193749064.2915.169.camel@shinybook.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Mon, 2007-10-29 at 17:14 +0100, M8 (Servaes Joordens) wrote:
>   
>> I use the blackfin embedded uClinux environment. I want to change a 
>> flash chip-driver to support all four memory banks which are available. 
>> Right now, I have a driver which supports 1 memory bank of 2MB. I want 
>> to be able to use the other three memory banks also 2-4Mb, 4-6MB and 6-8MB.
>>
>> Memory bank selection is done by using general io pf4 and pf5. For 
>> instance: when  pf4 is enabled and pf5 is disabled I am writing in the 
>> region 2-4MB.
>>
>> What would be the correct way to change the chip driver? Do you have a 
>> template or tutorial on bank switching?
>>
>> The driver I want to change is: cfi_cmdset_0001.c
>>     
>
> No, that's the "chip driver". What you need to provide is a "map driver"
> which enables physical access (read/write cycles) to the flash device in
> question.
>
> See the MTD_COMPLEX_MAPPINGS config option, which turns simple things
> like 'read word' and 'write word' into out-of-line function calls in
> your map driver. And see the map drivers which do this already, like
> maps/sbc_gxx.c
>
>   
Now I enabled the MTD_COMPLEX_MAPPINGS. I changed the code in
map_funcs.c for the bank switching, but I get a problem with my ext2
partition in RAM. The RAM memory has another memory mapping (of course).
In what file should I make the changes?
I use the following files:
- mtd/cmdlinepart.c
- mtd/chips/cfi_probe.c
- mtd/chips/cfi_cmdset_0001.c
- mtd/maps/uclinux.c (for the root fs in RAM)
- mtd/maps/physmap.c (for the flash_memory)
- mtd/maps/map_funcs.c

My idea is:
- I change the call to simple_map_init(xxx) in physmap.c to
my_simple_map_init(xxx)
- I add the bank-switching routines in physmap.c and link them via
my_simple_map_init(xxx)

Is this the correct way to do it?




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
