Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B095FC04AA8
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 03:11:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D8C221670
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 03:11:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="du3RnTel"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D8C221670
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gr5QXkA8/RmZe9EMsbFxQW9LjrjwJgIo3UpbYV3aI4U=; b=du3RnTelf0Zuv4
	DFVZLF4lvda+PLIsNyL0iDtkshVoIKGH3sVaMB4Y08Z5BcOazuQ4jYcJjcwLLdRacuwvzefMXpyKD
	X+eNRWLXUfGtQiwMtuZ/2ew9hcbmlEWxa2u2/AcW1CB5ygrHn9KINvJjquXnMj6lGW6jqhn8VIjd1
	sYYv4+qb1fAZCNPtdhn1XTJCYVLq95hWZ41HIWctI8krWFcTgIXHECCFcuNFqgrM7RC4yFkuYJ029
	AlCioqkGRnYmdMl0VAEV8uayT58d82TKahzZzaJd5qoaRt9pbVVWyB8CWFjsByeHpbjZUwk3vmQWB
	P+M1ZUgRp1CqgrHeGfFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hM27g-0006zJ-3Q; Thu, 02 May 2019 03:11:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hM27b-0006yv-N4
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 03:10:57 +0000
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 653D82085A;
 Thu,  2 May 2019 03:10:53 +0000 (UTC)
Date: Wed, 1 May 2019 23:10:51 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: BUG: soft lockup in kvm_vm_ioctl
Message-ID: <20190501231051.50eeccd6@oasis.local.home>
In-Reply-To: <20190502023426.GA804@sol.localdomain>
References: <000000000000fb78720587d46fe9@google.com>
 <20190502023426.GA804@sol.localdomain>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190501_201055_770259_1358C9CF 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mingo@kernel.org, kvm@vger.kernel.org, dedekind1@gmail.com,
 peterz@infradead.org, jbaron@redhat.com,
 syzbot <syzbot+8d9bb6157e7b379f740e@syzkaller.appspotmail.com>,
 riel@surriel.com, syzkaller-bugs@googlegroups.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, richard@nod.at, linux-mtd@lists.infradead.org,
 luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, davem@davemloft.net,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 1 May 2019 19:34:27 -0700
Eric Biggers <ebiggers@kernel.org> wrote:

> > Call Trace:
> >  smp_call_function_many+0x750/0x8c0 kernel/smp.c:434
> >  smp_call_function+0x42/0x90 kernel/smp.c:492
> >  on_each_cpu+0x31/0x200 kernel/smp.c:602
> >  text_poke_bp+0x107/0x19b arch/x86/kernel/alternative.c:821
> >  __jump_label_transform+0x263/0x330 arch/x86/kernel/jump_label.c:91
> >  arch_jump_label_transform+0x2b/0x40 arch/x86/kernel/jump_label.c:99
> >  __jump_label_update+0x16a/0x210 kernel/jump_label.c:389
> >  jump_label_update kernel/jump_label.c:752 [inline]
> >  jump_label_update+0x1ce/0x3d0 kernel/jump_label.c:731
> >  static_key_slow_inc_cpuslocked+0x1c1/0x250 kernel/jump_label.c:129
> >  static_key_slow_inc+0x1b/0x30 kernel/jump_label.c:144
> >  kvm_arch_vcpu_init+0x6b7/0x870 arch/x86/kvm/x86.c:9068
> >  kvm_vcpu_init+0x272/0x370 arch/x86/kvm/../../../virt/kvm/kvm_main.c:320
> >  vmx_create_vcpu+0x191/0x2540 arch/x86/kvm/vmx/vmx.c:6577
> >  kvm_arch_vcpu_create+0x80/0x120 arch/x86/kvm/x86.c:8755
> >  kvm_vm_ioctl_create_vcpu arch/x86/kvm/../../../virt/kvm/kvm_main.c:2569
> > [inline]
> >  kvm_vm_ioctl+0x5ce/0x19c0 arch/x86/kvm/../../../virt/kvm/kvm_main.c:3105
> >  vfs_ioctl fs/ioctl.c:46 [inline]
> >  file_ioctl fs/ioctl.c:509 [inline]
> >  do_vfs_ioctl+0xd6e/0x1390 fs/ioctl.c:696
> >  ksys_ioctl+0xab/0xd0 fs/ioctl.c:713
> >  __do_sys_ioctl fs/ioctl.c:720 [inline]
> >  __se_sys_ioctl fs/ioctl.c:718 [inline]
> >  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:718
> >  do_syscall_64+0x103/0x610 arch/x86/entry/common.c:290
> >  entry_SYSCALL_64_after_hwframe+0x49/0xbe

> 
> I'm also curious how syzbot found the list of people to send this to, as it
> seems very random.  This should obviously have gone to the kvm mailing list, but
> it wasn't sent there; I had to manually add it.

My guess is that it went down the call stack, and picked those that
deal with the functions that are listed at the deepest part of the
stack. kvm doesn't appear for 12 functions up from the crash. It
probably stopped its search before that.

-- Steve

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
