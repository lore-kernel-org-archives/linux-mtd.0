Received: from web51302.mail.yahoo.com ([206.190.38.168])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DMMqF-0001tV-N0
	for linux-mtd@lists.infradead.org; Fri, 15 Apr 2005 05:10:24 -0400
Message-ID: <20050415091026.33613.qmail@web51302.mail.yahoo.com>
Date: Fri, 15 Apr 2005 02:10:25 -0700 (PDT)
From: Pawel Studencki <pstudencki@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: 
Subject: Can not mount root on mtd block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hello Mike, 

I read your e-mails about problems with mounting ramfs
as root filesystem
and I wonder if you found a solution.
I'm trying the same thing with kernel 2.6.11 on ppc
processor. I've already
checked following:
- boot options: root=/dev/mtdblock1 ro
- debugging to/from do_mount_root function...
and slowly I'm loosing ideas...In my case function
path_lookup (in do_mount)
returns with error  -ENOENT, because there were no
inode found for "root".
It looks similar to your problem...

So if you have any hints, I will enjoy to check them
and perhaps together we
can solve this annoying problem  :) 

best regards
Pawel


		
__________________________________ 
Do you Yahoo!? 
Yahoo! Small Business - Try our new resources site!
http://smallbusiness.yahoo.com/resources/ 
