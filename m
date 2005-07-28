Received: from wproxy.gmail.com ([64.233.184.196])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1Dy3Gf-0005f1-JX
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2005 03:57:34 -0400
Received: by wproxy.gmail.com with SMTP id i20so347234wra
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Jul 2005 00:57:24 -0700 (PDT)
Message-ID: <9185a3fa0507280057dcd057f@mail.gmail.com>
Date: Thu, 28 Jul 2005 16:57:23 +0900
From: Amit Sharma <amitsharma91@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: JFFS2 mounting problem
Reply-To: Amit Sharma <amitsharma91@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi  all

I am working on JFFS2 MTD driver on NAND device

I try to copy file to JFFs2 partition before mounting my device to mnt
partition but after mounting i do not find any file in my mount
directory.

Can any one help me why i donot find any file in mount directory after
mounting when device have file.

mkfs.jffs2 -d /home/jffs2stuff -o /tmp/jffs2.image
cat /tmp/jffs2.image >/dev/mtdblock/0
mount -t jffs2 /dev/mtdblock/0 /mnt/
ls
--------No file available--------

but i am able to create file after mounting in jffs2 partition.

Regards
AK
