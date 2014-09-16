Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTsml-0000XJ-Eh
 for linux-mtd@lists.infradead.org; Tue, 16 Sep 2014 13:27:12 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [RFC] Don'd hold work_sem while calling worker functions
Date: Tue, 16 Sep 2014 15:26:36 +0200
Message-Id: <1410873998-2955-1-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I fail to see why we need work_sem while wrk->func() is executed.
Artem, do you have an idea?

Having the wear_leveling_worker() called without work_sem held
would simplify the fastmap code too. I'm currently reworking some
of it's code and I'm in locking hell. 8-)

Thanks,
//richard

[PATCH 1/2] UBI: Call worker functions without work_sem held
[PATCH 2/2] UBI: Get rid of __schedule_ubi_work()
