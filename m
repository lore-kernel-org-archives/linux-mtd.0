Received: from mail-vw0-f182.google.com ([209.85.212.182])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MXqCx-0008Q5-D9
	for linux-mtd@lists.infradead.org; Mon, 03 Aug 2009 05:35:44 +0000
Received: by vws12 with SMTP id 12so1089498vws.24
	for <linux-mtd@lists.infradead.org>;
	Sun, 02 Aug 2009 22:35:37 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
Date: Mon, 3 Aug 2009 14:35:37 +0900
Message-ID: <9c9fda240908022235l4b50f154jab11f4224412d472@mail.gmail.com>
Subject: UBIFS abnormal unaligned access at OneNAND 4KiB page
From: Kyungmin Park <kmpark@infradead.org>
To: Adrian Hunter <adrian.hunter@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Adrian,

Now I'm working with 4KiB pagesize OneNAND, I got problem with
unaligned byte align again.

<7>UBIFS DBG (pid 1): read_znode: LEB 78:205824, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:206016, indexing node, length 48
onenand_mlc_read_ops_nolock[1108] buf c41bda80 1216 48
<7>UBIFS DBG (pid 1): read_znode: LEB 78:206016, level 0, 1 branch
onenand_mlc_read_ops_nolock[1108] buf c40a68c0 441 13
onenand_read_bufferram[674] area 0x400, buffer c40a68c0, offset 441, count 13
<1>Unhandled fault: external abort on non-linefetch (0x1008) at 0xc58805ba

In the previous time, we got the similar case. but the problem gone
with some patch. but it happens again.

Do you have any idea?

Of course, 2KiB pagesize is working well with same kernel

My kernel is the latest arm git tree. (2.6.31-rc4-gb0c7edf-dirty #624)

Thank you,
Kyungmin Park


onenand_mlc_read_ops_nolock[1108] buf c41bda80 1264 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:230640, level 1, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:196608, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 0 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:196608, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:196800, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 192 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:196800, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:196992, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 384 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:196992, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:197184, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 576 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:197184, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:197376, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 768 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:197376, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:197568, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 960 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:197568, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:197760, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 1152 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:197760, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:197952, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 1344 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:197952, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:230832, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 1456 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:230832, level 1, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:198144, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 1536 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:198144, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:198336, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 1728 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:198336, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:198528, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 1920 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:198528, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:198720, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 2112 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:198720, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:198912, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 2304 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:198912, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:199104, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 2496 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:199104, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:199296, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 2688 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:199296, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:199488, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 2880 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:199488, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:231024, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 1648 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:231024, level 1, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:199680, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 3072 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:199680, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:199872, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 3264 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:199872, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:200064, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 3456 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:200064, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:200256, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 3648 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:200256, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:200448, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 3840 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:200448, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:200640, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 4032 64
onenand_mlc_read_ops_nolock[1108] buf c41bdac0 0 124
<7>UBIFS DBG (pid 1): read_znode: LEB 78:200640, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:200832, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 128 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:200832, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:201024, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 320 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:201024, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:231216, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 1840 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:231216, level 1, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:201216, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 512 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:201216, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:201408, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 704 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:201408, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:201600, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 896 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:201600, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:201792, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 1088 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:201792, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:201984, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 1280 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:201984, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:202176, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 1472 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:202176, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:202368, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 1664 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:202368, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:202560, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 1856 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:202560, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:231408, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 2032 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:231408, level 1, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:202752, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 2048 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:202752, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:202944, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 2240 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:202944, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:203136, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 2432 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:203136, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:203328, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 2624 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:203328, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:203520, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 2816 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:203520, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:203712, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 3008 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:203712, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:203904, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 3200 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:203904, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:204096, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 3392 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:204096, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:231600, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 2224 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:231600, level 1, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:204288, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 3584 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:204288, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:204480, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 3776 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:204480, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:204672, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 3968 128
onenand_mlc_read_ops_nolock[1108] buf c41bdb00 0 60
<7>UBIFS DBG (pid 1): read_znode: LEB 78:204672, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:204864, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 64 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:204864, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:205056, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 256 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:205056, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:205248, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 448 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:205248, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:205440, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 640 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:205440, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:205632, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 832 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:205632, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:231792, indexing node, length 68
onenand_mlc_read_ops_nolock[1108] buf c41bda80 2416 68
<7>UBIFS DBG (pid 1): read_znode: LEB 78:231792, level 1, 2 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:205824, indexing node, length 188
onenand_mlc_read_ops_nolock[1108] buf c41bda80 1024 188
<7>UBIFS DBG (pid 1): read_znode: LEB 78:205824, level 0, 8 branch
<7>UBIFS DBG (pid 1): ubifs_read_node: LEB 78:206016, indexing node, length 48
onenand_mlc_read_ops_nolock[1108] buf c41bda80 1216 48
<7>UBIFS DBG (pid 1): read_znode: LEB 78:206016, level 0, 1 branch
onenand_mlc_read_ops_nolock[1108] buf c40a68c0 441 13
onenand_read_bufferram[674] area 0x400, buffer c40a68c0, offset 441, count 13
<1>Unhandled fault: external abort on non-linefetch (0x1008) at 0xc58805ba
Internal error: : 1008 [#1]
<d>Modules linked in:
CPU: 0    Not tainted  (2.6.31-rc4-gb0c7edf-dirty #624)
PC is at memcpy+0xe4/0x330
LR is at onenand_read_bufferram+0x10c/0x128
