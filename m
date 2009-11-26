Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NDYhk-0005Zx-4F
	for linux-mtd@lists.infradead.org; Thu, 26 Nov 2009 07:23:56 +0000
Subject: Re: UBIFS on kernel 2.6.24?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Jander <david.jander@protonic.nl>
In-Reply-To: <200911231510.40294.david.jander@protonic.nl>
References: <200911231510.40294.david.jander@protonic.nl>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 26 Nov 2009 09:23:41 +0200
Message-Id: <1259220221.29118.55.camel@localhost>
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

Him

On Mon, 2009-11-23 at 15:10 +0100, David Jander wrote:
> Hi all,
> 
> I am forced to use this ancient kernel (2.6.24), but I also need UBIFS. 
> Our boards have 1GiB NAND flash chips with 2k pages.
> Until now I have been testing with vanilla MTD/UBI/UBIFS from that kernel, 
> and (not entirely unexpected) now errors start to appear, which look like this:
> 
> $ cd /etc
> $ ls -l
> ls: reading directory .: Structure needs cleaning
> 
> And the kernel messages look like this:
> 
> [10871.725906] UBIFS error (pid 10801): ubifs_check_node: bad magic 0x38f2aa8b, expected 0x6101831
> [10871.736785] UBIFS error (pid 10801): ubifs_check_node: bad node at LEB 6259:66568
> [10871.745344] UBIFS error (pid 10801): ubifs_read_node: expected node type 2
> [10871.753209] UBIFS error (pid 10801): ubifs_readdir: cannot find next direntry, error -117

Looks like your NAND driver has problems. You should run mtd tests and validate it:
http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests

> I did not bother turning on more debug messages yet, since I think I
> am most probably missing some important bugfixes in my version of 
> MTD/UBI/UBIFS.

May be, but this really looks like you either have problems in the
driver, or you did not flash the UBIFS image correctly. Try to reproduce
this problem when you attach a freshly erased NAND to UBI and then mount
UBIFS.

>  Btw, is there some sort of version number in some file somewhere, so
> I can check wich version I am actually using?

No, not really. The assumption is that the latest version should always
be used :-)

> I am aware of this git repository:
> http://git.infradead.org/users/dedekind/ubifs-v2.6.24.git

Good! Why you do not use it then? We fixed many UBI/UBIFS bugs there,
and there were important improvements.

> But I'd like to know how I can get this version into my kernel. Will
> it work if I just copy the relevant files?

No. This is git, and what you should do is to merge ubifs-v2.6.24.git to
your tree.

> Is there a patch against 2.6.24 that I can download somewhere?

This is git, and you can create patches yourself. Clone
ubifs-v2.6.24.git and do something like:

git format-patch v2.6.24

You will get all patches. Then you can merge them if you want, but this
is a bad idea, IMHO.

> Do I need only UBIFS, or do I also need all of MTD?

There are some mtd fixes which I considered important in the
ubifs-v2.6.24.git tree. And the tree is sufficient.

But of course, if you find some MTD problems which were fixed later, you
may back-port more patches.

> I have a custom NAND-flash driver, do I likely need to change it, or
> should it just work with the new version of MTD?

You really should just try things out. But I think it should be fine.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
