Received: from mail.imc-berlin.de ([217.110.46.186]
	helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BBZ3b-00035s-Op
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2004 13:54:59 +0100
Received: from mailgate.berlin.imc-berlin.de (mailgate.berlin.imc-berlin.de
	[10.0.0.13])i38C6kj9019728
	for <linux-mtd@lists.infradead.org>; Thu, 8 Apr 2004 14:06:46 +0200
Received: from imc-berlin.de (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailgate.berlin.imc-berlin.de (8.8.8/8.8.8) with ESMTP id OAA29379
	for <linux-mtd@lists.infradead.org>;
	Thu, 8 Apr 2004 14:54:50 +0200 (CEST)
	(envelope-from steven.scholz@imc-berlin.de)
Message-ID: <40754B83.3020000@imc-berlin.de>
Date: Thu, 08 Apr 2004 14:54:27 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
CC: MTD <linux-mtd@lists.infradead.org>
References: <407547DF.1020404@imc-berlin.de>
In-Reply-To: <407547DF.1020404@imc-berlin.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Changing the number of JFFS2 erasblocks?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Steven Scholz wrote:

> Hi there,
> 
> I have 320KB of unused flash in our embedded systems. Now I want to make 
> use of them using an read/write filesystem by updating the kernel.
> 
> Since it's flash I need some fs that's aware of the flash wearing 
> problem. So I guess that leaves only JFFS2.
> 
> My problem is that the 5 erase blocks set by default will eat up the 
> whole 320KB and leaves no free space. And IIRC there's no way to pass 
> the number of eraseblocks during mount.
> 
> Could I hardcode the number of eraseblocks to 1 in my new (but still old 
> 2.4.20) kernel? Where is it defined?
> And what happens to my root fs which is JFFS2 when I change that?


Is it enough and ok to just change the

/* Number of free blocks there must be before we... */
#define JFFS2_RESERVED_BLOCKS_BASE 3

in fs/jffs2/nodelist.h ???

Steven
