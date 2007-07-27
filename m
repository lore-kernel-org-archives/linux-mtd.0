Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IETlj-0006oh-En
	for linux-mtd@lists.infradead.org; Fri, 27 Jul 2007 18:38:28 +0100
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e5.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id l6RHcHmw018472
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jul 2007 13:38:17 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v8.4) with ESMTP id
	l6RHcHh5357840
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jul 2007 13:38:17 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l6RHcHpY030041
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jul 2007 13:38:17 -0400
Subject: Re: JFFS2 deadlock with alloc_sem
From: Dave Kleikamp <shaggy@linux.vnet.ibm.com>
To: ye janboe <janboe.ye@gmail.com>
In-Reply-To: <af3ea28a0707270935v3a8191acl5f2dc5780c56a3d9@mail.gmail.com>
References: <af3ea28a0707262032h7ee22775t6ef54e364a9cd704@mail.gmail.com>
	<af3ea28a0707262038i733d0a0rf6fda8e1fc82dd74@mail.gmail.com>
	<1185543729.13873.10.camel@kleikamp.austin.ibm.com>
	<af3ea28a0707270935v3a8191acl5f2dc5780c56a3d9@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 27 Jul 2007 12:38:16 -0500
Message-Id: <1185557896.22352.4.camel@kleikamp.austin.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2007-07-28 at 00:35 +0800, ye janboe wrote:
> David
> 
> Thanks for you comments.
> I still can not understand why there is comment in code say the dead
> lock can not happen.
> Could you give me some hints?

I could only speculate, since I really don't know the code.  I suspect
the writer of the comment had some other deadlock scenario in mind and
didn't foresee the one that was encountered.

Shaggy
-- 
David Kleikamp
IBM Linux Technology Center
