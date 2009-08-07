Received: from wf-out-1314.google.com ([209.85.200.172])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MZLLa-0006Xi-AS
	for linux-mtd@lists.infradead.org; Fri, 07 Aug 2009 09:02:51 +0000
Received: by wf-out-1314.google.com with SMTP id 23so597505wfg.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 07 Aug 2009 02:02:43 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 7 Aug 2009 17:02:43 +0800
Message-ID: <2df346410908070202i6c16008ckc145559a474129c6@mail.gmail.com>
Subject: [UBI UBIFS] replace vmalloc with kmalloc
From: JiSheng Zhang <jszhang3@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Artem.Bityutskiy@nokia.com, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, rmk@arm.linux.org.uk, adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If nandflash driver use DMA to support UBI and UBIFS i/o, there will
be panic like
the following. This is because UBI and UBIFS use vmalloced buffer
somewhere while
nandflash driver put the buffer under DMA and DMA support doesn't like vmalloced
memory.
[  412.369280] UBIFS: default file-system created
[  412.374879] Unable to handle kernel NULL pointer dereference at
virtual address 00000000
[  412.383177] UBIFS: background thread "ubifs_bgt0_0" started, PID 887
[  412.389656] pgd = c0004000
[  412.392419] [00000000] *pgd=00000000
[  412.396117] Internal error: Oops: 817 [#1] PREEMPT

Yes, I know kmalloc may fail when memory get fragmented, but I grep the UBI and
UBIFS's source, there are six .c files and seven .c files using
vmalloc, the function
which call vmalloc are all called during the ubi being attached and
the volume being
mounted. In embedded system, this mainly happen during kernel boot, it
should succeed.

After replacing vmalloc with kmalloc, ubi and ubifs runs fine on my
board. I can alos upload
a patch.

Comments are welcomed!

Jisheng
