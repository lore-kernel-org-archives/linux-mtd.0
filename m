Received: from web10804.mail.yahoo.com ([216.136.130.246])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16lcEF-00034K-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Mar 2002 20:53:39 +0000
Message-ID: <20020314210505.12581.qmail@web10804.mail.yahoo.com>
Date: Thu, 14 Mar 2002 13:05:05 -0800 (PST)
From: Scott Kapu <kapus1@yahoo.com>
Subject: NUBBIE: booting DOC2000 w/ lilo  (need mtd0?)
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

do I need to create a /dev/mtd0
and if so what are the maj min numbers???

I'm using the 2.4.18 kernel with the mtd drivers.
firmware DOC42.exb
I can mke2fs /dev/nftla1  + read/write etc.

I'd like to install lilo to switch between 
the ide HD and doc2000.
I'm using; lilo-22.0-2

I installed lilo on /dev/nftla

Presently I get 'L' followed by 40's
on reboot. (no prompt etc)

Please help!
Thanks in advance

-Scott Kapuschansky

lilo.conf
----------------------------
prompt
timeout 50
boot=/dev/nftla
loader=/boot/chain.b
map=/boot/map
install=/boot/boot.b
linear

image=/boot/vmlinuz
	label=linux
	read-only
	root=/dev/hda1

image=/boot/vmlinuz
	label=doc
	read-only
	root=/dev/nftla1




__________________________________________________
Do You Yahoo!?
Yahoo! Sports - live college hoops coverage
http://sports.yahoo.com/
