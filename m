Received: from mail-ob0-x22e.google.com ([2607:f8b0:4003:c01::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abfMw-0000Sv-DQ
 for linux-mtd@lists.infradead.org; Fri, 04 Mar 2016 02:21:30 +0000
Received: by mail-ob0-x22e.google.com with SMTP id ts10so38577179obc.1
 for <linux-mtd@lists.infradead.org>; Thu, 03 Mar 2016 18:21:09 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 3 Mar 2016 20:21:09 -0600
Message-ID: <CA+EcR23cFb_cY=CAHGcpaq9P9KU2mTDXbTh-OiuK3Oq_o3idDA@mail.gmail.com>
Subject: UBIFS Dump Stack on Android
From: Han Xu <xhnjupt@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

We found an issue on Kernel 4.1 when running Android on UBIFS. Android
required to enable SELINUX and exposed the issue, one ubifs_assert()
function failed and caused dump stack.

--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -309,7 +309,6 @@ static int setxattr(struct inode *host, const char
*name, const void *value,
        union ubifs_key key;
        int err, type;

        ubifs_assert(mutex_is_locked(&host->i_mutex));

It may related to your recent code change
UBIFS: Kill unneeded locking in ubifs_init_security

We also noticed Google maintained Kernel 4.1 AOSP didn't cherry-pick
the patch either. Could you please help to check this issue, Thanks.
