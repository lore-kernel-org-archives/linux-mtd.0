Received: from casablanca.magic.fr ([195.154.101.81])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 159mPb-0000na-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 12:32:43 +0100
Received: from serveur.inventel.fr (ppp-146.net-1002.magic.fr [195.115.184.146])
	by casablanca.magic.fr (8.9.3/8.9.3) with ESMTP id NAA26776
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 13:38:12 +0200 (CEST)
Message-ID: <3B25FEB8.A00FCE03@inventel.fr>
Date: Tue, 12 Jun 2001 13:36:24 +0200
From: Xavier DEBREUIL <xde@inventel.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: unable to mount jffs2
References: <3B24EC1B.7F920021@inventel.fr>  <991934470.27485.0.camel@timmy> <20010607114319.A23641@crystal.2d3d.co.za> <20010607110359.A22278@crystal.2d3d.co.za> <19468.991906514@redhat.com> <23825.991907052@redhat.com> <9968.991944081@redhat.com> <2667.992333648@redhat.com> <3B25DE97.D2041C9@inventel.fr>
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

I am using mtd-snapshot-20010610

I have made a jffs2 file on my computer ;
loaded it via ftp onto my arm board ;
erased the mtd1 partition : eraseall /dev/mtd1
copy the file in it : cp -a jffs2 /dev/mtd1

tried to mount it :
mount -t jffs2 /dev/mtdblock1 /mnt/jffs2/jffs2_1

and then the system stopped on the following :

/mnt/ramdisk/rd1 # mount -t jffs2 /dev/mtdblock1 /mnt/jffs2/jffs2_1
mtdblock_open
ok
jffs2_scan_empty(): Empty block at 0x0000fffc ends at 0x00010000 (with
0xe0021985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x0002fffc ends at 0x00030000 (with
0xe0021985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x0004fffc ends at 0x00050000 (with
0xe0021985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x0006fffc ends at 0x00070000 (with
0xe0021985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x000afffc ends at 0x000b0000 (with
0xe0021985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x000efffc ends at 0x000f0000 (with
0xe0021985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x0010fffc ends at 0x00110000 (with
0xe0021985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x0012fffc ends at 0x00130000 (with
0xe0021985)! Marking dirty
jffs2_scan_empty(): Empty block at 0x0014fffc ends at 0x00150000 (with
0xe0021985)! Marking dirty


Any help is welcomed.

Xavier
