Received: from [203.3.76.132] (helo=gatewayb.tabq.com.au)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16e4ZF-0004ov-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2002 01:32:09 +0000
Message-ID: <696BA06B3A0FD211BAAD0060B0C4DD8301B73185@wntx.tabq.com>
From: Simon Gittins <gittins@tabq.com.au>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: jffs2 dirty_list corruption
Date: Fri, 22 Feb 2002 11:43:22 +1000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi

It turns out that the dirty_list corruption feature does affect NOR flash,
or at least, my NOR flash.  I was in the middle of debugging a list
corruption bug when I saw the thread.  The first patch (Thomas) didn't help,
but the second (thanks David) seems to work for me.

Cheers
Simon Gittins
