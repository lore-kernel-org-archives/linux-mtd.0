Received: from mail-gx0-f160.google.com ([209.85.217.160])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LZzLR-0006dL-I2
	for linux-mtd@lists.infradead.org; Thu, 19 Feb 2009 03:13:04 +0000
Received: by gxk4 with SMTP id 4so611845gxk.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 18 Feb 2009 19:13:00 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 18 Feb 2009 19:13:00 -0800
Message-ID: <5c9cd53b0902181913j445175ebgbf7c2ee2d9201547@mail.gmail.com>
Subject: jffs2 on NOR flash
From: mike zheng <mail4mz@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I allocated 3 partitions on my NOR flash. After Linux bootup, all
paritions are found in the /proc/mtd. I verified the flash driver with
"od -x /dev/mtdxxx".

Do I have to use mkfs.jffs2 to format the partition before use it? Or
I can just mount it as "mount -t jffs2 /dev/mtdblock0 /mnt"?

Thanks,

Mike
