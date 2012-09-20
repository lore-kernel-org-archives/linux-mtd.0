Received: from switchvoice.com ([77.70.97.103] helo=mail.bioidentic.com)
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TEcMo-0001IU-QI
 for linux-mtd@lists.infradead.org; Thu, 20 Sep 2012 08:44:15 +0000
Received: from dpn (unknown [192.168.1.41])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.bioidentic.com (Postfix) with ESMTP id 23C8E3C52A3
 for <linux-mtd@lists.infradead.org>; Thu, 20 Sep 2012 11:44:12 +0300 (EEST)
Message-ID: <006c01cd970c$1b9cb930$2901a8c0@dpn>
From: "Dimitar Penev" <dpn@switchfin.org>
To: <linux-mtd@lists.infradead.org>
Subject: ubiattach  issue
Date: Thu, 20 Sep 2012 11:44:11 +0300
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
 reply-type=original
Content-Transfer-Encoding: 7bit
Reply-To: Dimitar Penev <dpn@switchfin.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Gents,

I am facing an issue with ubiattach on Linux kernel 3.0.8
On our target we have nand flash with mtd layer on top.
The logs attached below.

Can you please give me a pointer?


/bin # ubinfo -a
UBI version:                    1
Count of UBI devices:           0
UBI control device major/minor: 10:62

/bin # ubiformat /dev/mtd5 -y --vid-hdr-offset="2048"
ubiformat: mtd5 (nand), size 511705088 bytes (488.0 MiB), 3904 eraseblocks 
of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 3903 -- 100 % complete
ubiformat: 3904 eraseblocks have valid erase counter, mean value is 3
ubiformat: formatting eraseblock 3903 -- 100 % complete

/bin # ubiattach /dev/ubi_ctrl --mtdn=5 --devn=0 --vid-hdr-offset="2048"
ubiattach: error!: cannot attach mtd5
           error 25 (Inappropriate ioctl for device)


Best Regards
Dimitar 
