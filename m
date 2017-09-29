Received: from mail-lf0-x230.google.com ([2a00:1450:4010:c07::230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dy4Zz-0002YH-Jn
 for linux-mtd@lists.infradead.org; Fri, 29 Sep 2017 23:20:25 +0000
Received: by mail-lf0-x230.google.com with SMTP id d17so1044899lfe.2
 for <linux-mtd@lists.infradead.org>; Fri, 29 Sep 2017 16:20:02 -0700 (PDT)
MIME-Version: 1.0
From: Doug Crawford <dcraw101@gmail.com>
Date: Fri, 29 Sep 2017 16:20:00 -0700
Message-ID: <CAAEsGz+1T6eAHW_adm-RKHoaK6gv=ZtRdcMTum6+s1TXR0PzEQ@mail.gmail.com>
Subject: ubifs robustness with early power cut warning
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

We have an embedded system with an early power loss warning.  The
power supply drives a powerdown signal connected to a GPIO pin on the
CPU.  When AC power is switched off the power supply drives this
signal low for 500 milliseconds before the CPU gets held in reset.  If
AC power is switched back on before 500 milliseconds the powerdown
signal goes high again and the system is expected to continue running
normally.

I am wondering if there is a way to easily modify ubifs/ubi such that
when the powerdown gpio is low VFS or UBIFS or UBI freezes or pauses
further writes to the NAND.  If powerdown recovers to high again then
the filesystem would unfreeze and allow further writes?  Has anyone
implemented something like this before?  I know UBIFS/UBI is designed
to be very resilient to power cuts, but I am thinking this technique
might make the system even more resilient.  If I were to make this
change which file would be the right one to hook into:
fs/ubifs/super.c?
