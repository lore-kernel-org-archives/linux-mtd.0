Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56134C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 11:08:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2768E20870
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 11:08:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nC4YzwiH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2768E20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6kv19+YQrLnDecI23sFp5aOZObSnnioW4209HUojFc=; b=nC4YzwiHWk1auf
	o40wr/KmHatUv4B7OGCA+oIpkiq3jJiFjsIP+LuiMpNIR4BCjWK9ebITo7fl92+uPuO1iF2VXYWM1
	T7xHMHGl1y67w2e8AeNqU9hrEpDo9whBzJ0uixngOpmOjMEu+zQTlnrIQxq9ViCYywq43RRwpPqOF
	gUONOVe4oBLXmnZcVPnaJOVzgcmz69qQj/eYTr3PxI7uOnJDN8qFsWEARqx2eFZjSZoRVgmp1XnoR
	FMhhrJ08DXeZazSQyP5xTyQ4WbTK/1LCc6nWoFdboiV1vwvh+KaYkgQbbmic73XmJF3GNaMlLBKMO
	fbDdGR+E4QELk8rwKurg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAuo2-0002gJ-5r; Mon, 01 Apr 2019 11:08:46 +0000
Received: from ozlabs.org ([2401:3900:2:1::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAunx-0002fG-KD; Mon, 01 Apr 2019 11:08:45 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44XqMj2fSxz9sQr;
 Mon,  1 Apr 2019 22:08:31 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrey Abramov <st5pub@yandex.ru>, vgupta <vgupta@synopsys.com>,
 benh <benh@kernel.crashing.org>, paulus <paulus@samba.org>,
 tglx <tglx@linutronix.de>, mingo <mingo@redhat.com>, bp <bp@alien8.de>,
 hpa <hpa@zytor.com>, x86 <x86@kernel.org>, mark <mark@fasheh.com>,
 jlbec <jlbec@evilplan.org>, richard <richard@nod.at>,
 dedekind1 <dedekind1@gmail.com>, "adrian.hunter" <adrian.hunter@intel.com>,
 gregkh <gregkh@linuxfoundation.org>,
 "naveen.n.rao" <naveen.n.rao@linux.vnet.ibm.com>,
 jpoimboe <jpoimboe@redhat.com>, Dave Chinner <dchinner@redhat.com>,
 "darrick.wong" <darrick.wong@oracle.com>,
 "ard.biesheuvel" <ard.biesheuvel@linaro.org>, George Spelvin <lkml@sdf.org>,
 linux-snps-arc <linux-snps-arc@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 ocfs2-devel <ocfs2-devel@oss.oracle.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, sfr <sfr@canb.auug.org.au>
Subject: Re: [PATCH v2 2/5] powerpc: module_[32|64].c: replace swap function
 with built-in one
In-Reply-To: <14019281554057359@sas1-87f9feb8d943.qloud-c.yandex.net>
References: <19606671554056883@myt3-1179f584969c.qloud-c.yandex.net>
 <14019281554057359@sas1-87f9feb8d943.qloud-c.yandex.net>
Date: Mon, 01 Apr 2019 22:08:30 +1100
Message-ID: <87v9zyoudt.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_040841_906263_71642859 
X-CRM114-Status: UNSURE (   6.10  )
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
Cc: malat <malat@debian.org>, "yamada.masahiro" <yamada.masahiro@socionext.com>,
 npiggin <npiggin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Andrey Abramov <st5pub@yandex.ru> writes:
> Replace relaswap with built-in one, because relaswap
> does a simple byte to byte swap.

I replied to v1 with an ack, which stands, this is just a clarification.

> Since Spectre mitigations have made indirect function calls more
> expensive, and the default simple byte copies swap is implemented
> without them, an "optimized" custom swap function is now
> a waste of time as well as code.

Spectre mitigations don't necessarily slow down indirect function calls
on all arches or in all configurations on all arches, so that
justification is a bit dubious.

That's not really a problem for this patch, because the existing
overhead of the function call is probably already enough to rival the
cost of the 24 byte copy.

cheers

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
