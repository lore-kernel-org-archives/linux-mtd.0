Received: from law14-oe66.law14.hotmail.com ([64.4.20.201] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19eSJ8-0000gt-O9
	for <linux-mtd@lists.infradead.org>; Mon, 21 Jul 2003 05:29:54 +0100
From: "Vikram Mehta" <vm6580@hotmail.com>
To: "mtd" <linux-mtd@lists.infradead.org>
Date: Mon, 21 Jul 2003 09:50:02 -0700
MIME-Version: 1.0
Message-ID: <Law14-OE66TR9Ejb0zN0000fa8d@hotmail.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Help me i n Garbage Collection Thread code
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

When I mount jffs2 file system, The grabage collection thread plays up
funny.

The messages I get towards the end are

JFFS2: Garbage collect thread is pid 1792
thread_should_wake(): nr_free_blocks 1, nr_erasing_blocks 15, dirty_size 0x0
jffs2_garbage_collect_thread sleeping...
thread_should_wake(): nr_free_blocks 1, nr_erasing_blocks 15, dirty_size 0x0

And then the target board simple stops responding.

I am using 68vz328/uCdimm.

Help me here

Wiht regards
Vikram
