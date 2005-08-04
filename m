Received: from mail.sysgo.com ([62.8.134.5])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E0eu7-00043I-AR
	for linux-mtd@lists.infradead.org; Thu, 04 Aug 2005 08:33:07 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.sysgo.com (Postfix) with ESMTP id 4CA7EFB8D5
	for <linux-mtd@lists.infradead.org>;
	Thu,  4 Aug 2005 14:32:49 +0200 (CEST)
Received: from donald.sysgo.com (unknown [172.20.1.30])
	by mail.sysgo.com (Postfix) with ESMTP id 39FF1FB8D5
	for <linux-mtd@lists.infradead.org>;
	Thu,  4 Aug 2005 14:32:49 +0200 (CEST)
Received: from acs.sysgo.com (acs.sysgo.com [172.22.11.10])
	by donald.sysgo.com (Postfix) with ESMTP id D3FA917DBDF
	for <linux-mtd@lists.infradead.org>;
	Thu,  4 Aug 2005 15:11:47 +0200 (CEST)
Date: Thu, 4 Aug 2005 14:32:47 +0200 (CEST)
From: Armin Schindler <armin.schindler@sysgo.com>
Sender: acs@sysgo.com
To: linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <Pine.LNX.4.61.0508041422470.23179@acs.sysgo.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Subject: Fujitsu MBM29LV800BA not recognized because of unlock_addrs mismatch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

current MTD jedec_probe/jedec_match does not find a match for 
MBM29LV800BA, because the unlock_addrs does not match.

The jedec_table[] holds the correct values, but the function 
finfo_uaddr() returns the wrong values -> no match.

In finfo_uaddr() the code is

...
         uaddr = finfo->uaddr[uaddr_idx];

         if (finfo->uaddr[0] == MTD_UADDR_NOT_SUPPORTED ) {
                 /* ASSERT("The unlock addresses for non-8-bit mode
                    are bollocks. We don't really need an array."); */
                 uaddr = finfo->uaddr[0];
         }
...

when I remove the 'if', it works perfectly for MBM29LV800BA !

I do not know in which case this if really does make sense, but
at least for MBM29LV800BA the function finfo_uaddr() returns always
finfo->uaddr[0] which is the wrong in 16bit mode.

Removing this 'if' is probably wrong, because someone must have had a 
reason for it, but it is definatly not correct in each case.

What do you think?

regards,
Armin

-- 
Armin Schindler <armin.schindler AT sysgo.com>
SYSGO AG                      Embedded and Real-Time Software
www.sysgo.com | www.elinos.com | www.pikeos.com | www.osek.de
