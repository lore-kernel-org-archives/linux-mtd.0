Received: from [212.81.48.35] (helo=fides.aptilo.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19usVv-0001lm-IQ
	for <linux-mtd@lists.infradead.org>; Thu, 04 Sep 2003 12:42:59 +0100
Received: from kala.sth.aptilo.com (kala.sth.aptilo.com [192.168.121.15])
	by fides.aptilo.com (Postfix) with ESMTP id 88302837CF
	for <linux-mtd@lists.infradead.org>;
	Thu,  4 Sep 2003 13:42:20 +0200 (CEST)
From: Olov Hisved <olov.hisved@aptilo.com>
To: MTD <linux-mtd@lists.infradead.org>
Message-Id: <1062686428.31308.17.camel@kala.sth.aptilo.com>
Mime-Version: 1.0
Date: 04 Sep 2003 13:40:28 -0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: ATA flash and JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all!

I am running linux, ext3 fs, on a Compaq t5700. It is a thin client with
256Mb of ATA flash memory from Apacer. Now I am looking for information
regarding different filesystems in conjunction with ATA flash memory.
I guess it would be possible to mount an JFFS2 image as a mtdblock
device, but would it really improve fail safty of my system?

JFFS2 wear levelling will probably not work, since the IDE interface is
in between the FS driver and flash memories. Are there any other aspects
to run JFFS2 VS other filesystems on ATA flash disks?

Happy for all comments.

/Cheers Olov 
