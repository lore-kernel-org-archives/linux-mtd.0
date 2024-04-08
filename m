Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181EACD128A
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2024 10:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3oRG9/LUY9Ehv5r/m9PqdxOqCqNW6xCgr8jhB22XU1o=; b=onWy4Vtjdj/igf
	GrQh7NN9UKtu3XD36BijjqLJzY5CC2VJsz/tEuxAYdJe/5O24Ev5pytHThXqj77/8Hzkcxw85Ohzt
	CyYq/Q8ngNNMPp+6usq0RJvKGbFcbCUBhJAE0wEmFNQzY7ZL9MmY9RVJPAyt8mUEkZc9KTBjVB/bP
	Wve2juVuGOyX5HqHUzRVsT3r/Z8bE/5gH2auCpEK2KSfUQZb3EwsH2sbbGX4IENMvRqyN6n1/fUs5
	twU3wMetX4TxS5mMnTkORVXDFVOL152Q9Xx6kELQeiGtdp11srTn+fFUc3/LFfP3ItyLmZpwpWoTH
	fylEcj0lN01GKeChUPOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtm0x-0000000FE6R-3W4U;
	Mon, 08 Apr 2024 10:14:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtm0u-0000000FE5h-1I70
	for linux-mtd@lists.infradead.org;
	Mon, 08 Apr 2024 10:14:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1E17F60FC8;
	Mon,  8 Apr 2024 10:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E46C433C7;
	Mon,  8 Apr 2024 10:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712571246;
	bh=ndZGcftkDgSnQK3JEdER+AOyVK9STr0JYczcGQisxB8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gZ9F+8Swc04k+ovUTwH6lxYcG8dRYfZn4AFN710am7EmzWVuX3k7NkkxZFGsjDBm4
	 cp5tXH7crVVXUIaTfALc/QFx3SOK6FfiRo18vj/CnEpSkrOeHHmYKvRdnWQz/Q8AbI
	 qdgIbzq3uxtWT1dC6XmfnF/G6vQQ0TOxIrRqPU15uY0JyJMrAHYKsg1pkcTwnaCKb5
	 PYmdMRLUtfnszBKHMBrrZoAFC+KXHJrAN0CvOqq3LGE471RwiJzosntRXwYAZzC7D+
	 VIlL6URPPoS9kGt0mw/ne+iA/wfab6nhSnd/hmP38EnAQZ9D0O2R0eCFAUnMyXzt/x
	 y1n++5JBdqkpg==
Message-ID: <001cc68bbd35658a69ab1e5c5bae7e34d9cfba5e.camel@kernel.org>
Subject: Re: [linus:master] [fs]  541d4c798a:
 BUG:KCSAN:data-race_in_atime_needs_update/inode_update_timestamps
From: Jeff Layton <jlayton@kernel.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Christian Brauner
	 <brauner@kernel.org>, Jan Kara <jack@suse.cz>, gfs2@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, devel@lists.orangefs.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org
