Received: from e2.ny.us.ibm.com ([32.97.182.102])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CUt9K-0007G2-0u
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2004 15:45:03 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e2.ny.us.ibm.com (8.12.10/8.12.9) with ESMTP id iAIKipG4105980
	for <linux-mtd@lists.infradead.org>; Thu, 18 Nov 2004 15:44:51 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	iAIKipCP227368
	for <linux-mtd@lists.infradead.org>; Thu, 18 Nov 2004 15:44:51 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.12.11) with ESMTP id iAIKipWC005707
	for <linux-mtd@lists.infradead.org>; Thu, 18 Nov 2004 15:44:51 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: 419cf994@tempmail.wgz.org
In-Reply-To: <Pine.LNX.4.44.0411181209170.27784-100000@localhost.localdomain>
References: <Pine.LNX.4.44.0411181209170.27784-100000@localhost.localdomain>
Content-Type: text/plain
Message-Id: <1100810691.31062.22.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Thu, 18 Nov 2004 14:44:51 -0600
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Determining actual flash usage of a particular file
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-11-18 at 14:15, 419cf994@tempmail.wgz.org wrote:
> I've been reading through the archives for several days, so I hope I 
> haven't missed an answer somewhere.
> 
> Is there a way to determine the actual flash space occupied by a 
> particular file on a JFFS2 partition?  'ls' and 'du' report number of 
> bytes of the content of the file, but of course compression and other 
> factors affect that greatly.
> 
> My definition of actual space is flexible...  could be number of blocks or 
> pages occupied, or something similar.  I just need a metric that's more 
> closely related to storage space than uncompressed size.

I don't know of a way to get this info on a running system.  If you can
pull the binary filesystem image off of the board you might be able to
hack jffs2dump.c in the util directory to give you that info.

Or maybe there are other ways that I don't know about.

josh
