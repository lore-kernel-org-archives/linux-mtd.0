Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97A6C27C53
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2024 12:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hyhwdRSk7Z8kC9lQEDopG9prrajOUTipEqQzf6MiWSg=; b=L6ZvXlM440MXyUtNlBClKWqcD0
	hU+CPMu62j03s0pxVybVamqKgkWu5oQtUxA02C9NM5C9ZFVaQ9Fa8OW/cQSMghmfkFGIaYtOL5KnW
	YpKtrjPQB4eDQP2VUP+HWJbQ6Jf5/OMZsCR5+H2jpO6fZAbAMIeb3YD820nJLZi+gFEzdfECnFBDw
	NDxvESm8Unj/Dtf5RRXn2fkXPc7lrzHNOq8YFUfWlD3ujSegKSekvdifyW03guLkigQiuADqsS7Gj
	0m+dHzNwu/nrljliW54CGlhkGxWPYAVI80kYSl4ptdnJ8Hw4PDxqdbEFISIcyMhyrp42BsdeWcHq9
	CTZsQHVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJuRN-00000001BAi-1jQa;
	Wed, 19 Jun 2024 12:29:29 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJuRF-00000001B99-3nId
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jun 2024 12:29:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB4FA2000E;
	Wed, 19 Jun 2024 12:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1718800157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=dZ7KsPWjEsr6F2yMpAaojrsZxVq32flFDms4JbbiEcU=;
	b=Y+lpIaqGTxpZzolq9O3b/bP4EV0vq8L/xUUylwrI9JPk1kbFrq6Gf9YlAaNspKjHLTtXR6
	y9UR24vfBZiCoFIWsicyUQKw1yD82NcGni6eeLnhdX6Mm5CqZBR3wEY+JLa2DU7fUjq1r7
	/nlhBJDiwMK54VZXdwHjbqGfm2e4G1IXyz6gdmXWcF6xOhA0rDbyBVenYBZOlp+GzeJ476
	fjIvPa3xMsIarFf1KVDTAcoYJguIjgULni4XVVetRIGjGCKWQU/CaUz6aTnHoXdo034vO+
	WU+0kzlOwyAjt7nRRXxKAfSjUdP9tIrbUk8IBwfdjCPpg6pOv/8V6gdESYKt9A==
Message-ID: <c252ab82-dc4a-4267-84c3-4a20471524c5@yoseli.org>
Date: Wed, 19 Jun 2024 14:29:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Autocrypt: addr=jeanmichel.hautbois@gmail.com; keydata=
 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
 GiFeDtU=
To: linux-m68k@lists.linux-m68k.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org
Cc: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Schmitz <schmitzmic@gmail.com>, Christoph Hellwig
 <hch@infradead.org>, jeanmichel.hautbois@yoseli.org, wbx@openadk.org
Subject: m68k 54418 fails to execute user space
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_052922_278247_E8742033 
X-CRM114-Status: GOOD (  13.83  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello !

I am (still :-)) trying to make an upstream kernel work on my mcf54418 
custom board. The kernel boots nicely now, but I have an issue when 
executing binaries.

I tried uclibc-ng and glibc, with similar results.

First, I need a patch to change the ELF_ET_DYN_BASE value [1].
Next, I switched from jffs2 to ubifs, but the behavior is the same, with 
one or the other (just that jffs2 needs an extra patch to use 
dirty_folio callback) [2].

Now, I wrote a very dumb and classical program:

$> cat hello.c
#include <stdio.h>

int main()
{
	printf("Hello World on coldfire\n");
}

And I linked it statically, and dynamically (later called hello-stat and 
hello-dyn).

-- I added another patch to help debug the issue:
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index a1f46919934c..d01bd3276204 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1474,6 +1474,7 @@ static bool ubifs_dirty_folio(struct address_space 
*mapping,
          * An attempt to dirty a page without budgeting for it - should not
          * happen.
          */
+       VM_BUG_ON_FOLIO(ret != false, folio);
         ubifs_assert(c, ret == false);
         return ret;
  }

Now comes the (fun ?) part.

