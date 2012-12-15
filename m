Received: from plane.gmane.org ([80.91.229.3])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tjm7F-0006Ws-9J
 for linux-mtd@lists.infradead.org; Sat, 15 Dec 2012 07:24:58 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1Tjm7M-0004Ny-Fe
 for linux-mtd@lists.infradead.org; Sat, 15 Dec 2012 08:25:04 +0100
Received: from 91.150.147.9.internetia.net.pl ([91.150.147.9])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Sat, 15 Dec 2012 08:25:04 +0100
Received: from bl0-052 by 91.150.147.9.internetia.net.pl with local (Gmexim
 0.1 (Debian)) id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Sat, 15 Dec 2012 08:25:04 +0100
To: linux-mtd@lists.infradead.org
From: bl0 <bl0-052@playker.info>
Subject: block2mtd equivalent for NAND flash?
Date: Sat, 15 Dec 2012 08:20:22 +0100
Message-ID: <kah8ae$7ih$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Not sure if this is the right place to ask this question.
Is there any way to emulate NAND flash on top of a block device, with data
preserved across reboots, like block2mtd for NOR? I tried nandsim with
cache_file paremeter, the data is gone when the module is reloaded.

-- 
bl0
