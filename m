Received: from dsl-64-129-133-253.telocity.com ([64.129.133.253] helo=skylab.outpostsentinel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16idaY-0003Wq-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2002 15:44:22 +0000
Message-Id: <200203061645.g26Gjl806741@skylab.outpostsentinel.com>
Date: Wed, 06 Mar 2002 10:54:29 -0500
To: linux-mtd@lists.infradead.org
CC: dwmw2@infradead.org
From: Chris Fowler <strtok@hotmail.com>
Subject: Re: Lost DOC2000 after installation of Grub
Reply-To: strtok@hotmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

When I use root=(dc0,0) :

Error 23:  Erro parsing number.

But my root is not on the flash.  My root is /dev/ram7.  I have an initrd that loads data from fla1 into ram7.  Initrd temrinates then the kernel mounts /dev/ram7 as it root.

Lilo.conf:
boot=/dev/nftla
compact
#install=/boot/doc.b
map=/boot/map
disk=/dev/nftla
bios=0x80
prompt
delay = 50
timeout = 50
serial=0,9600n8

image = /boot/kernel
        label = outpost
        root = /dev/ram7
        initrd = /boot/initrd.gz
        read-only
        ramdisk=32768
        append="console=ttyS0,9600"

image = /boot/rtl8139.net
        label = net

I'm not concerned about serial console access.  How can I get the system up so I can try nftl_format?  Will I ever be able to use DFORMAT again?

Thanks,
Chris Fowler

strtok@hotmail said: > Now when it boots I get a grub propmt. I'm not sure what to do to 
> make the doc-lilo boot now. So I do not know what to type at grub
> root=(dc0,0) kernel=/boot/... 
> How do I revocer without replaceing the chip? Use nftl_format if DFORMAT won't work. 
