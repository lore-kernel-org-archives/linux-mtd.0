Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 142c4O-0000jD-00
	for mtd-list@infradead.org; Sun, 03 Dec 2000 16:32:56 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 142c4N-0000j7-00
	for mtd@infradead.org; Sun, 03 Dec 2000 16:32:55 +0000
Date: Sun, 3 Dec 2000 16:32:41 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Levi Khatskevitch <LKhatskevitch@cachier.com>
cc: Adam Agnew <agnew@glue.umd.edu>,  <mtd@infradead.org>
Subject: Re: including doc2001 and docprobe into the kernel
In-Reply-To: <00120301032208.00983@itidev1>
Message-ID: <Pine.LNX.4.30.0012031630220.8498-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sun, 3 Dec 2000, Levi Khatskevitch wrote:

> Adam,
>
> You can add inter_module_xxx support by applying
> patches/inter-module-2.2.17.patch on 2.2.17 kernel source. But if you
> didn't apply patches/mtd-patch-2.2.17-20001130 please do so *before*
> adding any mtd code to kernel tree.

The patch is gone from CVS. It's now on the FTP site.

Also note that the latest CVS version of docprobe uses the doc2000.c
driver for _both_ 2000 and Millennium devices. So either build doc2000 and
docprobe into the kernel, not 'doc2001 and docprobe' as you say in
$subject, or comment out the #define DOC_SINGLE_DRIVER near the top of
docprobe.c.

The latter is probably the best option, given that the author of doc2001.c
thinks there are still bugs remaining in the Millennium support which is
merged into doc2000.c

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
