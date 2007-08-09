Received: from smtpout08-04.prod.mesa1.secureserver.net ([64.202.165.12]
	helo=smtpout08.prod.mesa1.secureserver.net)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IJCIk-0001KP-FA
	for linux-mtd@lists.infradead.org; Thu, 09 Aug 2007 14:00:07 -0400
Message-ID: <46BB564D.703@techmoninc.com>
Date: Thu, 09 Aug 2007 13:00:45 -0500
From: Andy Kennedy <akennedy@techmoninc.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip 2000 (DOC 2000) woes.
References: <46B76F31.6020507@techmoninc.com>
	<46B9EE9B.7060805@techmoninc.com>	<46BB21F1.3060109@techmoninc.com>
	<46BB498D.9040707@techmoninc.com>
	<4f6ba3b0708091052n132bebb8rcbc0597cb35c75db@mail.gmail.com>
In-Reply-To: <4f6ba3b0708091052n132bebb8rcbc0597cb35c75db@mail.gmail.com>
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

Bob Beers wrote:
> On 8/9/07, Andy Kennedy <akennedy@techmoninc.com> wrote:
>
>   
>> root@winsys:~# modprobe nftl
>> root@winsys:~# fdisk /dev/nftla
>>     
>
> Have you tried compiling the MTD, MTD_NAND, MTD_NAND_DISKONCHIP
>  parts into the kernel rather than as modules?
>
> If you do that, what kind of dmesg output do you get related to MTD?
>
>   
Did that.  Changed over when I found something that someone suggested on 
the list about making sure that you run nftl_format on the /dev/mtd0 
before you load the nftl module.  Attempted this and it didn't work.  
Just haven't put the nftl back in the kernel yet.  The output, however, 
of the module was NFTL was nftla:  Unknown partition table.


>>   I created the block devices nftla{,1,2} using:
>> mknod /dev/nftla b 93 0
>> and I end up with a device:
>> brw-rw---- 1 root disk 93, 0 2007-08-09 10:52 /dev/nftla
>>     
>
> my device nodes look like this:
> bash-3.00# ls /dev/nftla* -al
> brw-r--r--  1 root root 93, 0 Mar  4  2005 /dev/nftla
> brw-r--r--  1 root root 93, 1 Mar  4  2005 /dev/nftla1
> brw-r--r--  1 root root 93, 2 Mar  4  2005 /dev/nftla2
> brw-r--r--  1 root root 93, 3 Mar  4  2005 /dev/nftla3
>
> I never had any success with 32M, but 8M, 16M, 64M worked for me.
> (48M worked, but had incredibly slow boot time.)
>
> Does your process work with other sizes of DiskOnChip 2000?
>
> -Bob
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
>   

The only other DOC I have is the (driver reports it as a Toshiba) 
M-Systems DOC  MD-2800-D08.  This required me to select the detect 
obsolete chips setting before it would detect it.  The system is a 
Pro-Log 486 SBC too.  The same thing happens.  I get the same errors.

I'm clearly doing something wrong. . . or the driver is.   It is 
probably me since it doesn't work on two different ones.

Andy
