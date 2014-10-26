Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XiU17-0004Dj-TP
 for linux-mtd@lists.infradead.org; Sun, 26 Oct 2014 20:02:23 +0000
Date: Sun, 26 Oct 2014 21:01:51 +0100 (CET)
From: Stefan Wahren <stefan.wahren@i2se.com>
Reply-To: Stefan Wahren <stefan.wahren@i2se.com>
To: linux-mtd@lists.infradead.org
Message-ID: <1081390030.524273.1414353711820.JavaMail.open-xchange@oxbsltgw08.schlund.de>
Subject: Questions about OTP driver
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

currently i try to port a driver for One Time Programmable memory pages on
Freescale MX23/MX28 (ARM9) SoC.
This driver gives readonly access to these memory pages via Sysfs.

As i created a patch RFC [1], Arnd Bergmann suggested me to move the driver to
MTD.

Now i have some questions:

1. What exact directory is suggested for OTP on SoC driver?
2. What is a good example implementaton of an OTP driver?

Best regards

Stefan Wahren

[1] -
http://lists.infradead.org/pipermail/linux-arm-kernel/2014-October/295228.html
