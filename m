Received: from smtp.codeaurora.org ([198.145.11.231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WRxzV-0004mU-Pj
 for linux-mtd@lists.infradead.org; Mon, 24 Mar 2014 06:04:10 +0000
Received: from www.codeaurora.org (pdx-caf-fw-vip.codeaurora.org
 [198.145.11.226])
 by smtp.codeaurora.org (Postfix) with ESMTP id D644913F012
 for <linux-mtd@lists.infradead.org>; Mon, 24 Mar 2014 06:03:48 +0000 (UTC)
Message-ID: <f08bbebef039d5bb28c2fcd3022165b0.squirrel@www.codeaurora.org>
Date: Mon, 24 Mar 2014 06:03:48 -0000
Subject: ubifs: assertion fails
From: "Dolev Raviv" <draviv@codeaurora.org>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I’m doing my first steps learning ubifs and I’m trying to understand a
something that does not make much sense to me.

In fs/ubifs/shrinker.c, at shrink_tnc(), there is an assert condition that
shows up every once I a while (after stressing).
ubifs_assert(atomic_long_read(&c->clean_zn_cnt) >= 0);

In another place in the same file in the function ubifs_shrinker(), I
found the following comment:
/*
* Due to the way UBIFS updates the clean znode counter it may
* temporarily be negative.
*/

Could the assertion condition be wrong?
Can anyone share information on what are those times that the counter can
be negative?

Thanks,
Dolev
-- 
QUALCOMM ISRAEL, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
