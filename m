Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P7CZM-00038h-78
	for linux-mtd@lists.infradead.org; Sat, 16 Oct 2010 19:37:28 +0000
Received: by bwz7 with SMTP id 7so2570436bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 16 Oct 2010 12:37:27 -0700 (PDT)
Subject: Re: Understanding OOB data read implementation (II)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Peverley <pev@sketchymonkey.com>
In-Reply-To: <AANLkTi=+2kVMg+YegwRe1SkWWWfF3-=4ZRmvciBZLkCy@mail.gmail.com>
References: <AANLkTi=+2kVMg+YegwRe1SkWWWfF3-=4ZRmvciBZLkCy@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 16 Oct 2010 22:37:22 +0300
Message-ID: <1287257842.1781.43.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-10-15 at 12:29 +0100, David Peverley wrote:
> Hi again...!
> 
> I've also noticed after blindly copying it that in the DoC drivers
> that the OOB reads use the ops->len for size :
>     static int doc_read_oob(struct mtd_info *mtd, loff_t ofs,
>                             struct mtd_oob_ops *ops)
>         ...
>         uint8_t *buf = ops->oobbuf;
>         size_t len = ops->len;
>         ...
> 
> Reading mtd.h and the following patch summary :
>     http://www.mail-archive.com/git-commits-head@vger.kernel.org/msg03799.html
> 
> I suspect this is wrong and should be using ops->ooblen instead. This
> is especially true given that mtdchar.c leaves ops->len
> uninitialised....! (should mtdchar.c:mtd_do_readoob() not zero the ops
> structure as it's a local automatic so not zero-initialised?) Again
> this is copied in doc2001.c and doc2001plus.c.

If you can test the change - please send a patch.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
