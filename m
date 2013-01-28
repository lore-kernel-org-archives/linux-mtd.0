Received: from mail-pa0-f45.google.com ([209.85.220.45])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TzdWq-0000gp-1N
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2013 01:28:56 +0000
Received: by mail-pa0-f45.google.com with SMTP id bg2so1197453pad.18
 for <linux-mtd@lists.infradead.org>; Sun, 27 Jan 2013 17:28:54 -0800 (PST)
From: Adam Thomas <adamthomas1111@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: UBIFS: a pair of orphan bugs
Date: Mon, 28 Jan 2013 01:28:31 +0000
Message-Id: <1359336513-6259-1-git-send-email-adamthomas1111@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello linux-mtd,

I recently encountered some UBIFS inconsistencies and tracked it back
to a pair of bugs in orphan delete. There is an assumption in
ubifs_delete_orphan that if the orphan cnext is NULL then it is not on
the cnext list, but that is incorrect for the last orphan on the cnext
list, which results in modifying freed memory. The same assumption is
made for the dnext list, which results in a double free. I am
including two patches that fix these issues by adding flags to
ubifs_orphan for pending commit and pending delete that are used
instead of checking cnext and dnext.

The cnext bug specifically was the cause of the inconsistencies I
encountered and is easy to reproduce. For example, repeatedly
untarring a root filesystem tarball and then removing those files
almost always results in inconsistencies in around 10 iterations. I do
not have a repro case for the dnext bug, I discovered that one due to
its similarity to the cnext list.

Thanks,
-Adam
