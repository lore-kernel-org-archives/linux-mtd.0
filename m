Received: from mail-pz0-f193.google.com ([209.85.222.193])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NHc0J-00008A-Tx
	for linux-mtd@lists.infradead.org; Mon, 07 Dec 2009 11:43:53 +0000
Received: by pzk31 with SMTP id 31so3827266pzk.28
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Dec 2009 03:43:45 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 7 Dec 2009 20:43:45 +0900
Message-ID: <2014bcab0912070343l12c9392v514b858b7a8f1a97@mail.gmail.com>
Subject: BUG? a suspected race bug due to the absence of memory barrier
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

Hi. I am reporting a type of suspected bugs
due the absence of proper memory barrier.

Please examine this issue of the possibility of occurring
error in real executions. This report is not from real errors
but from my code inspection so that it might be faulty.

We often allocate an object, initialize it,
and then link it to a data structure so that any thread can access the object.

For this pattern of programming, it seems to be necessary that
memory barrier should confirm that the initializations and the linking
to global data structures are not disordered by CPU or compilers.

For example, add_to_list() at ubi/scan.c of Linux 2.6.32
has the following code:

	86         seb = kmalloc(sizeof(struct ubi_scan_leb), GFP_KERNEL);
	87         if (!seb)
	88                 return -ENOMEM;
	90         seb->pnum = pnum;
	91         seb->ec = ec;
	92         list_add_tail(&seb->u.list, list);

By compilers and CPU, 92 might be executed earlier than 90 or 91.
In that situation, if there is other concurrent thread which iterates
the list might read uninitialized value on the newly linked objects.

Please examine this issue and let me know your opinions.
Thank you.

Sincerely
Shin Hong
