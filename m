Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 1445JW-0003Hg-00
	for mtd-list@infradead.org; Thu, 07 Dec 2000 17:58:38 +0000
Received: from amdext2.amd.com ([163.181.251.1])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 1445JU-0003Ha-00
	for mtd@infradead.org; Thu, 07 Dec 2000 17:58:36 +0000
Received: from iliad.amd.com (iliad.amd.com [163.181.250.7])
	by amdext2.amd.com (8.9.3/8.9.3/AMD) with SMTP id LAA28203
	for <mtd@infradead.org>; Thu, 7 Dec 2000 11:58:04 -0600 (CST)
From: mark.langsdorf@amd.com
Received: from txexmta8.amd.com (txexmta8.amd.com [163.181.3.118]) by
 amdint2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id LAA03922 for
 <mtd@infradead.org>; Thu, 7 Dec 2000 11:58:03 -0600 (CST)
Message-ID: <0FA1031B65A9D111960900805F9FA8E103B9F22D@txexmta8.amd.com>
To: mtd@infradead.org
Subject: RE: MTD & JFFS on Arcom SBC
Date: Thu, 7 Dec 2000 11:57:53 -0600
MIME-Version: 1.0
Content-Type: text/plain;
 charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I'm getting a similar set of error messages with
my AMD flash chips.

I posted a partial message list (for some reason, the
MTD printks weren't being collected properly) under the
title "Odd behavior of JFFS with AMD chips - kernel panic!"
on Monday.

-Mark Langsdorf
AMD, Inc.

> -----Original Message-----
> From: Micheal Kelly [mailto:michealk@thegravitywell.dhs.org]
> Sent: Thursday, December 07, 2000 11:35 AM
> To: mtd@infradead.org
> Subject: MTD & JFFS on Arcom SBC
> 
> 
> Hi all,
> 
> I've got an Arcom MediaGX board here that I'm trying to get 
> working w/Linux 
> 2.4-test12pre7 ...  Has anyone else tried the latest MTD 
> source from CVS with 
> this board?
> 
> It boots, loads the kernel, and it *does* identify the 
> onboard flash - it 
> even seems able to *read* from the flash (a JFFS 
> filesystem)... but when a 
> write occurs, the screen fills with errors - they go 
> scrolling by too quickly 
> to see, but they're something along the lines of:
> 
> Chip not ready for buffer write ...  XStatus = 30  bstatus = 0
> 
> and
> 
> flash_safe_write returned 5
> 
> After a few seconds, the screen fills with:
> 
> jffs_garbage_collect_thread():  free size == 0 This is BAD.
> 
> :)
> 
> Also,
> I inadvertently compiled the latest MTD sources from CVS with 
> the JFFS 
> included in the 2.4 sources and while I still couldn't write 
> to the flash, I 
> wouldn't get clobbered by 1000's of errors - I'd get one 
> "Chip not ready", 
> and then get the # prompt back....
> 
> Anyone have this working with 2.4?
> 
> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
> 



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
