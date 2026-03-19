Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B771090222
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Mar 2026 12:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VfFP6iOa3EzKMsqd2NChcheQ1znSpdjUQALiv+HxI0=; b=br/HcFMfIvMSrQ
	6X14pepIOSHdhKhBgN6znn3E1zI/oZHqj9lYh3R/M4pcIcIsES08Dk9EOiaNeE2gfK5Iub45Dot0S
	pf9pZQTe27F2KfoW3hKwanHK41P4k8zUvVP3ZvqmD56NRejH+MUWF2jpxoGQkQbMY5RgMycdo8zpF
	VXTDqTQ0SLNHC/vHzPLLV2MmlsZJlaxY1e4JYkRdItjrgd4+Rcke+JFbknfEONNrvlfz/tALVPJ/t
	CcRcF3KGFg5xG3whvUn/H8/zyX9SjZDLxrDkKShy4VHd2s9IW5LOkq8TahLetVpmX77mdPBvxynLt
	cDU+LDTWabAToGw0q2PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Crd-0000000AdNm-2eTW;
	Thu, 19 Mar 2026 12:52:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Crc-0000000AdNU-1WxN;
	Thu, 19 Mar 2026 12:52:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4926C600C4;
	Thu, 19 Mar 2026 12:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9282C19424;
	Thu, 19 Mar 2026 12:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773924755;
	bh=jA7diFAaatzjClu0BNNjaXH84miUw/aL+tXzTcfiSyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Udm/5szmcmrn1FQPUv6e/j0SN6gP++q+sDVLk95f5h2PMysLxA/Z+vmQxnocUccUn
	 NuBv89GwjGw+atxJn1J0so9qkU5Fz40p+PTENxR41hcO8d78y7WoL7d68u7RJwiVoU
	 24b8F9r9Rglgs2jG81B2Ku5fqywDVKhnmPJe34SHQaQbe0jVM5wnV7X8Yl87k20mNN
	 uLVYl3OTVyKbPcX2UWMxSpOwWjfeL17ZUhqEmwTrU9V9I6dAEZqrK0WhNYjr1Zk1rv
	 FL2a3cllmUIkPZSTj7CNTbJNtleLxEuRoC6olnUM1WEiLl3YJslQyYkYq6xD3FW/z0
	 rvKJyE92if+Dg==
Date: Thu, 19 Mar 2026 12:52:22 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Long Li <longli@microsoft.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Bodo Stroesser <bostroesser@gmail.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-mtd@lists.infradead.org, linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v2 12/16] mm: allow handling of stacked mmap_prepare
 hooks in more drivers
Message-ID: <caf19e7e-e8dc-4409-8655-f734279b0c45@lucifer.local>
References: <72750af6906fd96fb6f18e83ac3e694cf357a2c1.1773695307.git.ljs@kernel.org>
 <20260318210845.2591228-1-joshua.hahnjy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260318210845.2591228-1-joshua.hahnjy@gmail.com>
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

