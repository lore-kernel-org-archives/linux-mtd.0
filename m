Received: from lst-amand-152-33-17-184.w82-127.abo.wanadoo.fr ([82.127.60.184]
	helo=polaris.sacet.fr)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GxJ8N-0001Si-Jl
	for linux-mtd@lists.infradead.org; Thu, 21 Dec 2006 03:18:38 -0500
Message-ID: <458A41E0.8080200@sacet.com>
Date: Thu, 21 Dec 2006 09:12:16 +0100
From: Michel LECONTE <michel.leconte@sacet.com>
MIME-Version: 1.0
To: Enrico Migliore <enrico.migliore@fatti.com>
Subject: Re: Reduce boot time with jffs2 and CM-X255
References: <45881281.8060001@sacet.com> <4588E35F.8000806@fatti.com>
In-Reply-To: <4588E35F.8000806@fatti.com>
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

First, I would like to thanks all of you for  your help and I want to 
specify that I'm newbie with jffs2 filesystem.

I have tried 2 methods to use the Flash :

1)

I didn't create a jffs2 image with mkfs.jffs2 and I didn't use sumtool.
I just copy my system on the flash mounted as specified in my first
post.

In this case, the boot time is about 4 minutes !!!


2)

I have created an jffs2 filesystem image :

./mkfs.jffs2 -r ../Distribution/ -o name.jffs2

and used sumtool :

./sumtool -i ../name.jffs2 -o name_1.jffs2

In the kernel, I enable "Summary support"

I tried to load this image in the flash with :

dd if=name_1.jffs2 of=/dev/mtdblock1

But I had an error message :

« dd: writing to `/dev/mtdblock1': Input/output error »

So I loaded this image with :

cp -r name_1.jffs2 /dev/mtdblock1

But when I boot the system I had :

« summary node crc error... »

With this second method, it doesn't work !!!


All I have read on the web deals about jffs2 filesystem image, so is it
necessary to create a filesystem image ?

What is the difference between filesystem image and a copy of the system ?

What I'm missing in the second method to explain my error ?


Thanks in advance for any suggestion or help.


Michel



Enrico Migliore a écrit :
> Hi Michel,
>
> could you be more specific?
> The boot time, in a production environment, is the time that elapses 
> from the board reset to the login prompt.
> How long is that time on your cm-x255?
>
> Enrico
>> Hi,
>>
>> I use a cm-x255 compulab card and I boot on the NAND flash with jffs2
>> filesystem.
>>
>> My problem is the boot is too long.
>>
>> My method to boot on the NAND flash is :
>>
>> 1) I boot on the cm-x225 via nfs.
>>
>> 2) I format the flash:
>>
>> flash_eraseall -j /dev/mtd1
>>
>> 3) I mount the flash :
>>
>> mount -t jffs2 /dev/mtdblock1 /mountpoint
>>
>> 4) I put the distribution of my system on the flash:
>>
>> cp -r /Distribution/* /mountpoint
>>
>> 5) I unmount the flash :
>>
>> umount /mountpoint
>>
>> 6) Finally, I boot on the cm-x255 board with the 2.6.18 kernel and
>> options are :
>>
>> - Boot options : root=/dev/mtdblock1 rootfstype=jffs2
>> ip=192.168.82.70:::255.255.255.0:arm:eth0
>>
>> - Miscellaneous filesystems : Journalling Flash File System v2 (JFFS2)
>> support
>>
>> JFFS2 debugging verbosity à 0
>>
>> JFFS2 write-buffering support
>>
>> JFFS2 summary support (EXPERIMENTAL)
>>
>>
>> I would like to know what I'm missing or what I have to do to decrease
>> boot time ?
>>
>>
>> Thanks for any suggestion or help.
>>
>> Michel
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>>   
>
>

-- 
*Michel LECONTE <mailto:michel.leconte@sacet.com>*
Tél : 02 99 57 15 81
Fax : 02 99 57 16 17

	
*SACET*
2 rue Maupertuis
Campus de Ker Lann
35170 - BRUZ - FRANCE
www.sacet.com <http://www.sacet.com/>
