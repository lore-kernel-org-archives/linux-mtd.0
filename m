Received: from dsl093-038-089.pdx1.dsl.speakeasy.net ([66.93.38.89]
	helo=snafu.wgz.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CUshD-00074O-4s
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2004 15:16:00 -0500
Received: from localhost (snafu [127.0.0.1])
	by snafu.wgz.com (Postfix) with ESMTP id DA4652340F
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Nov 2004 12:15:42 -0800 (PST)
Received: from snafu.wgz.com ([127.0.0.1])
	by localhost (snafu [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 27690-06 for <linux-mtd@lists.infradead.org>;
	Thu, 18 Nov 2004 12:15:42 -0800 (PST)
Mime-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Message-id: <Pine.LNX.4.44.0411181209170.27784-100000@localhost.localdomain>
From: 419cf994@tempmail.wgz.org
Date: Thu, 18 Nov 2004 12:15:40 -0800 (PST)
To: linux-mtd@lists.infradead.org
Subject: Determining actual flash usage of a particular file
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I've been reading through the archives for several days, so I hope I 
haven't missed an answer somewhere.

Is there a way to determine the actual flash space occupied by a 
particular file on a JFFS2 partition?  'ls' and 'du' report number of 
bytes of the content of the file, but of course compression and other 
factors affect that greatly.

My definition of actual space is flexible...  could be number of blocks or 
pages occupied, or something similar.  I just need a metric that's more 
closely related to storage space than uncompressed size.
