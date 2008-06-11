Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K6Mbi-0002Pc-Qh
	for linux-mtd@lists.infradead.org; Wed, 11 Jun 2008 09:27:07 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K6Mbd-0002Vo-Bk
	for linux-mtd@lists.infradead.org; Wed, 11 Jun 2008 09:27:01 +0000
Received: from vpn28.rz.tu-ilmenau.de ([141.24.172.28])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2008 09:27:01 +0000
Received: from andre.puschmann by vpn28.rz.tu-ilmenau.de with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2008 09:27:01 +0000
To: linux-mtd@lists.infradead.org
From: Andre Puschmann <andre.puschmann@stud.tu-ilmenau.de>
Subject: Re: Mounting mtd block device raises "Block device required"
Date: Wed, 11 Jun 2008 11:26:46 +0200
Message-ID: <g2o5oo$fqe$1@ger.gmane.org>
References: <g2o39t$703$1@ger.gmane.org> <484F92E5.2080207@cetrtapot.si>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
In-Reply-To: <484F92E5.2080207@cetrtapot.si>
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Hinko Kocevar wrote:
> Char device seems to work..

Yes, sorry for being not precise.
Coping a jffs2 image (in 2.6.25) at /dev/mtd5 and mouting the same one
in 2.6.21 (/dev/mtdblock5) works. So accessing the flash as a character
device works.

> What is the ls -l /dev/mtdblock5 output?

As expected:
$ ls -l /dev/mtdblock5
brw-rw----    1 root     root      31,   5 Jan  1  1970 /dev/mtdblock5


> Also could you try:
> mount -t jffs2 /dev/mtdblock5 /mnt/flash

I also tried that:

# mount -t jffs2 /dev/mtdblock5 /mnt/flash
mount: mounting /dev/mtdblock5 on /mnt/flash failed: Invalid argument


But it seems like it has to do something with the block device driver
mapping:

$ head -n 2 /dev/mtdblock5 | hexdump -C
head: /dev/mtdblock5: No such device or address


Thanks,
Andre
