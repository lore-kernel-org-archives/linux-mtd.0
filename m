Received: from [203.197.255.76] (helo=mail.navayuga.co.in)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CeW5C-0001rl-QX
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2004 05:08:37 -0500
Message-ID: <005101c4e28e$558ec5b0$8500a8c0@nit37>
From: "Subrahmanyam" <subrahmanyam@navayuga.co.in>
To: <jianhung@csie.nctu.edu.tw>,
	<linux-mtd@lists.infradead.org>
References: <200412150900.iBF90stl039451@mail.csie.nctu.edu.tw>
Date: Wed, 15 Dec 2004 15:40:31 +0530
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="big5"; reply-type=original
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: A problem of porting jffs2 and mtd in kernel 2.4.18
Reply-To: Subrahmanyam <subrahmanyam@navayuga.co.in>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hai jianhung,

I have project similar to yours, wherein In my target too we have a file 
system and mtd drivers stored in the flash which also consists of 
ieee1394firewire and usb drivers. In the flash in the target system we need 
to store a particular key/data in the target. This data shall be dynamically 
modifiable  by a user interface provided to the user in the host.

Since you almost similar to the platform, henceforth I request you to 
suggest me a suitable approach.

Thanks,
Subrahmanyam.

----- Original Message ----- 
From: <jianhung@csie.nctu.edu.tw>
To: <linux-mtd@lists.infradead.org>
Sent: Wednesday, December 15, 2004 02:30 PM
Subject: A problem of porting jffs2 and mtd in kernel 2.4.18


> Hello,
>
>    This is my first posting. We have a project to porting jffs2 and mtd in
>    embedded system, the purpose is to use the NAND flash, and the kernel
>    is 2.4.18. We find there are jffs2 and mtd source code in the kernel
>    source code. So we just enable it ( use make menuconfig),and write a
>    mtd driver...
>
>    The good news is this works, we can add, delete a file and after power
>    on again, the file still exist. Thanks for JFFS2 and MTD, but the
>    problem comes....
>
>    1. the mount time is too slow, so we try to update the source code in
>       the kernel, but I don\\\'t know the version of jffs2 and mtd in the
>       kernel source code now is, how do I know it ? And I don\\\'t know 
> how
>       to update it, I hope someone can tell me, I would appreciate your
>       kindness.
>
>    2. If I use ECC function, and some thing wrong happens. After I trace
>       the source code, I find when I write a file, the jffs2 will write to
>       the same nand flash page (although in different position of the same
>       page) without erase first many times . So the ECC position in the
>       spare area will be write many times. It is reasonable when I read
>       this page next time, the ECC value is not equal to the value I
>       writed in the last time. of course the ecc will error, is this a bug
>       of this version in kernel 2.4.18? (if I don\\\'t use ECC function, 
> the
>       subsystem seems ok)
>
>    3. I didn\\\'t follow the instruction of \\\"The Linux MTD, JFFS HOW 
> TO\\\", so
>       I didn\\\'t use the utility erase and mkfs.jffs. But this still 
> works,
>       is this reasonable ?
>
> Best Regards,
> Yoda
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/ 
