Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 142czu-0000nI-00
	for mtd-list@infradead.org; Sun, 03 Dec 2000 17:32:22 +0000
From: Levi Khatskevitch <LKhatskevitch@cachier.com>
Reply-To: LKhatskevitch@cachier.com
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: including doc2001 and docprobe into the kernel
Date: Sun, 3 Dec 2000 12:19:14 -0500
Content-Type: text/plain
Cc: mtd@infradead.org
References: <Pine.LNX.4.30.0012031630220.8498-100000@imladris.demon.co.uk>
In-Reply-To: <Pine.LNX.4.30.0012031630220.8498-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Message-Id: <0012031229270A.00983@itidev1>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sun, 03 Dec 2000, David Woodhouse wrote:
> The patch is gone from CVS. It's now on the FTP site.

Hi,

If mtd-patch-* are gone from cvs what is the right procedure to bring the
latest mtd code into the kernel tree? Is is to apply a partial patch
mtd-*.infra.patch and then use patchin.sh? If that's so we need to have new
mtd-2.2.17.infra.patch and probably update or remove mtd-2.2.14.infra.patch and
mtd-2.2.16.infra.patch, they are way outdated.

BTW mtd-patch-2.2.17-20001130-1700GMT from ftp site still inserts
put_module_symbol even though it's not used anywhere in the source.

- Levi

-- 
Levi Khatskevitch
CTO
Cachier, Corp.
575 Grand St., Suite E306
New York, NY 10002


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
