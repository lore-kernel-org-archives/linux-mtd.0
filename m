Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvasD-0004a1-VA
 for linux-mtd@lists.infradead.org; Fri, 22 May 2015 00:31:38 +0000
Received: from [10.46.164.140] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: reddyn@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9007413FCA7
 for <linux-mtd@lists.infradead.org>; Fri, 22 May 2015 00:31:15 +0000 (UTC)
Message-ID: <555E78D2.9020307@codeaurora.org>
Date: Thu, 21 May 2015 17:31:14 -0700
From: Nikhilesh Reddy <reddyn@codeaurora.org>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: ubi_assert(list_empty(&used)) in ubi_attach_fastmap
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I am running kernel 3.10.

I recently saw an issue where ubi_assert(list_empty(&used)) in 
ubi_attach_fastmap always hits on a partition.

Searching this issue I found
http://git.infradead.org/linux-ubifs.git/commitdiff/a83832a7c8d023f446ec865926190951bd18a4b1?hp=36a87e44f642966442fd0d23f2ec536851e00236
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 600c4f9..9858bfb 100644 (file)
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -814,7 +814,9 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
         list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &free, u.list)
                 list_move_tail(&tmp_aeb->u.list, &ai->free);

-       ubi_assert(list_empty(&used));
+       list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &used, u.list)
+               list_move_tail(&tmp_aeb->u.list, &ai->erase);
+
         ubi_assert(list_empty(&eba_orphans));
         ubi_assert(list_empty(&free));


Can you please give me a background on this patch.
Is this safe to apply without any of patches in the list

http://lwn.net/Articles/618410/

Can this occur when trying to attach an empty partition?
i.e. one that doesn't contain a UBI image.

Please let me know.
I would really appreciate any help that you can give me.


-- 
Thanks
Nikhilesh Reddy

Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
