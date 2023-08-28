Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875B3C83F12
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Aug 2023 06:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WGGymFbjhpgYUDSl1Bqz28jmUcQPUp/mWRuSc8X7MG4=; b=hGL4eOXfTuuEn0
	59ipEOlu0F8EuBQ+dd0bvww+Q0Oh6qNL0UPqxooyASICfe937lvF+YWZQxnakEsxsNlJRVQCNyFLE
	qx8z8C8nunYLn2hxc8Wpjpi8HMftOVLGwsl+sRjY1loKyCK53/EeEek1kBHiewICKfdUjDtShJXUh
	0PFiG3LP0UwW+LOLNPm67nVcEwEoS9S9fz5KM+4BUmv1cBZtsnggEpSxWhKx4Br5RhdYXJLoPAGrf
	kf6ZaHSUKldJAw/faYtv92hcXyMWt/tuL2JABxcyi+EmrioyrIDxJ31JEQSAkW8QfWsyiYOtUyRku
	z3oc6bj6XeyrbqoFxxow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVy4-008yBu-1J;
	Mon, 28 Aug 2023 06:43:20 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVxz-008yAb-0l;
	Mon, 28 Aug 2023 06:43:16 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1c4c6717e61so2152389fac.1;
        Sun, 27 Aug 2023 23:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693204992; x=1693809792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZAs6BPn0UEnVbrYLaaDeF3O9l7Iturm7FWJFQ5jda0=;
        b=haA9BINSYxg9I16DLf3fgaKahUg9RyJI8ocrl5VSTVOmiATrKnk1AACd5WK1IfTqyZ
         zPWvop9xs1wwGErvhJsLJroxi7hDal/mwXbqUOvY0qB/q1EcZPyYd/LEm/9Qnwy7nUSe
         s0N4hysrqK32tp4MZFMbo+XXrw/pdsDDNQBPWiB/3oQey1YLRs14VTQT0Ndlc9k+gznp
         yZXQXQ55rSIFnkLLR5dPRCR7SwZDbbekaChAiLwnxcXur06bE1z1r2eq4WCHyK8405G4
         55R+dpzOgEJd/UaUCxBYSjwuqg76GTqFCrn5SaoaL+gYuEO/D/CFuJo9Zt4FzsF9RwyS
         cvxA==
X-Gm-Message-State: AOJu0Yzq1NccGOBcT+1A7K6n3b2J30tKbd+GLpD36w3Z20vhZpq2oyCI
	27lYPNYcYs8B5ONNUICySEncO5P28Np3IA==
X-Google-Smtp-Source: AGHT+IHY521FO0Jk1lrPkv2LqZ7hVdj8zdPVAMtYKKNOpxWvwmtZGPMmtUrShWDNFCCjqC6tHN4+XQ==
X-Received: by 2002:a05:6871:5214:b0:1c8:c27f:7dbb with SMTP id ht20-20020a056871521400b001c8c27f7dbbmr13378585oac.41.1693204992299;
        Sun, 27 Aug 2023 23:43:12 -0700 (PDT)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com. [209.85.160.50])
        by smtp.gmail.com with ESMTPSA id y16-20020a056870b49000b001ccab369c09sm3839573oap.42.2023.08.27.23.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 23:43:12 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1c4c6717e61so2152381fac.1;
        Sun, 27 Aug 2023 23:43:11 -0700 (PDT)
X-Received: by 2002:a25:8502:0:b0:d7a:e348:1e47 with SMTP id
 w2-20020a258502000000b00d7ae3481e47mr3956815ybk.36.1693204971245; Sun, 27 Aug
 2023 23:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230810141947.1236730-1-arnd@kernel.org> <169292577153.789945.11297239773543112051.b4-ty@oracle.com>
 <3956e2a4-c545-1212-e95f-3cf61a60d6a4@gmail.com> <CAMuHMdWC2S330_Vb_NTHTDC=BakBsw4ouP-eFJv0erV1-jmvTQ@mail.gmail.com>
 <130b3b57-edb0-184d-5b5f-69b013715773@gmail.com>
In-Reply-To: <130b3b57-edb0-184d-5b5f-69b013715773@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Aug 2023 08:42:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkZmkBSksvaGcDCKz2tsgkwyWgDa+WwCJm2UxFMCj1jw@mail.gmail.com>
Message-ID: <CAMuHMdUkZmkBSksvaGcDCKz2tsgkwyWgDa+WwCJm2UxFMCj1jw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230827_234315_275644_5092FBE2 
X-CRM114-Status: GOOD (  14.64  )
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

T24gU2F0LCBBdWcgMjYsIDIwMjMgYXQgMTI6NDTigK9BTSBNaWNoYWVsIFNjaG1pdHogPHNjaG1p
dHptaWNAZ21haWwuY29tPiB3cm90ZToKPiAoSW5jaWRlbnRhbGx5IC0gZGlkIHlvdSBldmVyIHB1
Ymxpc2ggdGhlIG02OGsgZnVsbCBoaXN0b3J5IHRyZWUgYW55d2hlcmUKPiBpbiBnaXQ/KQoKWW91
IG1lYW4gdGhlIGdpdGlmaWVkIHZlcnNpb24gb2YgdGhlIExpbnV4L202OGsgQ1ZTIHRyZWUgUmFs
ZiBjcmVhdGVkCmZvciBtZSBiZWNhdXNlIG15IG1hY2hpbmUgd2Fzbid0IHBvd2VyZnVsIGVub3Vn
aD8KTm8sIGFuZCBJIHNob3VsZCBsb29rIGludG8gZG9pbmcgdGhhdC4uLgoKR3J7b2V0amUsZWV0
aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhv
ZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgt
bTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxl
LCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFs
aXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
