Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CTcDc-0001J7-20
	for linux-mtd@lists.infradead.org; Mon, 15 Nov 2004 03:28:16 -0500
Received: from [192.168.37.21] (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id 0ACCC22967
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Nov 2004 11:27:26 +0300 (MSK)
Message-ID: <4198686D.8000301@yandex.ru>
Date: Mon, 15 Nov 2004 11:27:25 +0300
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: BUG in JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I've hit on bug in JFFS2, but I can not reproduce it easilly yet. I have 
  stess test which in general creates files, deletes them, creates 
directories and deletes them, and so on so on. When I run this test 
nightly, I see the following error when I come at work in the morning:

kernel BUG at 
/tester/linux/linux-2.6.8-1.521up-custom-nopreempt/fs/jffs2/gc.c:1164!
invalid operand: 0000 [#1]
DEBUG_PAGEALLOC
Modules linked in: jffs2 nandsim zlib_deflate mtdchar nand mtdpart 
nand_ids mtdcore nand_ecc nfsd exportfs md5 ipv6 autofs4d
CPU:    0
EIP:    0060:[<22aa58a0>]    Not tainted
EFLAGS: 00010206   (2.6.8-1.521up-custom-nopreempt)
EIP is at jffs2_garbage_collect_dnode+0x3f0/0x407 [jffs2]
eax: 003976f0   ebx: 00000000   ecx: 00397850   edx: 00000000
esi: 13fc3e00   edi: 13fc3e2c   ebp: 07198ea8   esp: 07198e08
ds: 007b   es: 007b   ss: 0068
Process mkfile (pid: 11938, threadinfo=07198000 task=11dbc9f0)
Stack: 00000010 00000fff 07198e3c 0220c6e7 00398000 07198e2c 00000246 
00000000
        00397000 003976f0 0902edf8 00000000 13fc3e40 000aa8f5 07198e48 
023660b4
        07198e7c 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
Call Trace:
  [<02107c7a>] show_stack+0x7a/0x90
  [<02107df7>] show_registers+0x147/0x1f0
  [<0210801e>] die+0xee/0x270
  [<021084da>] do_invalid_op+0x9a/0xa0
  [<ffff3454>] 0xffff3454
  [<22aa4131>] jffs2_garbage_collect_live+0x2c1/0x4f0 [jffs2]
  [<22aa351c>] jffs2_garbage_collect_pass+0x93c/0x1290 [jffs2]
  [<22aab132>] jffs2_flush_wbuf_gc+0xa2/0x140 [jffs2]
  [<22a9a7ca>] jffs2_fsync+0x1a/0x20 [jffs2]
  [<0217d0c4>] sys_fsync+0xb4/0xf0
  [<ffff3200>] 0xffff3200
Code: 0f 0b 8c 04 b4 ed aa 22 eb c5 0f 0b 28 04 b4 ed aa 22 e9 d5


May be somebody may comment this without having the test which can 
easilly reproduce this bug?

P.S. My kernel is 2.6.8.1, UP, Preemption is disabled.

P.P.S. I observed this several times.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
