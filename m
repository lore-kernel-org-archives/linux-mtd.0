Received: from vega.surpasshosting.com ([72.29.83.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MqPFo-0000J0-RY
	for linux-mtd@lists.infradead.org; Wed, 23 Sep 2009 10:39:25 +0000
Received: from bzq-82-81-138-186.red.bezeqint.net ([82.81.138.186]:50411
	helo=felix.lan) by vega.surpasshosting.com with esmtpa (Exim 4.69)
	(envelope-from <felix@embedded-sol.com>) id 1MqPFm-0006Mh-Pq
	for linux-mtd@lists.infradead.org; Wed, 23 Sep 2009 06:39:19 -0400
Message-ID: <4AB9FAD3.4020001@embedded-sol.com>
Date: Wed, 23 Sep 2009 13:39:15 +0300
From: Felix Radensky <felix@embedded-sol.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Erasing 4GB NAND flash
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

I think there's a problem with the definition of struct mtd_info_user
in include/linux/mtd/mtd-abi.h. The "size" field should be defined as
__u64, to match the corresponding field in struct mtd_info. Otherwise
MEMGETINFO ioctl returns invalid flash size for >= 4GiB devices.

Also, looks like flash_eraseall (and maybe others) should be modified
to use MEMERASE64 and MEMWRITEOOB64. Is that correct ?

Felix.
