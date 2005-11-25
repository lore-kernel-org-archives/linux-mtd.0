Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EfbTi-0003Sk-67
	for linux-mtd@lists.infradead.org; Fri, 25 Nov 2005 06:10:58 -0500
Received: from localhost ([127.0.0.1] helo=eos.fwall.u-szeged.hu)
	by eos.fwall.u-szeged.hu with smtp (Exim 4.51) id 1EfbTb-00007e-Vk
	for linux-mtd@lists.infradead.org; Fri, 25 Nov 2005 12:10:48 +0100
Received: from eos.fwall.u-szeged.hu ([127.0.0.1])
	by eos.fwall.u-szeged.hu (SMSSMTP 4.1.9.35) with SMTP id
	M2005112512104722431
	for <linux-mtd@lists.infradead.org>; Fri, 25 Nov 2005 12:10:47 +0100
Received: from zsofi.inf.u-szeged.hu ([160.114.37.199]
	helo=mail.inf.u-szeged.hu)
	by eos.fwall.u-szeged.hu with esmtp (Exim 4.51) id 1EfbTb-00007b-Rw
	for linux-mtd@lists.infradead.org; Fri, 25 Nov 2005 12:10:47 +0100
Received: from [160.114.36.214] (kpax.inf.u-szeged.hu [160.114.36.214])
	by mail.inf.u-szeged.hu (Postfix) with ESMTP id B58F823969
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Nov 2005 12:10:47 +0100 (CET)
Message-ID: <4386F21B.9010507@inf.u-szeged.hu>
Date: Fri, 25 Nov 2005 12:14:35 +0100
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Subject: New compression method for JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear All,

We would like to introduce our new work concerning JFFS2 compression.

New feautres:
- it uses the kernel's CryptoAPI interface, and will allow not only
compressors but also crypto algorithms
- advanced compressor configuration which allows to compress/encode a
block with more algorithm sequencially.
- certainly full backward compatibility for old JFFS2 images

The new compressor configuration is a regular expression like string to
specify the mode for JFFS2 how to compress blocks:
- "c": means to use algorithm c
- "[c1,c2,c3,...]": means to try algotithm c1, c2, c3,... and use the
first one which was successful.
- "{c1,c2,c3,...}": means to try all the algorithm c1, c2, c3, ... and
use the one which has the best compression ratio for that block.
- "x,y,..": means to apply algorithm x, and after apply algorithm y on
the result of x, and so on. Here x and y can be not only an algorithm
but also a subexpression.

At recent JFFS2 there is a compr field in the struct jffs2_raw_inode to
identify the compression method used in that node. In most cases it is
JFFS2_COMPR_ZLIB which means ZLIB.

Using this new method the compression/encoding method is stored not in
that compr field (that will be JFFS2_COMPR_ENGINE) but in the begining
of the compressed/encoded data. It allows to use not only one algorithm
for one block. At decompressing/deconding there will be a loop which
will terminated if the begining of the result is 0 and not a valid
algorithm name.

About user-space tools:
- there is an old mkfs.jffs2 which can be compiled and used as before
- there is a new mkfs.jffs2 which needs CryptoDev kernel patch which
allows to use the kernel's CryptoAPI from user space, too (patch is also
provided)

More info and patches are on our website at
http://www.inf.u-szeged.hu/jffs2/compression.php

Any comments are welcome.

Ferenc
