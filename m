Received: from mail-yw0-f189.google.com ([209.85.211.189])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MlO4R-0004ke-LQ
	for linux-mtd@lists.infradead.org; Wed, 09 Sep 2009 14:22:56 +0000
Received: by ywh27 with SMTP id 27so7514250ywh.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 09 Sep 2009 07:22:50 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 9 Sep 2009 23:22:50 +0900
Message-ID: <2014bcab0909090722t101657b1vf698607aae62e53e@mail.gmail.com>
Subject: UBIFS: possible bug for the absence of memory barrier
From: =?UTF-8?B?7ZmN7IugIHNoaW4gaG9uZw==?= <hongshin@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello. I am reporting the possible bugs caused by absence of memory barriers.

Since I do not have much background,
I can not convince that the codes are buggy.
But I hope that this report is helpful.
Please examine the issue and let me know your opinion.

In add_replay_bud() of UBIFS in Linux 2.6.30.5, it newly allocate a bud_entry
object and initialize and then link it to the replay_buds list.

The last initialization operation is "b->sqnum = sqnum ;" and
the linking to the list "list_add_tail(&b->list, &c->replay_buds;".

However, since there is no memory barrier between these two,
the execution order might be changed
so that uninitialized data might be accessible to other threads.

Therefore, race condition might occur and it may result error.

Please examine this issue.
Thank you

Sincerely
Shin Hong
