Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669B9C7EE2C
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Aug 2023 07:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GKX4YNivYztn5HYxg9oso6F/5fR89rin4/aPFPANNY=; b=SxNt0dzHyVvCh+
	NGhI3MzW65qsQ59m6oCAi5Oxs0coG6rbKnfVRbXB0VhVaUmNvfcoj6iH7F00NsPbE8UUfss/WSd/D
	cU6GvASHu7lim0GVzjI8tAH/Au/iVNhosgOWVGgFkscwOdWoOYdTtqi0wskw7mB7u2Pgv39WwQudB
	U+UX8oZAA9vmxTKtwFvcNkBI7jrnkBw7ph5k5PnJfL5UxWPSMQwqJcVl9gE/VT/mMnxVtHHrR8kc6
	Uy+3qBeCVrVJAWZPvfYavkLW6YHmlImRTHcKI3qKyiA6z9aV3BC60LFR/CX+lR8aNnVGjx3Dd5TEP
	mvvPdEQGS6dOpOlkzeIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZRQS-004Yb5-06;
	Fri, 25 Aug 2023 07:40:12 +0000
Received: from mail-yw1-f175.google.com ([209.85.128.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZRQM-004YZx-00;
	Fri, 25 Aug 2023 07:40:07 +0000
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5921a962adfso7752717b3.1;
        Fri, 25 Aug 2023 00:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692949201; x=1693554001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5r8bhhlGnXrx708tsGw6Ag8gm7AVkEO6BeDk4HD7tk=;
        b=SWXcOBeZooQfm5sZIBihRnei9mN7ZlPO1mobXwfCy1KElcJXVFZj/AyLfXUCmyCAIQ
         MoyCFUIbVrob497apOQbVzdLvM1rUUo3qK3B1K4fVGRqNiX+IBROCzGyMUz8dydtF9RG
         cHTMvcngpAohDkffjn8l6CDOF1PpsS1ZwfHuijLC58pKWVBMHYF4QdlpQpKX+lH2uObu
         RcxZ5APX0xlB0x40TfLRkxkknqNmKpUqFUwZEvpAeFmUGxTvcE1BCRYV0NetAa2iM5kJ
         j8j0MRKOt6kOtaN0bMx7vTCXeYtfIsPVe7bU1uN9bchsH5LbNgf/ThCTYD4atot+SaIv
         Cp+w==
X-Gm-Message-State: AOJu0YzmP5gAqcY3HjdsVrBEsOSc2gQ+YGAXJwprkitd/mS4+86qcWXI
	u4vJuPr0WEXGOGxEXcRT91NHqF8yRwC+8rs1
X-Google-Smtp-Source: AGHT+IHCO6m1+Wuf15WJCdBnfYHgPIBS+AjYqCpxy1sjziumk7zlxIa1DxqvFLwXlP4X8fFMaQBJbw==
X-Received: by 2002:a05:690c:c93:b0:592:9aa5:77fd with SMTP id cm19-20020a05690c0c9300b005929aa577fdmr1610660ywb.4.1692949201277;
        Fri, 25 Aug 2023 00:40:01 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id i2-20020a815402000000b005707d7686ddsm371336ywb.76.2023.08.25.00.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 00:40:00 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d77a4e30e97so629211276.2;
        Fri, 25 Aug 2023 00:40:00 -0700 (PDT)
X-Received: by 2002:a25:34cd:0:b0:d0b:5b6:4629 with SMTP id
 b196-20020a2534cd000000b00d0b05b64629mr19382891yba.46.1692949180028; Fri, 25
 Aug 2023 00:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230810141947.1236730-1-arnd@kernel.org> <169292577153.789945.11297239773543112051.b4-ty@oracle.com>
 <3956e2a4-c545-1212-e95f-3cf61a60d6a4@gmail.com>
In-Reply-To: <3956e2a4-c545-1212-e95f-3cf61a60d6a4@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Aug 2023 09:39:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWC2S330_Vb_NTHTDC=BakBsw4ouP-eFJv0erV1-jmvTQ@mail.gmail.com>
Message-ID: <CAMuHMdWC2S330_Vb_NTHTDC=BakBsw4ouP-eFJv0erV1-jmvTQ@mail.gmail.com>
Subject: Re: (subset) [PATCH 00/17] -Wmissing-prototype warning fixes
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, x86@kernel.org, 
	Borislav Petkov <bp@alien8.de>, Max Filippov <jcmvbkbc@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Richard Weinberger <richard@nod.at>, 
	Bjorn Helgaas <bhelgaas@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kbuild@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_004006_047213_3138049A 
X-CRM114-Status: GOOD (  20.17  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWljaGFlbCwKCk9uIEZyaSwgQXVnIDI1LCAyMDIzIGF0IDM6MzHigK9BTSBNaWNoYWVsIFNj
aG1pdHogPHNjaG1pdHptaWNAZ21haWwuY29tPiB3cm90ZToKPiBPbiAyNS8wOC8yMyAxMzoxMiwg
TWFydGluIEsuIFBldGVyc2VuIHdyb3RlOgo+ID4gWzExLzE3XSBzY3NpOiBndnAxMTogcmVtb3Zl
IHVudXNlZCBndnAxMV9zZXR1cCgpIGZ1bmN0aW9uCj4gPiAgICAgICAgICBodHRwczovL2dpdC5r
ZXJuZWwub3JnL21rcC9zY3NpL2MvYmZhYTRhMGNlMWJiCj4KPiBJIHNvbWVob3cgbWlzc2VkIHRo
YXQgb25lIC4uLgo+Cj4gVGhlIGd2cDExX3NldHVwKCkgZnVuY3Rpb24gd2FzIHByb2JhYmx5IGEg
cmVsaWMgZnJvbSB0aGUgdGltZXMgYmVmb3JlCj4gbW9kdWxlIHBhcmFtZXRlcnMuCj4KPiBTaW5j
ZSBndnAxMV94ZmVyX21hc2sgYXBwZWFycyB0byBiZSByZXF1aXJlZCBmb3Igc29tZSBBbWlnYSBz
eXN0ZW1zIHRvCj4gc2V0IHRoZSBETUEgbWFzaywgSSdkIGJlc3Qgc2VuZCBhIHBhdGNoIHRvIGFk
ZCBzdWNoIGEgbW9kdWxlIHBhcmFtZXRlciAuLi4KPgo+IERvIHlvdSBrbm93IGFueSBkZXRhaWxz
IGFyb3VuZCB0aGUgdXNlIG9mIERNQSBtYXNrcyBmb3IgQW1pZ2EgV0QzM0M5Mwo+IGRyaXZlcnMs
IEdlZXJ0PwoKRG9oLCBpdCdzIGJlZW4gYSB3aGlsZSwgYW5kIEkgbmV2ZXIgaGFkIGFuIGFmZmVj
dGVkIHN5c3RlbS4KUHJvYmFibHkgaXQncyBuZWVkZWQgb24gQTIwMDAgd2l0aCBhbiBhY2NlbGVy
YXRvciBjYXJkIGFuZCBHVlAgSUkgU0NTSSwKdG8gcHJldmVudCBETUEgdG8gUkFNIGJhbmtzIHRo
YXQgZG8gbm90IHN1cHBvcnQgZmFzdCBETUEgY3ljbGVzLgoKR3J7b2V0amUsZWV0aW5nfXMsCgog
ICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBU
aGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcK
CkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwg
bXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1
c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