When I execute /bin/bash as my init, and I launch the hello-dyn, I get:
[    4.140000] Run /bin/bash as init process
[    4.150000]   with arguments:
[    4.150000]     /bin/bash
[    4.150000]   with environment:
[    4.160000]     HOME=/
[    4.160000]     TERM=linux
bash: cannot set terminal process group (-1): Inappropriate ioctl for device
bash: no job control in this shell
bash-5.2# [  166.510000] random: crng init done

bash-5.2# /bin/hello-dyn
Hello World on coldfir[  382.450000] page: refcount:2 mapcount:1 
mapping:4206dc84 index:0x94 pfn:0x20ac9
e
[  382.460000] aops:0x413b1470 ino:9f dentry name:"libc.so.6"
[  382.460000] flags: 0x38(uptodate|dirty|lru|zone=0)
[  382.470000] raw: 00000038 4fed43dc 4fed4544 4206dc84 00000094 
00000000 00000000 00000002
[  382.480000] raw: 41592000
[  382.480000] page dumped because: VM_BUG_ON_FOLIO(ret != false)
[  382.490000] kernel BUG at fs/ubifs/file.c:1477!
[  382.490000] *** TRAP #7 ***   FORMAT=4
[  382.490000] Current process id is 26
[  382.490000] BAD KERNEL TRAP: 00000000
[  382.490000] PC: [<410fba84>] ubifs_dirty_folio+0x3e/0x42
[  382.490000] SR: 2010  SP: 4286bda4  a2: 41f24510
[  382.490000] d0: 00000023    d1: 000000b9    d2: 4fed4444    d3: 6014c000
[  382.490000] d4: 41593419    d5: 60150000    a0: 4286bce8    a1: 414d5180
[  382.490000] Process hello-dyn (pid: 26, task=41f24510)
[  382.490000] Frame format=4 eff addr=41450e8d pc=414674a3
[  382.490000] Stack from 4286bde0:
[  382.490000]         000005c5 4145aeed 41467485 4fed4444 410586de 
4206dc84 4fed4444 41593419
[  382.490000]         4286bf1a 41074196 4fed4444 00000000 ffffffff 
fffffffe 4286be9e 60150000
[  382.490000]         00000001 41387c58 41073de0 4107797c 00000001 
4283f184 ffffffff 42884600
[  382.490000]         60150000 42884600 4283a3d0 4286a000 4283a3fc 
00000000 00000000 00000000
[  382.490000]         00000000 4286bf5c 41074456 4286bf1a 4283f184 
6014c000 60150000 4286be9e
[  382.490000]         4283a3fc 4286bef6 4286bf1a 4102a05a 4283a3d4 
4283f344 4283a3d0 42830000
[  382.490000] Call Trace: [<410586de>] folio_mark_dirty+0x44/0x58
[  382.490000]  [<41074196>] unmap_page_range+0x3b6/0x602
[  382.490000]  [<41387c58>] mas_find+0x0/0xfa
[  382.490000]  [<41073de0>] unmap_page_range+0x0/0x602
[  382.490000]  [<4107797c>] vma_next+0x0/0x14
[  382.490000]  [<41074456>] unmap_vmas+0x74/0x98
[  382.490000]  [<4102a05a>] up_read+0x0/0x36
[  382.490000]  [<41079ab2>] exit_mmap+0xd4/0x1c0
[  382.490000]  [<41009300>] arch_local_irq_enable+0x0/0xc
[  382.490000]  [<410092f4>] arch_local_irq_disable+0x0/0xc
[  382.490000]  [<41006b76>] __mmput+0x2e/0x86
[  382.490000]  [<4100a080>] do_exit+0x21e/0x6e8
[  382.490000]  [<4100a6c8>] sys_exit_group+0x0/0x14
[  382.490000]  [<4100a686>] do_group_exit+0x22/0x64
[  382.490000]  [<4100a6dc>] pid_child_should_wake+0x0/0x56
[  382.490000]  [<41005848>] system_call+0x54/0xa8
[  382.490000]
[  382.490000] Code: 74a3 4879 4145 0e8d 4eb9 4139 adb8 4e47 <241f> 4e75 
91c8 f4e8 5288 f4e8 5288 f4e8 5288 f4e8 41e8 000d b1fc 0000 07f0 63e6
[  382.490000] Disabling lock debugging due to kernel taint
[  382.490000] note: hello-dyn[26] exited with irqs disabled
[  382.500000] Fixing recursive fault but reboot is needed!
[  387.520000] UBIFS error (ubi0:0 pid 24): ubifs_assert_failed: UBIFS 
assert failed: folio->private != NULL, in fs/ubifs/file.c:1016
[  387.530000] UBIFS warning (ubi0:0 pid 24): ubifs_ro_mode: switched to 
read-only mode, error -22
[  387.540000] CPU: 0 PID: 24 Comm: kworker/u4:1 Tainted: G      D 
      6.10.0-rc4-00050-g21c7ef993c85 #491
