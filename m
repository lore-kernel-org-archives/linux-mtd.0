Received: from mail.imc-berlin.de ([217.110.46.186]
	helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192oXj-0001LC-2g
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 09:33:23 +0100
Received: from mailgate.berlin.imc-berlin.de (mailgate.berlin.imc-berlin.de
	[10.0.0.13])h388XGLT022842
	for <linux-mtd@lists.infradead.org>; Tue, 8 Apr 2003 10:33:16 +0200
Received: from imc-berlin.de (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailgate.berlin.imc-berlin.de (8.8.8/8.8.8) with ESMTP id KAA22160
	for <linux-mtd@lists.infradead.org>;
	Tue, 8 Apr 2003 10:33:25 +0200 (CEST)
	(envelope-from steven.scholz@imc-berlin.de)
Message-ID: <3E928954.1080504@imc-berlin.de>
Date: Tue, 08 Apr 2003 10:33:24 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
CC: mtd <linux-mtd@lists.infradead.org>
References: <3E927803.9060205@imc-berlin.de>
	<1049790098.18045.91.camel@passion.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Inode corrupted after CVS update
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse schrieb:
> On Tue, 2003-04-08 at 08:19, Steven Scholz wrote:
> 
>>I pulled the CVS yesterday, patched my linuxppc-2.4.20, build and 
>>flashed my image.
> 
> 
>>I am using JFFS2 as root fs. While booting I get loads of
>>
>>...
>>jffs2_get_inode_nodes(): Inode corrupted at 0x000ff370, totlen 70, 
>>#ino  130, version 1, isize 0, csize 2, dsize 2
> 
> 
> Argh. device nodes have data in the nodes but isize is zero, triggering
> an overly-zealous sanity check. Fixed in cvs...

:o)

Thanks David!

It works now.

So how stable is the MTD/JFFS2 code anyway?
Is the CVS the only place for me to get the source?
Or are there some offical, release patches?

Thanks again,

Steven
