Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E51FC43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 10:10:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08D47214E0
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 10:10:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f30Mw+yp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08D47214E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jExtHwnPPxsMwLI6uFx0sB5JVv15ddumezQpUf2nybM=; b=f30Mw+ypJEESsJ
	u0ooTSFyCZLLdRXjwHMkCwImOSjA6OYk0XkIyFhRAFwi7gG6abbljcDP9ONTcilN78bXPjxSZQ+5Y
	1FPQOJxqx673zGdQkAwF6ErCwplkIgZr5Y/ZbLSeyfNcaiXhKgaxGy/RU9SJTgHCW2VAF5jyeApjN
	B0+S86+gBq6mD0C2nDL70t30F2il0nRRSps0ymE0O+lzezALoG3VKMvQwqQ+6vCcamUqetN68JC71
	BMq2uuNsWTS2zXk4Py0lTz/6j+q/3i3y6oph9B2+sFLFxxKs2rBhQO7qbaNgGePO6TTnNRyf9sZsB
	BtlGZA+4xBR7A+8IBTaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU6eg-00058F-5w; Mon, 11 Nov 2019 10:10:42 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU6eR-0004to-Ng; Mon, 11 Nov 2019 10:10:29 +0000
Received: from mail-qt1-f178.google.com ([209.85.160.178]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N6KMR-1hoCDI1u4f-016fjm; Mon, 11 Nov 2019 11:10:25 +0100
Received: by mail-qt1-f178.google.com with SMTP id o49so15061952qta.7;
 Mon, 11 Nov 2019 02:10:25 -0800 (PST)
X-Gm-Message-State: APjAAAWI/SJPAR5BTJja7Tcokwsf2epO6QM5fyMoZb+qtveVcHuit417
 rx4VI0sG5j2KRxlq5Krbz+4zF7uNexSDGkvfJ5c=
X-Google-Smtp-Source: APXvYqyqP0GEnKlLDcc3YXGxYPpIsc43oy+/l9orRIfJHYpq8HDGEADC0l7WhZk0kMzg516CeAScWIBjk4MnQDDCwV4=
X-Received: by 2002:ac8:1908:: with SMTP id t8mr24584774qtj.18.1573467024165; 
 Mon, 11 Nov 2019 02:10:24 -0800 (PST)
MIME-Version: 1.0
References: <20191029064834.23438-1-hch@lst.de>
 <20191029064834.23438-13-hch@lst.de>
In-Reply-To: <20191029064834.23438-13-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 Nov 2019 11:10:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a28UDPEP7Bqu_wEXsfwSpT-5i30STB2iX3RfxdvbfzrNQ@mail.gmail.com>
Message-ID: <CAK8P3a28UDPEP7Bqu_wEXsfwSpT-5i30STB2iX3RfxdvbfzrNQ@mail.gmail.com>
Subject: Re: [PATCH 12/21] arch: rely on asm-generic/io.h for default
 ioremap_* definitions
To: Christoph Hellwig <hch@lst.de>
X-Provags-ID: V03:K1:fQX32YRZ7MFYqktrGadEAUXdbqRuZ4SulAjtrqxyTp0DuPF/I4S
 ANIMFHovIsglz//xUx23TR904ba3Z2MIdcPzW4CyydXRFYrXBGQj0SlMj7tAAE4EHQ1qZUt
 DQUhK/C4bmAF+6NWq4k7sVyDrvD06BSbsm5s3Bwv6juBiqKvDc9xB+yq7mPHGBQdg8AX12I
 oTfmBvio7BFg5dsFP8Tyw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3v4ypQ8zeXk=:W6yi7Ju1qhjcxtjekngn8M
 tUSbvtWSmZYCXQw0V0SpoMCezGyjsY879/X4WA5KeTRDqPGTHX+bBxvnDK4AtxykFhS/yBcCz
 /v7BsAqKjbdm256T+9vKYTakd3KsoUguUpO8QAI0eYCU7wGuvPfBsNiNXUjMTCFKuZvCuBEfy
 +/Ncf4kwKV7xCHrf82pDI7GOKzLetXdAMGfbAZirutGVWRV2lK9/ou7ZIKFUDEuuptP123Nox
 W8fq5G6zovWGjROCwyrNMV5x2fq+gFh9xueJalURST9Xfxf5TZ1MFxeVIbJ4TCd6UgV4439ZV
 s5NDxjl8shqnp4aisTTOns9bzXgnLausYgEWZps/FREOo+4LtZnu3FeRuT/zw5GK5DHZXu9WV
 VCWPAjlAwJs3NdUPhfccna9/h0HHAwMZk9KMaVjlH6x2pAP3tafnJxTAzaUxM3QroWOyZOVdx
 xajoPqTAdNmxTM+zaEHANLnX1i9cJ1C9GHGHkhL4Bsa762kPK+/d1wh/JH2oOXGuc1iXPNlox
 D6SgSizKajDWfJYkeyLjr/afm2Vx/OPbsHs3ZC8FDhmjrzHFEE8Sx1m6wD+t1Hjjt2AYIgz0J
 0pJVsTkFwHRTtCqMOeRErw5cPD3PpZn6pa9Ruy/eF6yUzxduTpSCWFiVzgBlMhRB3eFcsVjXg
 hMgkgnjJLp1PMNZ6a6Fnl0fVod3ZnY2rzI3DhMdXoU45IrmqlDUeVtKjperyipG0Omc85PZzs
 +D5fW+yBqgQSyjT2conQ8mVsfTzPu5Owh0JWbB41VM3NUeSHrOuYoLpZQlCxnks10CmsGWFJF
 0XtJOebNOexrbpcHg5MZVIctaqJiMX/p4Izyt4h+UuKdjHAKK7MSaYFgFkHaUS/RVx+PYCA1L
 M6q9mxTAzh2zUik+hitQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_021028_062965_62E2A4E4 
X-CRM114-Status: UNSURE (   8.71  )
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
> Various architectures that use asm-generic/io.h still defined their
> own default versions of ioremap_nocache, ioremap_wt and ioremap_wc
> that point back to plain ioremap directly or indirectly.  Remove these
> definitions and rely on asm-generic/io.h instead.  For this to work
> the backup ioremap_* defintions needs to be changed to purely cpp
> macros instea of inlines to cover for architectures like openrisc
> that only define ioremap after including <asm-generic/io.h>.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
