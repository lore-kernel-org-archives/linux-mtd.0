Received: from tomts8.bellnexxia.net ([209.226.175.52] helo=tomts8-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LmCb-0002gM-00
	for <linux-mtd@lists.infradead.org>; Sat, 22 Jun 2002 15:49:25 +0100
Date: Sat, 22 Jun 2002 10:49:22 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Gonzalo Servat <gonzalo@linuxaus.com>
cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Trying to boot linux off a 2MiB M-Sys DoC2000 chip
In-Reply-To: <1024702809.32427.8.camel@beamer.servat.com>
Message-ID: <Pine.LNX.4.44.0206221044210.24642-100000@server.superbt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On 22 Jun 2002, Gonzalo Servat wrote:

> My question is, how do I configure grub to know how to boot off the DoC?
> I can get it to boot off an IDE HDD (root hd(0,0); kernel /boot/bzImage;
> boot) but how would grub know how to access the DoC's kernel?

Try

  root (dc0)
  kernel /boot/vmlinuz root=/dev/nftla ro

for a filesystem on top of /dev/nftla or

  root (dc0,0)
  kernel /boot/vmlinuz root=/dev/ntla1

for one on top of /dev/nftla1.  The first line may point to a different 
partition that would hold the kernel image.  Such separation allows to 
let GRUB boot a kernel off an ext2 partition.  The kernel in turn can 
mount another ext3 partition under "/".  GRUB is not aware of ext3.

Ilguiz
