Received: from mail4.cadvision.com ([207.228.64.49])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 161u5n-0003j0-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Nov 2001 18:39:59 +0000
From: Herman Oosthuysen <herman@wirelessnetworksinc.com>
To: "Daniel Manesajian" <dmanesajian@nextgig.com>,
        <linux-mtd@lists.infradead.org>
Subject: Re: StrataFlash and patching 2.2.16
Date: Thu, 8 Nov 2001 11:46:45 -0700
Content-Type: text/plain
References: <CAEBIEGNEOADOFPNEPJJOEEBCDAA.dmanesajian@nextgig.com>
In-Reply-To: <CAEBIEGNEOADOFPNEPJJOEEBCDAA.dmanesajian@nextgig.com>
MIME-Version: 1.0
Message-Id: <01110811510301.00788@grosmorne.wirelessnetworksinc.com>
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi Daniel,

Bad news for you - the JFFS2 only works with kernel 2.4 and later.

You can however get a simple flash file system from Intel for the enormous price
of $99.  Secondly, Wireless Networks Inc. ported the Intel IVFM to Linux.  Intel
plans to ship it as an example implementation with their IVFM.

So, your next step is to contact your local Intel distributor and order the
IVFM.  Then you can download it off their web site.  If our port is not
included, then contact me and I can supply it, if you provide proof of purchase
from Intel.

The Intel IVFM is very simple - no subdirectories, but it works fine for an
embedded system.

Cheers,

Herman


On Thu, 08 Nov 2001, Daniel Manesajian wrote:
> Hi list,
> 
> This is my first post here. I've been looking at MTD for a few days now as a
> solution for getting the Intel Advanced StrataFlash working under Linux.
> 
> I've downloaded the latest code from CVS and read the document
> "mtd-jffs-HOWTO.txt". I've also started looking through the source code. I
> hoping someone can help me with a few questions. First of all, will MTD
> support the StrataFlash "out of the box" or will I have to write an MTD
> driver for it? Second, I'm running kernel version 2.2.16 and don't see a
> corresponding patch at ftp://ftp.infradead.org/pub/mtd/patches. On the MTD
> web page it did mention a patch for 2.2.16 but is this kernel no longer
> supported? If not is my only option to upgrade my kernel (this isn't very
> feasible due to an external vendor's kernel modifications)?
> 
> Thank you for your help.
> 
> Daniel Manesajian
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
-- 
Herman Oosthuysen
E-mail: Herman@WirelessNetworksInc.com
Phone: 403+569-5687, Fax: 403+235-3965
