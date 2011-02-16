Received: from mail.grid-net.com ([97.65.115.2])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PpmhI-0002AU-69
	for linux-mtd@lists.infradead.org; Wed, 16 Feb 2011 19:05:56 +0000
Message-ID: <4D5C200C.3010007@grid-net.com>
Date: Wed, 16 Feb 2011 11:05:48 -0800
From: Steve Iribarne <siribarne@grid-net.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: xattr question AGAIN!
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry for the repeat but I just want to be sure I'm getting this right.

So the UBIFS supports most of the SELinux xattrs.  I believe the only 
exception is ACL.

Is this a correct assumption?  Sorry Artem, I can't find any answers 
that you have posted in the past.

And we are going to start doing some extensive testing on this, so I'll 
report any issues we find.  I also may have resources to add ACL support.


-stv
