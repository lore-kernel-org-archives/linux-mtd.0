Received: from mail-it0-x232.google.com ([2607:f8b0:4001:c0b::232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTWyZ-0007Bh-Qa
 for linux-mtd@lists.infradead.org; Thu, 14 Jun 2018 18:28:05 +0000
Received: by mail-it0-x232.google.com with SMTP id a3-v6so10019446itd.0
 for <linux-mtd@lists.infradead.org>; Thu, 14 Jun 2018 11:27:53 -0700 (PDT)
MIME-Version: 1.0
From: Martin Townsend <mtownsend1973@gmail.com>
Date: Thu, 14 Jun 2018 19:27:42 +0100
Message-ID: <CABatt_x=VnG18LJS4DyWpZJPog5w+4irorgZSkqZCp0bdMJ5-Q@mail.gmail.com>
Subject: mtdparts ro question
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

A quick question:

when the ro flag is set on an MTD Partition in the mtdparts kernel
bootargs is there a system call or ioctl or any other way that
userspace can override this setting to make the MTD partition
read/write.  I don't think there is but I just want to double check.
The reason is that if I want to update the file-system on that
partition I take it would have to reboot and remove the flag at the
bootloader state.

Many Thanks,
Martin.