[  387.540000] Workqueue: writeback wb_workfn (flush-ubifs_0_0)
[  387.540000] Stack from 41c7fc1c:
[  387.540000]         41c7fc1c 4145ed0d 4145ed0d 00000000 0012d0a0 
41e4d000 413a271a 4145ed0d
[  387.540000]         410fbf84 41e4d000 ffffffea 414674a3 000003f8 
4fed4444 41c7fd72 41c7fcea
[  387.540000]         41c7fce6 41c7fd72 00002230 41058b72 41051efc 
41c7fd72 41051efc 41c7fd72
[  387.540000]         41058e74 4fed4444 41c7fd72 00000000 00000064 
00000400 4281c200 4206dc84
[  387.540000]         00000000 410fb9dc 4206dc84 41c7fd72 410fbf00 
00000000 41059f34 4206dc84
[  387.540000]         41c7fd72 4206dbac 00000400 00000000 00000004 
41c7fd72 4206dbac 41c7fd72
[  387.540000] Call Trace: [<413a271a>] dump_stack+0xc/0x10
[  387.540000]  [<410fbf84>] ubifs_writepage+0x84/0x1e0
[  387.540000]  [<41058b72>] writeback_iter+0x0/0x2b0
[  387.540000]  [<41051efc>] folio_unlock+0x0/0x5c
[  387.540000]  [<41051efc>] folio_unlock+0x0/0x5c
[  387.540000]  [<41058e74>] write_cache_pages+0x52/0x6e
[  387.540000]  [<410fb9dc>] ubifs_writepages+0x14/0x1a
[  387.540000]  [<410fbf00>] ubifs_writepage+0x0/0x1e0
[  387.540000]  [<41059f34>] do_writepages+0x76/0x192
[  387.540000]  [<41024378>] vruntime_eligible+0x70/0x8c
[  387.540000]  [<410b7b06>] __writeback_single_inode+0x46/0x182
[  387.540000]  [<410b7e9a>] writeback_sb_inodes+0x2c/0x31a
[  387.540000]  [<410b7ffc>] writeback_sb_inodes+0x18e/0x31a
[  387.540000]  [<4109784a>] super_trylock_shared+0x0/0x40
[  387.540000]  [<410b7e6e>] writeback_sb_inodes+0x0/0x31a
[  387.540000]  [<4102a05a>] up_read+0x0/0x36
[  387.540000]  [<41020000>] devm_register_sys_off_handler+0x18/0x64
[  387.540000]  [<410b81f4>] __writeback_inodes_wb+0x6c/0x9e
[  387.540000]  [<41059ce8>] wb_over_bg_thresh+0x0/0x7c
[  387.540000]  [<410b8332>] queue_io+0x0/0xaa
[  387.540000]  [<410b8484>] wb_writeback.isra.0+0xa8/0x132
[  387.540000]  [<410b84ea>] wb_writeback.isra.0+0x10e/0x132
[  387.540000]  [<410b72d8>] arch_local_irq_enable+0x0/0xc
[  387.540000]  [<410b72cc>] arch_local_irq_disable+0x0/0xc
[  387.540000]  [<410b740a>] finish_writeback_work+0x0/0x44
[  387.540000]  [<410b83dc>] wb_writeback.isra.0+0x0/0x132
[  387.540000]  [<410b8ac4>] wb_workfn+0x188/0x286
[  387.540000]  [<41393fba>] sized_strscpy+0x0/0x13e
[  387.540000]  [<41016312>] list_del_init+0x0/0x18
[  387.540000]  [<41021ccc>] arch_local_irq_disable+0x0/0x12
[  387.540000]  [<41018382>] process_scheduled_works+0x172/0x220
[  387.540000]  [<410162e8>] arch_local_irq_disable+0x0/0xc
[  387.540000]  [<41017b8c>] assign_work+0x0/0x54
[  387.540000]  [<41018afa>] worker_thread+0x0/0x212
[  387.540000]  [<41018cd2>] worker_thread+0x1d8/0x212
[  387.540000]  [<4101d3f4>] kthread_exit+0x0/0x14
[  387.540000]  [<41018afa>] worker_thread+0x0/0x212
[  387.540000]  [<4101d6ac>] kthread+0x9a/0xa4
[  387.540000]  [<4101d612>] kthread+0x0/0xa4
[  387.540000]  [<410033d0>] ret_from_kernel_thread+0xc/0x14
[  387.540000]
[  387.550000] UBIFS error (ubi0:0 pid 24): ubifs_assert_failed: UBIFS 
assert failed: !c->ro_media && !c->ro_mount, in fs/ubifs/journal.c:108
[  387.570000] UBIFS error (ubi0:0 pid 24): make_reservation: cannot 
reserve 4144 bytes in jhead 2, error -30
[  387.580000] UBIFS error (ubi0:0 pid 24): do_writepage: cannot write 
folio 148 of inode 159, error -30
[  387.590000] UBIFS error (ubi0:0 pid 24): ubifs_assert_failed: UBIFS 
assert failed: folio->private != NULL, in fs/ubifs/file.c:944
[  387.600000] UBIFS error (ubi0:0 pid 24): ubifs_assert_failed: UBIFS 
assert failed: c->bi.dd_growth >= 0, in fs/ubifs/budget.c:550

