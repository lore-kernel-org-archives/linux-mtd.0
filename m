Received: from mail0.lsil.com ([147.145.40.20])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JEmkJ-0003a2-SR
	for linux-mtd@lists.infradead.org; Tue, 15 Jan 2008 14:26:41 +0000
Received: from milmhbs0.lsil.com (mhbs.lsil.com [147.145.1.30])
	by mail0.lsil.com (8.12.11/8.12.11) with ESMTP id m0FEJMqu002512
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Jan 2008 06:19:22 -0800 (PST)
Received: from PALMAILF01.ags.agere.com (palmailf01.agere.com [128.94.210.122])
	by milmhbs0.lsil.com (8.12.11/8.12.11) with ESMTP id m0FEM6Ou019903
	for <linux-mtd@lists.infradead.org>; Tue, 15 Jan 2008 06:22:07 -0800
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Slow mount of JFFS2 root file system
Date: Tue, 15 Jan 2008 09:22:04 -0500
Message-ID: <BBF94D674CC54C48B62BD0667061E8490199FA73@PAUMAILU02.ags.agere.com>
From: "Lin, Bin (Bin)" <Bin.Lin@lsi.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have ARM9 systems with JFFS2 root file system. For some reasons, e.g.
system crash or power failure, when system boots up next time, it takes
much longer time than usual to mount jffs2 root file system. It can hang
at following message for 3-10 min. Once this happens, the mount will
take the same long time in every reboot later on. Even though it take
long time to mount root file system, the system can still come up and
function well. This problem occurred in less than 10% of boards in the
field, but can not be reproduced in the lab. I have been struggling with
this is issue for weeks.

NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
Fast Floating Point Emulator V0.9 (c) Peter Teichmann.

There are some symbolic links in the root file system. These links is
linked to the files in another partition. Could that cause root file
system mount problem if the file in the other partition gets corrupted?
Looks like the files in the flash are not corrupted. I guess the
corruption could be in jffs2 file system.

Anyone has seen this issue, and solution?

Appreciate very much for any input,

Ben
