Received: from [161.64.60.46] (helo=cl.eee.umac.mo)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15dCx6-0002CE-00
	for <linux-mtd@lists.infradead.org>; Sat, 01 Sep 2001 16:44:56 +0100
Received: from localhost (lewis@localhost)
	by cl.eee.umac.mo (8.11.2/8.11.2) with ESMTP id f81G4CY26473
	for <linux-mtd@lists.infradead.org>; Sun, 2 Sep 2001 00:04:17 +0800
Date: Sun, 2 Sep 2001 00:04:12 +0800 (CST)
From: Lee Un Pang <lewis@eecl1.cl.eee.umac.mo>
To: <linux-mtd@lists.infradead.org>
Subject: lilo problem in DOC
Message-ID: <Pine.LNX.4.33.0109020003010.26470-100000@eecl1.cl.eee.umac.mo>
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

Hi all:
i am using a diskonchip. I want to put my embedded linux system into DOC
and boot it. Now i am still using the driver which is provided from
m-system. but later, i will change to use mtd because it is open source.
Now i have some problem about lilo.
i have alreday compile the kernel, so i can mount the diskonchip during
using a hardisk to boot up.
then i use the dformat to make the diskonchip be the first boot device.
then i use the hardisk to boot upp the system and try to use lilo to write
the MBR.
I follow the readme.install file, now i can compile the driver into module
and can insert it into kernel. when i boot the system from hardisk then i
can mount the diskonchip and i can read or write it normally. In my
project,
i only want to use one diskonchip to boot up the system (not use hardisk).
i
already copy my embedded system into the diskonchip. But i can't write the
MBR of diskonchip correctly.
i mount the diskonchip in a directory '/doc2000'.
following is the 'lilo.config-initrd' file in
/doc2000/etc/lilo.config-initrd.
---------------------------
boot=/dev/fla
map=/boot/map
install=/boot/doc.b
prompt
timeout=50
default=linux
linear
image=/boot/vmlinuz-2.2.14-5.0
initrd=/boot/initrd-2.2.14-5.0.img
label=linux
read-only
root=/dev/fla1
-------------------------
then i run 'doc-lilo -v -C /etc/lilo.config-initrd -r /doc2000 '
it can success to write the MBR of diskonchip
but whenever i try to boot,only folloing will be shown:

dL 01 01 01 01 01 01 01 01 01 01 01 01 01 01
01 01 01 01 .....etc

what is my problem??
please help me.....
Thank's for your advice
