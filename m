Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE5FC369D7
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Apr 2025 18:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4bkiTRXZ98i9Md9XqhxU8MIQwrqj4lZkvTlbLQl05nE=; b=PE5PwzRWP42A5h
	jrF4271VSL8BrVU1NaysIGnJs8+q5RpwTmPztktk/5xsdqGgj3W+6RZysIqV5hs1hw1KqEIYHkX1s
	CCWRCQr3ApOdhPVrmYq+BknIHhNjp/zMtIsOpKPbTPSObEwqz11/iWfQmg6mviTiMRmTJ2FEbsBg8
	Ty4EWnhfA0/YCTfZhYkfG7xu2WVDwv7r/rlLJWoOHTWNr/B/56SGRIJqMLlLUZ9UOJW2hodB5aKzZ
	MUJUBRH61/U3OM1OztvCtpDG3V9wo7M2BhXJMg25Bmtyj3a6sPwBtpuSsBtmbWi5H4blRr52Bn4m2
	Ll8ESL+byW5Z8NrEIixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7IXb-00000008CZo-36mV;
	Tue, 22 Apr 2025 18:40:19 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Hp2-000000083xK-3oTS
	for linux-mtd@lists.infradead.org;
	Tue, 22 Apr 2025 17:54:19 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id B8D2C1F910;
	Tue, 22 Apr 2025 19:54:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745344454;
	bh=PkgELOsXXHcP6A6fIVqU8X1w8GCmR28cJ50CK+2ZOPw=; h=From:To:Subject;
	b=TUhigKMzpq4lxbTvqBu567flmEypELZRJ42uUl3VWbuP864x0RFBR/QiDLjXxXkIg
	 w7O2LJQ3CmbFpRs3tehhvwOxqdGzwUoLLZwIdCKWfW6/VmVlb2DmAyTNyk4vqlepzF
	 eL2jOGZWK0/w/PP0Rv6IwrtOZgt3p9oqED7Q9b/q40pZ2jqprTIYbot89NokuYy+mV
	 bnOgfHRcRrXaGG4ltJUT96VT+yc8gRpHzfgiOkgrrXuYqjrewPEi9gHa7I1dIrGBQ7
	 54DsZp6qOgmUeAIlEJ4yRUM2oIT7YLRJn5Xvr/J0c5cq24saTyPDLhZvC4MbLqKUvA
	 kHRWeRWsaP2Tw==
Date: Tue, 22 Apr 2025 19:54:09 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Richard Weinberger <richard@nod.at>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Matthew Wilcox <willy@infradead.org>,
	Zhihao Cheng <chengzhihao1@huawei.com>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: Re: Linux 6.15-rc1 regression, folio/ubifs Oops
Message-ID: <20250422175409.GA877874@francesco-nb>
References: <20250408082018.GA23886@francesco-nb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250408082018.GA23886@francesco-nb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_105417_999478_67758B20 
X-CRM114-Status: GOOD (  12.95  )
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

+ Herbert, Zhihao

Hello all,

