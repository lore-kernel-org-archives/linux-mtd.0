Received: from [203.115.15.100] (helo=CROSSVUE-PRI.sri.crossvue.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15LHwG-0003Ca-00
	for <linux-mtd@lists.infradead.org>; Sat, 14 Jul 2001 06:26:01 +0100
Message-ID: <3B4FDB9D.BF97C98C@sri.crossvue.com>
Date: Sat, 14 Jul 2001 11:41:49 +0600
From: dhammika <dpathirana@sri.crossvue.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>,
 	david woodhouse <dwmw2@infradead.org>
Subject: problem with lilo
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

hi, 

i'm trying to boot from a 32MB DOC. but am having trouble with mtd-lilo.
here's my setup, 
	133Mhz Advantech Biscuit PC (486 SBC),
	32MB Millennium 2000 DOC,
	2.4.6 kernel

here's what i did,
	got the mtd-lilo patches from earlier list posting, 					
(http://lists.infradead.org/pipermail/linux-mtd/2001-April/000049.html)
	tar -xvzf lilo_21.7.orig.tar.gz
    	cd lilo_21.7
        cat lilo_21.7-1.diff | patch -p1
        cat mtd-lilo-21.7-1.patch | patch -p1
        make all
	copied mtd-menu.b, mtd-text.b and bootsect.b to /boot
	and map.b link to point to mtd-menu.b
	./mtd-lilo -v -C /etc/lilo.conf -i /boot/bootsect.b -c /boot/map.b

and my lilo.conf looks like this,
	boot=/dev/nftla1
	map=/boot/map.b
	install=/boot/bootsect.b
	vga=0x0f05
	default=linux
	keytable=/boot/us.klt
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
	
but i get the following error, 
	Reading boot sector from /dev/nftla1
	Merging with /boot/bootsect.b
	Fatal: First boot sector is version 20.0. Expecting version 21.7.

any ideas??

tia

dhammika
