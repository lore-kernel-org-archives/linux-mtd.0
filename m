Received: from mail-gx0-f176.google.com ([209.85.217.176])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M9rWW-0003q2-NK
	for linux-mtd@lists.infradead.org; Fri, 29 May 2009 02:08:51 +0000
Received: by gxk24 with SMTP id 24so1611061gxk.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 May 2009 19:08:43 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 28 May 2009 19:08:43 -0700
Message-ID: <1c3f4270905281908g75069b39sbc2167b5a3d32d1b@mail.gmail.com>
Subject: ubiformat error
From: Manoj <manoj23@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am trying to flash an UBI image to NAND flash. But I get an error
about "No such file or directory".

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 01000000 00020000 "NAND-block1"
mtd1: 01e00000 00020000 "jffs2"
mtd2: 0d200000 00020000 "NAND-block2"
# ubiformat /dev/mtd1
ubiformat: error!: cannot get information about "/dev/mtd1"
           error 2 (No such file or directory)
# ls -l /dev/mtd1
crw-rw-r--    1 root     root      90,   2 Dec 31 16:00 /dev/mtd1

I am able to do ubiattach with mtd1, create an empty volume and mount
the volume as ubifs.

Thanks.
