Received: from myyr.colleduc.ee ([193.40.113.30] helo=kiire.colleduc.ee)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bp8sK-00079F-KP
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2004 13:02:59 -0400
Received: from smartlink.ee (mail.smartlink.ee [213.180.16.242])
	(authenticated bits=0)
	by kiire.colleduc.ee (8.12.11/8.12.10) with ESMTP id i6QH2nS0014419
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Mon, 26 Jul 2004 20:02:50 +0300
Message-ID: <41053939.3090106@smartlink.ee>
Date: Mon, 26 Jul 2004 20:02:49 +0300
From: Kalev Lember <kalev@smartlink.ee>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Millennium Plus support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have just committed support for the Diskonchip Millennium Plus in the 
new diskonchip driver. I believe the old driver will be phased out soon, 
so it is the right time to start testing. Unfortunately it supports only 
16 MB devices at the moment.

The new driver enables proper jffs2 and nandwrite operation on diskonchips.

Todo:

* page 0x1 does not have any ECC checksum (it is all 0xff), therefore 
nanddump dies on this page. It is generally seen as nanddump problem.
* the driver does not support Diskonchip Millennium 32MB based devices 
(I plan to add support to it later, but I do not have any of those 
devices at hand. I would find useful a Mil+ 32MB based PCI evaluation 
board, if any of you have a spare one )

-- 
Best regards,
Kalev Lember
