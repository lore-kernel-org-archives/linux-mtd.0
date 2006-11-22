Received: from nf-out-0910.google.com ([64.233.182.191])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gmmds-0002rE-5G
	for linux-mtd@lists.infradead.org; Wed, 22 Nov 2006 02:35:48 -0500
Received: by nf-out-0910.google.com with SMTP id i2so437601nfe
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Nov 2006 23:35:33 -0800 (PST)
Message-ID: <d33135570611212335p76f32b82k13c3a8a0671d4e24@mail.gmail.com>
Date: Tue, 21 Nov 2006 23:35:32 -0800
From: "Dragan Marinkovic" <marinkovic.dragan@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: jffs2_truncate_fragtree does not handle NULL return from
	jffs2_lookup_node_frag
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_16506_5992317.1164180932833"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_16506_5992317.1164180932833
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I have little endian, MIPS embedded system in which rootfs is
stored on the USB stick (it has its own hardware wear leveling which
can't be turned off). The system is running 2.6.18 kernel. USB stick
has two partitions:

* RO squashfs partition
* RW jffs2 partition (to access the data on this partition, jffs2 and
block2mtd are used, block2mtd driver is the module loaded before jffs2
partition is mounted)

I was testing power loss scenario where power is lost during file update
on the jffs2 partition. After a few test runs I've encountered the
following kernel Oops while attempting to mount jffs2 partition:


CPU 0 Unable to handle kernel paging request at virtual address 0000000c,
epc == 802a4374, ra == 802a8788 Oops[#1]:
Cpu 0
$ 0   : 00000000 80000000 00000000 00008000
$ 4   : 00000000 00000004 00000004 00000000
$ 8   : af229674 878c5e94 38483592 00000000
$12   : 00000000 00000000 0000000a 00000000
$16   : 00000044 00000000 00000004 87814410
$20   : 87814e00 879429c0 865b07f8 865b07f8
$24   : 00000000 2acb8050
$28   : 878c4000 878c5da8 87814e00 802a8788
Hi    : 00000000
Lo    : 00001588
epc   : 802a4374 jffs2_truncate_fragtree+0xf8/0x14c     Not tainted
ra    : 802a8788 jffs2_do_read_inode_internal+0x58c/0xa34
Status: 9004fc03    KERNEL EXL IE
Cause : 00000008
BadVA : 0000000c
PrId  : 00002753
Modules linked in: block2mtd
Process jffs2_gcd_mtd0 (pid: 264, threadinfo=878c4000, task=811e3528)
Stack : 00000044 87814400 00000000 878c5e10 00000044 87814400 00000000 878c5e10
        878c5e50 802a8788 87814e00 87814400 878c5e08 878c5e0c 00000044 878c5e10
        878c5e50 00000000 384834b6 878c5e40 00000000 87814400 87814e00 00000000
        879429c0 00000000 00000044 87814400 87814400 87a24380 87814e00 00000000
        87814e2c 00000000 00000000 00000000 00000000 802a8eac 87de39b0 00000000
        ...
Call Trace:
[<802a4374>] jffs2_truncate_fragtree+0xf8/0x14c
[<802a8788>] jffs2_do_read_inode_internal+0x58c/0xa34
[<802a8eac>] jffs2_do_crccheck_inode+0x68/0x138
[<802acc04>] jffs2_garbage_collect_pass+0x2a4/0xa18
[<802b0184>] jffs2_garbage_collect_thread+0x150/0x17c
[<80104fc4>] kernel_thread_helper+0x10/0x18


Code: 5440fffe  8c840004  00801021 <8c43000c> 1060000c  8fbf0024  8c420014  3042
0fff  14400009

...

Digging a bit deeper, I found that jffs2_truncate_fragtree is not
handling the NULL as a return value from jffs2_lookup_node_frag . It looks
like that NULL return is perfectly legal. The patch to fix this is attached.
I'm not really sure if this is the right place to fix this problem but
it should be OK from the correctness prospective (can't use NULL
pointers).

More to it, I've noticed that if I remove the system power while file
on JFFS2 partition is being updated (it takes a bit of time to hit the
right moment), I'll completely lose the file (it just disappears). Any
ideas?

If anybody is interested I can post more info as well as the offending
jffs2 image.

Dragan

------=_Part_16506_5992317.1164180932833
Content-Type: text/x-patch; name=nodelist.c.patch; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: base64
X-Attachment-Id: f_eutf0mq5
Content-Disposition: attachment; filename="nodelist.c.patch"

LS0tIGxpbnV4LTIuNi4xOC9mcy9qZmZzMi9ub2RlbGlzdC5jLm9yaWcJMjAwNi0xMS0xOCAxODoy
Nzo0My41MzA1Nzk5OTIgLTA4MDAKKysrIGxpbnV4LTIuNi4xOC9mcy9qZmZzMi9ub2RlbGlzdC5j
CTIwMDYtMTEtMTggMTg6Mjg6NDMuMDg5NTI1NjU2IC0wODAwCkBAIC01Nyw2ICs1NywxNiBAQCB2
b2lkIGpmZnMyX2FkZF9mZF90b19saXN0KHN0cnVjdCBqZmZzMl9zCiB2b2lkIGpmZnMyX3RydW5j
YXRlX2ZyYWd0cmVlKHN0cnVjdCBqZmZzMl9zYl9pbmZvICpjLCBzdHJ1Y3QgcmJfcm9vdCAqbGlz
dCwgdWludDMyX3Qgc2l6ZSkKIHsKIAlzdHJ1Y3QgamZmczJfbm9kZV9mcmFnICpmcmFnID0gamZm
czJfbG9va3VwX25vZGVfZnJhZyhsaXN0LCBzaXplKTsKKy8qCisgIERNOiBsb29rcyBsaWtlIGl0
J3MgbGVnYWwgZm9yIGpmZnMyX2xvb2t1cF9ub2RlX2ZyYWcgdG8gcmV0dXJuCisgIE5VTEwgYnV0
IHdlIHdlcmUgbm90IGNoZWNraW5nIGZvciBpdCAod2hpY2ggbGVhZHMgdG8ga2VybmVsIG9vcHMg
YW5kCisgIG91ciB1bHRpbWF0ZSBkZWF0aCB3aGVuIG1vdW50aW5nIGpmZnMyIGZzKS4KKyovCisg
ICAgICAgIGlmKCBOVUxMID09IGZyYWcgKQorICAgICAgICB7CisgICAgICAgICAgICBkYmdfZnJh
Z3RyZWUoIkhtLCBqZmZzMl9sb29rdXBfbm9kZV9mcmFnIHJldHVybmVkIE5VTEwgKGVtcHR5IGZy
YWd0cmVlKSFcbiIpOworICAgICAgICAgICAgcmV0dXJuOworICAgICAgICB9CiAKIAlkYmdfZnJh
Z3RyZWUoInRydW5jYXRpbmcgZnJhZ3RyZWUgdG8gMHglMDh4IGJ5dGVzXG4iLCBzaXplKTsKIAo=

------=_Part_16506_5992317.1164180932833--
