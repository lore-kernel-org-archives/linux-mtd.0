Received: from wproxy.gmail.com ([64.233.184.205])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F9V7X-00045v-7W
	for linux-mtd@lists.infradead.org; Wed, 15 Feb 2006 17:27:37 -0500
Received: by wproxy.gmail.com with SMTP id 58so228914wri
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Feb 2006 14:27:30 -0800 (PST)
Message-ID: <7e560e180602151427x3efcd032n9e43b29f084c54b4@mail.gmail.com>
Date: Thu, 16 Feb 2006 11:27:30 +1300
From: Braden Simpson <braden.simpson@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: Diskonchip BDK versus BDTL partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I am building a system on a Diskonchip 2000 TSOP and I'm a little
confused over the
distinction between a BDK binary partition and a BDTL disk partition.
I had gathered
from what I had read that the Diskonchip NAND driver didn't care if a
partition was BDK
or BDTL, but recent problems indicate that this might not be the case.

My understanding of the layers between the filesystem and the physical
chips on the
Diskonchip are shown in the diagrams below.

Ext2 filesystem:

   EXT2 -> MTDBLOCKn -> INFTL -> NAND (Diskonchip) -> DISKONCHIP

JFFS2 filesystem:

   JFFS2 -> MTDBLOCKn -> NAND (Diskonchip) -> DISKONCHIP

This is based on the parameters to the mount command that are used:
   "mount /dev/mtdblock2 /mnt" for ext2 formatted partitions
   "mount -t jffs2 /dev/mtdblock2 /mnt" for JFFS2 formatted partitions

Things all seem to work fine for mtdblock2, which is a BDK partition,
but the BDTL
partition on mtdblock3 will not mount with the ext2 filesystem.

Regards,

Braden Simpson
