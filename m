Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TE6Kf-00089L-2R
 for linux-mtd@lists.infradead.org; Tue, 18 Sep 2012 22:31:55 +0000
Message-ID: <1348011095.25236.15.camel@dinh-ubuntu>
Subject: nand/denali: Enable DT for Denali NAND controller
From: Dinh Nguyen <dinguyen@altera.com>
To: <jamie@jamieiles.com>
Date: Tue, 18 Sep 2012 17:31:35 -0600
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Cc: ZY - pavel <pavel@denx.de>, linux-mtd@lists.infradead.org,
 David.Woodhouse@intel.com, chuanxiao.dong@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jamie,

I saw that you posted a series of patches about a year ago to convert
the PCI Denali NAND controller over to a non-PCI based driver. It seems
that the best solution was to make it DT compatible, which at the time
the patch was posted, DT was not available on ARM.

http://thread.gmane.org/gmane.linux.drivers.mtd/35031/focus=35101

It appears that the denali NAND driver has not been enabled for DT yet.
Do you know if there is still an interest in doing that and if I can
help in anyway? I have a strong interest in converting the denali NAND
driver to be DT capable.

Thanks,

Dinh Nguyen
