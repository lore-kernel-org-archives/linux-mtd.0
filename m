Received: from rt-pi1-ru-sssup.pi1.garr.net ([193.206.136.46]
	helo=smtp2.sssup.it)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JzR5O-0003Vt-4B
	for linux-mtd@lists.infradead.org; Fri, 23 May 2008 06:49:06 +0000
Message-ID: <483668B6.3080507@gandalf.sssup.it>
Date: Fri, 23 May 2008 08:48:22 +0200
From: michael <trimarchi@gandalf.sssup.it>
MIME-Version: 1.0
To: James <jamessteward@optusnet.com.au>
Subject: Re: Help needed with MTD on AT91SAM9263-EK please.
References: <1211437223.6129.82.camel@Ubuntu-Desktop>	<80b317760805222326j57e6bc11sfe0beef9ab68267b@mail.gmail.com>
	<1211524684.6203.13.camel@torchwood>
In-Reply-To: <1211524684.6203.13.camel@torchwood>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Richard Genoud <richard.genoud@gmail.com>,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi
James wrote:
> Hi Richard,
>
> On Fri, 2008-05-23 at 08:26 +0200, Richard Genoud wrote:
>   
>> I didn't have those kind of problems with the sam9263-ek
>> have you tried to erase the device, mount it with jffs2 or yaffs2,
>> write a file, unmount, mount and read back the file ?
>>     
>
> Yup.  I have used the examples from linux4sam.org, which use a jffs2
> file system.
>
> The NAND flash was erased and root jffs2 image written using the SAM-BA
> utility, then boot the kernel to use this as its rootfs.  It mounts ok
> to begin with, then I get heaps of jffs2 warnings and finally a kernel
> bug, I think at fs/jffs2/file.c:251 (I don't have the system here at
> home.)
>
>   
How do you create the jffs2 image. Which parameters use with the
mtd-utils?
Did you try to start from a ramdisk, erase all, and mount it?

I'm using an at91san9260 board without any problems.

Regards Michael
