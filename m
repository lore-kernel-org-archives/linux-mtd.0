Received: from smtp.imp.bg.ac.yu ([147.91.50.101])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G8uTZ-00079O-SC
	for linux-mtd@lists.infradead.org; Fri, 04 Aug 2006 03:52:13 -0400
Message-ID: <002901c6b79a$e23af8c0$c6345b93@VLADIMIR>
From: "Iva Salom" <diva@kondor.imp.bg.ac.yu>
To: "Josh Boyer" <jwboyer@gmail.com>
References: <001601c6b6ea$cb60f790$c6345b93@VLADIMIR>
	<625fc13d0608030453u54cc12b2nf9aca1609148d07e@mail.gmail.com>
Subject: Re: Problem with mounting JFFS2
Date: Fri, 4 Aug 2006 09:52:07 +0200
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=response
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


----- Original Message ----- 
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Iva Salom" <diva@kondor.imp.bg.ac.yu>
Cc: <linux-mtd@lists.infradead.org>
Sent: Thursday, August 03, 2006 1:53 PM
Subject: Re: Problem with mounting JFFS2


> On 8/3/06, Iva Salom <diva@kondor.imp.bg.ac.yu> wrote:
>>
>>
>> Hi!
>>
>> I am a beginner in all these embedded linux - mtd - jffs stuff. I am 
>> using
>> Intel FLASH 28F320 (2 interleaved 16b chips of 8MB, so we have 32bit
>> buswidth) (CFI) with TMS320C5471 platform. I turnd on MTD support, so I 
>> have
>> 5 partitions: bootloader (/dev/mtd0), bootloader parameters (/dev/mtd1),
>> kernel image (/dev/mtd2), ROMFS SDRAM image (/dev/mtd5), primary file
>> system, which is romfs (/dev/mtd3) and I want the second to be jffs2
>> (/dev/mtd4):
>
> Which kernel are you using?
It's uClinux 2.4.

>> I have made jffs2 image:
>>
>> arm-uclinux-mkjffs2 -d ./jffsfolder -l -e 0x00020000 -o jffs2.img 
>>  >/dev/null
>>
>> and I loaded it at addresses from 0x00800000, which correspond to fs2, 
>> i.e.
>> /dev/mtd4.
>
> Loaded it how?
I used rrload "Load" and "Store" options, and when I checked the flash 
everything looked ok, it also had those jffs2 magic 0x1985 words at some 
places, so I thought that I did that part right.

> josh

Thanks!
Iva
