Return-Path: <SRS0=1krx=SB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8033DC43381
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Mar 2019 18:38:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 510CA218A3
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Mar 2019 18:38:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mKvytEtw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8zL3K/6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 510CA218A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1C14becanbyOVyr+f9kxyYmKNs4A+cuMNBTVxo7zKw=; b=mKvytEtwjoYwrw
	2UmZem5Se+68tn4hTDJ3GWC56nF3z3Q1C1vsuQnt6ffPdgCE/f2pzssQ40ljUFCN7ziZA65OzrDKC
	o+M4M3UewkbQl0jgC7g7U1VYkY385lSB5tmZc+iE84GPLPAJbp5DsVbqlV9CxKl6g5jV2miXtSsKK
	il6xn/GfzOIQDFk2z+frzXkGHI24MkVTGufVG2P/p9zrlyXX44plv03MRO30pXHHmlKLNGABMgX4Y
	ovcBfd+3lQFG8qzI3ruceE5gpM8fTnIW6quiA840E/fEl8uE2pw22SAeNF9nAjn2QegvFHWsu408c
	DsvwrGrnsUFzGHJy2T5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAIsI-0007xG-NQ; Sat, 30 Mar 2019 18:38:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAIsF-0007wp-Ey; Sat, 30 Mar 2019 18:38:36 +0000
Received: from localhost (unknown [62.119.166.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3EBD02082C;
 Sat, 30 Mar 2019 18:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1553971113;
 bh=vM5XqOYIzrKLgI9QaO+v6rMuxnWCOX6vb912khkZumM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z8zL3K/6e1BCa/IS41rGnV9LgxCrji6MJAcOVtk1N4vYWpj0Ifi8Lws/EroR3Q1xA
 l2XvbbLc5Vm/jEVDNA9G4RNBLRp9lRR7HVuW8OJLQRiUGHMYi5hUIr0TYRwaZLD476
 jLL7zA+oC+JldczlxlZqN7m3X6HFSO8n95MM8Lak=
Date: Sat, 30 Mar 2019 19:38:26 +0100
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Andrey Abramov <st5pub@yandex.ru>
Subject: Re: [PATCH 5/5] Lib: sort.h: replace int size with size_t size in
 the swap function
Message-ID: <20190330183826.GB21828@kroah.com>
References: <18626931553963861@sas1-b3ec53dbc12b.qloud-c.yandex.net>
 <20467491553964233@myt4-c0b480c282c8.qloud-c.yandex.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20467491553964233@myt4-c0b480c282c8.qloud-c.yandex.net>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_113835_521420_CDD7E05D 
X-CRM114-Status: UNSURE (   6.85  )
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
Cc: "mhocko@suse.com" <mhocko@suse.com>,
 "gustavo@embeddedor.com" <gustavo@embeddedor.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 Dave Chinner <dchinner@redhat.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "piaojun@huawei.com" <piaojun@huawei.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "paulus@samba.org" <paulus@samba.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "jiang.biao2@zte.com.cn" <jiang.biao2@zte.com.cn>,
 "jslaby@suse.cz" <jslaby@suse.cz>,
 "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "darrick.wong@oracle.com" <darrick.wong@oracle.com>,
 "richard@nod.at" <richard@nod.at>, "mark@fasheh.com" <mark@fasheh.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "yuehaibing@huawei.com" <yuehaibing@huawei.com>,
 "lchen@suse.com" <lchen@suse.com>, "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "ge.changwei@h3c.com" <ge.changwei@h3c.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "kamalesh@linux.vnet.ibm.com" <kamalesh@linux.vnet.ibm.com>,
 "amir73il@gmail.com" <amir73il@gmail.com>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "jannh@google.com" <jannh@google.com>,
 "ashish.samant@oracle.com" <ashish.samant@oracle.com>,
 "npiggin@gmail.com" <npiggin@gmail.com>,
 "jiangyiwen@huawei.com" <jiangyiwen@huawei.com>, "bp@alien8.de" <bp@alien8.de>,
 "jlbec@evilplan.org" <jlbec@evilplan.org>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 George Spelvin <lkml@sdf.org>, "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "malat@debian.org" <malat@debian.org>,
 "vgupta@synopsys.com" <vgupta@synopsys.com>,
 "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Morton Andrew <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Mar 30, 2019 at 07:43:53PM +0300, Andrey Abramov wrote:
> Replace int type with size_t type of the size argument
> in the swap function, also affect all its dependencies.

This says _what_ the patch does, but it gives no clue as to _why_ you
are doing this.  Neither did your 0/5 patch :(

Why make this change?  Nothing afterward depends on it from what I can
tell, so why is it needed?

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
