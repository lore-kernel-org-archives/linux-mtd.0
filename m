Received: from mail.mediatrix.com ([205.237.248.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 159pxT-0001CT-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 16:19:55 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D9954A3@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: 'Xavier DEBREUIL' <xde@inventel.fr>, linux-mtd@lists.infradead.org
Subject: RE: unable to modify jffs2
Date: Tue, 12 Jun 2001 11:20:33 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

Are you sure your erase function ( at command set level ) works =
properly^

Fr=E9d=E9ric Giasson





-----Original Message-----
From: Xavier DEBREUIL [mailto:xde@inventel.fr]
Sent: Tuesday, June 12, 2001 11:19 AM
To: linux-mtd@lists.infradead.org
Subject: unable to modify jffs2


I have managed to mount the jffs2 ;
however, it seems that I cannot erase anything or write anything on it

/mnt/jffs2/jffs2_1/bin # df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/ram0                 3963      2997       966  76% /
/dev/ram1                 2011        13      1998   1% =
/mnt/ramdisk/rd1
/dev/mtdblock1            2048      2048         0 100%
/mnt/jffs2/jffs2_1

/mnt/jffs2/jffs2_1/bin # mount=20
/dev/ram0 on / type ext2 (rw)
none on /proc type proc (rw)
none on /dev/pts type devpts (rw)
/dev/ram1 on /mnt/ramdisk/rd1 type ext2 (rw)
/dev/mtdblock1 on /mnt/jffs2/jffs2_1 type jffs2 (rw)

I can list, chroot and execute things on the filesystem but no
erasure...
Is there an option I've missed ?

Xavier

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
