Received: from jafar.unixpac.com.au ([203.3.121.10])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17MHqR-0006Nk-00
	for <linux-mtd@lists.infradead.org>; Mon, 24 Jun 2002 01:36:40 +0100
Subject: Re: Trying to boot linux off a 2MiB M-Sys DoC2000 chip
From: Gonzalo Servat <gonzalo@linuxaus.com>
To: Ilguiz Latypov <ilatypov@superbt.com>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
In-Reply-To: <Pine.LNX.4.44.0206221044210.24642-100000@server.superbt.com>
References: <Pine.LNX.4.44.0206221044210.24642-100000@server.superbt.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 24 Jun 2002 10:35:54 +1000
Message-Id: <1024878954.15354.33.camel@pluto.unixpac.com.au>
Mime-Version: 1.0
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

On Sun, 2002-06-23 at 00:49, Ilguiz Latypov wrote:
> 
> On 22 Jun 2002, Gonzalo Servat wrote:
> 
> > My question is, how do I configure grub to know how to boot off the DoC?
> > I can get it to boot off an IDE HDD (root hd(0,0); kernel /boot/bzImage;
> > boot) but how would grub know how to access the DoC's kernel?
> 
> Try
> 
>   root (dc0)
>   kernel /boot/vmlinuz root=/dev/nftla ro
> 
> for a filesystem on top of /dev/nftla or
> 
>   root (dc0,0)
>   kernel /boot/vmlinuz root=/dev/ntla1
> 
> for one on top of /dev/nftla1.  The first line may point to a different 
> partition that would hold the kernel image.  Such separation allows to 
> let GRUB boot a kernel off an ext2 partition.  The kernel in turn can 
> mount another ext3 partition under "/".  GRUB is not aware of ext3.

Hi Ilguiz. Thanks for your reply.

I tried this and Grub doesn't like "dc0". It says "Error 23: Error while
parsing number" .. I tried doing tab completion after the 'dc' but it
kept giving me the same error.

The DiskOnChip is on /dev/mtd0 and my first partition is /dev/nftla1
(ext2)

I configured /boot/grub/{menu.lst,grub.conf} on the DOC but since Grub
doesn't seem to be able to read the DOC, it can't read the menu.lst.

Any help would be greatly appreciated.

Thanks!

Regards,
Gonzalo

> 
> Ilguiz
> 
> 
