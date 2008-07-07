Received: from wf-out-1314.google.com ([209.85.200.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KFnIA-0003YK-15
	for linux-mtd@lists.infradead.org; Mon, 07 Jul 2008 09:45:54 +0000
Received: by wf-out-1314.google.com with SMTP id 28so2052153wfc.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Jul 2008 02:45:52 -0700 (PDT)
Message-ID: <3aad55d90807070245q6399b535na7f0778bf477e3af@mail.gmail.com>
Date: Mon, 7 Jul 2008 12:45:51 +0300
From: Elias <dilu666@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: MTD device read from kernel module
In-Reply-To: <3aad55d90807040612t2e4883afs2f7dbdda1a937eae@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <3aad55d90807040612t2e4883afs2f7dbdda1a937eae@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

I'm new to this list and a newbie in MTD manipulation from the kernel space.

I'm trying to implement a module for a 2.6.10 linux kernel on a mips
machine that will write and read data from a specific partition of a
Spansion NOR flash chip.

I've understood that the first step in order to read or write to the
flash from a module
is to lock the partition using the get_mtd_device(struct mtd_info
*mtd,int minorNum).

The partition I'm trying to handle is the /dev/mtd2, which has the
major number 90 and the minor number 4, and, thus, I execute right at
the beginning of the module a:
"struct mtd_info *debug=get_mtd_device(NULL,4);"
The get_mtd_device returns immediately with NULL after the insertion
of the module,
so, I figured (after going through the source code of the kernel
(mtdcore.c)) that the
reason probably is that the mtd_table does not contain an entry for
this device. After investigating the contents of the mtd_table, I
found out that only the first 4 positions have contents, so I replaced
the minor number (4) with 2. The get_mtd_device causes a segmentation
fault in that case.

The partition is not mounted during the test. Though, the device can
be mounted using the mtdblock2 (major 31, minor 2), and data can be
accessed using the /dev/mtd2; two facts that suggest that the mtd
partition is functioning properly and the minor number is valid.

What am I doing wrong?

Thanks a priori,
--
elias a.k.a. diluted
