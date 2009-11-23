Received: from protonic.xs4all.nl ([213.84.116.84] helo=protonic.prtnl)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NCZca-0003Na-Os
	for linux-mtd@lists.infradead.org; Mon, 23 Nov 2009 14:10:32 +0000
Received: from localhost (localhost [127.0.0.1])
	by protonic.prtnl (Postfix) with ESMTP id 303DC28067
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 Nov 2009 15:08:59 +0100 (CET)
Received: from protonic.prtnl ([127.0.0.1])
	by localhost (protonic [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 01664-08 for <linux-mtd@lists.infradead.org>;
	Mon, 23 Nov 2009 15:08:59 +0100 (CET)
Received: from archvile.localnet (archvile.prtnl [192.168.1.153])
	by protonic.prtnl (Postfix) with ESMTP id E343B2803B
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 Nov 2009 15:08:58 +0100 (CET)
From: David Jander <david.jander@protonic.nl>
To: linux-mtd@lists.infradead.org
Subject: UBIFS on kernel 2.6.24?
Date: Mon, 23 Nov 2009 15:10:40 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200911231510.40294.david.jander@protonic.nl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi all,

I am forced to use this ancient kernel (2.6.24), but I also need UBIFS. 
Our boards have 1GiB NAND flash chips with 2k pages.
Until now I have been testing with vanilla MTD/UBI/UBIFS from that kernel, 
and (not entirely unexpected) now errors start to appear, which look like this:

$ cd /etc
$ ls -l
ls: reading directory .: Structure needs cleaning

And the kernel messages look like this:

[10871.725906] UBIFS error (pid 10801): ubifs_check_node: bad magic 0x38f2aa8b, expected 0x6101831
[10871.736785] UBIFS error (pid 10801): ubifs_check_node: bad node at LEB 6259:66568
[10871.745344] UBIFS error (pid 10801): ubifs_read_node: expected node type 2
[10871.753209] UBIFS error (pid 10801): ubifs_readdir: cannot find next direntry, error -117


I did not bother turning on more debug messages yet, since I think I am most probably missing some important bugfixes in my version of 
MTD/UBI/UBIFS. Btw, is there some sort of version number in some file somewhere, so I can check wich version I am actually using?

I am aware of this git repository:
http://git.infradead.org/users/dedekind/ubifs-v2.6.24.git

But I'd like to know how I can get this version into my kernel. Will it work if I just copy the relevant files?
Is there a patch against 2.6.24 that I can download somewhere?
Do I need only UBIFS, or do I also need all of MTD?
I have a custom NAND-flash driver, do I likely need to change it, or should it just work with the new version of MTD?

Thanks for any advice.

Best regards,

-- 
David Jander
Protonic Holland.
