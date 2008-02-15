Received: from knoppix.nateks.ru ([81.28.3.166])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JQ5VL-0002BD-M8
	for linux-mtd@lists.infradead.org; Fri, 15 Feb 2008 18:41:54 +0000
Message-ID: <004b01c87000$52c8a050$2f0fa8c0@idle>
From: "Mikhail Gruzdev" <gruzdev@nateks.ru>
To: <linux-mtd@lists.infradead.org>
Subject: How to hardcode NOR Flash parameters (wrong CFI table) ?
Date: Fri, 15 Feb 2008 21:26:41 +0300
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="koi8-r"; reply-type=original
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

I have NOR flash chip(Spansion S29GL032N04) with wrong CFI table information 
(Erase Region 2 Information).
My do_map_probe("cfi_probe", &nor_map) function call fails due to geometry 
mismatch.
So I decided to hardcode _all_ flash chip information without any probing at 
all.

Are there any examples? I don't want to miss something while digging into 
mtd sources.
Doesn't it the preferable way for embedded systems?

Thanks! 
