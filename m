Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4459C10F0E
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 13:21:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71E58217D7
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 13:21:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gLK8Qfdo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBVI3mxB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71E58217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nfkcPWj8C78dvsMK8kblkzpZAc38iFGMMv0py9S3TuA=; b=gLK8QfdoSlJGJv
	sacXervU9Q+TINxKffsnULgz3Do7InuLnoc5GDxpfcVP5jBlmC26XHkvyOUz5qH7aoRjSmPFyIEQ9
	tfETv4fn/whbUmpL4mgsrFMX322hc3nbzVIPEXuJiqS95H5Avf8iYvfNyKYnkhMj7E7TlYCqW9NXv
	oedbiXVutV7rxk+9cpaYks2QbUcaNGaHW02c/PQp0l3Ln5usIExN8FS/OxtXuVSlDG7LRK2gjg+KZ
	UCGmRhz14d3ut/R4/BPfdDMhR0P9htVQc+6GessFz+isXab+xkx5D6ydo6WwDk70e0nkjEtbrynfT
	CwkQLKMlzURGWDsNPqPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH6yK-0008Ov-5R; Thu, 18 Apr 2019 13:21:00 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH6yC-0008Hc-0k; Thu, 18 Apr 2019 13:20:53 +0000
Received: by mail-wr1-x444.google.com with SMTP id w18so2928667wrv.11;
 Thu, 18 Apr 2019 06:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XQCHoAAFT5Z9bDRSYOBbJEBinvShFFVBSkUMOBYi/Tc=;
 b=OBVI3mxBq7hJJ7GMq63UZAs5eDSNSQHVMQhmsRcAzOUlEvQybBl1shmYvk0PdKKK5/
 0AT3aJ9peUWu6DDE2+uo/dmc7PEUAwXzlwkLRi6iJQAHlOzIPupYPzVxLR6BgJ1aoE8/
 PaA7Uf6uU6WdoZEbRyIT6Bl8wnNCRk7UlthLWf1af5Bs/hdbglOXeyfrugNoRNZbu+ve
 K6oedra3Ss9p/ADCD3fv4vNKJ1x2sNjXk8UGfrCFuaZT7pQkl/USfphp6YQaSoQn1qZZ
 OJjlYQjkhJvXBlSdRxhmEm7YT/CUd/7rFK/KQcjGeGoFbZTeIJoWsQ6fLUy7H1fnUd8s
 b6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=XQCHoAAFT5Z9bDRSYOBbJEBinvShFFVBSkUMOBYi/Tc=;
 b=YGvf07ikmlKC7GQ2rYlx2E3q6PIVAqLDhOcyEwJlHls1Dd/FfOzeQRiZT3oQZspce+
 edTjvlJ3Od0nGiOjWRzrL44x8w9Bd6kMUHkHg9N3fA9uL92kH88z62F8vam2Qga5i9CZ
 iV10CYyh5sqWM0QWjPEu7OZFQs1USq3TCNpZP/AgRD7PH33Z4mKpnPyPN8hk0zq8+zO3
 wMbGu0WFxlmXTfFWQRs/NnXiaj1j36XYUdXbFVDp+oVIl97V70qKO9adk6GgKKr1DGxe
 Y+EZv0rFqMjSSBDF+ZkRpdYBaRKkfynIap8/ux3HdKDYzlkMPaynHPBacdtzKXW+qqCS
 Ermg==
X-Gm-Message-State: APjAAAX0bDh7KDi+anie+1tMbg/SECyH2UiOz85vr9rcRfmBLRAhndAm
 eLzZpg+a5gR5kohrZ+aPn1S7g3qg
X-Google-Smtp-Source: APXvYqzJ/ySJ+z0VjPKhlTQyMQFU1iuU9BCAPDw4iU0TqindWFDaAlZ0lD4Q/VA3V2aWhbWS1mn+aA==
X-Received: by 2002:a05:6000:1111:: with SMTP id
 z17mr282634wrw.103.1555593650693; 
 Thu, 18 Apr 2019 06:20:50 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
 by smtp.gmail.com with ESMTPSA id r18sm3417736wme.18.2019.04.18.06.20.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 18 Apr 2019 06:20:49 -0700 (PDT)
Date: Thu, 18 Apr 2019 15:20:47 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] compiler: allow all arches to enable
 CONFIG_OPTIMIZE_INLINING
Message-ID: <20190418132047.GA21430@gmail.com>
References: <1553062828-27798-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1553062828-27798-1-git-send-email-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_062052_057249_28757C7C 
X-CRM114-Status: GOOD (  13.83  )
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
 Dave Hansen <dave@sr71.net>, Arnd Bergmann <arnd@arndb.de>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Ingo Molnar <mingo@redhat.com>,
 linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


* Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Commit 60a3cdd06394 ("x86: add optimized inlining") introduced
> CONFIG_OPTIMIZE_INLINING, but it has been available only for x86.
> 
> The idea is obviously arch-agnostic although we need some code fixups.
> This commit moves the config entry from arch/x86/Kconfig.debug to
> lib/Kconfig.debug so that all architectures (except MIPS for now) can
> benefit from it.
> 
> At this moment, I added "depends on !MIPS" because fixing 0day bot reports
> for MIPS was complex to me.
> 
> I tested this patch on my arm/arm64 boards.
> 
> This can make a huge difference in kernel image size especially when
> CONFIG_OPTIMIZE_FOR_SIZE is enabled.
> 
> For example, I got 3.5% smaller arm64 kernel image for v5.1-rc1.
> 
>   dec       file
>   18983424  arch/arm64/boot/Image.before
>   18321920  arch/arm64/boot/Image.after
> 
> This also slightly improves the "Kernel hacking" Kconfig menu.
> Commit e61aca5158a8 ("Merge branch 'kconfig-diet' from Dave Hansen')
> mentioned this config option would be a good fit in the "compiler option"
> menu. I did so.

No objections against moving it from x86 code to generic code.

Thanks,

	Ingo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
