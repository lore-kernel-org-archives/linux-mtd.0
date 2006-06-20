Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fsb0F-0003Hh-6k
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 03:50:37 -0400
Message-ID: <4497A89F.4010202@yandex.ru>
Date: Tue, 20 Jun 2006 11:49:51 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Andrew Victor <andrew@sanpeople.com>
Subject: DataFlash & writesize
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Andrew,

AFAIR you are the guy who provided DataFlash drivers. May I ask you to 
fix them as I suspect they may be broken in mtd-2.6.git.

We've introduced a mtd->writesize field recently and it has to be filled 
by the flash driver. The field contains the minimal Flash's I/O unit 
size. For NOR it is 1, for NAND it is NAND page, or less if multiple 
writes to a NAND page are supported, etc. I once read a DataFlash 
datasheet and suspect this has to be DataFlash sector size, but I'm not 
sure.

So, I'm asking you to initialize mtd->writesize correctly.

Thanks.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
