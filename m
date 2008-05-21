Received: from mail.feig.de ([212.184.177.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JyoKS-0001R4-Gj
	for linux-mtd@lists.infradead.org; Wed, 21 May 2008 13:26:04 +0000
Message-ID: <483422E8.4030905@feig.de>
Date: Wed, 21 May 2008 15:26:00 +0200
From: Manuel Sahm <Manuel.Sahm@feig.de>
MIME-Version: 1.0
To: Jason Liu <liu.h.jason@gmail.com>
Subject: Re: mkfs.jffs2 ?!
References: <4833F626.1060600@feig.de>
	<e8775dd00805210613n6988a534m8103b9dc4d9b8c7f@mail.gmail.com>
In-Reply-To: <e8775dd00805210613n6988a534m8103b9dc4d9b8c7f@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have make a pertition of 5 MB through the Kernel Partitioning.
my jffs2 Image has a size of 128kB

If I mount the jffs df -h says:


Filesystem               size      used        available   Use%       
Mounted on
/dev/mtdblock5       5.0M   388.0k   4.6M        8%            
/media/DATAfs  

If I write to /media/Datafs, does the system automatically increase my 
mounted jffs image ?

I defenitly have the right erase size ----- maybe it is an endian problem ?
How could I see which endian I need (little or big) ?

Thank you



Jason Liu schrieb:
> before mount please erase the partition and then mount & copy files to
> the mount point,
> remount and see what happen. empty flash at [address] end at [address]
> !!!!!!!!!!!!!!!!!!!!!!!
> is no harmfull message. the wrong configration when use mkfs.jffs2
> will also lead to it.
> such as the erase size is not the same with your nand flash used.
>
> 2008/5/21 Manuel Sahm <Manuel.Sahm@feig.de>:
>   
>> Hello,
>>
>> I have lot of problems concerning my NANDflash:
>>
>> I?ve downloaded mtd-utils 1.1.0 and compiled it on my host pc [Suse
>> Linux 10.2 - Kernel 2.6.18]
>>
>> I enter:
>> mkfs.jffs2 -d /exports/ -p -s 0x800 -e 0x20000 -n -l -o /RFS.jffs2
>>
>> NAND Flash has Pagesize = 2048 Byte = 2kByte
>> EraseBlockSize= 128 kByte
>> oob = 64
>>
>> I could mount the Image on my target [linux 2.6.25.3]through:
>>
>> mount -rw -t jffs2 /dev/mtdblock5 /media/DATAfs
>>
>> BUT:
>> If I want to write to the device like: touch /media/DATAfs/test.txt
>> and then unmount /media/DATAfs/test.txt
>> and mount -rw -t jffs2 /dev/mtdblock5 /media/DATAfs
>>
>>
>> There?s an message:
>>
>> empty flash at [address] end at [address] !!!!!!!!!!!!!!!!!!!!!!!
>>
>>
>> Please help me........
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>>     

-- 
Freundliche Grüße / Best regards 

Manuel Sahm	

Research & Development

FEIG ELECTRONIC GmbH
Lange Straße 4
35781 Weilburg
Germany
 
Tel.:  +49 (0)6471-3109.492
Fax.:  +49 (0)6471-3109.99
email: manuel.sahm@feig.de
internet: http://www.feig.de

------------------------------------------------------------------------
Amtsgericht Limburg HRB 3178
Geschäftsführer: Dipl.-Ing. Wolfgang Feig
------------------------------------------------------------------------

------------------------------------------------------------------------
Diese Email (eingeschlossen die Anhaenge) unterliegt Urheberrecht, die
Informationen sind vertraulich und rechtswirksam privilegiert. Der
Gebrauch dieser Email oder der Anhaenge von einem anderen als den
Adressaten ist nicht gestattet und unrechtmaessig.

This email (including any attachments) is subject to copyright, the
information in it is confidential, and it is legally privileged. Use of
this email or of any information in it other than by the addressee is
unauthorised and unlawful.
------------------------------------------------------------------------
