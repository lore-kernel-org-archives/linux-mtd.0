Received: from rproxy.gmail.com ([64.233.170.192])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DVTHh-0006ih-HG
	for linux-mtd@lists.infradead.org; Tue, 10 May 2005 07:52:22 -0400
Received: by rproxy.gmail.com with SMTP id y7so1043484rne
	for <linux-mtd@lists.infradead.org>;
	Tue, 10 May 2005 04:52:26 -0700 (PDT)
Message-ID: <f6d0cd0605051004524bab895b@mail.gmail.com>
Date: Tue, 10 May 2005 17:22:26 +0530
From: Niraj Maheshwari <niraj.maheshwari@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: SUMMARY patch for JFFS2
Reply-To: Niraj Maheshwari <niraj.maheshwari@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am using Intel NOR flash having a 5.5 MB parition specific for
JFFS2. I have enabled the JFFS2 SUMMARY option after applying the
patch from the below
website on latest MTD for JFFS2 only.

http://www.inf.u-szeged.hu/jffs2/mount.php

Flash is completely erased and i am trying to mount this by using=20

mount -t jffs2 /dev/mtdblock0 tmp/

It gets mounted..and then i completely full this partition ( 5.5 MB)
with data... then i  remove few of the files from this partition..then
i do a sync.

In the next reboot, i get to see lot of error while mounting this parition.

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00270020:
0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00270024:
0x00b0 instead
Further such events for this erase block will not be printed=20

Am i doing some mistake as i guess SUMMARY patch must have been
completely tested for NOR flash as mentioned in the site.

I am having the same problem when i try to use SUMMARY in JFFS3.=20

If you could help me out to resolve this problem then it would be great.

Thanks
Niraj
