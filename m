Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13qSxb-00067a-00
	for mtd-list@infradead.org; Tue, 31 Oct 2000 04:23:43 +0000
Received: from [63.196.9.2] (helo=ftp.neontech.com)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13qSxZ-00067U-00
	for mtd@infradead.org; Tue, 31 Oct 2000 04:23:42 +0000
Date: Mon, 30 Oct 2000 20:26:34 -0800
From: Qiuyuan Liu <q.liu@acm.org>
To: mtd@infradead.org
Subject: building mtd: bitsy.h
Message-Id: <39FE49FA3AC.1785Q.LIU@mail.neontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Thank you, David. I am getting closer.

I installed 2.2.17 kernel source, and got the put_module_symbol fixed by
the 2.2.1x.patch.

Now, how about bitsy.h. It seems, from Google's search result, to be a
file introduced in 2.4.0, right? Then how can I get one on 2.2.17 and
what's the corresponding source code that implements, e.g.,
set_bitsy_egpio?

Thank you,
Qiuyuan


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
