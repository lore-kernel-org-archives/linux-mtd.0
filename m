Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 142deB-0000uw-00
	for mtd-list@infradead.org; Sun, 03 Dec 2000 18:13:59 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 142deA-0000uq-00
	for mtd@infradead.org; Sun, 03 Dec 2000 18:13:58 +0000
Date: Sun, 3 Dec 2000 18:13:54 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Levi Khatskevitch <LKhatskevitch@cachier.com>
cc: <mtd@infradead.org>
Subject: Re: including doc2001 and docprobe into the kernel
In-Reply-To: <0012031229270A.00983@itidev1>
Message-ID: <Pine.LNX.4.30.0012031735490.13316-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sun, 3 Dec 2000, Levi Khatskevitch wrote:

> If mtd-patch-* are gone from cvs what is the right procedure to bring
> the latest mtd code into the kernel tree? Is is to apply a partial
> patch mtd-*.infra.patch and then use patchin.sh? If that's so we need
> to have new mtd-2.2.17.infra.patch and probably update or remove
> mtd-2.2.14.infra.patch and mtd-2.2.16.infra.patch, they are way
> outdated.

The patch still exists, and the procedure for applying it is just the same
- except that now you download it from the FTP site, rather than clogging
up the CVS tree with it.

I've removed all the extra files from the CVS tree, too.

> BTW mtd-patch-2.2.17-20001130-1700GMT from ftp site still inserts
> put_module_symbol even though it's not used anywhere in the source.

Thanks. I'll try to remember to remove that part next time I make a patch.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
