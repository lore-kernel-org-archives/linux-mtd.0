Received: from wproxy.gmail.com ([64.233.184.196])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Co3CH-0002w0-LZ
	for linux-mtd@lists.infradead.org; Mon, 10 Jan 2005 12:19:20 -0500
Received: by wproxy.gmail.com with SMTP id 37so305158wra
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 Jan 2005 09:19:13 -0800 (PST)
Message-ID: <1f9886eb05011009192b417f3e@mail.gmail.com>
Date: Mon, 10 Jan 2005 11:19:13 -0600
From: xemc <xemcnet@gmail.com>
To: Niraj Maheshwari <neer_mh@yahoo.com>
In-Reply-To: <20050106123007.74871.qmail@web61306.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <20050106111916.63614.qmail@web61309.mail.yahoo.com>
	<20050106123007.74871.qmail@web61306.mail.yahoo.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Booting Ramdisk from MTD
Reply-To: xemc <xemcnet@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.

> > I am using JFFS2 and MTD on our target for booting
> > the Ramdisk from MTD device ( Intel W18 Flash ).
logs:
> > Kernel command line: root=/dev/mtdblock1 rw mem=64M
> > rootfstype=jffs2 console=ttyS0,115200 ramdisk=8192

Are you using a ramdisk, or using mtdblock1 as the rootfs?
I'm a little unclear on this.  It looks like you're using the JFFS2
MTD partition as your rootfs, not using a ramdisk.

> > Here is the logs for the same. I am getting this
> > error eveytime when Linux Kernel tries to mount the JFFS2
> > compressed Ramdisk from the Flash Device.

logs:
> > INIT: Eep. Unknown node type 0080 at 00186f34 was
> > marked REF_UNCHECKED
> > Node header CRC failed at 00186f34. But it must have
> > been OK earlier.
> > Node was: { 0080, 2080, 00800080, 00800080 }
> > Node totlen on flash (0x00800080) != totlen from
> > node
> > ref (0x000001b4)

Well, this looks totally broken.  Did you format the flash correctly?
I would use 'flash_eraseall -j /dev/mtd1' 'nandwrite -j /dev/mtd1
jffs2_rootfs.img', and then try mounting it 'mount -t jffs2
/dev/mtdblock1 /mnt/temp', and make sure that works correctly before
trying to boot off of it.

(Can you load a ramdisk another way to do this?)

On the other hand, all the errors look the same.  Once you figure out
what that is, you could have it working.

Mike
