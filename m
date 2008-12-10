Received: from jupiter.malva.ua ([62.244.5.114])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LANUx-0007t3-Fg
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 11:44:59 +0000
Message-ID: <00a101c95abc$ba2a0fc0$3503200a@head.local>
From: =?koi8-r?B?9sXLwQ==?= <vortexx@ukr.net>
To: <linux-mtd@lists.infradead.org>
Subject: Ubifs
Date: Wed, 10 Dec 2008 13:44:57 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem!!! 
On my system after create UBI device /dev/ubi0_0 it was not created...
I did check... here is a result

# cat /sys/class/ubi/ubi0/dev
253:0
# ls -l /dev/ubi0
brw-rw----    1 root     root     253,   0 Jan  1 00:11 /dev/ubi0 


best regards, Evgeny
