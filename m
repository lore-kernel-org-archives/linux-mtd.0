Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12QDDP-0003Kq-00
	for mtd-list@infradead.org; Wed, 01 Mar 2000 17:47:15 +0000
Received: from tammy.cendio.se
	([193.180.23.67] helo=tammy.signum.se ident=alex)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12QDDN-0003KW-00
	for mtd@infradead.org; Wed, 01 Mar 2000 17:47:13 +0000
Received: from localhost (alex@localhost)
	by tammy.signum.se (8.9.3/8.9.3) with ESMTP id SAA29086
	for <mtd@infradead.org>; Wed, 1 Mar 2000 18:47:11 +0100
Date: Wed, 1 Mar 2000 18:47:11 +0100 (CET)
From: Alexander Larsson <alex@cendio.se>
To: mtd@infradead.org
Subject: mtd comments
Message-ID: <Pine.LNX.4.10.10003011820470.29074-100000@tammy.signum.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I'm just browsing trough the mtd code.
Here are some comments:

The following code in mtd.c::mtd_read() is pretty bad from a security
standpoint:

if (!mtd->point || (ret = MTD_POINT(mtd, *ppos, count, &retlen, &mtdbuf)) != 0)
{
   /* mtd->point() failed; use mtd->read instead */
   ret = MTD_READ(mtd, *ppos, count, &retlen, buf);

The passing of buf, which is a userspace pointer to a kernel API is
dubious at the very least. And in the case of i.e. slram.c the 
physmem_read() function in fact just does an memcpy leading to a direct
security problem. 

FTL uses the read functions directly to though, so read must be able to
handle kernel pointers also.

Is the buffer pointer in the read call supposed to be a kernel or
userspace pointer? Who is responsible for verifying it?
Maybe there needs to be two API:s, one for userspace buffers and one for
kernelspace buffers. In this context the MTD_POINT api is actually very
nice.

Also, what is oob (out of band) blocks? And how are flash-memories that
have non-constant erase-sector size (i.e. boot sectors etc.) handled?

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
