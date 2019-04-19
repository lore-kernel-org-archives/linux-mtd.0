Return-Path: <SRS0=SE3z=SV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09D2C282DA
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2019 15:45:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0356222CE
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2019 15:45:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TxqCoF5H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0356222CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8zbAmYgqfOCN5XOufp1smWjA1NACM7rtworHRnTcKmM=; b=TxqCoF5HNeVXCT
	AWTP65SNlS22BJfQcqPRUGj1nm8qcjaYEEUoIKz9F+W/M33yhk61C/p4lW7lBdPArxTohEYsPjPw6
	GvUhUKO/coOdqt28cZ3BdMhxNzjmXH67yenH3mQ1SMLaBV7r3BgNqNk+hsE0syME2d8qvPQeayKWk
	f5kSSLDxwYtdVzI84/JQLww+5qlj3pVIqxQiVwTiRJvplz7aRu9jbLKsqqtNgWdlf5RUvv0kzTnLS
	sKc2BHM4HPqZtP9HdOALdkjAdX9LXnICwCORJQugv+DQbxGtkHF7KSloIY+VmR6/Qwelk3xgK9ZBr
	HlxJyaEwZiSkCLUKvbig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHVi0-00082i-O9; Fri, 19 Apr 2019 15:45:48 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHVhx-00082E-37; Fri, 19 Apr 2019 15:45:46 +0000
Received: by mail-ot1-f68.google.com with SMTP id e5so4618295otk.12;
 Fri, 19 Apr 2019 08:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rgm+DlPYj4YwXD0IUlXbIhCkCaP4ItKaQlGxc47GSHs=;
 b=t7IoVcgMNLEcZtzZeJL3hLEqMpsjvwI3mqNoVQir8JVVl7rcM2Zh20xo2p/AmNTvlv
 zoPtI+YrrrNfOj1LmnbGO7/sO7wRcX7EnnrCGm5GyqKsgyK/Rx04tjYTruIRj6lD+Suz
 RRI5QQ5PQabF11t4wvmmJfl0jsbRVfgco2w1X37NIf6Wa9rzP0yNJd7swkp5WHI9MNO7
 lLNEhBkpcIKKFsjpWfD6KPBKakCKIpFIHkb4cvQnTbHwP1G73bzwr1PXcpulc+Nur31f
 +CbOXfzR8aDKVfovjK8drYon8u563XZlD/FwY7V2jfBJrdsolntrJxG9VOYw7vlojeAm
 EsaA==
X-Gm-Message-State: APjAAAXjq5vfZCDiY5RaBPGwtkmPWt8ihfE2X5dR4E107qubRPMfODkf
 TqwNj8Go2JnlHEAFLe/Tv2cumQ39P1zXbCxSJ+w=
X-Google-Smtp-Source: APXvYqyzS5bhws5CT7A5nXn4OpfeWT4dvhjZS6lwiZnWt+A2qa8xQlOemhAXzlKYNBL6JXPtGyLamsLnBS+1CfuvVbc=
X-Received: by 2002:a9d:7dda:: with SMTP id k26mr2666597otn.354.1555688742221; 
 Fri, 19 Apr 2019 08:45:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190419094754.24667-1-yamada.masahiro@socionext.com>
 <20190419094754.24667-7-yamada.masahiro@socionext.com>
In-Reply-To: <20190419094754.24667-7-yamada.masahiro@socionext.com>
From: Mathieu Malaterre <malat@debian.org>
Date: Fri, 19 Apr 2019 17:45:31 +0200
Message-ID: <CA+7wUsygTo=AN_giku_X6_a4mQWdJL48RoVbVB4hBqkZSKkP0Q@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] MIPS: mark __fls() as __always_inline
To: Masahiro Yamada <yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190419_084545_139782_93CECEFF 
X-CRM114-Status: GOOD (  15.77  )
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
 LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Fri, Apr 19, 2019 at 12:06 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> This prepares to move CONFIG_OPTIMIZE_INLINING from x86 to a common
> place. We need to eliminate potential issues beforehand.
>
> If it is enabled for mips, the following errors are reported:
>
> arch/mips/mm/sc-mips.o: In function `mips_sc_prefetch_enable.part.2':
> sc-mips.c:(.text+0x98): undefined reference to `mips_gcr_base'
> sc-mips.c:(.text+0x9c): undefined reference to `mips_gcr_base'
> sc-mips.c:(.text+0xbc): undefined reference to `mips_gcr_base'
> sc-mips.c:(.text+0xc8): undefined reference to `mips_gcr_base'
> sc-mips.c:(.text+0xdc): undefined reference to `mips_gcr_base'
> arch/mips/mm/sc-mips.o:sc-mips.c:(.text.unlikely+0x44): more undefined references to `mips_gcr_base'

Tested with success on ppc32/G4. But on CI20 (ci20_defconfig from
master), I get:

  MODPOST vmlinux.o
mipsel-linux-gnu-ld: arch/mips/kernel/traps.o: in function
`addr_gcr_err_control':
/home/mathieu/tmp/linux/linux/ci20/../arch/mips/include/asm/mips-cm.h:169:
undefined reference to `mips_gcr_base'
mipsel-linux-gnu-ld:
/home/mathieu/linux/linux/ci20/../arch/mips/include/asm/mips-cm.h:169:
undefined reference to `mips_gcr_base'
mipsel-linux-gnu-ld: arch/mips/mm/sc-mips.o: in function
`addr_gcr_l2_pft_control':
/home/mathieu/linux/linux/ci20/../arch/mips/include/asm/mips-cm.h:246:
undefined reference to `mips_gcr_base'
mipsel-linux-gnu-ld:
/home/mathieu/linux/linux/ci20/../arch/mips/include/asm/mips-cm.h:246:
undefined reference to `mips_gcr_base'
mipsel-linux-gnu-ld:
/home/mathieu/linux/linux/ci20/../arch/mips/include/asm/mips-cm.h:246:
undefined reference to `mips_gcr_base'
mipsel-linux-gnu-ld:
arch/mips/mm/sc-mips.o:/home/mathieu/linux/linux/ci20/../arch/mips/include/asm/mips-cm.h:246:
more undefined references to `mips_gcr_base' follow


> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Changes in v2:
>   - new patch
>
>  arch/mips/include/asm/bitops.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.h
> index 830c93a010c3..6a26ead1c2b6 100644
> --- a/arch/mips/include/asm/bitops.h
> +++ b/arch/mips/include/asm/bitops.h
> @@ -482,7 +482,7 @@ static inline void __clear_bit_unlock(unsigned long nr, volatile unsigned long *
>   * Return the bit position (0..63) of the most significant 1 bit in a word
>   * Returns -1 if no 1 bit exists
>   */
> -static inline unsigned long __fls(unsigned long word)
> +static __always_inline unsigned long __fls(unsigned long word)
>  {
>         int num;
>
> --
> 2.17.1
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
