Received: from xrelay.neomagic.com ([209.172.119.197] helo=relay.neomagic.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DzsSx-0006CN-AO
	for linux-mtd@lists.infradead.org; Tue, 02 Aug 2005 04:49:52 -0400
Received: from mail.neomagic.com
	(IDENT:U2FsdGVkX1/uHV2q12SSccTtrixn95/BpLzRJJlQ5IE@scha25.neomagic.com
	[192.168.51.45])
	by relay.neomagic.com (8.13.1/8.12.5) with ESMTP id j728lpAb017127
	for <linux-mtd@lists.infradead.org>; Tue, 2 Aug 2005 01:47:52 -0700
Message-Id: <6.0.1.1.0.20050802141851.03486180@mail.neomagic.com>
Date: Tue, 02 Aug 2005 14:22:55 +0530
To: linux-mtd@lists.infradead.org
From: Sunil Khandelwal <skhandelwal@neomagic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: 10 bytes Reed Solomon code
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

Our flash controller has a mode where in writes 10 bytes of RS code on last 
10 Bytes of OOB. On read it can do error correction in the data read before 
transferring them to buffers.

Is it okay for us to use this mode or the upper layers need at 16 Bytes of 
OOB data for it's use.

How will as fs like YAFFS will work in such case which uses OOB data for 
metadata

Regards,
Sunil
