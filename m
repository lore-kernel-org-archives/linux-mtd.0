Received: from mail-gx0-f160.google.com ([209.85.217.160])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LomTR-0005C7-Lb
	for linux-mtd@lists.infradead.org; Tue, 31 Mar 2009 22:30:37 +0000
Received: by gxk4 with SMTP id 4so3682185gxk.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 Mar 2009 15:30:24 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 31 Mar 2009 15:30:24 -0700
Message-ID: <1c3f4270903311530u287184d4x8fce867c8dbbd7ed@mail.gmail.com>
Subject: copy problem with mtd partition
From: Manoj <manoj23@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have two mtd partitons on a NAND flash and one of them keeps the
jffs2 filesystem. I can mount the jffs2 fs, read and write files off
of the mounted directory. But when I  copy a big file (11 MB) to any
location in the mounted directory, the call never returns. The
partition is 112MB big. Sometimes, a small file copy can produce the
problem.

I enabled jffs2 debugging and I see this in dmesg:

[  167.250000] jffs2_erase_pending_blocks completed
[  167.250000] jffs2_reserve_space: ret is -11
[  167.250000] jffs2_erase_pending_blocks completed
[  167.250000] jffs2_reserve_space: ret is -11
[  167.250000] jffs2_erase_pending_blocks completed
[  167.250000] jffs2_reserve_space: ret is -11
[  167.250000] jffs2_erase_pending_blocks completed
[  167.250000] jffs2_reserve_space: ret is -11
[  167.250000] jffs2_erase_pending_blocks completed
[  167.250000] jffs2_reserve_space: ret is -11
[  167.250000] jffs2_erase_pending_blocks completed
[  167.250000] jffs2_reserve_space: ret is -11
[  167.250000] jffs2_erase_pending_blocks completed
[  167.250000] jffs2_reserve_space: ret is -11
[  167.250000] jffs2_erase_pending_blocks completed
[  167.250000] jffs2_reserve_space: ret is -11

It seems like jffs2 can't find a block to write to? What could be wrong?

Please cc me in the reply as I am not subscribed.

Thanks.
