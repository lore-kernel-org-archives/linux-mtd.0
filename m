Received: from isengard.yottayotta.com ([209.115.177.37])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170POj-0006oR-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2002 17:13:37 +0100
Received: from fw-edm-dmz.yottayotta.com ([192.168.1.2] helo=edm-app01.yottayotta.com)
	by isengard.yottayotta.com with esmtp (Exim 3.33 #1)
	id 170PFP-00045j-00
	for linux-mtd@lists.infradead.org; Wed, 24 Apr 2002 10:03:59 -0600
Message-ID: <3CC6D972.7000008@yottayotta.com>
Date: Wed, 24 Apr 2002 10:12:34 -0600
From: Murtada Shah <mshah@yottayotta.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: crc32.h & crc32.c in the wrong dir?
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

Hi,

It seems that crc32.h & crc32.c are in fs/jffs2/ of mtd. So when we copy 
it over, we assume to put it in $TOPDIR/fs/jffs2/

But they are expected in include/linux/, as the files in fs/jffs2 from 
the mtd release say : #include <linux/crc32.h>

Is this a bug or intentional?

Murtada
