Received: from e6.ny.us.ibm.com ([32.97.182.146])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DAvG4-000352-A6
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2005 14:29:45 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e6.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j2EJTgxY022618
	for <linux-mtd@lists.infradead.org>; Mon, 14 Mar 2005 14:29:42 -0500
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j2EJTg9J238482
	for <linux-mtd@lists.infradead.org>; Mon, 14 Mar 2005 14:29:42 -0500
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j2EJTfUN013408
	for <linux-mtd@lists.infradead.org>; Mon, 14 Mar 2005 14:29:42 -0500
Received: from windu.rchland.ibm.com (windu.rchland.ibm.com [9.10.78.17])
	by d01av01.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j2EJTfc9013389
	for <linux-mtd@lists.infradead.org>; Mon, 14 Mar 2005 14:29:41 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1110828016.7642.29.camel@windu.rchland.ibm.com>
References: <1110827292.7642.26.camel@windu.rchland.ibm.com>
	<1110828016.7642.29.camel@windu.rchland.ibm.com>
Content-Type: text/plain
Date: Mon, 14 Mar 2005 13:29:24 -0600
Message-Id: <1110828565.7642.33.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: lock bit and erase errors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-03-14 at 13:20 -0600, Josh Boyer wrote:
> On Mon, 2005-03-14 at 13:08 -0600, Josh Boyer wrote:
> > Caveat:  I am using some pretty old code in this case, but the current
> > code is also questionable so bear with me.

FYI, I just ran this with a 2.6 kernel + fairly recent MTD code and I
see the same problems.

No more updates from me until I hear back, I promise :).

josh
