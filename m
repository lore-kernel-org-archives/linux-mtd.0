Return-Path: <SRS0=GuhJ=7W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A158BC433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2020 05:58:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 718E5207F9
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2020 05:58:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UPaZHKIE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 718E5207F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	Subject:From:To:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=TO9eXO+Yxq+JtJwEyPzMjv1jyEQi1EGYjqUr/aAZrxg=; b=UPa
	ZHKIE1oSWwG4XPkL4RX+JiPYtu6RXKG5BPx/BdjYZHfnogp8Kfh/yLv49v8EZRp5eeADpC91By2ns
	CS14tb2Br8J2EVwgGMC61vnSwXMbEcYTnYLmK7wZy6juN2/GVjTvlIT08F2tMEdC9V40aciud0FC/
	gJoaC2u9V4Rrn0sfjNrUxWONvTkAh3kW1aWAFajPNzQiczwfp/wMJMO79k7pKALqWSZJCiwN72R8l
	Lkh5IrtXuCSZLpTklTNnc2ClBeIr3Kxuw7wPIW9h6qI7L0svY/lsFDgwj2ZLS7n5EgwmavXWCjsZw
	LjVx4jwt8m0krf18XuBsDpPRKodGcKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiXHU-0001EP-Fj; Tue, 09 Jun 2020 05:58:40 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1] helo=ozlabs.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiXHM-0001DR-P3; Tue, 09 Jun 2020 05:58:36 +0000
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzvB1bJMz9sSy; Tue,  9 Jun 2020 15:58:30 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: bac7ca7b985b72873bd4ac2553b13b5af5b1f08a
In-Reply-To: <994931554238042@iva8-b333b7f98ab0.qloud-c.yandex.net>
To: Andrey Abramov <st5pub@yandex.ru>, vgupta <vgupta@synopsys.com>,
 benh <benh@kernel.crashing.org>, paulus <paulus@samba.org>,
 tglx <tglx@linutronix.de>, mingo <mingo@redhat.com>, bp <bp@alien8.de>,
 hpa <hpa@zytor.com>, x86 <x86@kernel.org>, mark <mark@fasheh.com>,
 jlbec <jlbec@evilplan.org>, richard <richard@nod.at>,
 dedekind1 <dedekind1@gmail.com>, adrian.hunter <adrian.hunter@intel.com>,
 gregkh <gregkh@linuxfoundation.org>,
 naveen.n.rao <naveen.n.rao@linux.vnet.ibm.com>, jpoimboe <jpoimboe@redhat.com>,
 Dave Chinner <dchinner@redhat.com>, darrick.wong <darrick.wong@oracle.com>,
 ard.biesheuvel <ard.biesheuvel@linaro.org>, George Spelvin <lkml@sdf.org>,
 linux-snps-arc <linux-snps-arc@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 ocfs2-devel <ocfs2-devel@oss.oracle.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, sfr <sfr@canb.auug.org.au>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v3 2/5] powerpc: module_[32|64].c: replace swap function
 with built-in one
Message-Id: <49gzvB1bJMz9sSy@ozlabs.org>
Date: Tue,  9 Jun 2020 15:58:30 +1000 (AEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_225832_974026_A402C56C 
X-CRM114-Status: UNSURE (   4.46  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: malat <malat@debian.org>, "yamada.masahiro" <yamada.masahiro@socionext.com>,
 npiggin <npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2019-04-02 at 20:47:22 UTC, Andrey Abramov wrote:
> Replace relaswap with built-in one, because relaswap
> does a simple byte to byte swap.
> 
> Since Spectre mitigations have made indirect function calls more
> expensive, and the default simple byte copies swap is implemented
> without them, an "optimized" custom swap function is now
> a waste of time as well as code.
> 
> Signed-off-by: Andrey Abramov <st5pub@yandex.ru>
> Reviewed by: George Spelvin <lkml@sdf.org>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/bac7ca7b985b72873bd4ac2553b13b5af5b1f08a

cheers

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
