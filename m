Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 1433MK-0005Ng-00
	for mtd-list@infradead.org; Mon, 04 Dec 2000 21:41:16 +0000
Received: from [208.166.87.138] (helo=server.rwii.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 1433MI-0005NV-00
	for mtd@infradead.org; Mon, 04 Dec 2000 21:41:15 +0000
Message-Id: <200012042140.QAA08601@server.rwii.com>
Date: Mon, 4 Dec 2000 16:40:16 -0500 (EST)
From: tyson@rwii.com
Subject: Re: nftl/DoC Mill. root fs question
To: rminnich@lanl.gov
cc: LKhatskevitch@cachier.com, mtd@infradead.org, linuxbios@lanl.gov
In-Reply-To: <Pine.LNX.4.21.0012041436200.16124-100000@mini.acl.lanl.gov>
MIME-Version: 1.0
Content-Type: TEXT/plain; CHARSET=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On  4 Dec, Ronald G Minnich wrote:
> On Mon, 4 Dec 2000, Levi Khatskevitch wrote:
> 
>> it reports that / is /dev/root device and not /dev/nftla1 what did I miss?
> 
> This is unix foolishness. Mounts are kept in /etc/mtab. Since the file
> system is readonly, this won't get fixed, since you can't update files in
> /etc. 
> 
> ron

I run systems with read-only file systems.  Among other thigs, we
symlink /etc/mtab to /proc/mounts.

Cheers!
Ty

-- 
Tyson D Sawyer                             iRobot Corporation
Senior Systems Engineer                    Real World Interface Div.
tsawyer@irobot.com                         Robots for the Real World
603-532-6900 ext 206                       http://www.irobot.com



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
