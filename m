Received: from [203.115.15.101] (helo=obelix.sri.crossvue.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15TZxW-0005XN-00
	for <linux-mtd@lists.infradead.org>; Mon, 06 Aug 2001 03:17:35 +0100
Message-ID: <3B6E01BA.2B394136@sri.crossvue.com>
Date: Mon, 06 Aug 2001 08:32:26 +0600
From: dhammika <dpathirana@sri.crossvue.com>
MIME-Version: 1.0
To: david woodhouse <dwmw2@infradead.org>,
 	linux-mtd <linux-mtd@lists.infradead.org>
Subject: mtd lilo
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

hello,

i'm trying to boot from a 32MB DOC. but am having trouble with mtd-lilo.
here's my setup, 
        133Mhz Advantech Biscuit PC (486 SBC),
        32MB Millennium 2000 DOC,
        2.4.6 kernel

what i did,
        got the mtd-lilo patches from earlier list
posting,                                     
	(http://lists.infradead.org/pipermail/linux-mtd/2001-April/000049.html)
	build mtd-lilo
        ./mtd-lilo -v -C /etc/lilo.conf -i /boot/mtd.b -c /boot/map.b

now mtd-lilo runs ok, 

	Reading boot sector from /dev/nftla1
	Merging with /boot/mtd.b
	Mapping message file /boot/message
	Boot image: /boot/vmlinuz
Added linux *
	Boot other: /dev/fd0, loader /boot/chain.b
	Pseudo partition start: 0
	Added floppy
	/boot/boot.5D01 exists - no backup copy made.
	Writing boot sector.

and my lilo.conf looks like, 
	boot=/dev/nftla1
	map=/boot/map.b
	install=/boot/mtd.b
	prompt 
	timeout=50
	message=/boot/message
	image=/boot/vmlinuz
		label=linux
		root=/dev/nftla1
		read-only
	other=/dev/fd0
		label=floppy
		unsafe	

but when i try to boot with lilo nothing comes up, any ideas??

thanks 

dhammika
