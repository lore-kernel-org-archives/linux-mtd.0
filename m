Return-Path: <SRS0=axHB=SY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374ACC282CE
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Apr 2019 10:14:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08B7720874
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Apr 2019 10:14:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B1dzeuEB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="sWma/h1F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08B7720874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OxRp1J+egw40A9JF440RkQkccI7CikU8IVmCNccMhuU=; b=B1dzeuEBJpQcFW
	jGDPWoOEwCfBnXXX8rCkcZL6MqJKvmWyHVl6KgVZ+cEbobsXgXeUqD1extXCY6M43YCqm7n89Anb3
	4Sgy6bmnDVP7u2RSaDVPEvK9cyKI+fA9KpqZS7ggAPFSj8McX1srEmX+ajzBCIEj384UkYpjfexRX
	YhYJKOfM5zpykqItkneW352P9EmnCLUQbtji5zWeBO1yypGpaI1g5EjGS/5SliQ9v/cvYNoh4g3mD
	1W6qD5wvVCBatSKoXYtJj51CgrGsU8d8EVZvU8Yzgl0lMEQrfoL1Dn8l683YJyEqKhFwTge90RSHK
	IJxrm/pIyqmucLiYVr/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIVyM-0004uq-S1; Mon, 22 Apr 2019 10:14:50 +0000
Received: from mail.skyhub.de ([2a01:4f8:190:11c2::b:1457])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIVyC-0004nI-La; Mon, 22 Apr 2019 10:14:42 +0000
Received: from zn.tnic (p200300EC2F07AE00CC11E6C5A9980264.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f07:ae00:cc11:e6c5:a998:264])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1EAA81EC082D;
 Mon, 22 Apr 2019 12:14:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1555928067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=sz3E4pgdldPIX/SlGCWVkujUtXQ0huwXgSgApTywR/Y=;
 b=sWma/h1F7e6UVTopq1w9LG7G7cMAoJT6cxRkYHGw5ZeuYoWcR9kGCDOMy+Tr9msUZrPVG7
 Vt5CfoFUZ0DRtijdvo/zaa4UO/AJpqKXbGr/zO1vduQxWjlxU0EhyVukdEEPoCe8QyUhO5
 goRUd3FSGJHbd34nC/yvDhfNBJAZq14=
Date: Mon, 22 Apr 2019 12:14:20 +0200
From: Borislav Petkov <bp@alien8.de>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2 11/11] compiler: allow all arches to enable
 CONFIG_OPTIMIZE_INLINING
Message-ID: <20190422101420.GA21457@zn.tnic>
References: <20190419094754.24667-1-yamada.masahiro@socionext.com>
 <20190419094754.24667-12-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190419094754.24667-12-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_031440_866891_CC4B726B 
X-CRM114-Status: GOOD (  14.58  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-mtd@lists.infradead.org, Christophe Leroy <christophe.leroy@c-s.fr>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Apr 19, 2019 at 06:47:54PM +0900, Masahiro Yamada wrote:
> Commit 60a3cdd06394 ("x86: add optimized inlining") introduced
> CONFIG_OPTIMIZE_INLINING, but it has been available only for x86.
> 
> The idea is obviously arch-agnostic. This commit moves the config
> entry from arch/x86/Kconfig.debug to lib/Kconfig.debug so that all
> architectures can benefit from it.
> 
> This can make a huge difference in kernel image size especially when
> CONFIG_OPTIMIZE_FOR_SIZE is enabled.
> 
> For example, I got 3.5% smaller arm64 kernel for v5.1-rc1.
> 
>   dec       file
>   18983424  arch/arm64/boot/Image.before
>   18321920  arch/arm64/boot/Image.after
> 
> This also slightly improves the "Kernel hacking" Kconfig menu as
> e61aca5158a8 ("Merge branch 'kconfig-diet' from Dave Hansen') suggested;
> this config option would be a good fit in the "compiler option" menu.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v2:
>   - split into a separate patch
> 
>  arch/x86/Kconfig               |  3 ---
>  arch/x86/Kconfig.debug         | 14 --------------
>  include/linux/compiler_types.h |  3 +--
>  lib/Kconfig.debug              | 14 ++++++++++++++
>  4 files changed, 15 insertions(+), 19 deletions(-)

Acked-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
