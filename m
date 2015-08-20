Received: from mail-la0-x233.google.com ([2a00:1450:4010:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSJBb-0005Ts-G7
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 06:18:52 +0000
Received: by laba3 with SMTP id a3so16351808lab.1
 for <linux-mtd@lists.infradead.org>; Wed, 19 Aug 2015 23:18:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1440032464-17626-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <55D52473.7050209@cn.fujitsu.com>
 <1440032464-17626-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Date: Thu, 20 Aug 2015 08:18:28 +0200
Message-ID: <CAHpGcMLZT5xYx5EUBLTPyLQd0f+jQ-g+c_f-oErsHP33m7-ROg@mail.gmail.com>
Subject: Re: [PATCH] fstests: link .out to correct output when we set
 USE_ATTR_SECURE=yes
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: fstests@vger.kernel.org, linux-mtd@lists.infradead.org,
 richard.weinberger@gmail.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dongsheng,

2015-08-20 3:01 GMT+02:00 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>:
>
> When we set USE_ATTR_SECURE to yes or no, the expected outputs of generic/062
> would be different. So we need to link the .out to different file.

Can the tests for the different namespaces please be separated from
each other here (see below)?

diff --git a/tests/generic/062 b/tests/generic/062
index 194b638..9dd4498 100755
--- a/tests/generic/062
+++ b/tests/generic/062
@@ -142,6 +142,7 @@ for nsp in $ATTR_MODES; do
                echo "*** final list (strings, type=$inode, nsp=$nsp)"
                getfattr -m '.' -e hex $SCRATCH_MNT/$inode

+               # FIXME: Remove all remaining xattrs
        done
 done

Next, can the security namespace tests be put in their own test case
so that we don't need to switch between two different .out files? This
could be done by setting ATTR_MODES and then invoking
tests/generic/062 to avoid duplicating the entire test script.

Thanks,
Andreas
