Received: from ext-ch1gw-3.online-age.net ([216.34.191.37])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BxAcH-0003V4-EN
	for linux-mtd@lists.infradead.org; Tue, 17 Aug 2004 16:31:34 -0400
Received: from int-ch1gw-2.online-age.net (int-ch1gw-2 [3.159.232.66])
	by ext-ch1gw-3.online-age.net (8.12.9/8.12.9/990426-RLH) with ESMTP id
	i7HKVRWG000817 for <linux-mtd@lists.infradead.org>;
	Tue, 17 Aug 2004 16:31:27 -0400 (EDT)
Received: from uswaumsxb1medge.am.med.ge.com (localhost [127.0.0.1])
	by int-ch1gw-2.online-age.net (8.12.9/8.12.3/990426-RLH) with ESMTP id
	i7HKVQj7029112 for <linux-mtd@lists.infradead.org>;
	Tue, 17 Aug 2004 16:31:26 -0400 (EDT)
Message-ID: <41226B8B.7010603@med.ge.com>
Date: Tue, 17 Aug 2004 15:33:15 -0500
From: Michael Howard <michael.howard@med.ge.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: compile errors with daily snapshots
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I've been grabbing the daily snapshots for a couple of weeks now and 
keep seeing the following error:

fs/jffs2/write.c: In function `jffs2_write_dnode':
fs/jffs2/write.c:95: error: storage size of `vecs' isn't known
fs/jffs2/write.c:95: warning: unused variable `vecs'
fs/jffs2/write.c: In function `jffs2_write_dirent':
fs/jffs2/write.c:236: error: storage size of `vecs' isn't known
fs/jffs2/write.c:236: warning: unused variable `vecs'
make[2]: *** [fs/jffs2/write.o] Error 1
make[1]: *** [fs/jffs2] Error 2
make: *** [fs] Error 2


Is anyone else getting this?  I've tried patching 2.4.23 and 2.6.7 with 
the same results.  Any help would be much appreciated.

Thanks
Mike
