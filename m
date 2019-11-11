Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14513C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 10:11:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6C7B21925
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 10:11:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FHim/quE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6C7B21925
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YiZCwt9b1GQrfy/SRNXIuSpO8uetsQzpJg49eXHxkxg=; b=FHim/quEQELhIm
	5I+POEX18qYg1CLyJV7S/ge/brdU8ceUNV9SMKxQovuZTOfzMz8GFi1Ld6hH/vwSzB4dYmZZFku9b
	2D/C9I7vQK1AI6Zqh+HZE0yqXxmqnpFK/31WmaFxNqaT1OdUeiDk4ayLmvR3oFydjuWLMxpYiD7GX
	N9eDkR4YLyui84R71Q6z6cKA+Zavm82JQ9+4v/zy5Gy9hkoc2NVPKVIb7LIbip91DsKS0NvSVjI8C
	o+GonW/kVSkWtht7e5jOLjvxbh0m8oubHsF8aXHAr9u6Sx1BJC1+eFuLNxuQBoJ2f/fGAEvGJoNdN
	P2O8WUK1Mzjs1F589Ukg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU6fO-0005WH-3L; Mon, 11 Nov 2019 10:11:26 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU6fI-0005TJ-E1; Mon, 11 Nov 2019 10:11:21 +0000
Received: from mail-qv1-f44.google.com ([209.85.219.44]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MVrXh-1iMAZE1CPl-00Rp8i; Mon, 11 Nov 2019 11:11:17 +0100
Received: by mail-qv1-f44.google.com with SMTP id x14so4639521qvu.0;
 Mon, 11 Nov 2019 02:11:16 -0800 (PST)
X-Gm-Message-State: APjAAAVmdCrLJpajd9I/R2B+6Y8eRW+QvnMUFrtmGFL7eO6xlU8yhCMq
 tBYN63EhMi6ihjsSj3+QKn7Zyg6v6DNwE3lciqk=
X-Google-Smtp-Source: APXvYqyPlYZ0IqFyt+F/Kw+2cGPdhPemO7nTBHjMV2hNTSSGSuWp0EuM7jgO4bHxqVV9VdMKLREBG37EpIWZ8cUBhPs=
X-Received: by 2002:a05:6214:2c2:: with SMTP id
 g2mr4941532qvu.210.1573467075908; 
 Mon, 11 Nov 2019 02:11:15 -0800 (PST)
MIME-Version: 1.0
References: <20191029064834.23438-1-hch@lst.de>
 <20191029064834.23438-18-hch@lst.de>
In-Reply-To: <20191029064834.23438-18-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 Nov 2019 11:10:59 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0zfmup8DYQQnT3GNCkgcv9cWxejj2QAr+FmYWs46ZuHQ@mail.gmail.com>
Message-ID: <CAK8P3a0zfmup8DYQQnT3GNCkgcv9cWxejj2QAr+FmYWs46ZuHQ@mail.gmail.com>
Subject: Re: [PATCH 17/21] lib: provide a simple generic ioremap implementation
To: Christoph Hellwig <hch@lst.de>
X-Provags-ID: V03:K1:ByRBg0qTUoED5t/7wEr819rdCDHJtByTBUe1tntgCKGW8jzGtuO
 arDiyykTCJjK4pSF0o4Hb01EYqK7ErXN6exIV5AkcT0OZB7ha3S1XS7SGS1w0tFgiIWhiVQ
 8/mPhhd/qr+G1EGMpNzwIANX6cy1PbjxgVremdzDTAP3oBq3mjK2DB0GNZHM2ohBYYXXS7K
 6d4DQ5ulF3FkyJW5hfvqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4DlXVzwhzRE=:Kl2ap7rgV+rWTxfHIRu26V
 qDnOr8A3il8uOWIHstLxfahsl4GxhU95J2zOiOsb/lMSCuFAIwwUsihIAEumhHPkN+IyYHTJF
 O/NWhAgZIv40+lFIHTadQbkfiNT2SAl/kscRPXpFdIriO/STamto8Zx19iRQDlsGsrRFXOKJ/
 I7GjcyJnnT4bB1QsDx1Dy6G2PryNb8DdGZTDquOGiXZfJhlI+EM7CZdiBqrixOoUpBgpqlB5/
 T3hI5Lhg2+thju6ieXO2OvrueeWhpw1lIZJ8xc4P5J4KX28RfPZCPsMa854KPjLPfEQ/fzRIM
 4VXDXg45HliwBhBFDGMMdAnFj3lC9mYB1BPjaFPltMpmdZeBpLnKivT+ewQYb7W3T2Uvj3eku
 SmvLiYLBmEnLEnPOFh89SMGVf9qR0gLHzcEjqiyrLVaoGfHNLrpGN/Vhjz77xEtNwdErQe3Jf
 rF7rbDlGAX7t2KTq4egyod3W89qviCUcND87bFZ1zHfrr/Wc3eMfQfPYk/PS73rA+lhXV8CRE
 sJdYaqAtBdKfP2ds/gnl1VrKNwQpdGHvMcm8/Mw0CDZPsici2OuvGrYwDpbJ77KY/lGUbZeVM
 awxopdUtizbz6yy455J003Y7BYP7QtH8Vvw1X6VwWyTJ7j7U1Lqs1qzjYZ/Ax78CJJBWC6+mw
 4AQJ1qJ/+4PoYoAvaPoLTncVmLGDwM0oMnJncStY7elZxvBn+2y0ymZWff40TKxCzZFfQT+zb
 jazT5AbwZA1F4ajvHqQM7ied36QnARPp45NFjoxPjpHibORQ5RFtQzQAbrkYpMldNXb2BC0Vk
 XyjSMbf+CmBGF+Hy15jweTlhOtk4ynYo0XWLNVC8Uu5O0JZYw+2L8zYVNgRSabBLSj0lzDpZQ
 LPDtZVdZYjuhjjo9LbUA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_021120_761334_2CC24D6F 
X-CRM114-Status: UNSURE (   7.86  )
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
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-xtensa@linux-xtensa.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 "moderated list:NIOS2 ARCHITECTURE" <nios2-dev@lists.rocketboards.org>,
 Guan Xuetao <gxt@pku.edu.cn>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Parisc List <linux-parisc@vger.kernel.org>,
 linux-mips@vger.kernel.org, alpha <linux-alpha@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Oct 29, 2019 at 7:49 AM Christoph Hellwig <hch@lst.de> wrote:
>
> A lot of architectures reuse the same simple ioremap implementation, so
> start lifting the most simple variant to lib/ioremap.c.  It provides
> ioremap_prot and iounmap, plus a default ioremap that uses prot_noncached,
> although that can be overridden by asm/io.h.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
