Received: from mail-bn1bon0057.outbound.protection.outlook.com
 ([157.56.111.57] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoxHO-0007bE-Rr
 for linux-mtd@lists.infradead.org; Thu, 13 Nov 2014 16:29:56 +0000
Date: Thu, 13 Nov 2014 10:26:39 -0600
From: Graham Moore <grmoore@opensource.altera.com>
To: bpqw <bpqw@micron.com>
Subject: RE: [V5 PATCH 1/1] driver:mtd:spi-nor: Add quad I/O support for
 Micron spi nor
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315EB0DA@NTXXIAMBX02.xacn.micron.com>
Message-ID: <alpine.DEB.2.02.1411130945300.19890@lava-test-server>
References: <A765B125120D1346A63912DDE6D8B6315DCC46@NTXXIAMBX02.xacn.micron.com>
 <201409251211.57183.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315DCDF1@NTXXIAMBX02.xacn.micron.com>
 <201409261046.07132.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315EA24E@NTXXIAMBX02.xacn.micron.com>
 <54613259.4070903@opensource.altera.com>
 <alpine.DEB.2.02.1411111336010.1356@lava-test-server>
 <A765B125120D1346A63912DDE6D8B6315EB0DA@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Cc: Marek Vasut <marex@denx.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "shijie8@gmail.com" <shijie8@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Wed, 12 Nov 2014, bpqw wrote:

> This maybe your spi controller is still extended mode, 
> Once EVCR bit 7 is set to 0, the spi nor device will operate in quad I/O.Command-address-data line is 4-x-4.
> So after send WRITE EVCR command , spi controller also  must transfer to quad I/O Mode,and set its Command-address-data line also
> Should be 4-x-4 .

Thanks, this helped.  I added some code to snoop the command stream for 
WRITE EVCR with quad mode, and then set up the quad mode in the 
controller.  Seems kinda ugly, but working now.

-Graham
