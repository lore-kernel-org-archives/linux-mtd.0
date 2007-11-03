Received: from post-25.mail.nl.demon.net ([194.159.73.195])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IoHmA-0006Ez-Of
	for linux-mtd@lists.infradead.org; Sat, 03 Nov 2007 08:07:01 -0400
Message-ID: <472C6473.8020502@m8.nl>
Date: Sat, 03 Nov 2007 13:07:15 +0100
From: "M8 (Servaes Joordens)" <Servaes.Joordens@m8.nl>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>,
	mtd-forum <linux-mtd@lists.infradead.org>
Subject: Re: address lines
References: <472C5368.3060306@m8.nl>
	<1194090374.9405.42.camel@pmac.infradead.org>
In-Reply-To: <1194090374.9405.42.camel@pmac.infradead.org>
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

David,

Yes you did. I did the following:

- I changed the call to simple_map_init(xxx) in physmap.c to
my_simple_map_init(xxx)
- I add the bank-switching routines in physmap.c and link them via
my_simple_map_init(xxx)

I put an printk in every bank-switching routine. I does work properly in the begining, but then I get the following prints: (I added a printk in every function to check the caling order of things)

cfi_cmdset_001.c: cfi_intelext_point
cfi_cmdset_001.c: do_point_onechip
cfi_cmdset_001.c: get_chip
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000: 0x890a in
stead

I expected that prior to error-report a read or write action to the flash is done. In that case I should have seen an printk saying physmap.c:bank_switching_map_read or physmap.c:bank_switching_map_write.

Servaes




David Woodhouse wrote:
> On Sat, 2007-11-03 at 11:54 +0100, M8 (Servaes Joordens) wrote:
>   
>> I took a closer look at the bank-switching problem. The situation is:
>>
>> - I have an 4Mb Flash chip MT28F320J3FS-11
>> - A0-A19 are connected to the data-bus
>> - A20 is connected to GPIO PF4
>>
>> So the hardware probe detects 4MB flash in 1 chip and tries to access
>> it 
>> in a normal manner. How should I solve this? I got a patch from the 
>> manufacturer of the hardware for the file cfi_cmdset_0001.c, but I do 
>> wonder if that is the correct way to do it?
>>     
>
> No, it isn't. The correct way to do it is a fairly trivial 'complex
> mapping' driver, which ensures that the GPIO is set appropriately for
> the high bit of the address, before each access. Didn't I already point
> you to examples?
>
>   


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