Date: Mon, 08 Apr 2024 06:14:04 -0400
In-Reply-To: <202404081036.56aa7de3-lkp@intel.com>
References: <202404081036.56aa7de3-lkp@intel.com>
Autocrypt: addr=jlayton@kernel.org; prefer-encrypt=mutual; keydata=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 kZWuOsJdJQdmwlWC5L5ln9xgfr/4mOY38B0U=
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_031408_462243_CFCBA988 
X-CRM114-Status: GOOD (  14.01  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2024-04-08 at 11:04 +0800, kernel test robot wrote:
> 
> Hello,
> 
> kernel test robot noticed "BUG:KCSAN:data-race_in_atime_needs_update/inode_update_timestamps" on:
> 
> commit: 541d4c798a598854fcce7326d947cbcbd35701d6 ("fs: drop the timespec64 arg from generic_update_time")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> in testcase: trinity
> version: trinity-i386-abe9de86-1_20230429
> with following parameters:
> 
> 	runtime: 300s
> 	group: group-04
> 	nr_groups: 5
> 
> 
> 
> compiler: gcc-13
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> we noticed this issue does not always happen, and parent has similar ones.
> we don't know if these issues are expected, just report what we found in our
> tests FYI.
> 
> 
> 0d72b92883c651a1 541d4c798a598854fcce7326d94
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>           8:202         -4%            :202   dmesg.BUG:KCSAN:data-race_in_atime_needs_update/generic_update_time
>            :202         11%          22:202   dmesg.BUG:KCSAN:data-race_in_atime_needs_update/inode_update_timestamps
>          48:202        -24%            :202   dmesg.BUG:KCSAN:data-race_in_atime_needs_update/touch_atime
>            :202          7%          14:202   dmesg.BUG:KCSAN:data-race_in_generic_fillattr/inode_update_timestamps
>          21:202        -10%            :202   dmesg.BUG:KCSAN:data-race_in_generic_fillattr/touch_atime
>            :202         12%          24:202   dmesg.BUG:KCSAN:data-race_in_inode_update_timestamps/inode_update_timestamps
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Closes: https://lore.kernel.org/oe-lkp/202404081036.56aa7de3-lkp@intel.com
> 
> 
> [  179.356355][ T3221] BUG: KCSAN: data-race in atime_needs_update / inode_update_timestamps
> [  179.363113][ T3221]
> [  179.363323][ T3221] write to 0xffffa34c4c66f600 of 8 bytes by task 3222 on cpu 0:
> [ 179.363951][ T3221] inode_update_timestamps (fs/inode.c:1923) 
> [ 179.364410][ T3221] generic_update_time (fs/inode.c:1948) 
> [ 179.364823][ T3221] touch_atime (fs/inode.c:1966 fs/inode.c:2038) 
> [ 179.365207][ T3221] generic_file_mmap (include/linux/fs.h:2245 mm/filemap.c:3616) 
> [ 179.365721][ T3221] mmap_region (mm/mmap.c:2751) 
> [ 179.366104][ T3221] do_mmap (mm/mmap.c:1362) 
> [ 179.366448][ T3221] vm_mmap_pgoff (arch/x86/include/asm/jump_label.h:27 include/linux/jump_label.h:207 include/linux/mmap_lock.h:41 include/linux/mmap_lock.h:127 mm/util.c:545) 
> [ 179.366840][ T3221] vm_mmap (mm/util.c:562) 
> [ 179.367181][ T3221] elf_map (fs/binfmt_elf.c:378) 
> [ 179.367586][ T3221] load_elf_binary (fs/binfmt_elf.c:1187) 
> [ 179.367996][ T3221] search_binary_handler (fs/exec.c:1740) 
> [ 179.368434][ T3221] exec_binprm (fs/exec.c:1781) 
> [ 179.368813][ T3221] bprm_execve (fs/exec.c:279 fs/exec.c:383 fs/exec.c:1533) 
> [ 179.369251][ T3221] bprm_execve (fs/exec.c:1885) 
> [ 179.369784][ T3221] kernel_execve (fs/exec.c:2023) 
> [ 179.370172][ T3221] call_usermodehelper_exec_async (kernel/umh.c:114) 
> [ 179.370673][ T3221] ret_from_fork (arch/x86/entry/entry_64.S:314) 
> [  179.371043][ T3221]
> [  179.371253][ T3221] read to 0xffffa34c4c66f600 of 8 bytes by task 3221 on cpu 1:
> [ 179.371864][ T3221] atime_needs_update (include/linux/time64.h:49 (discriminator 1) fs/inode.c:2008 (discriminator 1)) 
> [ 179.372294][ T3221] touch_atime (fs/inode.c:2020 (discriminator 1)) 
> [ 179.372669][ T3221] generic_file_mmap (include/linux/fs.h:2245 mm/filemap.c:3616) 
> [ 179.373163][ T3221] mmap_region (mm/mmap.c:2751) 
> [ 179.373533][ T3221] do_mmap (mm/mmap.c:1362) 
> [ 179.373950][ T3221] vm_mmap_pgoff (arch/x86/include/asm/jump_label.h:27 include/linux/jump_label.h:207 include/linux/mmap_lock.h:41 include/linux/mmap_lock.h:127 mm/util.c:545) 
> [ 179.374338][ T3221] vm_mmap (mm/util.c:562) 
> [ 179.374673][ T3221] elf_map (fs/binfmt_elf.c:378) 
> [ 179.375070][ T3221] load_elf_binary (fs/binfmt_elf.c:1187) 
> [ 179.375498][ T3221] search_binary_handler (fs/exec.c:1740) 
> [ 179.375941][ T3221] exec_binprm (fs/exec.c:1781) 
> [ 179.376294][ T3221] bprm_execve (fs/exec.c:279 fs/exec.c:383 fs/exec.c:1533) 
> [ 179.376712][ T3221] bprm_execve (fs/exec.c:1885) 
> [ 179.377063][ T3221] kernel_execve (fs/exec.c:2023) 
> [ 179.377452][ T3221] call_usermodehelper_exec_async (kernel/umh.c:114) 
> [ 179.378061][ T3221] ret_from_fork (arch/x86/entry/entry_64.S:314) 
> [  179.378434][ T3221]
> [  179.378635][ T3221] value changed: 0x000000000402a3d1 -> 0x000000000411e611
> [  179.379219][ T3221]
> [  179.379411][ T3221] Reported by Kernel Concurrency Sanitizer on:
> [  179.379920][ T3221] CPU: 1 PID: 3221 Comm: modprobe Tainted: G                 N 6.5.0-rc1-00096-g541d4c798a59 #1
> [  179.380804][ T3221] ==================================================================
> 
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240408/202404081036.56aa7de3-lkp@intel.com
> 
> 
> 

Timestamp updates in Linux have always been a bit racy. The changelog
for this patch mentions that there is a potential race condition with
this change:

"This change means that an update_time could fetch a different timestamp
 than was seen in inode_needs_update_time. update_time is only ever
 called with one of two flag combinations: Either S_ATIME is set, or
 S_MTIME|S_CTIME|S_VERSION are set.
    
 With this change we now treat the flags argument as an indicator that
 some value needed to be updated when last checked, rather than an
 indication to update specific timestamps."

I think that race condition is benign, and when it happens it we're no
worse off than before. Let me know if I'm misinterpreting this report
though. If there is potential for harm with this race, then I'm happy to
take another look.
-- 
Jeff Layton <jlayton@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
