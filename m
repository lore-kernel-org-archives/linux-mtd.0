Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15uYY5-0000SY-00
	for <linux-mtd@lists.infradead.org>; Fri, 19 Oct 2001 13:14:49 +0100
Received: from dwmw2 by passion.cambridge.redhat.com with local (Exim 3.16 #2)
	id 15uYh1-0001lZ-00
	for linux-mtd@lists.infradead.org; Fri, 19 Oct 2001 13:24:03 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <25D13BA49CC6D31193040040953309CE7F9F@MICSERV> 
References: <25D13BA49CC6D31193040040953309CE7F9F@MICSERV> 
To: Gareth Williams <gareth@microm-electronics.com>
Cc: "'lists-mtd@lists.infradead.org'" <lists-mtd@lists.infradead.org>
Subject: Re: Quick question. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 19 Oct 2001 13:22:26 +0100
Message-ID: <6619.1003494146@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

gareth@microm-electronics.com said:
> ANAND header found @ 0xC000 in mtd0, but ECC read failed (err 1) 
> ANAND header found @ 0xE000 in mtd0, but ECC read failed (err 1)
> Could not find valid boot record.
> Could not mount NFTL device.

It's being anal and refusing to deal with the Media Header because the ECC 
failed on that block - it seems that some versions of the M-Systems 
firmware don't put ECC on the Media Header blocks.

--- drivers/mtd/nftlmount.c	2001/09/19 21:42:32	1.23
+++ drivers/mtd/nftlmount.c	2001/10/19 12:22:13
@@ -94,7 +94,7 @@
 			continue;
 		}
 
-#if 1 /* Some people seem to have devices without ECC or erase marks
+#if 0 /* Some people seem to have devices without ECC or erase marks
 	 on the Media Header blocks. There are enough other sanity
 	 checks in here that we can probably do without it.
       */



--
dwmw2
