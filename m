Received: from dyn-ctb-210-9-243-132.webone.com.au
	([210.9.243.132] helo=chimp.local.net ident=mail)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19zHPC-0000zh-2p
	for <linux-mtd@lists.infradead.org>; Tue, 16 Sep 2003 16:06:14 +0100
Message-ID: <3F672689.40404@cyberone.com.au>
Date: Wed, 17 Sep 2003 01:04:41 +1000
From: Nick Piggin <piggin@cyberone.com.au>
MIME-Version: 1.0
To: Timothy Miller <miller@techsource.com>
References: <200309160435.h8G4ZkQM009953@elaine4.Stanford.EDU>
	<20030916065553.GA12329@wohnheim.fh-wedel.de> <3F672396.10906@techsource.com>
In-Reply-To: <3F672396.10906@techsource.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
cc: David Yu Chen <dychen@stanford.edu>
cc: linux-mtd@lists.infradead.org
cc: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
cc: mc@cs.stanford.edu
cc: David Woodhouse <dwmw2@infradead.org>
cc: linux-kernel@vger.kernel.org
Subject: Re: [CHECKER] 32 Memory Leaks on Error Paths
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Timothy Miller wrote:

>
>>> 276:    /* OK, it's not open. Create cache info for it */
>>> START -->
>>> 277:    mtdblk = kmalloc(sizeof(struct mtdblk_dev), GFP_KERNEL);
>>> 278:    if (!mtdblks)
>>> END -->
>>> 279:        return -ENOMEM;
>>
>
>>
>> Invalid.  This is quite an obvious false positive, at least if your
>> algorithm checks for possible value ranges.
>
>
> Wait... one is "mtdblk", and the other is "mtdblks".  One has an extra 
> 's' on it.  Unless there is some kind of aliasing going on, they would 
> appear to be different variables.  Naturally, I didn't check the 
> original code, so I could be full of it.  :)


Yes its a bug from glancing at the source code.