If I reboot, and launch hello-stat from bash, I get:
[    4.140000] Run /bin/bash as init process
[    4.150000]   with arguments:
[    4.150000]     /bin/bash
[    4.150000]   with environment:
[    4.160000]     HOME=/
[    4.160000]     TERM=linux
bash: cannot set terminal process group (-1): Inappropriate ioctl for device
bash: no job control in this shell
bash-5.2# /bin/hello-stat

I don't have a printf() printed, and a second launch results in:
bash-5.2# /bin/hello-stat
[   18.540000] page: refcount:2 mapcount:1 mapping:4207134c index:0x29 
pfn:0x27f23
[   18.550000] aops:0x413b1470 ino:8f dentry name:"hello-stat"
[   18.560000] flags: 0x38(uptodate|dirty|lru|zone=0)
[   18.560000] raw: 00000038 4fed5a14 414f3fdc 4207134c 00000029 
00000000 00000000 00000002
[   18.570000] raw: 4fe46000
[   18.570000] page dumped because: VM_BUG_ON_FOLIO(ret != false)
[   18.580000] kernel BUG at fs/ubifs/file.c:1477!
[   18.580000] *** TRAP #7 ***   FORMAT=4
[   18.580000] Current process id is 28
[   18.580000] BAD KERNEL TRAP: 00000000
[   18.580000] PC: [<410fba84>] ubifs_dirty_folio+0x3e/0x42
[   18.580000] SR: 2010  SP: 4288bc9c  a2: 41f24a10
[   18.580000] d0: 00000023    d1: 000000b8    d2: 4ffda0ec    d3: 80054000
[   18.580000] d4: 4fe47419    d5: 8005a000    a0: 4288bbe0    a1: 414d5180
[   18.580000] Process hello-stat (pid: 28, task=41f24a10)
[   18.580000] Frame format=4 eff addr=41450e8d pc=414674a3
[   18.580000] Stack from 4288bcd8:
[   18.580000]         000005c5 4145aeed 41467485 4ffda0ec 410586de 
4207134c 4ffda0ec 4fe47419
[   18.580000]         4288be12 41074196 4ffda0ec 00000000 ffffffff 
fffffffe 4288bd96 8005a000
[   18.580000]         00000001 41387c58 41073de0 4107797c 00000001 
4283eb64 ffffffff 42890800
[   18.580000]         8005a000 42890800 4283a1f0 4288a000 4283a21c 
00000000 00000000 00000000
[   18.580000]         00000000 4288be54 41074456 4288be12 4283eb64 
80052000 8005a000 4288bd96
[   18.580000]         4283a21c 4288bdee 4288be12 4102a05a 4283a1f4 
4283eaf4 4283a1f0 42830000
[   18.580000] Call Trace: [<410586de>] folio_mark_dirty+0x44/0x58
[   18.580000]  [<41074196>] unmap_page_range+0x3b6/0x602
[   18.580000]  [<41387c58>] mas_find+0x0/0xfa
[   18.580000]  [<41073de0>] unmap_page_range+0x0/0x602
[   18.580000]  [<4107797c>] vma_next+0x0/0x14
[   18.580000]  [<41074456>] unmap_vmas+0x74/0x98
[   18.580000]  [<4102a05a>] up_read+0x0/0x36
[   18.580000]  [<41079ab2>] exit_mmap+0xd4/0x1c0
[   18.580000]  [<41009300>] arch_local_irq_enable+0x0/0xc
[   18.580000]  [<410092f4>] arch_local_irq_disable+0x0/0xc
[   18.580000]  [<41014283>] __sys_setreuid+0x99/0x138
[   18.580000]  [<41006b76>] __mmput+0x2e/0x86
[   18.580000]  [<4100a080>] do_exit+0x21e/0x6e8
[   18.580000]  [<4100a686>] do_group_exit+0x22/0x64
[   18.580000]  [<4101276e>] get_signal+0x420/0x502
[   18.580000]  [<41003d68>] test_ti_thread_flag+0x0/0x14
[   18.580000]  [<41004444>] do_notify_resume+0x4a/0x4e2
[   18.580000]  [<41011cac>] force_sig_fault_to_task+0x40/0x4c
[   18.580000]  [<410058fe>] Lsignal_return+0x14/0x26
[   18.580000]
[   18.580000] Code: 74a3 4879 4145 0e8d 4eb9 4139 adb8 4e47 <241f> 4e75 
91c8 f4e8 5288 f4e8 5288 f4e8 5288 f4e8 41e8 000d b1fc 0000 07f0 63e6
[   18.580000] Disabling lock debugging due to kernel taint
[   18.580000] note: hello-stat[28] exited with irqs disabled
[   18.590000] Fixing recursive fault but reboot is needed!
[   23.600000] UBIFS error (ubi0:0 pid 24): ubifs_assert_failed: UBIFS 
assert failed: folio->private != NULL, in fs/ubifs/file.c:1016
[   23.610000] UBIFS warning (ubi0:0 pid 24): ubifs_ro_mode: switched to 
read-only mode, error -22
[   23.620000] CPU: 0 PID: 24 Comm: kworker/u4:1 Tainted: G      D 
      6.10.0-rc4-00050-g21c7ef993c85 #491
