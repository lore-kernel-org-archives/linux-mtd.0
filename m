Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vler-00032B-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 May 2001 20:54:34 +0100
Received: from dns.uswo.net ([207.153.115.5] helo=mail.uswo.net)
	by infradead.org with smtp (Exim 3.20 #2)
	id 14vlfM-00005M-00
	for linux-mtd@lists.infradead.org; Fri, 04 May 2001 20:55:04 +0100
From: "Jason Walker" <jasonw@uswo.net>
To: "MTD Mailing List" <linux-mtd@lists.infradead.org>
Subject: RE: MTD and 2.4 
Date: Fri, 4 May 2001 15:54:50 -0400
Message-ID: <NEBBIDMHCLDPHDHEGDMLGEGJCBAA.jasonw@uswo.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <2834.988646625@redhat.com>
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

Sorry it took so long to respond, things have been busy.

I did as you said, enabled CONFIG_MTD_DOC2001 and checked out the #define in
docprobe.c and it was already enabled.  I recompiled and I get the same
error.  Let me see if I can type it out, as I have no way to cut and paste
it

M-Systems DiskOnChip Driver. (C) 1999 Machine Vision Holdings, Inc.
request_module[doc2000]: Root fs not mounted
Cannot find driver for DiskOnChip Millennium at 0xD0000
M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
$Id: nftl.c,v 1.57 2000/12/01 17:51:54 dwmw2 Exp $
<--TCP initializes here-->
...
request_module[block-major-100]: Root fs not mounted
VFS: Cannot open root device "6401" or 64:01
Please append a correct "root=" boot option
Kernel panic: VFS: cannot mount root fs blah blah blah

What is it that I am missing?  This is 2.4.4, and no patches have been
applied as of yet.

Thanks for your time!

Jason Walker

-----Original Message-----
From: owner-mtd@infradead.org [mailto:owner-mtd@infradead.org]On Behalf
Of David Woodhouse
Sent: Monday, April 30, 2001 12:04 PM
To: Jason Walker
Cc: MTD Mailing List
Subject: Re: MTD and 2.4



jasonw@uswo.net said:
> This is a DiskOnChip Millenium chip, btw.  If I need to post error
> messages or my kernel config, that is fine.. Any help would be
> appreciated. thank!

Enable the #define DOC_SINGLE_DRIVER in docprobe.c and make sure you've
enabled CONFIG_MTD_DOC2001. If it still doesn't work, show us the startup
messages.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
