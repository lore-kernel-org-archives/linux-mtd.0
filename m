Received: from mx1.redhat.com ([66.187.233.31])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K7ARr-0002Rt-Hf
	for linux-mtd@lists.infradead.org; Fri, 13 Jun 2008 14:40:15 +0000
Received: from int-mx1.corp.redhat.com (int-mx1.corp.redhat.com
	[172.16.52.254])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id m5DEdtuB026030
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jun 2008 10:39:55 -0400
Received: from pobox.corp.redhat.com (pobox.corp.redhat.com [10.11.255.20])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5DEdtdS026104
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jun 2008 10:39:55 -0400
Received: from [10.11.15.61] (vpn-15-61.rdu.redhat.com [10.11.15.61])
	by pobox.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5DEdsIO018490
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jun 2008 10:39:54 -0400
Subject: DiskOnChip Millennium Plus 32MB
From: Mark Salter <msalter@redhat.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Fri, 13 Jun 2008 10:39:54 -0400
Message-Id: <1213367994.3057.24.camel@deneb.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a box with a Millennium Plus 64MB part (MD3331-D64-V3) which is
really just two 32MB parts on the same die. I'm not having much luck
with mtd, though. If I use docprobe/doc2000plus/inftl, I get a message
from inftl saying that the old (doc2000plus) driver is not supported and
I should use the diskonchip driver under the nand directory. This was
discussed a couple of years ago and a patch was claimed to be nearly
ready:

  http://lists.infradead.org/pipermail/linux-mtd/2005-May/012592.html

The current nand/diskonchip.c has this:

  case DOC_ChipID_DocMilPlus32:
    printk(KERN_ERR "DiskOnChip Millennium Plus 32MB is not supported, ignoring.\n");
  default:
   ret = -ENODEV;
   goto notfound;

So it seems the 32MB support never showed up. Am I missing anything? Was
the patch ever submitted?

--Mark
