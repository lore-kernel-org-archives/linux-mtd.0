Received: from wx-out-0506.google.com ([66.249.82.235])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I3G37-0002eG-RW
	for linux-mtd@lists.infradead.org; Tue, 26 Jun 2007 14:46:04 -0400
Received: by wx-out-0506.google.com with SMTP id h26so1908446wxd
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Jun 2007 11:46:00 -0700 (PDT)
Message-ID: <4dde4acb0706261146s5906d8f3vb787d5aecb429116@mail.gmail.com>
Date: Wed, 27 Jun 2007 00:16:00 +0530
From: "Midhun Agnihotram" <agnimidhun@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Mounting MMC card
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

   I am using Cogent CSB535FS board. The kernel has got MMC card
support. So when I insert the card, it says :

# imx-mmc imx-mmc.0: card inserted

   So, the kernel has identified that MMC has been inserted. I have
the following dev entries for mmc:

brwxrwxrwx    1 0        0        254,   0 Jun 26  2007 mmcblk0
brwxrwxrwx    1 0        0        254,   1 Jun 26  2007 mmcblk0p0
brwxrwxrwx    1 0        0        254,   2 Jun 26  2007 mmcblk0p1
brwxrwxrwx    1 0        0        254,   3 Jun 26  2007 mmcblk0p2
brwxrwxrwx    1 0        0        254,   4 Jun 26  2007 mmcblk0p3

    How do I access the MMC card data now? If I try to mount it,
busybox doesnot mount it.

# mount /dev/mmcblk0p0 /mnt
mount: mounting /dev/mmcblk0p0 on /mnt failed

  How do I access the contents of MMC card? Is there any thing missing
in my settings?

Thanks,
Midhun.
