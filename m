Received: from kinesis.swishmail.com ([209.10.110.86] ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 19zHBl-0000rD-DV
	for <linux-mtd@lists.infradead.org>; Tue, 16 Sep 2003 15:52:21 +0100
Message-ID: <3F672396.10906@techsource.com>
Date: Tue, 16 Sep 2003 10:52:06 -0400
From: Timothy Miller <miller@techsource.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <200309160435.h8G4ZkQM009953@elaine4.Stanford.EDU>
	<20030916065553.GA12329@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: David Yu Chen <dychen@stanford.edu>
cc: mc@cs.stanford.edu
cc: David Woodhouse <dwmw2@infradead.org>
cc: linux-kernel@vger.kernel.org
cc: linux-mtd@lists.infradead.org
Subject: Re: [CHECKER] 32 Memory Leaks on Error Paths
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>> 276:	/* OK, it's not open. Create cache info for it */
>>START -->
>> 277:	mtdblk = kmalloc(sizeof(struct mtdblk_dev), GFP_KERNEL);
>> 278:	if (!mtdblks)
>>END -->
>> 279:		return -ENOMEM;

> 
> Invalid.  This is quite an obvious false positive, at least if your
> algorithm checks for possible value ranges.

Wait... one is "mtdblk", and the other is "mtdblks".  One has an extra 
's' on it.  Unless there is some kind of aliasing going on, they would 
appear to be different variables.  Naturally, I didn't check the 
original code, so I could be full of it.  :)
