Received: from mail.nanometrics.ca ([206.191.47.130])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CAAzO-0006Kh-V6
	for linux-mtd@lists.infradead.org; Wed, 22 Sep 2004 13:33:14 -0400
To: linux-mtd@lists.infradead.org
Message-ID: <OF7FF34D00.56A74EB3-ON85256F17.005D63CA-85256F17.00607249@nanometrics.ca>
From: David Ho <DavidHo@nanometrics.ca>
Date: Wed, 22 Sep 2004 13:33:27 -0400
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Subject: Building CVS mtd/jffs2 on 2.4 kernel
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>





Hi all,

I am new to the list, I have been working on a 2.4.24 kernel from the Denx
tree for the PPC8xx for some time.  We are having a few issues with the
JFFS2 code there, namely the increasing mount time as the JFFS2 partition
becomes full, and in general, we like to get a faster mount time.

I am trying to build the mtd/jffs2 code from the CVS snapshot on my 2.4.24
kernel.  I ran the patchin.sh script on the kernel tree.  And with the
Intel flash support selected I was getting a link error from in
mtd/chips/cfi_cmdset_0001.c

drivers/mtd/mtdlink.o: In function `cfi_intelext_partition_fixup':
drivers/mtd/mtdlink.o(.text+0x693c): undefined reference to `__ffs'
drivers/mtd/mtdlink.o(.text+0x693c): relocation truncated to fit:
R_PPC_REL24 __ffs
drivers/mtd/mtdlink.o: In function `do_erase_oneblock':
drivers/mtd/mtdlink.o(.text+0x8d54): undefined reference to `msleep'
drivers/mtd/mtdlink.o(.text+0x8d54): relocation truncated to fit:
R_PPC_REL24 msleep

Can anyone tell me if the code there need fixing or if I missed something
in the configuration.  I am assuming based on the available documentation
that the code should work with my 2.4 kernel.

Regards,
David Ho
Nanometrics Inc.
