Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 1433sW-0005aW-00
	for mtd-list@infradead.org; Mon, 04 Dec 2000 22:14:32 +0000
Received: from mrserver.wte.net ([206.98.206.71] helo=mrserver.cachier.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 1433sU-0005aQ-00
	for mtd@infradead.org; Mon, 04 Dec 2000 22:14:31 +0000
From: Levi Khatskevitch <LKhatskevitch@cachier.com>
Reply-To: LKhatskevitch@cachier.com
To: Jan Danielsson <jan@cendio.se>
Subject: Re: nftl/DoC Mill. root fs question
Date: Mon, 4 Dec 2000 17:08:11 -0500
Content-Type: text/plain
Cc: mtd@infradead.org, linuxbios@lanl.gov
References: <Pine.LNX.4.21.0012041436200.16124-100000@mini.acl.lanl.gov> <200012042151.WAA13296@localhost.localdomain>
In-Reply-To: <200012042151.WAA13296@localhost.localdomain>
MIME-Version: 1.0
Message-Id: <00120417114204.15102@mrserver>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 04 Dec 2000, Jan Danielsson wrote:
> If you use the proc filesystem: try to let "/etc/mtab" be a soft-link
> to "/proc/mounts".
> 
>   --Jan

/proc/mounts says the same thing (/dev/root)
- Levi

-- 
Levi Khatskevitch
CTO
Cachier, Corp.
575 Grand St., Suite E306
New York, NY 10002


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
