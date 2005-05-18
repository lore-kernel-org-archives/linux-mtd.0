Received: from mail.deutaeit.de ([213.168.79.210])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DYJYo-0000de-5r
	for linux-mtd@lists.infradead.org; Wed, 18 May 2005 04:05:48 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.deutaeit.de (Postfix) with ESMTP id 4E94E1A63D
	for <linux-mtd@lists.infradead.org>;
	Wed, 18 May 2005 10:05:46 +0200 (CEST)
Received: from mail.deutaeit.de ([127.0.0.1])
	by localhost (eitserver [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05194-08 for <linux-mtd@lists.infradead.org>;
	Wed, 18 May 2005 10:05:34 +0200 (CEST)
Received: from shrek.eitintern.de (unknown [192.168.2.1])
	by mail.deutaeit.de (Postfix) with ESMTP id EA9331C5F6
	for <linux-mtd@lists.infradead.org>;
	Wed, 18 May 2005 10:05:33 +0200 (CEST)
From: Thorsten Haas <haas@deutaeit.de>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Wed, 18 May 2005 10:05:35 +0200
Message-Id: <1116403535.2682.7.camel@shrek>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: CFI physmap - how to create partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello everyone,

I have a board equipped with CFI-compatible NOR-flash, which is
physmapped and detected by the kernel (/dev/mtd0 in /proc/mtd). Now I am
trying to configure partitions. I read the HOWTO on
ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/mtd/mtd-jffs-HOWTO.txt,
googled and browsed kernel code (2.6.8.11) and a daily mtd-snapshot
(2005-05-15). From what i read, I understand:
a) Command line partition table parsing is not functional with
physmapped devices
b) I need to create and fill a 'struct mtd_partition' and call
physmap_configure() and physmap_set_partitions()
Is this correct so far?

I've seen people writing board-dependent mapping drivers, thus
clobbering the section "mapping driver for chip access". Is this
actually the way to go? Well, I am not too lazy to write some code, but
is there a more genric way?

Best regards,
Thorsten Haas
