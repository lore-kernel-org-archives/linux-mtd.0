Received: from post2.inre.asu.edu ([129.219.110.73])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170vaO-0000PJ-00
	for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2002 03:35:48 +0100
Received: from conversion.post2.inre.asu.edu by asu.edu (PMDF V6.1 #40111)
 id <0GV500101LVLA6@asu.edu> for linux-mtd@lists.infradead.org; Thu,
 25 Apr 2002 19:35:45 -0700 (MST)
Date: Thu, 25 Apr 2002 19:35:50 -0700
From: Russ Dill <Russ.Dill@asu.edu>
Subject: Re: Booting from DOC2000 with GRUB loader
In-reply-to: <20020426021938.12025.qmail@web20407.mail.yahoo.com>
To: Zhiwei Yu <linux_vpn@yahoo.com>
Cc: linux-mtd@lists.infradead.org
Message-id: <1019788550.17348.9.camel@russ>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7bit
References: <20020426021938.12025.qmail@web20407.mail.yahoo.com>
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

On Thu, 2002-04-25 at 19:19, Zhiwei Yu wrote:
> Hi,
> 
> I am working on booting from DOC2000, LILO works on my
> box but GRUB doesn't.  After I patched the latest
> patch for GRUB, I got grub-fireware and sucessfully
> load the fireware in DOC.
> 
> For now, everytime I boot up, I got grub prompt, but I
> failed to load kernel, the command I using is 
> kernel (dc0,0)/boot/bzImage.
> 
> This problem is not new to the list, I found several
> similar mails, All of them didn't have the answer.  DI
> u have any idea?  Thanks in advance.

probably because you overwrote some nftl stuff with grub. Erase the
whole thing (eraseall /dev/mtd0), put grub on it, find the next free
block directly past grub and nftl_format at that offset. fdisk your
nftla, mkfs the partition, add the kernel, and maybe a menu.lst.