[   23.620000] Workqueue: writeback wb_workfn (flush-ubifs_0_0)
[   23.620000] Stack from 41c7fc1c:
[   23.620000]         41c7fc1c 4145ed0d 4145ed0d 00000000 00233cf8 
41e4d000 413a271a 4145ed0d
[   23.620000]         410fbf84 41e4d000 ffffffea 414674a3 000003f8 
4ffda0ec 41c7fd72 41c7fcea
[   23.620000]         41c7fce6 41c7fd72 ffff9408 41058b72 41051efc 
41c7fd72 41051efc 41c7fd72
[   23.620000]         41058e74 4ffda0ec 41c7fd72 00000000 00000064 
00000400 4281c200 4207134c
[   23.620000]         00000000 410fb9dc 4207134c 41c7fd72 410fbf00 
00000000 41059f34 4207134c
[   23.620000]         41c7fd72 42071274 00000400 00000000 00000004 
41c7fd72 42071274 41c7fd72
[   23.620000] Call Trace: [<413a271a>] dump_stack+0xc/0x10
[   23.620000]  [<410fbf84>] ubifs_writepage+0x84/0x1e0
[   23.620000]  [<41058b72>] writeback_iter+0x0/0x2b0
[   23.620000]  [<41051efc>] folio_unlock+0x0/0x5c
[   23.620000]  [<41051efc>] folio_unlock+0x0/0x5c
[   23.620000]  [<41058e74>] write_cache_pages+0x52/0x6e
[   23.620000]  [<410fb9dc>] ubifs_writepages+0x14/0x1a
[   23.620000]  [<410fbf00>] ubifs_writepage+0x0/0x1e0
[   23.620000]  [<41059f34>] do_writepages+0x76/0x192
[   23.620000]  [<41024378>] vruntime_eligible+0x70/0x8c
[   23.620000]  [<410b7b06>] __writeback_single_inode+0x46/0x182
[   23.620000]  [<410b7e9a>] writeback_sb_inodes+0x2c/0x31a
[   23.620000]  [<410b7ffc>] writeback_sb_inodes+0x18e/0x31a
[   23.620000]  [<4109784a>] super_trylock_shared+0x0/0x40
[   23.620000]  [<410b7e6e>] writeback_sb_inodes+0x0/0x31a
[   23.620000]  [<4102a05a>] up_read+0x0/0x36
[   23.620000]  [<41020000>] devm_register_sys_off_handler+0x18/0x64
[   23.620000]  [<410b81f4>] __writeback_inodes_wb+0x6c/0x9e
[   23.620000]  [<41059ce8>] wb_over_bg_thresh+0x0/0x7c
[   23.620000]  [<410b8332>] queue_io+0x0/0xaa
[   23.620000]  [<410b8484>] wb_writeback.isra.0+0xa8/0x132
[   23.620000]  [<410b84ea>] wb_writeback.isra.0+0x10e/0x132
[   23.620000]  [<410b72d8>] arch_local_irq_enable+0x0/0xc
[   23.620000]  [<410b72cc>] arch_local_irq_disable+0x0/0xc
[   23.620000]  [<410b740a>] finish_writeback_work+0x0/0x44
[   23.620000]  [<410b83dc>] wb_writeback.isra.0+0x0/0x132
[   23.620000]  [<410b8ac4>] wb_workfn+0x188/0x286
[   23.620000]  [<41393fba>] sized_strscpy+0x0/0x13e
[   23.620000]  [<41016312>] list_del_init+0x0/0x18
[   23.620000]  [<41021ccc>] arch_local_irq_disable+0x0/0x12
[   23.620000]  [<41018382>] process_scheduled_works+0x172/0x220
[   23.620000]  [<410162e8>] arch_local_irq_disable+0x0/0xc
[   23.620000]  [<41017b8c>] assign_work+0x0/0x54
[   23.620000]  [<41018afa>] worker_thread+0x0/0x212
[   23.620000]  [<41018cd2>] worker_thread+0x1d8/0x212
[   23.620000]  [<4101d3f4>] kthread_exit+0x0/0x14
[   23.620000]  [<41018afa>] worker_thread+0x0/0x212
[   23.620000]  [<4101d6ac>] kthread+0x9a/0xa4
[   23.620000]  [<4101d612>] kthread+0x0/0xa4
[   23.620000]  [<410033d0>] ret_from_kernel_thread+0xc/0x14
[   23.620000]
[   23.630000] UBIFS error (ubi0:0 pid 24): ubifs_assert_failed: UBIFS 
assert failed: !c->ro_media && !c->ro_mount, in fs/ubifs/journal.c:108
[   23.650000] UBIFS error (ubi0:0 pid 24): make_reservation: cannot 
reserve 4144 bytes in jhead 2, error -30
[   23.660000] UBIFS error (ubi0:0 pid 24): do_writepage: cannot write 
folio 41 of inode 143, error -30
[   23.670000] UBIFS error (ubi0:0 pid 24): ubifs_assert_failed: UBIFS 
assert failed: folio->private != NULL, in fs/ubifs/file.c:944
[   23.680000] UBIFS error (ubi0:0 pid 24): ubifs_assert_failed: UBIFS 
assert failed: c->bi.dd_growth >= 0, in fs/ubifs/budget.c:550

