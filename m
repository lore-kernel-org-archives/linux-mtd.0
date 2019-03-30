Return-Path: <SRS0=1krx=SB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF73C43381
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Mar 2019 16:38:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D254218E2
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Mar 2019 16:38:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fBhZIol+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="qz4/uVdp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D254218E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yandex.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:MIME-Version:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PBi4iL3JO+MhiBL8ry28qzmz5mYiER6KNM7MYvRKwWI=; b=fBhZIol+MF2YbY
	8tC3x11rsQQ1KCzwzteHe3FcLevyGqxZMK9XKB3r54BkAf/h7N8ifVVvoaXlsuyQDT88wLyg3A9fA
	YoZwMOQ7F33ZEhU8bV9O++HHgwfkdqz3c9aqqe5ZSyQbjCx75V63yRadQOoNStf/gt7ez5zpek0V0
	otrSZhrZa10/pHIo6T5WhzWOVHcIlse/e6oT+NP6zImZsODDFRZJElmSn97bFoJ48oXV4esaFWABj
	b432tKyjHPWIr1/6/5+EbRtVKYivVisOROADV3LC1DaW8Xglr8xbaAaxDRg07EJITChKv+tflGEDy
	g2zdRt9FSArZ6C9h1G4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAGze-0000xU-Ff; Sat, 30 Mar 2019 16:38:06 +0000
Received: from forward400j.mail.yandex.net ([2a02:6b8:0:801:2::105])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAGzZ-0000vG-Ux; Sat, 30 Mar 2019 16:38:04 +0000
Received: from mxback5g.mail.yandex.net (mxback5g.mail.yandex.net
 [IPv6:2a02:6b8:0:1472:2741:0:8b7:166])
 by forward400j.mail.yandex.net (Yandex) with ESMTP id 499076E0DD0;
 Sat, 30 Mar 2019 19:37:56 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxback5g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id xem8NZgUUA-bpb4xXgr; 
 Sat, 30 Mar 2019 19:37:55 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1553963875; bh=ua+pPFPSHTEeenSsWAP5SFeoYcFeBHynoZLbeXw8Fuk=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=qz4/uVdpJYJGQ7fhSdAPcsW3IemZkkBPGB1igVM/zPTxRJHMRbkwQvDto6n/ltbkh
 mLCq/0mbpf0VoG6kxlbaxpK6X71jwp15wZv8xXv8lmxWdunrw61PtACXGXTdlBBLYw
 F2zakY6RgjQayhCupNjQlrFmta3Cubx8Oj9ICWJ8=
Authentication-Results: mxback5g.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by sas1-b3ec53dbc12b.qloud-c.yandex.net with HTTP;
 Sat, 30 Mar 2019 19:37:41 +0300
From: Andrey Abramov <st5pub@yandex.ru>
To: vgupta@synopsys.com, benh@kernel.crashing.org, paulus@samba.org,
 mpe@ellerman.id.au, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 hpa@zytor.com, x86@kernel.org, mark@fasheh.com, jlbec@evilplan.org,
 richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 gregkh@linuxfoundation.org, naveen.n.rao@linux.vnet.ibm.com,
 jpoimboe@redhat.com, Dave Chinner <dchinner@redhat.com>,
 darrick.wong@oracle.com, ard.biesheuvel@linaro.org,
 George Spelvin <lkml@sdf.org>, linux-snps-arc@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, ocfs2-devel@oss.oracle.com,
 linux-mtd@lists.infradead.org, sfr@canb.auug.org.au
Subject: [PATCH 0/5] simple sort swap function usage improvements
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Sat, 30 Mar 2019 19:37:41 +0300
Message-Id: <18626931553963861@sas1-b3ec53dbc12b.qloud-c.yandex.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_093802_496119_784283D4 
X-CRM114-Status: UNSURE (   4.61  )
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
Cc: mhocko@suse.com, gustavo@embeddedor.com, peterz@infradead.org,
 amir73il@gmail.com, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 kamalesh@linux.vnet.ibm.com, piaojun@huawei.com, yamada.masahiro@socionext.com,
 jiang.biao2@zte.com.cn, jslaby@suse.cz, yuehaibing@huawei.com,
 rppt@linux.ibm.com, ge.changwei@h3c.com, keescook@chromium.org,
 jannh@google.com, ashish.samant@oracle.com, npiggin@gmail.com,
 jiangyiwen@huawei.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 lchen@suse.com, malat@debian.org, Morton Andrew <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is the logical continuation of sort improvements by George Spelvin
"lib/sort & lib/list_sort: faster and smaller" series
(added to the linux-next really recently).

Patches from 1 to 4 replace simple swap functions with the built-in
(which is now much faster) and grouped by subsystem (after that only
3 files implement custom swap - arch/x86/kernel/unwind_orc.c,
kernel/jump_label.c and lib/extable.c).

Patch #5 replaces the int type with the size_t type of the size argument
in the swap function.

Andrey Abramov (5):
  arch/arc: unwind.c: replace swap function with built-in one
  powerpc: module_[32|64].c: replace swap function with built-in one
  ocfs2: dir,refcounttree,xattr: replace swap functions with built-in
    one
  ubifs: find.c: replace swap function with built-in one
  Lib: sort.h: replace int size with size_t size in the swap function

 arch/arc/kernel/unwind.c        | 20 ++------------------
 arch/powerpc/kernel/module_32.c | 17 +----------------
 arch/powerpc/kernel/module_64.c | 17 +----------------
 arch/x86/kernel/unwind_orc.c    |  2 +-
 fs/ocfs2/dir.c                  | 13 +------------
 fs/ocfs2/refcounttree.c         | 13 +++----------
 fs/ocfs2/xattr.c                | 15 +++------------
 fs/ubifs/find.c                 |  9 +--------
 include/linux/sort.h            |  2 +-
 kernel/jump_label.c             |  2 +-
 lib/extable.c                   |  2 +-
 lib/sort.c                      |  6 +++---
 12 files changed, 19 insertions(+), 99 deletions(-)

-- 
2.21.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
