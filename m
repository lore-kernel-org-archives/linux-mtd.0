Received: from wproxy.gmail.com ([64.233.184.207])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1ChDKk-00056c-1H
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2004 15:43:47 -0500
Received: by wproxy.gmail.com with SMTP id 55so14666wri
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Dec 2004 12:43:44 -0800 (PST)
Message-ID: <1f9886eb04122212431223a508@mail.gmail.com>
Date: Wed, 22 Dec 2004 14:43:44 -0600
From: xemc <xemcnet@gmail.com>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
In-Reply-To: <1f9886eb041222122244c01216@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <JPEALJAFNGDDLOPNDIEEIEHDCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412171119290.8020@phoenix.infradead.org>
	<Pine.LNX.4.58.0412221328430.23254@phoenix.infradead.org>
	<20041222140331.GG31282@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412221442510.30556@phoenix.infradead.org>
	<20041222151403.GA8943@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412221522400.30689@phoenix.infradead.org>
	<1f9886eb041222122244c01216@mail.gmail.com>
Subject: Re: JFFS3 & performance
Reply-To: xemc <xemcnet@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If you're interested, here are some more meaningful results for an ARM
architecture (Sharp LH7A400):

# rmmod crc_test; insmod ./crc_test.ko
[crctst] 16-bit CRC CCITT 32 bytes: ts1 37059, ts2 37070, delta 11
[crctst] 16-bit CRC CCITT 4096 bytes: ts1 60342, ts2 61427, delta 1085
[crctst] 16-bit CRC CCITT 65536 bytes: ts1 31089, ts2 51127, delta 20038
[crctst] crc32 32 bytes: ts1 38319, ts2 38325, delta 6
[crctst] crc32 4096 bytes: ts1 57032, ts2 57458, delta 426
[crctst] crc32 65536 bytes: ts1 49367, ts2 58710, delta 9343
[crctst] crc32c 32 bytes: ts1 42039, ts2 42048, delta 9
[crctst] crc32c 4096 bytes: ts1 61670, ts2 62677, delta 1007
[crctst] crc32c 65536 bytes: ts1 64761, ts2 46754, delta 4294949289
[crctst] adler32 32 bytes: ts1 32352, ts2 32357, delta 5
[crctst] adler32 4096 bytes: ts1 51543, ts2 51811, delta 268
[crctst] adler32 65536 bytes: ts1 41608, ts2 48194, delta 6586
[crctst] adler32r 32 bytes: ts1 32140, ts2 32145, delta 5
[crctst] adler32r 4096 bytes: ts1 51663, ts2 51921, delta 258
[crctst] adler32r 65536 bytes: ts1 41654, ts2 47917, delta 6263
[crctst] engel32 32 bytes: ts1 32182, ts2 32188, delta 6
[crctst] engel32 4096 bytes: ts1 51549, ts2 51918, delta 369
[crctst] engel32 65536 bytes: ts1 43199, ts2 51347, delta 8148
[crctst] engel32r 32 bytes: ts1 35293, ts2 35298, delta 5
[crctst] engel32r 4096 bytes: ts1 54784, ts2 55173, delta 389
[crctst] engel32r 65536 bytes: ts1 44905, ts2 51102, delta 6197

Mike
