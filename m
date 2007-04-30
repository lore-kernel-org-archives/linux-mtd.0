Received: from mail128.messagelabs.com ([216.82.250.131])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hibkt-0001vS-0v
	for linux-mtd@lists.infradead.org; Mon, 30 Apr 2007 15:41:53 -0400
Received: from az33exr03.mot.com (az33exr03.mot.com [10.64.251.233])
	by motgate2.mot.com (8.12.11/Motorola) with ESMTP id l3UJfmk2015783
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Apr 2007 12:41:48 -0700 (MST)
Received: from az10vts03 (az10vts03.mot.com [10.64.251.244])
	by az33exr03.mot.com (8.13.1/Vontu) with SMTP id l3UJflkQ013719
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Apr 2007 14:41:48 -0500 (CDT)
Received: from de01exm63.ds.mot.com (de01exm63.am.mot.com [10.176.8.108])
	by az33exr03.mot.com (8.13.1/8.13.0) with ESMTP id l3UJfkTW013705
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Apr 2007 14:41:47 -0500 (CDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: JFFS2 deadlock with alloc_sem
Date: Mon, 30 Apr 2007 15:41:45 -0400
Message-ID: <F0A7A3D5461CB54F878D218854074FCE01F7425F@de01exm63.ds.mot.com>
From: "Roberts Nathan-mcg31137" <Nathan.Roberts@motorola.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Has anyone seen this deadlock before? It seems to be a classic deadlock=20
situation so I'm not sure if maybe I'm misinterpreting things or=20
the use case (several postmark tests running in parallel on a
preemptible
kernel) is especially vulnerable.=20

If the lock at NOTE2 is aquired followed by the lock at NOTE4, it seems=20
like deadlock is inevitable.=20

Kernel is 2.6.10 based. (although I've looked at 2.6.18 sources and it=20
appears that the scenario is possible there as well.)

Kernel preemption is enabled.=20

Flash is large page NAND (we've also got it to happen on small page NAND

but it's more difficult).=20

It's not always the GC thread which is the other party.  We've also=20
gotten other callers of garbage_collect_pass() to end up in the same=20
situation.

Thread1
--
[<c023fd60>] (__schedule+0x0/0x5b0) from [<c024047c>]
(schedule+0xec/0x124)
[<c0240390>] (schedule+0x0/0x124) from [<c023f930>]
(__compat_down+0xe0/0x178)
 r4 =3D C0EA4000=20
[<c023f850>] (__compat_down+0x0/0x178) from [<c023f7ec>]
(__compat_down_failed+0xc/0x20)
 r8 =3D C001462C  r7 =3D C2B7C2E8  r6 =3D C2B7C2E8  r5 =3D C0014600
 r4 =3D C2B7C30C=20
[<c00d5b60>] (jffs2_reserve_space+0x0/0x268) from [<c00d80b4>]
(jffs2_write_inode_range+0x5c/0x468)
NOTE1: jffs2_reserve_space() releases and reaquires alloc_sem

[<c00d8058>] (jffs2_write_inode_range+0x0/0x468) from [<c00d30ac>]
(jffs2_commit_write+0x1b0/0x31c)
[<c00d2efc>] (jffs2_commit_write+0x0/0x31c) from [<c00638d8>]
(generic_file_buffered_write+0x3e4/0x64c)
[<c00634f4>] (generic_file_buffered_write+0x0/0x64c) from [<c00641c8>]
(__generic_file_aio_write_nolock+0x488/0x4b4)
NOTE2: generic_file_buffered_write() gets page_lock

[<c0063d40>] (__generic_file_aio_write_nolock+0x0/0x4b4) from
[<c0064274>] (__generic_file_write_nolock+0x80/0xac)
[<c00641f4>] (__generic_file_write_nolock+0x0/0xac) from [<c00643c4>]
(generic_file_write+0x58/0xdc)
 r9 =3D C0EA4000  r8 =3D C1CC3A00  r6 =3D 40030008  r5 =3D C1CC3A9C
 r4 =3D C1CC3A6C=20
[<c006436c>] (generic_file_write+0x0/0xdc) from [<c007eeb4>]
(vfs_write+0xec/0x170)
[<c007edc8>] (vfs_write+0x0/0x170) from [<c007eff4>]
(sys_write+0x48/0x74)
 r8 =3D C0025154  r7 =3D 00000004  r6 =3D C26E7960  r5 =3D 00000000
 r4 =3D 0002D000=20
[<c007efac>] (sys_write+0x0/0x74) from [<c00249a0>]
(ret_fast_syscall+0x0/0x34)
 r6 =3D 00000004  r5 =3D 0002D000  r4 =3D 0008A0FF=20


Thread2
--
[<c023fd60>] (__schedule+0x0/0x5b0) from [<c024047c>]
(schedule+0xec/0x124)
[<c0240390>] (schedule+0x0/0x124) from [<c0241040>]
(io_schedule+0x2c/0x48)
 r4 =3D C02E01A8=20
[<c0241014>] (io_schedule+0x0/0x48) from [<c0060bbc>]
(sync_page+0x40/0x48)
 r5 =3D 00000000  r4 =3D C34F7CF8=20
[<c0060b7c>] (sync_page+0x0/0x48) from [<c024140c>]
(__wait_on_bit_lock+0x54/0x88)
[<c02413b8>] (__wait_on_bit_lock+0x0/0x88) from [<c00614a4>]
(__lock_page+0x88/0x98)
[<c006141c>] (__lock_page+0x0/0x98) from [<c006301c>]
(read_cache_page+0x21c/0x324)
 r5 =3D 00000000  r4 =3D C0336FE0=20
[<c0062e00>] (read_cache_page+0x0/0x324) from [<c00df8f8>]
(jffs2_gc_fetch_page+0x2c/0x64)
[<c00df8cc>] (jffs2_gc_fetch_page+0x0/0x64) from [<c00dc664>]
(jffs2_garbage_collect_pass+0x14a4/0x1c28)
NOTE3: jffs2_gc_fetch_page() attempts to get page_lock

[<c00db1c0>] (jffs2_garbage_collect_pass+0x0/0x1c28) from [<c00de684>]
(jffs2_garbage_collect_thread+0x148/0x19c)
NOTE4: garbage_collect_pass() aquires alloc_sem

[<c00de53c>] (jffs2_garbage_collect_thread+0x0/0x19c) from [<c00444e8>]
(do_exit+0x0/0xd88)
 r7 =3D 00000000  r6 =3D 00000000  r5 =3D 00000000  r4 =3D 00000000
