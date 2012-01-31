Received: from cluster-g.mailcontrol.com ([208.87.233.190])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsAWB-0000bM-5u
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 10:00:53 +0000
Received: from rly32g.srv.mailcontrol.com (localhost.localdomain [127.0.0.1])
 by rly32g.srv.mailcontrol.com (MailControl) with ESMTP id
 q0VA0jcp008948
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 10:00:47 GMT
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly32g.srv.mailcontrol.com (MailControl) id q0VA0P94005946
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 10:00:25 GMT
From: Barry Song <Barry.Song@csr.com>
To: Greg Kroah-Hartman <gregkh@suse.de>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] platform: add platform_devm_request_and_ioremap() common
 API
Date: Tue, 31 Jan 2012 17:59:59 +0800
Message-ID: <1328004002-24646-1-git-send-email-Barry.Song@csr.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, Barry Song <Barry.Song@csr.com>,
 workgroup.linux@csr.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

these patches move the common pattern from

"
res = platform_get_resource(pdev, IORESOURCE_MEM, 0); 
if (!res) {
	        ret = -ENODEV;
		        goto err;
}

base = devm_request_and_ioremap(&dev->dev, mem_res);
if (!base) {
	        ret = -ENODEV;
		        goto err;
}
"

to

"
base = platform_devm_request_and_ioremap(pdev, 0); 
if (!base) {
	        ret = -ENODEV;
		        goto err;
}
"


Barry Song (3):
  platform: add common resource requesting and mapping helper
  GPIO: TEGRA: move to use platform_devm_request_and_ioremap() helper
  MTD: NAND: txx9ndfmc: move to use platform_devm_request_and_ioremap()
    helper

 drivers/base/platform.c         |   19 +++++++++++++++++++
 drivers/gpio/gpio-tegra.c       |    8 +-------
 drivers/mtd/nand/txx9ndfmc.c    |    6 +-----
 include/linux/platform_device.h |    1 +
 4 files changed, 22 insertions(+), 12 deletions(-)



Member of the CSR plc group of companies. CSR plc registered in England and Wales, registered number 4187346, registered office Churchill House, Cambridge Business Park, Cowley Road, Cambridge, CB4 0WZ, United Kingdom
More information can be found at www.csr.com. Follow CSR on Twitter at http://twitter.com/CSR_PLC and read our blog at www.csr.com/blog
