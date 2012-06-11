Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Se59u-0007pt-Ss
 for linux-mtd@lists.infradead.org; Mon, 11 Jun 2012 13:59:55 +0000
Received: from ONYX.xi-lite.lan (unknown [193.34.35.244])
 by co202.xi-lite.net (Postfix) with ESMTPS id 7D8E32602DA
 for <linux-mtd@lists.infradead.org>; Mon, 11 Jun 2012 16:01:44 +0200 (CEST)
Message-ID: <4FD5F9D6.9020800@parrot.com>
Date: Mon, 11 Jun 2012 15:59:50 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: ubifs error : read_znode: bad indexing node
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

we have products where rw ubifs partition are corrupted.
They all failed with the "read_znode: bad indexing node at LEB 558:22056, error
6" or "read_znode: bad indexing node at LEB 446:62888, error 2".

The last ubifs stable commit we have is
http://git.infradead.org/users/dedekind/ubifs-v2.6.32.git/commit/7eb3b6c0999bd2cbc37adb2bd0fb8127f98240ea
.


Do you know if the bug is known ?
Google doesn't provide any info on this and looking at ubifs new commits don't
provide explicit bug fix.

Are there any document that explain how znode works ?


Matthieu
