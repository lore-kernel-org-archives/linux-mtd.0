Received: from jerusalem.magic.fr ([195.154.101.82])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 159pt9-0001C8-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 16:15:28 +0100
Received: from serveur.inventel.fr (ppp-146.net-1002.magic.fr [195.115.184.146])
	by jerusalem.magic.fr (8.9.0/8.9.0) with ESMTP id RAA17024
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 17:20:52 +0200 (CEST)
Message-ID: <3B2632EA.B38B039C@inventel.fr>
Date: Tue, 12 Jun 2001 17:19:06 +0200
From: Xavier DEBREUIL <xde@inventel.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: unable to modify jffs2
References: <3B260CB7.E1513BBD@inventel.fr>  <3B25FEB8.A00FCE03@inventel.fr> <3B24EC1B.7F920021@inventel.fr> <991934470.27485.0.camel@timmy> <20010607114319.A23641@crystal.2d3d.co.za> <20010607110359.A22278@crystal.2d3d.co.za> <19468.991906514@redhat.com> <23825.991907052@redhat.com> <9968.991944081@redhat.com> <2667.992333648@redhat.com> <3B25DE97.D2041C9@inventel.fr> <3161.992348379@redhat.com> <5586.992349315@redhat.com> <3B261F73.BF7325E1@inventel.fr>
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

I have managed to mount the jffs2 ;
however, it seems that I cannot erase anything or write anything on it

/mnt/jffs2/jffs2_1/bin # df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/ram0                 3963      2997       966  76% /
/dev/ram1                 2011        13      1998   1% /mnt/ramdisk/rd1
/dev/mtdblock1            2048      2048         0 100%
/mnt/jffs2/jffs2_1

/mnt/jffs2/jffs2_1/bin # mount 
/dev/ram0 on / type ext2 (rw)
none on /proc type proc (rw)
none on /dev/pts type devpts (rw)
/dev/ram1 on /mnt/ramdisk/rd1 type ext2 (rw)
/dev/mtdblock1 on /mnt/jffs2/jffs2_1 type jffs2 (rw)

I can list, chroot and execute things on the filesystem but no
erasure...
Is there an option I've missed ?

Xavier
