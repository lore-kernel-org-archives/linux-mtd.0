Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePCjS-0005Og-PS
 for linux-mtd@lists.infradead.org; Wed, 13 Dec 2017 19:30:21 +0000
Received: by mail-wm0-x22c.google.com with SMTP id g130so23255160wme.0
 for <linux-mtd@lists.infradead.org>; Wed, 13 Dec 2017 11:29:57 -0800 (PST)
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
From: Manfred Spraul <manfred@colorfullife.com>
Subject: UBIFS corruptions - update
Message-ID: <8856ca52-8483-7e9d-fe43-cc7fa668517e@colorfullife.com>
Date: Wed, 13 Dec 2017 20:29:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

as promised I tried to add backtrace support to my mtdram modification.

I don't like the result, the workflow is way to complex (good old 
ksymoops, ...)

Just dump_stack(), and then retain the output from dmesg would be simple 
and more efficient.

Thus I have abandoned the patch.


What I have are the results:

- chk_fs corruptions: With 4.15-rc2, the issue still exists.

The corruptions start when the background worker thread erases a page:

1st instance:

https://sourceforge.net/projects/calculix-rpm/files/ubifs-2/11_xattr/image-3754.bin/download

https://sourceforge.net/projects/calculix-rpm/files/ubifs-2/11_xattr/rec-syms-3753.txt/download

2nd instance:

https://sourceforge.net/projects/calculix-rpm/files/ubifs-2/11_xattr/image-5311.bin/download


- the garbage_collect_leb issue:

The issue happens during ubifs_tnc_end_commit(), called by sync().

I'm not sure about the root cause: Should ubifs_check_node() skip the 
index LEB? Or should the nodes never cross a page boundary?

https://sourceforge.net/projects/calculix-rpm/files/ubifs-2/11_xattr/image-167836.bin/download

https://sourceforge.net/projects/calculix-rpm/files/ubifs-2/11_xattr/rec-syms-167837.txt/download

https://sourceforge.net/projects/calculix-rpm/files/ubifs-2/11_xattr/r-167836.txt/download


Without xattr, the garbage_collect_leb issue did not happen, I tested 
around 40.000 images.


@Richard: Is there something where I could support? I fear more data 
would just cause confusion.

For me, there appears to be two reproducible issues:

- garbage_collect_leb: Fairly rare

- Failure with chk_fs enabled. Easy to reproduce, more common.


--

     Manfred
