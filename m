Received: from natpool.ud.com ([65.112.245.211] helo=jikku-lt.corp.ud.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16j6VG-0005rf-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Mar 2002 22:36:50 +0000
Received: from infinity-studios.com (localhost.localdomain [127.0.0.1])
	by jikku-lt.corp.ud.com (8.11.6/8.11.6) with ESMTP id g27Mawh01395
	for <linux-mtd@lists.infradead.org>; Thu, 7 Mar 2002 16:36:58 -0600
Message-ID: <3C87EB8A.7070305@infinity-studios.com>
Date: Thu, 07 Mar 2002 16:36:58 -0600
From: Dzuy Nguyen <dzuy@infinity-studios.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Compressed root FS & DoC partition
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I have a 16MB DoC 2000.  I am able to boot make an ext2 FS on and boot 
via LILO.

Now, I want to be able to make it boot to a compressed root FS.  I've 
created my own
compressed root FS (about 6MB).  I figured I'd partition the DoC into 2 
parts of 8MB
each.  The first part is to hold the root FS (and possibly kernel) and 
the latter part an
ext2 FS to store system's configuration files (to mount on /etc later).

I've tried both using dformat and nftl_format to format half of the DoC 
and mke2fs it.
It just refuses to make the formatted half an ext2 unless the entire DoC 
is formatted.

Am I on the wrong path here?  Can someone point me to the right 
direction?  Thanks.

Dzuy
