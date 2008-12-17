Received: from aibo.runbox.com ([87.238.52.70])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCwJH-0005hf-MQ
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 13:19:32 +0000
Received: from [10.9.9.160] (helo=penny.runbox.com)
	by greyhound.runbox.com with esmtp (Exim 4.50) id 1LCwJI-0007SR-V4
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 14:19:33 +0100
Received: from [74.94.155.177] (helo=[192.168.12.139])
	by penny.runbox.com with esmtpsa (uid:263104 )
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50) id 1LCwJF-000273-O3
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 14:19:29 +0100
Message-ID: <4948FC5F.10907@runbox.com>
Date: Wed, 17 Dec 2008 08:19:27 -0500
From: Cal Page <pagcal@runbox.com>
MIME-Version: 1.0
To: ubifs <linux-mtd@lists.infradead.org>
Subject: ubifs: BUG: scheduling while atomic - when runs out of space
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When I run a ubifs partition out of space, I get

  BUG: scheduling while atomic: tar/0xffffffff/3324

repeated until I stop trying to write the partition.

What's wrong? Who went atomic in ubi/ubifs? If I wait a minute, disk 
usage drops from 100% to 75%, no doubt due to garbage collection.

Cal Page
