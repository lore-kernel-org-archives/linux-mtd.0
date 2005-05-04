Received: from e4.ny.us.ibm.com ([32.97.182.144])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DTQhs-0004eR-9E
	for linux-mtd@lists.infradead.org; Wed, 04 May 2005 16:42:57 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e4.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j44Kgu9U021271
	for <linux-mtd@lists.infradead.org>; Wed, 4 May 2005 16:42:56 -0400
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j44KguA3092424
	for <linux-mtd@lists.infradead.org>; Wed, 4 May 2005 16:42:56 -0400
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j44Kgtpe021250
	for <linux-mtd@lists.infradead.org>; Wed, 4 May 2005 16:42:55 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Vahid Fereydunkolahi <fereydunk@yahoo.com>
In-Reply-To: <20050504201852.7642.qmail@web51007.mail.yahoo.com>
References: <20050504201852.7642.qmail@web51007.mail.yahoo.com>
Content-Type: text/plain
Date: Wed, 04 May 2005 15:43:35 -0500
Message-Id: <1115239415.6079.3.camel@ibm-ptfdj7idx47.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: two questions about jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-05-04 at 13:18 -0700, Vahid Fereydunkolahi wrote:
> I am not sure if you even understand the question, so
> please behave.

Speaking of behaving, please don't top post on this list.

> 
> The question is: if the file system supposed to
> address the issue of the bad blocks then JFFS2, which
> is the file system must handle the bad blocks, This
> includes all the read and write operations. The only
> thing MTD checks is the erase operation on the blocks.

Perhaps if you restate the question someone may be able to help you.
The above isn't very clear.

JFFS2 handles bad blocks.  It does this by detecting a block is bad, and
then never doing anything with said block.  The definition of a bad
block is that it is marked as such in the spare area at manufacturing
time. Any write/erase operation to such a block would cause this
information to be lost.  Therefore, JFFS2 does not touch these blocks
during runtime.

josh
