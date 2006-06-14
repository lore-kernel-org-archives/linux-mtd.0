Received: from mail.artecdesign.ee ([62.65.32.9] helo=postikukk.artecdesign.ee)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FqSCa-0008VB-QC
	for linux-mtd@lists.infradead.org; Wed, 14 Jun 2006 06:03:03 -0400
Message-ID: <448FDEC4.8020606@artecdesign.ee>
Date: Wed, 14 Jun 2006 13:02:44 +0300
From: Indrek Kruusa <indrek.kruusa@artecdesign.ee>
MIME-Version: 1.0
To: tglx@linutronix.de
Subject: Re: cat file > /dev/mtd0 works but after position 512
References: <448EC58D.8010608@artecdesign.ee>
	<1150210422.5257.333.camel@localhost.localdomain>
In-Reply-To: <1150210422.5257.333.camel@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Thomas Gleixner wrote:
> On Tue, 2006-06-13 at 17:02 +0300, Indrek Kruusa wrote:
>> Hi!
>>
>> I have Samsung 64 MB NAND behind cs553x flash controller - therefore 
>> cs553x_nand driver.
>> cat file > /dev/mtd0 works reportedly (with page aligned file). But 
>> after board reboots the flash is empty.
>>
>> dd ... bs=512 seek=1 of=/dev/mtd0  works and content stays in flash 
>> after reboot too (it works I mean :) )
>>
>> I am debugging my own changes in cs553x_nand driver so it is up to me of 
>> course. But can this behavior be explained in other way than nand driver 
>> bug? Broken BIOS/board?
>
> http://www.linux-mtd.infradead.org/faq/nand.html
>
> 	tglx

Thanks for the pointer - there are definitely still things I am not 
aware of. Currently it came out though that our BIOS contains support 
for NAND media with specific format. And if there isn't needed format in 
place - it creates one immediately at boot :)
Without that "feature" it seems to be OK. Annoying thing is that 
initializing says 'ECC error while reading bad block table'. I am not 
sure at moment how to handle this fact. But it is possible to 
flash_eraseall, nandwrite my_jffs2.img, mount and read it.

thanks,
Indrek
