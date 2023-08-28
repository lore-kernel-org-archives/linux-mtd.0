Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E0AC83F11
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Aug 2023 08:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fm32qgqWLj7BtvveyoahWbmyvmTKY7zz7qqLSp2HNsA=; b=Geh9G8LEOXk5Xpz+aTCn313aKi
	E5wuMxV6SEGsAUVaKoBtr5GAKphAFuTITOxvokwSrYhzizcsrGFtZOu34SiiPySNh67ZVtPGHFnBP
	517PC0AUU3cCY3rql0A8zzU+zApV1iU9RG6lonq+sGXEGjaD4mws68fxmMBA9GGFTunrCZbitJD8D
	7YfszrwfMyueSyVTLn4R2CLttWfLMDsU74zI5bAdkuUeH3rVSmNVcsJwM8uahnTljlbfmVE2sikmq
	NhIBZqD3XFYj99mfpbJtkLGNYzI7CwOUjT2wXTRmHvFRdB5pvjUh4gUefd3g6OTpKNldqoIjGt4Ep
	ACD1wRKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaXI5-0096uS-09;
	Mon, 28 Aug 2023 08:08:05 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaXI2-0096sj-2N;
	Mon, 28 Aug 2023 08:08:03 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c0bae4da38so19223465ad.0;
        Mon, 28 Aug 2023 01:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693210077; x=1693814877;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnrE6dyfVAprK/xFUC60jFewyVljQRt3NNtTMulp0V0=;
        b=LVg55P2ejT0BJXH9H1+hgJHcBL2A+IF5g+KpwZsnJ2WoqXmcrL9ZfEfa3T6fNEdxE+
         ga2nqaZ+gZjmffBcNuVnaXDtmvodkJeUEflTba5i6j/rIlhBduWdBgZRPVnHwy+erFMo
         Q2sF5ZgAuDt+03EKZEd8qEogPdBU5cTg8EccDlTx6cSnC2QLYfomUfDCZyZGJl19L0Ry
         zfDO9BgqWN0KlkikpK3fWA7KZvQWChySAj+L6JXiUhVTo7xH2gRnW3f4Al2lAGJTZzAW
         5ZruNkogVGDYB3ptB7Tk7PeewBGyh+fZdTDyBJ7/jPzoGq3RnYeGV17VCUydj0j+5OXO
         MJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693210077; x=1693814877;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pnrE6dyfVAprK/xFUC60jFewyVljQRt3NNtTMulp0V0=;
        b=S4amCH/BuU7Fo3V+GwLGIvmgRPRU/EKtWxmGujkGtQQMa5Z7JRuPbCfw6BlURE5BeQ
         BQrfRGoPSHmMtPeG7Y1aZIia2ApZyGj7xMib1VCaYaQ1ZyZh2YLic5ZCajf3f/MtzQcI
         z5csCJgJS3yEBMTcAQv8qlFCmBcXk25sElTqpXWNn0YIs8uIzo0UH7qgYKqSXT4QtGuy
         qkGXULdkeAk3r/eXhAswbykSc4adYm5JbTUuak8PtKKASxcWtjS7K/eUVG0RI4NR/0MP
         u/PVVJgoMAmD33TDotAAIdS/Mw3nYQBaUrF7BZtUfQdKShdsslRQyJ5u67UiUOOKMGBX
         npig==
X-Gm-Message-State: AOJu0YwuXezXQP5WkKenwUhyv9KxQcZy7/CumQ5SqGgJS/USuQAMa/rO
	90V6zT73s+Oj85GZ3jUCOG1eITZdAHXOCQ==
X-Google-Smtp-Source: AGHT+IHEN6rjlzubXIy3DuU1iYHuYGfJmUDj7MCrRMJIjxExjNAtfO/xrf/2cugqJ3sCcKtAmuhffg==
X-Received: by 2002:a17:903:41d1:b0:1bf:193a:70b6 with SMTP id u17-20020a17090341d100b001bf193a70b6mr38374653ple.5.1693210077452;
        Mon, 28 Aug 2023 01:07:57 -0700 (PDT)
Received: from [10.1.1.24] (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.gmail.com with ESMTPSA id x19-20020a170902ea9300b001bc445e2497sm6610519plb.79.2023.08.28.01.07.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Aug 2023 01:07:57 -0700 (PDT)
Subject: Re: (subset) [PATCH 00/17] -Wmissing-prototype warning fixes
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230810141947.1236730-1-arnd@kernel.org>
 <169292577153.789945.11297239773543112051.b4-ty@oracle.com>
 <3956e2a4-c545-1212-e95f-3cf61a60d6a4@gmail.com>
 <CAMuHMdWC2S330_Vb_NTHTDC=BakBsw4ouP-eFJv0erV1-jmvTQ@mail.gmail.com>
 <130b3b57-edb0-184d-5b5f-69b013715773@gmail.com>
 <CAMuHMdUkZmkBSksvaGcDCKz2tsgkwyWgDa+WwCJm2UxFMCj1jw@mail.gmail.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, x86@kernel.org,
 Borislav Petkov <bp@alien8.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Richard Weinberger <richard@nod.at>, Bjorn Helgaas <bhelgaas@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-next@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kbuild@vger.kernel.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <dbed3311-6b8e-a396-7e9e-2747902c5d6a@gmail.com>
Date: Mon, 28 Aug 2023 20:07:27 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUkZmkBSksvaGcDCKz2tsgkwyWgDa+WwCJm2UxFMCj1jw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_010802_782190_ACA7C608 
X-CRM114-Status: GOOD (  13.14  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgR2VlcnQsCgpBbSAyOC4wOC4yMDIzIHVtIDE4OjQyIHNjaHJpZWIgR2VlcnQgVXl0dGVyaG9l
dmVuOgo+IE9uIFNhdCwgQXVnIDI2LCAyMDIzIGF0IDEyOjQ04oCvQU0gTWljaGFlbCBTY2htaXR6
IDxzY2htaXR6bWljQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IChJbmNpZGVudGFsbHkgLSBkaWQgeW91
IGV2ZXIgcHVibGlzaCB0aGUgbTY4ayBmdWxsIGhpc3RvcnkgdHJlZSBhbnl3aGVyZQo+PiBpbiBn
aXQ/KQo+Cj4gWW91IG1lYW4gdGhlIGdpdGlmaWVkIHZlcnNpb24gb2YgdGhlIExpbnV4L202OGsg
Q1ZTIHRyZWUgUmFsZiBjcmVhdGVkCj4gZm9yIG1lIGJlY2F1c2UgbXkgbWFjaGluZSB3YXNuJ3Qg
cG93ZXJmdWwgZW5vdWdoPwoKVGhlIHZlcnkgc2FtZSAuLi4KCj4gTm8sIGFuZCBJIHNob3VsZCBs
b29rIGludG8gZG9pbmcgdGhhdC4uLgoKTm8gcHJlc3N1cmUhCgpDaGVlcnMsCgoJTWljaGFlbAoK
Pgo+IEdye29ldGplLGVldGluZ31zLAo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
