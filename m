Received: from xrelay.neomagic.com ([209.172.119.197] helo=relay.neomagic.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E0AVU-00017P-9m
	for linux-mtd@lists.infradead.org; Wed, 03 Aug 2005 00:05:37 -0400
Received: from mail.neomagic.com
	(IDENT:U2FsdGVkX19LPWM0cN7KWeYwoJ8xOsc2Fgr3PSYm4xA@scha25.neomagic.com
	[192.168.51.45])
	by relay.neomagic.com (8.13.1/8.12.5) with ESMTP id j7343p0i014487
	for <linux-mtd@lists.infradead.org>; Tue, 2 Aug 2005 21:03:52 -0700
Received: from pcskhandelwal2k.neomagic.com ([192.168.31.213])
	by mail.neomagic.com (8.12.11/8.12.5) with ESMTP id j733kFmF018967
	for <linux-mtd@lists.infradead.org>; Tue, 2 Aug 2005 20:46:16 -0700
Message-Id: <6.0.1.1.0.20050803093247.0346bf70@mail.neomagic.com>
Date: Wed, 03 Aug 2005 09:38:36 +0530
To: linux-mtd@lists.infradead.org
From: Sunil Khandelwal <skhandelwal@neomagic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: Can mtd support 10 bytes ECC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

NAND Flash controller on our ARM based board has a mode where in, it writes 
10 bytes of Reed-Solomon code on last 10 Bytes of OOB. On read it can do 
error correction in the data read before transferring them to buffers. Does 
existing mtd layer can work with such controllers.

Regards,
Sunil 