On Wed, Mar 18, 2026 at 02:08:45PM -0700, Joshua Hahn wrote:
> On Mon, 16 Mar 2026 21:12:08 +0000 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org> wrote:
>
> > While the conversion of mmap hooks to mmap_prepare is underway, we wil
> > encounter situations where mmap hooks need to invoke nested mmap_prepare
> > hooks.
> >
> > The nesting of mmap hooks is termed 'stacking'.  In order to flexibly
> > facilitate the conversion of custom mmap hooks in drivers which stack, we
> > must split up the existing compat_vma_mapped() function into two separate
> > functions:
> >
> > * compat_set_desc_from_vma() - This allows the setting of a vm_area_desc
> >   object's fields to the relevant fields of a VMA.
>
> Hello Lorenzo, I hope you are doing well!
>
> Thank you for this patch. I was developing on top of mm-new today and had
> an error that I think was caused by this patch. I want to preface this by
> saying that I am not at all familiar with this area of the code, so please
> do forgive me if I've misinterpreted the crash and mistakenly pointed
> at this commit : -)
>
> Here is the crash:
>
> [    1.083795] kernel tried to execute NX-protected page - exploit attempt? (uid: 0)
> [    1.083883] BUG: unable to handle page fault for address: ffa00000048efbb8
> [    1.083957] #PF: supervisor instruction fetch in kernel mode
> [    1.084030] #PF: error_code(0x0011) - permissions violation
> [    1.084086] PGD 100000067 P4D 10035f067 PUD 100364067 PMD 441ed9067 PTE 80000004466a3163
> [    1.084162] Oops: Oops: 0011 [#1] SMP
> [    1.084218] CPU: 0 UID: 0 PID: 305 Comm: mkdir Tainted: G        W   E       7.0.0-rc4-virtme-00442-ge53de5a0302f-dirty #85 PREEMPTLAZY
>
> As you can see, it's on a QEMU instance. I don't think this makes a difference
> in the crash, though.
>
> [    1.084321] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE
> [    1.084369] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-5.el9 11/05/2023
> [    1.084450] RIP: 0010:0xffa00000048efbb8
> [    1.084489] Code: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 <40> 12 0e 00 01 00 11 ff d0 fa 8e 04 00 00 a0 ff 80 33 51 02 01 00
> [    1.084642] RSP: 0018:ffa00000048ef998 EFLAGS: 00010286
> [    1.084692] RAX: ffa00000048efbb8 RBX: ff11000102512cc0 RCX: 000000000000000d
> [    1.084766] RDX: ffffffffa06247d0 RSI: ffa00000048efa18 RDI: ff11000102512cc0
> [    1.084826] RBP: ffa00000048ef9c8 R08: 0000000000000000 R09: 0000000000000007
> [    1.084889] R10: ff110001047d1f08 R11: 00007effdc3d0fff R12: ff110001047d3b00
> [    1.084954] R13: ff11000446cae600 R14: ff110001024efe00 R15: ff11000102510a80
> [    1.085021] FS:  0000000000000000(0000) GS:ff110004aae72000(0000) knlGS:0000000000000000
> [    1.085083] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    1.085136] CR2: ffa00000048efbb8 CR3: 0000000102667001 CR4: 0000000000771ef0
> [    1.085201] PKRU: 55555554
> [    1.085228] Call Trace:
> [    1.085248]  <TASK>
> [    1.085274]  ? __compat_vma_mmap+0x8e/0x130
> [    1.085318]  ? compat_vma_mmap+0x76/0x80
> [    1.085354]  ? mas_alloc_nodes+0xb2/0x110
> [    1.085390]  ? backing_file_mmap+0xc3/0xf0
> [    1.085426]  ? ovl_mmap+0x41/0x50
> [    1.085463]  ? ovl_mmap+0x50/0x50
> [    1.085499]  ? __mmap_region+0x7e8/0x1100
> [    1.085539]  ? do_mmap+0x49f/0x5e0
> [    1.085573]  ? vm_mmap_pgoff+0xef/0x1e0
> [    1.085609]  ? ksys_mmap_pgoff+0x15c/0x1f0
> [    1.085647]  ? do_syscall_64+0xab/0x980
> [    1.085684]  ? entry_SYSCALL_64_after_hwframe+0x4b/0x53
> [    1.085730]  </TASK>
> [    1.085770] Modules linked in: virtio_mmio(E) 9pnet_virtio(E) 9p(E) 9pnet(E) netfs(E)
> [    1.085838] CR2: ffa00000048efbb8
> [    1.085874] ---[ end trace 0000000000000000 ]---
> [    1.085875] kernel tried to execute NX-protected page - exploit attempt? (uid: 0)
> [    1.085918] RIP: 0010:0xffa00000048efbb8
> [    1.085921] Code: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 <40> 12 0e 00 01 00 11 ff d0 fa 8e 04 00 00 a0 ff 80 33 51 02 01 00
> [    1.085988] BUG: unable to handle page fault for address: ffa00000048f7bb8
> [    1.086026] RSP: 0018:ffa00000048ef998 EFLAGS: 00010286
> [    1.086166] #PF: supervisor instruction fetch in kernel mode
> [    1.086221]
> [    1.086267] #PF: error_code(0x0011) - permissions violation
> [    1.086321] RAX: ffa00000048efbb8 RBX: ff11000102512cc0 RCX: 000000000000000d
> [    1.086348] PGD 100000067
> [    1.086394] RDX: ffffffffa06247d0 RSI: ffa00000048efa18 RDI: ff11000102512cc0
> [    1.086459] P4D 10035f067
> [    1.086486] RBP: ffa00000048ef9c8 R08: 0000000000000000 R09: 0000000000000007
> [    1.086550] PUD 100364067
> [    1.086577] R10: ff110001047d1f08 R11: 00007effdc3d0fff R12: ff110001047d3b00
> [    1.086641] PMD 441ed9067
> [    1.086668] R13: ff11000446cae600 R14: ff110001024efe00 R15: ff11000102510a80
> [    1.086731] PTE 80000004433d3163
> [    1.086764] FS:  0000000000000000(0000) GS:ff110004aae72000(0000) knlGS:0000000000000000
> [    1.086829]
> [    1.086868] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    1.086931] Oops: Oops: 0011 [#2] SMP
> [    1.086958] CR2: ffa00000048efbb8 CR3: 0000000102667001 CR4: 0000000000771ef0
> [    1.087015] CPU: 29 UID: 0 PID: 306 Comm: mount Tainted: G      D W   E       7.0.0-rc4-virtme-00442-ge53de5a0302f-dirty #85 PREEMPTLAZY
> [    1.087050] PKRU: 55555554
> [    1.087115] Tainted: [D]=DIE, [W]=WARN, [E]=UNSIGNED_MODULE
> [    1.087207] Kernel panic - not syncing: Fatal exception
> [    2.158392] Shutting down cpus with NMI
> [    2.158629] Kernel Offset: disabled
> [    2.158668] ---[ end Kernel panic - not syncing: Fatal exception ]---
>
> It crashes at compat_vma_mmap, and here is what I think could be the
> potential crash path:
>
> - compat_vma_mmap() creates struct vm_area_desc desc;
>   - compat_set_desc_from_vma Doesn't initialize the struct, but instead
>     modifies independent fields. I think this is where the behavior
>     diverges, since before we would use the C initializer and uninitialized

Ah yeah you're right I'll fix that up!

>     variables would be set to 0 (including ommitted ones, like
>     action.success_hook or action.error_hook). But action.type = MMAP_NOTHING
>   - desc.action.success_hook remains uninitialized in vfs_mmap_prepare
>   - mmap_action_complete()
>     - Here, We've set action.type to be MMAP_NOTHING, so we have err = 0
>     - mmap_action_finish(action, vma, 0)
>       - And here, since err == 0, we check action->success_hook (which has
>         garbage, therefore it's nonzero) and call action->success_hook(vma)
>
> And I think action->success_hook(vma) where success_hook is uninitialized
> stack garbage gets me to where I am.
>
> Again, I'm not too familiar with this area of the kernel, this is just
> based on the quick digging that I did. And aplogies again if I'm missing
> something ; -) I do think that the uninitialized members could be a problem
> though.
>
> Thank you, I hope you have a great day Lorenzo!
> Joshua

Thanks for the report and analysis, much appreciated, hope you have a great
day too :)

Cheers, Lorenzo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
