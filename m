Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EeYJ9-0007XQ-8n
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2005 08:35:43 -0500
Message-ID: <43831EB8.9050505@inf.u-szeged.hu>
Date: Tue, 22 Nov 2005 14:35:52 +0100
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Nikhil <nikhils@cdac.in>
References: <twig.1132644305.54050@cdac.in>
In-Reply-To: <twig.1132644305.54050@cdac.in>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: MKFS.JFFS2 util
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Nikhil,

> i followed the following steps.
> 1) mount the partition as JFFS2 (mount -t jffs2 /dev/mtdblock0 /mnt/cf)
> and 
> 2) then copy the file (cp /home/mydir/test.txt /mnt/cf/) or 
> 
> 1) i can MKFS.JFFS2 on the dir (mkfs.jffs2 -d /home/mydir/ -o myimage) 
> 2) then dd it to flash (dd if=myimage of=/dev/mtdblock0)
> 3) and then mount it (mount -t jffs2 /dev/mtdblock0 /mnt/cf/)
> 
> is the first method the correct way of implementation, as i am getting the
> same results either way but i need not use mkfs.jffs2. if yes, then when
> shud i use mkfs.jffs2 utility 

If before the first method the flash was empty (for example erased with 
flash_eraseall -j /dev/mtd/0) then the result will be the same in 
practice. Not exactly the same, but in practice it is the same.

When can be mkfs.jffs2 very usefull? For example:
- when the machine is very slow. With mkfs.jffs2 you can build the file 
system on a host machine which can be much faster.
- when there is no other possibility: in some cases it is impossible to 
simply copy files from somewhere, because there is no other storage 
devices. For example at HP iPAQ there is only a bootloader communicating 
via serial port. You can upload file system image (created by 
mkfs.jffs2), and the bootloader will simply write to the flash.

Ferenc
