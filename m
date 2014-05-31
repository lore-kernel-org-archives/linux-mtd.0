Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wqe1j-0003eA-Ul
 for linux-mtd@lists.infradead.org; Sat, 31 May 2014 07:48:29 +0000
Message-ID: <538988F7.8090805@huawei.com>
Date: Sat, 31 May 2014 15:47:03 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] UBIFS: Remove incorrect assertion in shrink_tnc()
References: <53894EF4.5030607@huawei.com>
In-Reply-To: <53894EF4.5030607@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Dolev Raviv <draviv@codeaurora.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

In previous mail, I introduce a condition I found that may hit assert
failed in shrink_tnc(). So I think this assertion is useless. But I
don't know if there are any leaks in @c->clean_zn_cnt. Although I've
done some tests and found everything is OK, I'm still not sure of that.

As you said, there might be some problems in TNC sub-sys. I would like
to add a new ubifs_assert in ubifs_tnc_close().

Patch 83707237 solves a problem if one per-fs @c->clean_zn_cnt is wrong,
it will not harm the global @ubifs_clean_zn_cnt to ensure other ubifs
partitions work well. Suppose there is only one ubifs partition, because
we have decreased global @ubifs_clean_zn_cnt with @c->clean_zn_cnt in
ubifs_tnc_close(), assertion in ubifs_exit() will not be hitted whether
@c->clean_zn_cnt is wrong or not.

diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 9083bc7..61914f0 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -2859,10 +2859,11 @@ void ubifs_tnc_close(struct ubifs_info *c)
 {
 	tnc_destroy_cnext(c);
 	if (c->zroot.znode) {
-		long n;
+		long n, freed;

-		ubifs_destroy_tnc_subtree(c->zroot.znode);
+		freed = ubifs_destroy_tnc_subtree(c->zroot.znode);
 		n = atomic_long_read(&c->clean_zn_cnt);
+		ubifs_assert(freed == n);
 		atomic_long_sub(n, &ubifs_clean_zn_cnt);
 	}
 	kfree(c->gap_lebs);


How about adding a new ubifs_assert like this? We can know if there are
any leaks in @c->clean_cn_cnt by it but still not know where it happens. I
think if we are confident of TNC sub-sys, this seems not bad.

What's your opinions? If you are not conflict with it. I would like to add
this to the previous patch and resend it.

Thanks!

Hu
