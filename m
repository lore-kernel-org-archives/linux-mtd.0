Received: from mail-yx0-f202.google.com ([209.85.210.202])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mle8r-0007y3-9Q
	for linux-mtd@lists.infradead.org; Thu, 10 Sep 2009 07:32:34 +0000
Received: by yxe40 with SMTP id 40so1030018yxe.28
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Sep 2009 00:32:27 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 10 Sep 2009 16:32:27 +0900
Message-ID: <2014bcab0909100032j236664b4o7e7bff9c4b56623b@mail.gmail.com>
Subject: BUG? a possible bug at rename_volumes()
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

Hello. I am reporting a possible bug at rename_volumes()
in drivers/mtd/ubi/cdev.c of Linux 2.6.30.5.

I hope that this report would be helpful.
Please examine this report, and let me know your opinion.

rename_volumes() first allocates a ubi_rename_entry variable (at line 801)
and initializes the variable (line 808~809).
And then the function links the variable to the rename_list.

However, it seems that the execution order of the initialization and the linking
to the list might be possibly changed by re-ordering because there is no
memory barrier between them.

And this undesirable re-ordering might result race condition
so that other concurrent threads can read uninitialized value.

I think this is a subtle problem and it might be realistic.
But please examine the report and let me know your opinion.
Thank you.

Sincerely
Shin Hong
