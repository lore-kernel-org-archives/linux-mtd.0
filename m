Received: from deferred.serv4.aus.datafoundry.com ([209.99.125.43])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IdAz0-0004gn-M8
	for linux-mtd@lists.infradead.org; Wed, 03 Oct 2007 21:38:19 +0100
Received: from residential.serv4.aus.datafoundry.com
	(residential.serv4.aus.datafoundry.com [209.99.125.41])
	by deferred.serv4.aus.datafoundry.com (Postfix) with ESMTP id
	713BE344D43 for <linux-mtd@lists.infradead.org>;
	Wed,  3 Oct 2007 14:33:57 -0500 (CDT)
Received: from localhost (mw-mail.datafoundry.com [209.99.127.23])
	by residential.serv4.aus.datafoundry.com (Postfix) with ESMTP id
	CD1931BC051 for <linux-mtd@lists.infradead.org>;
	Wed,  3 Oct 2007 14:33:02 -0500 (CDT)
Message-ID: <1191439970.4703ee62083f1@webmail.texas.net>
Date: Wed, 03 Oct 2007 14:32:50 -0500
From: catboat@texas.net
To: linux-mtd@lists.infradead.org
Subject: bit flip
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hello all, 


A NAND card flipped a bit and caused a data CRC problem in a data node. 
When I cat the file, this region is zeroes. cat exits with rc 0.

I can simulate this. I made a jffs2 file system using mkfs.jffs2. 
In a file with multiple data nodes, I manually flip a bit in one of them.
At mount time, I see a printk about it.  cat exits with 0 and the file has a 
chunk of zeroes in it.

Seems incorrect to me.  I expected jffs2 to return EIO somewhere.

Does it seem incorrect to you? 


Monte Copeland
IBM Austin
