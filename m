Received: from motgate8.mot.com ([129.188.136.8])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bq5RJ-0006q6-9N
	for linux-mtd@lists.infradead.org; Thu, 29 Jul 2004 03:34:58 -0400
Received: from il06exr02.mot.com (il06exr02.mot.com [129.188.137.132])
	by motgate8.mot.com (Motorola/Motgate8) with ESMTP id i6T7ZjRC016155
	for <linux-mtd@lists.infradead.org>;
	Thu, 29 Jul 2004 00:35:46 -0700 (MST)
Received: from zch07exm04.corp.mot.com (ZCH07EXM04.corp.mot.com [200.3.1.210])
	by il06exr02.mot.com (Motorola/il06exr02) with ESMTP id
	i6T7XfPO027238
	for <linux-mtd@lists.infradead.org>; Thu, 29 Jul 2004 02:33:42 -0500
Message-ID: <01139FC052A0D411900B00508B9535FC13AC4286@ZCH07EXM04.corp.mot.com>
From: Shen Aaron-r62966 <Aaron.Shen@freescale.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Thu, 29 Jul 2004 15:34:51 +0800
MIME-Version: 1.0
Content-Type: text/plain
Subject: fs not recognized when upgrading kernel from 2.4.18 to 2.4.20
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

  Now my Embeded linux system is using the 2.4.18 kernel. And everything is ok including 
scaning the cramfs and jffs2 rootdisk.

  But after I upgrade the kernel to be 2.4.20 and merged my modification to it, the rootdisk 
will not be recognized correctly. For cramfs rootdisk, it will say "cramfs: wrong magic". And 
for jffs2 rootdisk, it will scan each eraseblock and finally says no block is formatted.

  I havn't modified any codes in linux/fs/ and they should work fine. So I suspect the function 
like "read_super" may not work for the old rootdisk? But I havn't seen any notice which says 
the "mkcramfs" and "mkjffs2" need to be rebuild.

  Anybody has such experience? Looking forward to your feedback....

  Thanks!

Best Regards!
Feng Shen (Aaron)
