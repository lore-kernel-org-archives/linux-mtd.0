Received: from diadema.ru ([80.66.89.150] helo=mail.diadema.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FfWJz-0004MD-BY
	for linux-mtd@lists.infradead.org; Mon, 15 May 2006 02:12:51 -0400
Received: from localhost (bridge [127.0.0.1])
	by mail.diadema.ru (Postfix) with ESMTP id 128D967E91
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 May 2006 12:40:27 +0700 (NOVST)
Received: from mail.diadema.ru ([127.0.0.1])
	by localhost (bridge [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18172-06-2 for <linux-mtd@lists.infradead.org>;
	Mon, 15 May 2006 12:40:22 +0700 (NOVST)
Received: from [192.168.2.239] (sigrand.ru [80.66.88.167])
	by mail.diadema.ru (Postfix) with ESMTP id 3C0D268279
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 May 2006 12:39:51 +0700 (NOVST)
From: Polyakov Artem <art@sigrand.ru>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=Windows-1251
Date: Mon, 15 May 2006 03:54:23 +0000
Message-Id: <1147665263.6999.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Reading data from NAND FLASH without ECC is not recommended
Reply-To: art@sigrand.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all! Sorry for my poor english.
I want to ask - why by default reading from NAND flash provided without
ECC?
I work with Samsung K9F5608U0Ñ 32M flash.
And one interest thing for me is that debug messages show that oob bytes
for ECC are used by system. I mean, after eraseing - all bytes are 0xFF.
But my debug messages shows this:
> write oob(00001890): 65 55 97 5a ffff 69 57 ff ff ff ff ff ff ff ff
bytes for ECC are not equal 0xFF!
but system dont use this bytes for ECC correction:
> Reading data from NAND FLASH without ECC is not recommended