On Tue, Apr 08, 2025 at 10:20:18AM +0200, Francesco Dolcini wrote:
> I do have the following regression on single core system using UBIFS,
> dual core seems not affected, any idea?
> 
> [    1.003798] 8<--- cut here ---
> [    1.003843] Unable to handle kernel paging request at virtual address d21af3b8 when read
> [    1.003876] [d21af3b8] *pgd=00000000
> [    1.003914] Internal error: Oops: 5 [#1] SMP ARM
> [    1.023282] Modules linked in:
> [    1.026371] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.15.0-rc1-0.0.0-devel #1 PREEMPT
> [    1.035110] Hardware name: Freescale i.MX7 Dual (Device Tree)
> [    1.040881] PC is at scomp_acomp_comp_decomp+0x138/0x390
> [    1.046243] LR is at scomp_acomp_decompress+0x10/0x48
> [    1.051336] pc : [<c050aa90>]    lr : [<c050b07c>]    psr: 20000013
> [    1.057634] sp : d0825a98  ip : 00000024  fp : c221d780
> [    1.062886] r10: 00000576  r9 : d0825af0  r8 : c204e030
> [    1.068137] r7 : cfdaf3b8  r6 : cfdaf3b8  r5 : c27b2540  r4 : cfd5b1e8
> [    1.074694] r3 : 02400000  r2 : 00001000  r1 : d0b01000  r0 : 00000000
> [    1.081251] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> [    1.088419] Control: 10c5387d  Table: 8000406a  DAC: 00000051
> [    1.094189] Register r0 information: NULL pointer
> [    1.098929] Register r1 information: 16-page vmalloc region starting at 0xd0b01000 allocated at crypto_scomp_init_tfm+0x8c/0x180
> [    1.110556] Register r2 information: non-paged memory
> [    1.115641] Register r3 information: non-paged memory
> [    1.120726] Register r4 information: non-slab/vmalloc memory
> [    1.126421] Register r5 information: slab kmalloc-192 start c27b2540 pointer offset 0 size 192
> [    1.135112] Register r6 information: non-slab/vmalloc memory
> [    1.140806] Register r7 information: non-slab/vmalloc memory
> [    1.146500] Register r8 information: slab kmalloc-8k start c204e000 pointer offset 48 size 8192
> [    1.155280] Register r9 information: 2-page vmalloc region starting at 0xd0824000 allocated at kernel_clone+0xa4/0x33c
> [    1.166043] Register r10 information: non-paged memory
> [    1.171219] Register r11 information: slab kmalloc-64 start c221d780 pointer offset 0 size 64
> [    1.179827] Register r12 information: non-paged memory
> [    1.185003] Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
> [    1.191043] Stack: (0xd0825a98 to 0xd0826000)
> [    1.195431] 5a80:                                                       00000004 c07edfcc
> [    1.203650] 5aa0: 00000000 00000000 00001000 c7d16f8f 04070598 c27b2540 c27b2540 c28b0000
> [    1.211870] 5ac0: d0825c94 c0dc7064 d0825af0 c204e030 d0825c94 c050b07c c27b2540 00000576
> [    1.220089] 5ae0: c28b0000 c04d40b8 00000000 c07ebbd0 00000000 00000000 d0825af8 d0825af8
> [    1.228308] 5b00: 00000000 c7d16f8f c28b0000 c117b6d0 00000000 c204e030 cfdaf3b8 c43f7080
> [    1.236527] 5b20: d0825b40 c04d47e0 d0825c94 c0dc7064 00000576 c2213cc0 0000f598 000005a6
> [    1.244745] 5b40: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    1.252963] 5b60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    1.261182] 5b80: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    1.269400] 5ba0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    1.277618] 5bc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    1.285837] 5be0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    1.294056] 5c00: c28b0000 c04c5e54 00000001 00000000 00000001 c289eb00 000009e4 20000000
> [    1.302275] 5c20: 00000000 000002b0 0000f598 000005a6 c204e000 c7d16f8f cfd5fec0 00000000
> [    1.310494] 5c40: 00000000 cfdaf3b8 00000000 00000000 c43f7080 c204e000 00001000 c04b58b4
> [    1.318713] 5c60: 00000000 d0825c94 00000001 c7d16f8f d0825d50 c7d16f8f 00040cc0 00000016
> [    1.326932] 5c80: c28b0000 00000000 00015600 c2068000 cfdaf3b8 00001000 000009e4 20000000
> [    1.335151] 5ca0: 00000001 c7d16f8f 0eced000 cfdaf3b8 c28b0000 00000000 c27fc0c0 c43f7080
> [    1.343370] 5cc0: 00000000 c43f7180 c27fc0c0 c04b60e4 00000000 ffffffff 00000000 c02a0430
> [    1.351590] 5ce0: 00000cc0 00000001 ffffc005 00000001 d0825d50 00000000 c2068000 c7d16f8f
> [    1.359809] 5d00: c43f7184 cfdaf3b8 00000000 c2068000 c27fc0c0 c43f7180 c2068000 c43f7180
> [    1.368028] 5d20: c27fc0c0 c029e91c 00000000 c02ae4d8 00000000 00000000 c2068000 c43f7180
> [    1.376247] 5d40: c27fc0c0 c7d16f8f d0825d50 d0825ef0 00000000 d0825e14 cfdaf3b8 c43f7180
> [    1.384466] 5d60: c2068000 c43f7180 c27fc0c0 c02a0c5c 0eced000 00000000 00000001 00000000
> [    1.392685] 5d80: c43f7190 00000000 00000100 c2068000 00000001 c2014800 c27fc0c0 c43f7180
> [    1.400904] 5da0: c27fc120 00000000 00000000 00000000 00000000 00000000 000001ff c7d16f8f
> [    1.409123] 5dc0: c2952fb8 00000000 d0825ed8 c43f7080 00000000 00000000 ffffffff ffffffff
> [    1.417342] 5de0: d0825ef0 c02a10f4 00000000 d0825ed8 c289f000 beffffd4 00050003 c43f7080
> [    1.425561] 5e00: cfdaf3dc c02d4c24 c43f7180 c27fc0c0 cfde4694 00000000 00000000 00000000
> [    1.433779] 5e20: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    1.441997] 5e40: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    1.450215] 5e60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    1.458433] 5e80: 00000000 00000000 00000000 00000000 00000000 c7d16f8f 00000000 00000000
> [    1.466653] 5ea0: c27fc0c0 d0825f48 00000100 00000000 00000000 00000006 c2864a58 c0329db8
> [    1.474871] 5ec0: 00000100 00000001 00000000 00050001 c2864a58 00000100 00000003 00000000
> [    1.483090] 5ee0: d0825ed0 00000100 00000001 00000000 c27fc0c0 00000000 00000000 00000000
> [    1.491308] 5f00: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 c7d16f8f
> [    1.499527] 5f20: 00000000 c2864a00 00000000 00000001 c2068000 c11ed360 00000000 c0332988
> [    1.507745] 5f40: 00000000 00000001 00000000 00000000 c2068000 c7d16f8f 00000000 c2864a00
> [    1.515964] 5f60: c20e0000 c1108094 00000000 00000000 00000000 00000000 00000000 c0333de0
> [    1.524183] 5f80: c11bd000 c0d8c568 00000000 00000000 00000000 c0101364 c11bd000 c0b40a68
> [    1.532401] 5fa0: 00000000 c0b40b4c 00000000 c010014c 00000000 00000000 00000000 00000000
> [    1.540620] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    1.548838] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
> [    1.557050] Call trace:
> [    1.557069]  scomp_acomp_comp_decomp from scomp_acomp_decompress+0x10/0x48
> [    1.566549]  scomp_acomp_decompress from ubifs_decompress_req+0xa8/0x148
> [    1.573313]  ubifs_decompress_req from ubifs_decompress_folio+0xdc/0x20c
> [    1.580065]  ubifs_decompress_folio from do_readpage+0x1e0/0x4b0
> [    1.586116]  do_readpage from ubifs_read_folio+0x4c/0x4d8
> [    1.591557]  ubifs_read_folio from filemap_read_folio+0x30/0x1fc
> [    1.597612]  filemap_read_folio from filemap_get_pages+0x534/0x8ac
> [    1.603841]  filemap_get_pages from filemap_read+0x120/0x504
> [    1.609546]  filemap_read from __kernel_read+0x164/0x2f4
> [    1.614907]  __kernel_read from bprm_execve+0x194/0x3f4
> [    1.620180]  bprm_execve from kernel_execve+0x114/0x19c
> [    1.625450]  kernel_execve from try_to_run_init_process+0xc/0x38
> [    1.631505]  try_to_run_init_process from kernel_init+0xe4/0x134
> [    1.637565]  kernel_init from ret_from_fork+0x14/0x28
> [    1.642663] Exception stack(0xd0825fb0 to 0xd0825ff8)
> [    1.647747] 5fa0:                                     00000000 00000000 00000000 00000000
> [    1.655966] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    1.664183] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [    1.670835] Code: e1a03623 e0833622 e026609c e003039c (e7963003)
> [    1.676964] ---[ end trace 0000000000000000 ]---
> [    1.681608] note: swapper/0[1] exited with irqs disabled
> [    1.681787] random: crng init done
> [    1.691090] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [    1.698805] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
> 

The issue is still present on current master, I did bisect it, the
regression is from commit 7e0969bae493 ("ubifs: Pass folios to acomp"),
reverting it on top of current master solves the issue.

How should we proceed?

Unless someone is able to look into that I gonna send a revert patch,
the regression is severe, the machine is not booting anymore.

Francesco


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
