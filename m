Received: from post-23.mail.nl.demon.net ([194.159.73.193])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IoI6D-0007v1-IO
	for linux-mtd@lists.infradead.org; Sat, 03 Nov 2007 08:27:44 -0400
Message-ID: <472C694C.7020103@m8.nl>
Date: Sat, 03 Nov 2007 13:27:56 +0100
From: "M8 (Servaes Joordens)" <Servaes.Joordens@m8.nl>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>,
	mtd-forum <linux-mtd@lists.infradead.org>
Subject: Re: address lines
References: <472C5368.3060306@m8.nl>	
	<1194090374.9405.42.camel@pmac.infradead.org>
	<472C6473.8020502@m8.nl>
	<1194091981.9405.47.camel@pmac.infradead.org>
In-Reply-To: <1194091981.9405.47.camel@pmac.infradead.org>
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
> On Sat, 2007-11-03 at 13:07 +0100, M8 (Servaes Joordens) wrote:
>   
>> cfi_cmdset_001.c: cfi_intelext_point
>> cfi_cmdset_001.c: do_point_onechip
>> cfi_cmdset_001.c: get_chip
>> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000:0x890a instead
>>
>> I expected that prior to error-report a read or write action to the
>> flash is done. In that case I should have seen an printk saying
>> physmap.c:bank_switching_map_read or
>> physmap.c:bank_switching_map_write.
>>     
>
> Hm, yes. The 'point' method bypasses the normal access functions, on the
> assumption that the entire device is actually directly mappable. 
>
> The sbc_gxx driver to which I referred you sets map->phys = NO_XIP;
>
> Did you?
>
> I don't understand why you're messing with physmap.c when that isn't the
> one I told you to use as a template.
>   
How do I enable my own driver file based on sbc_gxx.c? I cannot find an 
configuration option in the kernel by menuconfig.



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
