Return-Path: <SRS0=PPpL=24=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A737C33C99
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jan 2020 06:30:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C0A42077B
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jan 2020 06:30:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="exFtq4r2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="PUtkQKRh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C0A42077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGkHmgi2beKOi1DGtxGq+3AOW2fmuY+lezbinj9M3IY=; b=exFtq4r2fAWGkC
	FiReo9IRCN2mmuwNWE4mP9t6w475/OVhp9EZ9BKA6o8FB616NffAHewTZIh9XHnh6t/Xqk68Kj1Oa
	oYRi0ouH+/n8uq+VXG3wf6HMz4c3UyxSBmDW/bysms5ssgqesDqkRE/4AKWZWABfDTtOfGxl2bRix
	cmTyWHImphUI4lnNrR5YxYV49GMDBAMA3131EBU7XTFcwU2C3V7UW54UzpKMBa10PoXv44AGLPidZ
	D+/sCvlPdBNHz2j06duhrjyBq0ebfCK8wrAT2vtWZT3VC+1A7IiJNLbkxJ35c7/5E5GSZrj5AZPfW
	Aqr/au2C+oHBbCemE0Gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioiNH-0006af-95; Tue, 07 Jan 2020 06:29:55 +0000
Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioiN9-0006UH-HW; Tue, 07 Jan 2020 06:29:49 +0000
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id 0076TAxn007306;
 Tue, 7 Jan 2020 15:29:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 0076TAxn007306
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1578378551;
 bh=V4OXT4Fpyi9+NOlQeIWNoTFry/VXFE9skkoLr0JmobU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PUtkQKRh/fLDhr7OyI2jsy3dRzrVKjGRsJD26kFb8Yi5DYb3ZzVIj9aI89P3bCxO2
 kcx+0mSsXbAq4C2G/aOvNTObJyA3sA7ZRSemwGljOlIhcw4yni6N1g0mkghKwLkTff
 PCvpPysq86Ay4TJqu/B05j3eWpmSKVpUV3flWj7fJbDYzYBRe9GDCcNj/9ZPgS6WVy
 mBpxYB8cwCaNXyhhFYC562rrdIJWQJ4ftIQllFGlOQDej1RK7yQoEXLAEkU4cuevXA
 FSB3dvO2xXez30a7IBaDz3GjYj6T2nLHidaWCSDoGt0mX8w317v0yQ6iasfpegGulk
 qbQdyYxrLIKew==
X-Nifty-SrcIP: [209.85.222.45]
Received: by mail-ua1-f45.google.com with SMTP id 73so18078389uac.6;
 Mon, 06 Jan 2020 22:29:10 -0800 (PST)
X-Gm-Message-State: APjAAAUDGlYQ/zFbh9ejSNx23bVxKAihHa5Ytx8SLZZltq5UGceTe50w
 JEDYTPlD98B3pXuZU1CEB8VwdVgMHc5lKZ3zEcA=
X-Google-Smtp-Source: APXvYqypZNoHbzfj+w5gFDA3N15SQKWwFjdrHnOhN5aGCU+FKq8xDDltKeTcAoYEWk93oUB5yZ92m3AGy2jJt8IgSdk=
X-Received: by 2002:ab0:2ea6:: with SMTP id y6mr41352359uay.25.1578378549666; 
 Mon, 06 Jan 2020 22:29:09 -0800 (PST)
MIME-Version: 1.0
References: <20200106045833.1725-1-masahiroy@kernel.org>
 <20200107051521.GF705@sol.localdomain>
In-Reply-To: <20200107051521.GF705@sol.localdomain>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 7 Jan 2020 15:28:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNATbLESJ6CdPSN8bdpt7+4iOKW2L3c4OZaz2sLzqJH6BTw@mail.gmail.com>
Message-ID: <CAK7LNATbLESJ6CdPSN8bdpt7+4iOKW2L3c4OZaz2sLzqJH6BTw@mail.gmail.com>
Subject: Re: [PATCH] treewide: remove redundent IS_ERR() before error code
 check
To: Eric Biggers <ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200106_222947_804104_6B11C7A4 
X-CRM114-Status: GOOD (  12.85  )
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
Cc: DTML <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Julia Lawall <julia.lawall@lip6.fr>, linux-mtd <linux-mtd@lists.infradead.org>,
 linux-crypto@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jan 7, 2020 at 2:15 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Mon, Jan 06, 2020 at 01:58:33PM +0900, Masahiro Yamada wrote:
> > 'PTR_ERR(p) == -E*' is a stronger condition than IS_ERR(p).
> > Hence, IS_ERR(p) is unneeded.
> >
> > The semantic patch that generates this commit is as follows:
> >
> > // <smpl>
> > @@
> > expression ptr;
> > constant error_code;
> > @@
> > -IS_ERR(ptr) && (PTR_ERR(ptr) == - error_code)
> > +PTR_ERR(ptr) == - error_code
> > // </smpl>
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Any reason for not doing instead:
>
>         ptr == ERR_PTR(-error_code)
>
> ?

Because there is no reason to change

        PTR_ERR(ptr) == -error_code
to
        ptr == ERR_PTR(-error_code)



     if (PTR_ERR(ptr) == -error_code)
style seems to be used more often.

But, I think it is just a matter of preference after all.
Both work equally fine.



>  To me it seems weird to use PTR_ERR() on non-error pointers.  I even had to
> double check that it returns a 'long' and not an 'int'.  (If it returned an
> 'int', it wouldn't work...)
>
> - Eric



-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
