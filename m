Received: from mail.imc-berlin.de ([217.110.46.186]
	helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192olg-0001hy-6n
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 09:47:48 +0100
Received: from mailgate.berlin.imc-berlin.de (mailgate.berlin.imc-berlin.de
	[10.0.0.13])h388lfLT022921
	for <linux-mtd@lists.infradead.org>; Tue, 8 Apr 2003 10:47:41 +0200
Received: from imc-berlin.de (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailgate.berlin.imc-berlin.de (8.8.8/8.8.8) with ESMTP id KAA22367
	for <linux-mtd@lists.infradead.org>;
	Tue, 8 Apr 2003 10:47:50 +0200 (CEST)
	(envelope-from steven.scholz@imc-berlin.de)
Message-ID: <3E928CB5.5010306@imc-berlin.de>
Date: Tue, 08 Apr 2003 10:47:49 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
CC: mtd <linux-mtd@lists.infradead.org>
References: <3E927803.9060205@imc-berlin.de>
	<1049790098.18045.91.camel@passion.cambridge.redhat.com>
	<3E928954.1080504@imc-berlin.de>
	<1049791383.18045.144.camel@passion.cambridge.redhat.com>
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
> On Tue, 2003-04-08 at 09:33, Steven Scholz wrote:
> 
>>So how stable is the MTD/JFFS2 code anyway?
>>Is the CVS the only place for me to get the source?
>>Or are there some offical, release patches?
> 
> 
> The jffs2-2_4-branch from CVS, which is in Marcelo's latest 2.4.21-pre,
> is the one that's _really_ intended to be stable -- but that's because
> we don't make any exciting changes there at all.

But the performance improvements lately done on the JFFS2 code is in 
there!?

So for production systems I should patch my 2.4.20 with the 
jffs2-2_4-branch !?

> If you want to track -HEAD it's worth keeping an eye on the IRC channel
> -- if Thomas and I are spending the day discussing how best to fix
> stuff, and there's a lot of swearing and debugging going on, then it's
> probably not a good time to update :)
:o))

Thanks,

Steven
