Received: from smtpauth11.prod.mesa1.secureserver.net ([64.202.165.33])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1ILfU5-0007qI-Bm
	for linux-mtd@lists.infradead.org; Thu, 16 Aug 2007 09:34:03 -0400
Message-ID: <46C4524C.1030602@techmoninc.com>
Date: Thu, 16 Aug 2007 08:34:04 -0500
From: Andy Kennedy <akennedy@techmoninc.com>
MIME-Version: 1.0
To: mailthrottle-mtd@yahoo.it
Subject: Re: Trying to use DOC2000 on Debian
References: <485972.3949.qm@web25502.mail.ukl.yahoo.com>
In-Reply-To: <485972.3949.qm@web25502.mail.ukl.yahoo.com>
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

mailthrottle-mtd@yahoo.it wrote:
> Hello to the list.
>
> I'm sorry to ask here but I could not find the answers
> by myself.
> I have a "native" dos formatted DOC2000, my first goal
> is access it from Linux.
> I guessed I have to create the necessary device node
> first so I created some of them (it seems MAKEDEV
> script in debian only provides mtdX devices, I added
> these by hand):
>
> mknod /dev/ftla b 44 0
> mknod /dev/ftla1 b 44 1
> mknod /dev/ftla2 b 44 2
> mknod /dev/ftla3 b 44 3
> mknod /dev/ftla4 b 44 4
> mknod /dev/nftla b 93 0
> mknod /dev/nftla1 b 93 1
> mknod /dev/nftla2 b 93 2
> mknod /dev/nftla3 b 93 3
> mknod /dev/nftla4 b 93 4
>
> Then I tried "modprobe diskonchip" and I saw some
> messages from which I guess the system recognized a
> DiskOnChip device.
> I could be happy now but when I try to mount
> /dev/nftla1 or fdisk /dev/nftla the system delay a
> while then prints some messages saying it is
> formatting some blocks (I'm sorry I can't reproduce
> the exact messages now).
> After this I cannot access the device anymore and if I
> reboot with a dos floppy disk I can see dos cannot
> find any partition on DOC2000, I have to create it and
> format it again.
> Can you help me to understand what is happening?
> It is possible to read the DOC "native" format using
> mtd drivers?
> I learn there are different format nftl/inftl but
> can't say which one is really used by the device,
> shoul I try to access it as inftl?
>
> I'm using debian stable (Etch) kernel 2.6.18.
>
> Thanks.
>
> Alessandro.
>
>
>   
Well, you've jacked it up.  You've also lost all of your data as the
nftl driver formated that puppy.  Furthermore, you've removed the DOC
firmware (without even knowing it) and you'll have to get a DOS boot
floppy with dformat (and a good image file) to replace it.

As far as accessing it via Linux -- good luck getting support on it.  It
appears that the DOC developers of the driver for Linux do not "give"
out support for mounting this puppy under Linux.  I have attempted
everything and cannot get the stupid sucker to work.

I have a bootable floppy that will restore your DOC back to DOS if you'd
like it -- just e-mail me off-line.

Andy
