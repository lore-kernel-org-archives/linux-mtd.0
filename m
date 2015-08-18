Received: from mail-ig0-x22c.google.com ([2607:f8b0:4001:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRfnn-0003Gm-0o
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 12:15:44 +0000
Received: by igfj19 with SMTP id j19so80980376igf.0
 for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2015 05:15:16 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 18 Aug 2015 14:15:16 +0200
Message-ID: <CAHpGcM+bkFA-UDM0FKwH=FkS9+TWv_Br7nWJXSpKDquo5n_gFw@mail.gmail.com>
Subject: [kernel.org bug 103071] Dead "security.*" xattr code in ubifs
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

FYI, I've filed the following bug report against ubifs:

> ubifs sets sb->s_xattr to ubifs_xattr_handlers which contains a handler for
> "security.*" xattrs. The s_xattr handlers are never used because ubifs uses
> its own ubifs_{get,set,list,remove}xattr inode operations instead of
> generic_{get,set,list,remove}xattr inode operations though.

https://bugzilla.kernel.org/show_bug.cgi?id=103071

Thanks,
Andreas
