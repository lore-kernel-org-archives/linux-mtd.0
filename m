Received: from [207.164.182.16] (helo=cbnsitar.cbnco.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16GjaK-00060a-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Dec 2001 16:28:48 +0000
Received: from wann.com (porcupine.wann.com [207.164.182.104])
	by cbnsitar.cbnco.com (8.11.3/8.11.3/SuSE Linux 8.11.1-0.5) with ESMTP id fBJGdCY13082
	(using TLSv1/SSLv3 with cipher RC4-MD5 (128 bits) verified NO)
	for <linux-mtd@lists.infradead.org>; Wed, 19 Dec 2001 11:39:14 -0500
Message-ID: <3C20C36F.D02FD5A5@wann.com>
Date: Wed, 19 Dec 2001 11:42:23 -0500
From: Vladimir Doukhanine <vdoukhan@wann.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Two flash chips with a gap between them.
References: <01121914160800.03136@rob>  <Pine.LNX.4.21.0112181832140.3242-100000@dagobert.svc.sysgo.de> <20544.1008697534@redhat.com> <12142.1008768097@redhat.com>
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 7bit
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

Hi,

I have two flash chips Am29lv320db90ei, which are physically mapped to
different memory areas and even have a memory gap between each other. I
would like to have one file system (JFFS2) for these two chips.
Is it possible to create only one MTD partition&JFFS2 on top of them?
Or the only way is to create MTD partitions & JFFS2 for each of the
chips? (Does it mean that in this case each JFFS2 going to have 4 blocks
overhead? I guess so.)

Thanks,
Vlad
