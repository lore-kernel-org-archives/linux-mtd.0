Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D38k3-0006NG-6y
	for linux-mtd@lists.infradead.org; Mon, 21 Feb 2005 03:16:32 -0500
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id B915B2F016
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Feb 2005 09:16:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id AE2FE11786
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Feb 2005 09:16:28 +0100 (CET)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 08D4199FF
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Feb 2005 09:16:28 +0100 (CET)
Message-ID: <421998DA.1060503@imc-berlin.de>
Date: Mon, 21 Feb 2005 09:16:26 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: MTD List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: ioremap_cached in drivers/mtd/maps ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

it looks like only lubbock-flash.c is using ioremap_cached().

Can I use ioremap_cached() with normal NOR flashes?
Is it only for DMA transfer from/to flash?
Does it improve something when using JFFS2?
What do I have to consider? .inval_cache function?

Thanks a million!

-- 
Steven Scholz
imc Measurement & Control
