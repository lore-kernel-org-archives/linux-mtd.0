Received: from ns1ca.ubisoft.qc.ca ([205.205.27.131])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15cvHl-0000q2-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 Aug 2001 21:53:05 +0100
Received: from srvmail-mtl.ubisoft.qc.ca (srvmail-mtl.ubisoft.qc.ca [205.205.27.194])
	by ns1ca.ubisoft.qc.ca (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id RAA22959
	for <linux-mtd@lists.infradead.org>; Fri, 31 Aug 2001 17:58:47 -0400
Message-ID: <9A1957CB9FC45A4FA6F35961093ABB8404344CFC@srvmail-mtl.ubisoft.qc.ca>
From: Patrick Allaire <pallaire@gameloft.com>
To: linux-mtd@lists.infradead.org
Subject: lilo and mtd ans doc
Date: Fri, 31 Aug 2001 16:52:44 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi,

I have finaly accepted that this driver is working with linux 2.4 !!! Wow
its more easy that way ... I can now compile without any problems the kernel
with DOC2000 support and Nftl !!! Now I can see the DOC, I can write to it,
I can read from it ... the only thing left is :

I cant boot from my DOC2000 ! There is a lilo.conf (listed below) on the
chip. I have run the lilo-mtd with the good boot.b-mtd {lilo-mtd -C
/etc/lilo.conf -r /mnt}. Every thing look fine, I see the "Patched LILO for
M-Systems DiskOnChip 2000   added s*" that is my label. When I boot with
only the DOC, the kernel get loaded, I see the DOC partition : "Partition
check : nftla1" ... but then it does not find the root fs :

Kernel Panic : VFS: unable to mount root fs on 03:05


is it the fault of :

lilo-mtd ?
boot.b-mtd ?
map ?

if so where do I get them ? I have taken those on the mtd CVS ! execpt from
map wich i didnt find anywhere.


************************************
lilo.conf
************************************
boot=/dev/nftla
map=/boot/map
install=/boot/boot.b-mtd
vga=extended
image=/boot/bzImage
label=s
root=/dev/nftla1
read-write

************************************
/dev/nftla* on the DOC
************************************
brw-r--r--    1 root     root     93,   0 Aug 28  2001 nftla
brw-r--r--    1 root     root     93,   1 Aug 28  2001 nftla1
brw-r--r--    1 root     root     93,   2 Jul  8 09:29 nftla2
brw-r--r--    1 root     root     93,   3 Jul  8 09:29 nftla3
brw-r--r--    1 root     root     93,   4 Jul  8 09:29 nftla4
brw-r--r--    1 root     root     93,   5 Jul  8 09:29 nftla5
brw-r--r--    1 root     root     93,   6 Jul  8 09:29 nftla6


thank you all !!


Patrick Allaire
mailto:pallaire@gameloft.com
If you can see it, but it's not there, it's virtual. 
If you can't see it, but it is there, it's hidden. 
It you can't see it and it isn't there, it's gone.
