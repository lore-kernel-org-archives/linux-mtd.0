Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 1433IP-0005M2-00
	for mtd-list@infradead.org; Mon, 04 Dec 2000 21:37:13 +0000
Received: from acl.lanl.gov ([128.165.147.1])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 1433IN-0005LD-00
	for mtd@infradead.org; Mon, 04 Dec 2000 21:37:12 +0000
Date: Mon, 4 Dec 2000 14:36:55 -0700 (MST)
From: Ronald G Minnich <rminnich@lanl.gov>
To: Levi Khatskevitch <LKhatskevitch@cachier.com>
cc: mtd@infradead.org, linuxbios@lanl.gov
Subject: Re: nftl/DoC Mill. root fs question
In-Reply-To: <00120414560502.15102@itidev1>
Message-ID: <Pine.LNX.4.21.0012041436200.16124-100000@mini.acl.lanl.gov>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 4 Dec 2000, Levi Khatskevitch wrote:

> it reports that / is /dev/root device and not /dev/nftla1 what did I miss?

This is unix foolishness. Mounts are kept in /etc/mtab. Since the file
system is readonly, this won't get fixed, since you can't update files in
/etc. 

ron



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
