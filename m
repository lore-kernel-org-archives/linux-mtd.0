Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12gCFH-0007bl-00
	for mtd-list@infradead.org; Fri, 14 Apr 2000 20:59:15 +0100
Received: from proxy.datalux.com ([204.111.16.98] helo=datalux_nt1.datalux_nt1)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12gCFG-0007bf-00
	for mtd@infradead.org; Fri, 14 Apr 2000 20:59:15 +0100
Message-ID: <38F77872.4399A0F8@datalux.com>
Date: Fri, 14 Apr 2000 15:58:42 -0400
From: Ralph Stickley <rstickley@datalux.com>
MIME-Version: 1.0
To: "linux-embedded@waste.org" <linux-embedded@waste.org>,
 	mtd-list <mtd@infradead.org>
Subject: More Compact Flash Problems
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


When I copy a file system to the CF, some cards work, some do not.

A problem I've noticed:
1. copy files from image fs (27MB of files) to mnt (mount point of CF)
2. sync / umount / mount
3. diff -rq mnt image reports files different

One file in particular, on one card, always comes up different:
XF86_SVGA

If I delete that file and copy the original one again, the above steps
can be
repeated...same problem.

However, if I move that file to xxxx then copy XF86_SVGA (this prevents
me 
from using the original blocks used by XF86_SVGA) -  Now it works!!

So, I conclude that either:
A. there are bad blocks on the CF device that linux is not aware of
B. the write operation is not fully supported with CF and the IDE driver


Which leads to a few questions:

1. Can you actually find bad blocks on a device ? (mkfs -c didn't seem
to help)

2. Are these cards manufactured with a list of bad blocks ?? 

3. Is there any way to slow down the copy operation ? (maybe this is not 
supporting the copying of large files - some flash blocks may take
longer to
write than others - moon phase may be a factor here :)

4. Will the nftl drivers work for CF ??

Any help on this would be greatly appreciated!
Thanks,
Ralph


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
