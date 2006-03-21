Received: from ms01.sssup.it ([193.205.80.99] helo=sssup.it)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLjUe-0004oS-3H
	for linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 11:14:16 -0500
Message-ID: <20060321171356.zde5m0rj4gks4000@feanor.sssup.it>
Date: Tue, 21 Mar 2006 17:13:56 +0100
From: trimarchi@gandalf.sssup.it
To: Peter Menzebach <pm-mtd@mw-itcon.de>
References: <B70A50D07063384EB9BCE3330D18414F024CCD28@nonameb.ptu.promise.com>
	<441FC3DC.4000909@mw-itcon.de>
In-Reply-To: <441FC3DC.4000909@mw-itcon.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset=ISO-8859-1;
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Cc: "Lakshmi N. Sundararajan" <lakshmi.s@promise.com>,
	linux-mtd@lists.infradead.org
Subject: Re: boot issue.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
do you have u-boot as bootloader? Just read using nand read mem_address offset
size
then using the cmd line to pass this information to the kernel using initrd

Regards
Michael


Quoting Peter Menzebach <pm-mtd@mw-itcon.de>:

> Hi,
>
> Lakshmi N. Sundararajan wrote:
>> I have a compressed ext2 filesystem on a FLASH partition which I would
>> like
>> to use as a root file system mounted in RAM. The FLASH is accessed via
>> MTD layer.
> So you have *no* filesystem in the flash, but a compressed image. 
> This is not usable as a filesystem directly in this format. Afaik, 
> only the initrd code can use this...
>
>> The kernel parameters are "console=ttyS0,115200  noinitrd mem=128M
>> root=/dev/mtdblock5"
>> But kernel panics saying "VFS: Cannot mount root unknown device (31,5)".
>>
> which is correct, since there is no fs there...
>
>> If I were to use cramfs on FLASH and use the same kernel command line,
>> I am able to bringup the system.I am using 2.6 linux.
> which would save the RAM space. You can still put some directories 
> into RAM...
>
>> Would anyone know about this issue? Is there any thing I got to do?
>> Any pointers would be helpful.
> The only solution I know is (assuming parallel flash) to give the 
> compressed image as an initrd=<address>,<size> to the kernel.
>
>
> Best regards
> Peter
> -- 
> Peter Menzebach
> Menzebach und Wolff IT-Consulting GbR
> Phone +49 751 355 387 1
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>



----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