Now, if I change the init process, and call /bin/hello-dyn instead:
[    4.140000] Run /bin/hello-dyn as init process
[    4.150000]   with arguments:
[    4.150000]     /bin/hello-dyn
[    4.150000]   with environment:
[    4.160000]     HOME=/
[    4.160000]     TERM=linux
Hello World on coldfire
[    4.470000] Kernel panic - not syncing: Attempted to kill init! 
exitcode=0x00000000
[    4.470000] CPU: 0 PID: 1 Comm: hello-dyn Not tainted 
6.10.0-rc4-00050-g21c7ef993c85 #491
[    4.470000] Stack from 4186df2c:
[    4.470000]         4186df2c 4145ed0d 4145ed0d 41009300 00000001 
000000ff 413a271a 4145ed0d
[    4.470000]         4139a532 41009300 00000000 000000ff 00000001 
418a0010 00000000 410092f4
[    4.470000]         4186dfac 41009fd4 41452c80 00000000 00000000 
4100a6c8 00000000 00000001
[    4.470000]         00000000 00000001 41872010 6014f468 6014c000 
41872010 6014f468 6014c000
[    4.470000]         601501cc 4100a686 00000000 4186c000 00000000 
4100a6dc 00000000 41005848
[    4.470000]         00000000 00000001 000000f7 00000000 00000001 
60161700 60161700 601501d4
[    4.470000] Call Trace: [<41009300>] arch_local_irq_enable+0x0/0xc
[    4.470000]  [<413a271a>] dump_stack+0xc/0x10
[    4.470000]  [<4139a532>] panic+0xc6/0x25c
[    4.470000]  [<41009300>] arch_local_irq_enable+0x0/0xc
[    4.470000]  [<410092f4>] arch_local_irq_disable+0x0/0xc
[    4.470000]  [<41009fd4>] do_exit+0x172/0x6e8
[    4.470000]  [<4100a6c8>] sys_exit_group+0x0/0x14
[    4.470000]  [<4100a686>] do_group_exit+0x22/0x64
[    4.470000]  [<4100a6dc>] pid_child_should_wake+0x0/0x56
[    4.470000]  [<41005848>] system_call+0x54/0xa8
[    4.470000]
[    4.470000] ---[ end Kernel panic - not syncing: Attempted to kill 
init! exitcode=0x00000000 ]---

