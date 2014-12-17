Received: from plane.gmane.org ([80.91.229.3])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1L5A-0003AB-CY
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 20:20:29 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1Y1L4l-0007uL-9O
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 21:20:03 +0100
Received: from tcccf2.etn.com ([192.104.67.222])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Wed, 17 Dec 2014 21:20:03 +0100
Received: from rajkapur by tcccf2.etn.com with local (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Wed, 17 Dec 2014 21:20:03 +0100
To: linux-mtd@lists.infradead.org
From: Raj Kapur <rajkapur@yahoo.com>
Subject: UBIFS power cuts corruption on MLC flash
Date: Wed, 17 Dec 2014 20:18:19 +0000 (UTC)
Message-ID: <loom.20141217T210421-115@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

We are new linux users and are confused about the latest information on 
the unstable bits issue with MLC flash. We have embedded linux 2.6.35 with 
UBIFS running on a board with MLC Nand flash. Can somebody please clarify 
if a UBIFS will handle memory corruption on a power cut on a board with 
MLC NAND flash?

We are trying to understand how serious this problem is for the NAND flash 
and if anybody has any recommendations or solutions you could offer.

Thanks.
 
