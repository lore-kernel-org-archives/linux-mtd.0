Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atWKH-0003KL-Rx
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2016 08:20:34 +0000
Received: by mail-wm0-x232.google.com with SMTP id u206so14603499wme.1
 for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2016 01:20:13 -0700 (PDT)
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Murali Karicheri <m-karicheri2@ti.com>
Cc: linux-mtd@lists.infradead.org
From: Petr Kulhavy <petr@barix.com>
Subject: DaVinci NAND: disable subpage write (28c015)
Message-ID: <5719DEB9.1020909@barix.com>
Date: Fri, 22 Apr 2016 10:20:09 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
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

this email refers to the commit: 
28c015a9daabe4ed3aeb0ccf669a3f1c2b8b81d5 on drivers/mtd/nand/davinci-nand.c.
This commit sets the NAND_NO_SUBPAGE_WRITE option for "ti,keystone-nand" 
to workaround a HW issue on the controller.

Disabling subpage write however should be made a general option because 
some NAND chips do not support subpage write at all. Subpage write is a 
feature of the NAND chip, not the NAND interface. In combination with  
"ti,davinci-nand" there is no option to disable subpage write.
In my case I'm struggling with this issue on the AM1808 with a 1Gb 
Micron NAND (MT29F1GxxABB).

My proposal would be to add a boolean property 
"ti,davinci-disable-subpage-write" or similar, which sets the 
NAND_NO_SUBPAGE_WRITE option.
I'm also wondering why no other binding is addressing this, as it is a 
general problem.

I wanted to collect your opinion before submitting a patch.

Thanks
Petr
