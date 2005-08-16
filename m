Received: from rt-soft-2.moscow.itn.ru ([80.240.96.70] helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E536T-0001uJ-9K
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2005 11:11:53 -0400
Message-ID: <43020232.60908@ru.mvista.com>
Date: Tue, 16 Aug 2005 19:11:46 +0400
From: Vitaly Bordug <vbordug@ru.mvista.com>
MIME-Version: 1.0
To: manboot@ureach.com
References: <200508161441.KAA07341@www21.ureach.com>
In-Reply-To: <200508161441.KAA07341@www21.ureach.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Intel NOR flash(P30) query
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm not an MTD guru, but...
Manjula D wrote:
> Hi All,
> Iam a newbie to mtd. We have a MPC8272 custom board with INTEL
> TE28F640P30B85 (P30-CFI compilant)NOR boot Flash and NAND flash
> with JFFS2 filesystem running linux-2.4.20-8.
> The NOR Flash need not have any partition/filesystem.
> My requirement is to have an application to copy an image from
> the NAND Flash to the NOR Flash.
> My current understanding is 
> Under RAM/ROM/Flash chip drivers on selecting, 
> Detect flash chips by Common Flash Interface (CFI) probe :
>   cfi_probe_init() will register with the mtd_chip_driver.
> Support for Intel/Sharp flash chips:
>   cfi_cmdset_0001.c contains the list of commands supported by
>   Intel.
>   
> 1) I need to understand how the application views the NOR flash
>     once it is registered as a mtd device.
The answer is trivial - as mtd device. You can enable support for mtd as 
character or block devices - thus you will have say /dev/mtdchar1 to 
work from your application.
> 2) Once i register as mtd_chip_driver how can i call the
>     read/write commands of the flash from the application?
see upper. It can be treated as an ordinary character device.
> 3) What is do_map_probe for and how is it different from
>     cfi_probe?
If the flash is used for firmware storage as well, you need to 
"partition" it with independent accesss to each part, keeping some of 
them write-protected. do_map_probe will apply the map, and will probably 
call cfi_probe for certain flash region - refer to google for details.
> 
>   -Thanks
>   Manju
> 
> ________________________________________________
> Get your own "800" number
> Voicemail, fax, email, and a lot more
> http://www.ureach.com/reg/tag
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 


-- 
Sincerely,
Vitaly
