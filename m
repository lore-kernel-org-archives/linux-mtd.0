Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14IeKU-0003iP-00
	for mtd-list@infradead.org; Tue, 16 Jan 2001 22:11:50 +0000
Received: from amdext2.amd.com ([163.181.251.1])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14IeKT-0003iJ-00
	for mtd@infradead.org; Tue, 16 Jan 2001 22:11:49 +0000
Received: from odyssey.amd.com (odyssey.amd.com [163.181.250.8])
	by amdext2.amd.com (8.9.3/8.9.3/AMD) with SMTP id QAA21115
	for <mtd@infradead.org>; Tue, 16 Jan 2001 16:11:09 -0600 (CST)
From: mark.langsdorf@amd.com
Received: from txexmta8.amd.com (txexmta8.amd.com [163.181.3.118]) by
 amdint2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id QAA03138 for
 <mtd@infradead.org>; Tue, 16 Jan 2001 16:11:08 -0600 (CST)
Message-ID: <0FA1031B65A9D111960900805F9FA8E103B9F285@txexmta8.amd.com>
To: mtd@infradead.org
Subject: 101% in use?
Date: Tue, 16 Jan 2001 16:11:07 -0600
MIME-Version: 1.0
Content-Type: text/plain;
 charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I've finally gotten my flash system 95% working, and now I'm
performing some stress tests to make sure that everything is
good.

The partition size is 14.5 megs, give or take a bit, and
I have a very large directly (around 2.7 megs) that I'm
repeatedly copying onto the disk and deleting.  At one
point, I got my italicization (according to df) up to 
101%, with a negative number of free blocks.  Is this bad?

After I deleted the most recent copy of the directory,
utilization dropped to 100%, with 44 blocks free.  
Shouldn't the GC be kicking in and getting rid of the
rest of the dirty space?  It's stayed at 44 blocks for
quite some time.

Mark Langsdorf
Advanced Micro Devices, Inc             Tel: 512.602.3756
5204 E. Ben White Blvd. M/S 590         Fax: 512.602.5051
Austin, TX 78741                        mark.langsdorf@amd.com



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
