Received: from euros.telenet-ops.be ([195.130.132.55])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B1884-00031Q-2Q
	for linux-mtd@lists.infradead.org; Wed, 10 Mar 2004 18:08:28 +0000
Received: from asteria.telenet-ops.be (asteria.telenet-ops.be
	[195.130.132.85])
	by euros.telenet-ops.be (Postfix) with ESMTP id B7F9C4A307
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Mar 2004 19:08:08 +0100 (MET)
Received: from asteria.telenet-ops.be (unknown [127.0.0.1])
	by asteria.telenet-ops.be (Postfix) with ESMTP id 3CF40250024
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Mar 2004 19:08:08 +0100 (MET)
From: joris.lammers@pandora.be
To: linux-mtd@lists.infradead.org
Message-ID: <W418732572587941078942088@asteria.telenet-ops.be>
Date: Wed, 10 Mar 2004 18:08:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: Failed to garbage collect: ENOSPC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

We are using jffs2 on a PowerPC board with four AM29LV128 flashes on it. =
There are 3 jffs2 partitions on the flash and one of the smaller ones (4M=
B in size) contains the log files (and their rotated counterparts).

If we log intensively to one of the files and reset the board after a ran=
dom uptime, it sometimes occurs the partition gets full (97% use, 124k fr=
ee reported by df) and any write to the partition fails with error ENOSPC=
. If I then turn on debugging of the jffs2 code I get the following error=
: "dirty size 0x0001BC38 + unchecked_size 0x00000000 < nospc_dirty_size 0=
x20000, returning -ENOSPC).

Only way to get out of this is to remove the log file that was written to=
 most. This file is then about 200kB in size but after removal the free s=
pace of the partition grows from 124kB to 2MB! Apparently there was dirty=
 space to collect?

What's causing the garbage collector to fail during a write? Where is all=
 that dirty space gone? What's the difference between a remove and a writ=
e.

We are using the MTD snapshot of 29 February 2004.

Thanks in advance,
Joris
