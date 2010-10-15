Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P6iTu-00060N-9d
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2010 11:29:51 +0000
Received: by ywp6 with SMTP id 6so320796ywp.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Oct 2010 04:29:49 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 15 Oct 2010 12:29:48 +0100
Message-ID: <AANLkTi=+2kVMg+YegwRe1SkWWWfF3-=4ZRmvciBZLkCy@mail.gmail.com>
Subject: Understanding OOB data read implementation (II)
From: David Peverley <pev@sketchymonkey.com>
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

Hi again...!

I've also noticed after blindly copying it that in the DoC drivers
that the OOB reads use the ops->len for size :
    static int doc_read_oob(struct mtd_info *mtd, loff_t ofs,
                            struct mtd_oob_ops *ops)
        ...
        uint8_t *buf = ops->oobbuf;
        size_t len = ops->len;
        ...

Reading mtd.h and the following patch summary :
    http://www.mail-archive.com/git-commits-head@vger.kernel.org/msg03799.html

I suspect this is wrong and should be using ops->ooblen instead. This
is especially true given that mtdchar.c leaves ops->len
uninitialised....! (should mtdchar.c:mtd_do_readoob() not zero the ops
structure as it's a local automatic so not zero-initialised?) Again
this is copied in doc2001.c and doc2001plus.c.

Cheers,

~Pev