Which is expected. So, I modified hello-dyn a bit:
$> cat hello.c
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

int main()
{
	printf("Hello World on coldfire, execute bash !\n");
	/* Let's now execute /bin/bash with execve */
	char *args[] = {"/bin/bash", NULL};
	execve(args[0], args, NULL);
	/* If we reach here, it means execve failed */
	perror("execve");
	exit(EXIT_FAILURE);
}

And now, I get:
Hello World on coldfire, execute bash !
bash: cannot set terminal process group (-1): Inappropriate ioctl for device
bash: no job control in this shell
bash-5.2# ls
[  122.030000] page: refcount:3 mapcount:2 mapping:4206cdc4 index:0x94 
pfn:0x20ab2
[  122.030000] aops:0x413b1470 ino:9f dentry name:"libc.so.6"
[  122.040000] flags: 0x38(uptodate|dirty|lru|zone=0)
[  122.040000] raw: 00000038 4fed3fec 4fed4208 4206cdc4 00000094 
00000000 00000001 00000003
[  122.050000] raw: 41564000
[  122.050000] page dumped because: VM_BUG_ON_FOLIO(ret != false)
[  122.060000] kernel BUG at fs/ubifs/file.c:1477!
[  122.060000] *** TRAP #7 ***   FORMAT=4
[  122.060000] Current process id is 26
[  122.060000] BAD KERNEL TRAP: 00000000
[  122.060000] PC: [<410fba84>] ubifs_dirty_folio+0x3e/0x42
[  122.060000] SR: 2010  SP: 42871cec  a2: 41f24510
[  122.060000] d0: 00000023    d1: 000000b9    d2: 4fed4108    d3: 601ce000
[  122.060000] d4: 41565411    d5: 601d2000    a0: 42871c30    a1: 414d5180
[  122.060000] Process bash (pid: 26, task=41f24510)
[  122.060000] Frame format=4 eff addr=41450e8d pc=414674a3
<snip>

I can see the page refcount growing, and a difference between it and 
mapcount of 1. But I can't get exactly what is going on.

Any pointer, ideas, will be greatly appreciated, as I am out of clue 
right now :-(.

Thanks !

[1]: 
https://lore.kernel.org/linux-m68k/82ba7ea3-d290-494c-b3e3-93d9dc7c6c0d@yoseli.org/
[2]: 
https://lore.kernel.org/linux-m68k/0b657056-3a7f-46ba-8e99-a8fe2203901f@yoseli.org/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
