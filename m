Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QykbO-0004jZ-7B
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 13:13:11 +0000
Received: by ewy3 with SMTP id 3so435778ewy.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 31 Aug 2011 06:13:07 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 31 Aug 2011 15:13:07 +0200
Message-ID: <CAHRBi55cByFH55SO0Ysf1bjycFFuX=kPvvHFy0TuYBbe-BguNQ@mail.gmail.com>
Subject: Erase error
From: Ryan Raasch <ryan.raasch@gmail.com>
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

Hello,

I have now been trying to get the cfi cmdset 0002
erase_one_block to work correctly with our design.

We have some Spansion NOR flash connected with
the gpio-addr-flash driver. However...

Works: mtd-utils (erase)
Erasing is acting kind of strange. When using mtd-utils
and erase partitions using the mtd[?] the erase works
everytime.

Works: performance test modules.
Using the stress, torture, and etc. modules, the erase works.

Doesn't work: Using jffs2

However, when jffs2 starts to do cleanup (the paritition is
mounted, of course) I get about 1/3 failure
on "jffs2_erase_block"

printk(KERN_WARNING "Erase at 0x%08x failed immediately: errno %d\n",
jeb->offset, ret);

However, if I add the largest of hacks in jffs2_erase_block

ret = c->mtd->erase(c->mtd, instr);
if (!ret)
  return;

ret = c->mtd->erase(c->mtd, instr);
if (!ret) {
     printk("Finally!!!!\n");
      return;
}

This works!!!

Any ideas, pls?

Cheers,
Ryan
