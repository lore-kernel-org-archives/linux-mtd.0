Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 1433oe-0005Yu-00
	for mtd-list@infradead.org; Mon, 04 Dec 2000 22:10:32 +0000
Received: from mrserver.wte.net ([206.98.206.71] helo=mrserver.cachier.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 1433oZ-0005Yo-00
	for mtd@infradead.org; Mon, 04 Dec 2000 22:10:28 +0000
From: Levi Khatskevitch <LKhatskevitch@cachier.com>
Reply-To: LKhatskevitch@cachier.com
To: tyson@rwii.com
Subject: Re: nftl/DoC Mill. root fs question
Date: Mon, 4 Dec 2000 17:05:49 -0500
Content-Type: text/plain
Cc: mtd@infradead.org, linuxbios@lanl.gov
References: <200012042140.QAA08601@server.rwii.com>
In-Reply-To: <200012042140.QAA08601@server.rwii.com>
MIME-Version: 1.0
Message-Id: <00120417072203.15102@mrserver>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 04 Dec 2000, tyson@rwii.com wrote:
> On  4 Dec, Ronald G Minnich wrote:
> > On Mon, 4 Dec 2000, Levi Khatskevitch wrote:
> > 
> >> it reports that / is /dev/root device and not /dev/nftla1 what did I miss?
> > 
> > This is unix foolishness. Mounts are kept in /etc/mtab. Since the file
> > system is readonly, this won't get fixed, since you can't update files in
> > /etc. 
> > 
> > ron
> 
> I run systems with read-only file systems.  Among other thigs, we
> symlink /etc/mtab to /proc/mounts.
> 
> Cheers!
> Ty
> 

tried that, doesn't change anything
- Levi

-- 
Levi Khatskevitch
CTO
Cachier, Corp.
575 Grand St., Suite E306
New York, NY 10002


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
