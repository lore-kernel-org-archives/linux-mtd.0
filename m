Received: from [207.164.182.16] (helo=cbnsitar.cbnco.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18ACeI-0000N8-00
	for <linux-mtd@lists.infradead.org>; Fri, 08 Nov 2002 17:10:27 +0000
Message-ID: <3DCBF73B.9070904@cbnco.com>
Date: Fri, 08 Nov 2002 12:41:15 -0500
From: Vladimir Doukhanine <vdoukhan@cbnco.com>
MIME-Version: 1.0
To: dwmw2@infradead.org
CC: linux-mtd@lists.infradead.org
Subject: cfi_cmdset_0002.c (HZ/1000) question
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hi David,

I'm just wondering if this line makes any sence:

./drivers/mtd/chips/cfi_cmdset_0002.c:511:      timeo = jiffies + 
(HZ/1000); /* setting timeout to 1ms for now */

Thanks,
Vlad
