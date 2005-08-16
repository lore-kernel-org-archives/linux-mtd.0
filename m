Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4wjE-00036A-Uq
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2005 04:23:29 -0400
Message-ID: <4301A259.3090304@yandex.ru>
Date: Tue, 16 Aug 2005 12:22:49 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <42E5ECE5.4010901@inf.u-szeged.hu>	<20050726093215.GD15903@wohnheim.fh-wedel.de>	<20050726100330.GF15903@wohnheim.fh-wedel.de>	<42EDF04C.1010108@inf.u-szeged.hu>	<20050801095645.GA32464@wohnheim.fh-wedel.de>	<42EDF470.4060208@inf.u-szeged.hu>	<20050801104343.GB32464@wohnheim.fh-wedel.de>	<42EE2B78.70500@inf.u-szeged.hu>	<20050801141841.GD32464@wohnheim.fh-wedel.de>	<42FB68AE.6070805@inf.u-szeged.hu>	<20050815094816.GA27229@wohnheim.fh-wedel.de>	<43007773.2070602@yandex.ru>	<43008129.2060303@inf.u-szeged.hu>	<43008BFB.502@yandex.ru>
	<4300970E.2090803@inf.u-szeged.hu> <43009AE1.6010907@yandex.ru>
In-Reply-To: <43009AE1.6010907@yandex.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: zhao_fusheng@hotmail.com, linux-mtd@lists.infradead.org
Subject: JFFS2 eraseblock header
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ok, here is my *rough* offer about the JFFS2 eraseblock header.

What for?
~~~~~~~~~

a). Zhao Fusheng (aka Forrest) wants to implement fairer wear-levelling 
in JFFS2. For this reason he needs to store the 'erasecount' for each 
flash eraseblock.

b). The recent review of Ferenc Havasi's patch (aka the summary patch) 
showed a JFFS2 inconsistency in how it calculates the physical 
eraseblock to virtual eraseblock ratio. We want to fix this, probably by 
switching to constant 1:1 mapping. Because of this, for compatibility, 
we need to introduce JFFS2 versioning. Since there is no superblock in 
JFFS2, we may add the version number to the eraseblock header as well.

Versioning support will anyway be useful in future.

How to implement?
~~~~~~~~~~~~~~~~~

1. Get rid of clean marker and use eraseblock header instead (the 
eraseblock header will play the role of cleanmarker).
2. The length of the eraseblock header will not be constant, it may grow 
with growing version.
3. As it is implemented currently, store the eraseblock header at the 
beginning of the eraseblock, in OOB for NAND.
4. For NAND, we assume the eraseblock header may span several OOBs, not 
only the first page's.

What's with compatibility?
~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Old JFFS2 binaries have to reject mounting new JFFS2 images (for 
example, because we are going to change the phys:virt mapping to 
constant 1:1, which is anyway incompatible). This is the problem in NAND 
since the compatibility bits are not checked in clean marker (see 
jffs2_check_nand_cleanmarker()). We may solve this problem by, for 
example, changing types of dirent/inode nodes and adding INCOMPAT flag 
there (yes, this is ugly workaround).

2. New JFFS2, when mounting an old JFFS2 binary, will use old algorithms 
(1:M mappings, clean markers).

3. If JFFS2 finds that the version of the image is larger, it will 
reject mounting the image. This will be useful in future.

Comments?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
