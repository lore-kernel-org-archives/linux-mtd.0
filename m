Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ozGJ-0006nv-00
	for mtd-list@infradead.org; Fri, 27 Oct 2000 03:28:55 +0100
Received: from [63.196.9.2] (helo=ftp.neontech.com)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13ozGH-0006np-00
	for mtd@infradead.org; Fri, 27 Oct 2000 03:28:54 +0100
Date: Thu, 26 Oct 2000 19:38:49 -0700
From: Qiuyuan Liu <q.liu@acm.org>
To: mtd@infradead.org
Subject: building mtd: DECLARE_MUTEX?
Message-Id: <39F8EAB996.E4A2Q.LIU@mail.neontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I am trying to build mtd (checked out from the CVS version) on my Red
Hat Linux 6.2 box (2.2.14).

I can't find where DECLARE_MUTEX is defined, which referenced in
mtdcore.c (line 89).

Btw, there isn't a file named compatmac.h under /usr/include/linux,
except the one came with mtd package, which refers to it.

Thank you,
Qiuyuan


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
