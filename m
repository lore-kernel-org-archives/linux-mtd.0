Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3439C83F05
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Aug 2023 22:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gE1LhHmKv1eGvf8M2mzwDKQ7J1pxb3tJCioOKJGdGJ4=; b=X1Kj12OyD4aJXheHoWTRCV8Oze
	uLApkJGQws425ByEc+RmMjjeTW3SzMFFQhkJiPuBdSqYw+d37lniIZYZKQ4Vv9bKUqB2hIXrHflHI
	xGt2Fe0yBp/jqMXMIpBL3dIFtI/dVN53+i37bMhQ731Gre8IFxxon7wi5+GYV01neIkF1AtcmcNH5
	1bFcS9t3NAJeCvtC0nIlueY1jXWvqAjoG+0D44lVt7Dl+SQjshdO61fwGFXkeObdMOJFxalb9zYxq
	l/1aT30JWKp1eBnkkrwgTfpbFqagMyPae/DUUK5q/iseTQH3e8H/hOnldBjx5MMxRpN8ylRZ3/mu3
	GwI7VdDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZfXt-0067is-0b;
	Fri, 25 Aug 2023 22:44:49 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZfXq-0067hz-2O;
	Fri, 25 Aug 2023 22:44:48 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1bf078d5f33so12018405ad.3;
        Fri, 25 Aug 2023 15:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693003477; x=1693608277;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:subject:from:references:cc:to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EfHZKV5Rs50FUqRYXClC9vzZD5WlxrYeYbs3IamXT4=;
        b=YxGLOPcaOZR604IVjJRcGcoKnB33IZ0CTfYuHyWKXt+0pInUOQSMoNyJ0dS6B1KmgY
         cxaBOMvor3UlQ6MZnz8hco99YltIQ+TVGTfUiOj3M6EtIom4aLy5Ogu10qSlU6URXk+W
         RnRGmXEhLIg0POh+PDKptxk33OVTKsM2/52zz5494dr8R8CSNGpoqbrRI3gpmS9Q+cTN
         hJYUsHOFyiz+AcMtmJLq8rt6PHOWgX+jhYTNJt4ghkMZ1YZYHd+UADqGIVtKxfSRzrdW
         eHx1TWLsT9QLE3Re7SH9KzLMTXlxKvezJrH+R76CylIu77symnMHbROv+J2zJ4UP/BTK
         7yuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693003477; x=1693608277;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:subject:from:references:cc:to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+EfHZKV5Rs50FUqRYXClC9vzZD5WlxrYeYbs3IamXT4=;
        b=JWVqNiHsmtiOi8ZwjfZ1D+X/XgIOJ0OjQGrbEnaA6CySwDyk+944f8RquHZPp/HBZB
         JFbj1PtWEDA/D1qKyCXW/pjghm30oN41EsAmoHlSah56S5ehCm/RBhDPdCkQC3RklyUf
         ZirnRkDF9v6Yv4fWRZUOCDYDGQrNbT1Mc5gnEWmc7gSm/5wOItEb8i7QiwNDm4/kOIu0
         Z1RRBeNLxKXbNBOKfaBCcSVqy2tYblCJjur5yRXwix/TUTlIPLAgBosfqqvzSt5sBaSC
         jsMmX2F0D87ClDZzZqHFEc8TUi63DHV741TjsDuNnAEdSPOGR2JSVWDeVN2QG3yvp//i
         h98A==
X-Gm-Message-State: AOJu0YyJAyFkWtK/JYgoe7h5XA+m3X6PT8NIzuN1BLMOHlvekD6D4He3
	3Urll187QeL7s/LCj73tTZI=
X-Google-Smtp-Source: AGHT+IHfISCtSa05UGz9PT6tDA2qtVyoG70cJPjb2fBEQ6/U+mzxDHROeZB/hJ4FR5D+DwWhbVxiGA==
X-Received: by 2002:a17:903:25d4:b0:1bd:bbc3:c87b with SMTP id jc20-20020a17090325d400b001bdbbc3c87bmr18047490plb.41.1693003477133;
        Fri, 25 Aug 2023 15:44:37 -0700 (PDT)
Received: from Schmitz-MacBook-Pro.local (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.googlemail.com with ESMTPSA id b1-20020a170902d50100b001adf6b21c77sm2280761plg.107.2023.08.25.15.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 15:44:36 -0700 (PDT)
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
References: <20230810141947.1236730-1-arnd@kernel.org>
 <169292577153.789945.11297239773543112051.b4-ty@oracle.com>
 <3956e2a4-c545-1212-e95f-3cf61a60d6a4@gmail.com>
 <CAMuHMdWC2S330_Vb_NTHTDC=BakBsw4ouP-eFJv0erV1-jmvTQ@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: (subset) [PATCH 00/17] -Wmissing-prototype warning fixes
Message-ID: <130b3b57-edb0-184d-5b5f-69b013715773@gmail.com>
Date: Sat, 26 Aug 2023 10:44:13 +1200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWC2S330_Vb_NTHTDC=BakBsw4ouP-eFJv0erV1-jmvTQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_154446_782954_074AADF6 
X-CRM114-Status: GOOD (  18.78  )
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

SGkgR2VlcnQsCgpBbSAyNS4wOC4yMyB1bSAxOTozOSBzY2hyaWViIEdlZXJ0IFV5dHRlcmhvZXZl
bjoKPiBIaSBNaWNoYWVsLAo+Cj4gT24gRnJpLCBBdWcgMjUsIDIwMjMgYXQgMzozMeKAr0FNIE1p
Y2hhZWwgU2NobWl0eiA8c2NobWl0em1pY0BnbWFpbC5jb20+IHdyb3RlOgo+PiBPbiAyNS8wOC8y
MyAxMzoxMiwgTWFydGluIEsuIFBldGVyc2VuIHdyb3RlOgo+Pj4gWzExLzE3XSBzY3NpOiBndnAx
MTogcmVtb3ZlIHVudXNlZCBndnAxMV9zZXR1cCgpIGZ1bmN0aW9uCj4+PiAgICAgICAgICBodHRw
czovL2dpdC5rZXJuZWwub3JnL21rcC9zY3NpL2MvYmZhYTRhMGNlMWJiCj4+IEkgc29tZWhvdyBt
aXNzZWQgdGhhdCBvbmUgLi4uCj4+Cj4+IFRoZSBndnAxMV9zZXR1cCgpIGZ1bmN0aW9uIHdhcyBw
cm9iYWJseSBhIHJlbGljIGZyb20gdGhlIHRpbWVzIGJlZm9yZQo+PiBtb2R1bGUgcGFyYW1ldGVy
cy4KPj4KPj4gU2luY2UgZ3ZwMTFfeGZlcl9tYXNrIGFwcGVhcnMgdG8gYmUgcmVxdWlyZWQgZm9y
IHNvbWUgQW1pZ2Egc3lzdGVtcyB0bwo+PiBzZXQgdGhlIERNQSBtYXNrLCBJJ2QgYmVzdCBzZW5k
IGEgcGF0Y2ggdG8gYWRkIHN1Y2ggYSBtb2R1bGUgcGFyYW1ldGVyIC4uLgo+Pgo+PiBEbyB5b3Ug
a25vdyBhbnkgZGV0YWlscyBhcm91bmQgdGhlIHVzZSBvZiBETUEgbWFza3MgZm9yIEFtaWdhIFdE
MzNDOTMKPj4gZHJpdmVycywgR2VlcnQ/Cj4gRG9oLCBpdCdzIGJlZW4gYSB3aGlsZSwgYW5kIEkg
bmV2ZXIgaGFkIGFuIGFmZmVjdGVkIHN5c3RlbS4KPiBQcm9iYWJseSBpdCdzIG5lZWRlZCBvbiBB
MjAwMCB3aXRoIGFuIGFjY2VsZXJhdG9yIGNhcmQgYW5kIEdWUCBJSSBTQ1NJLAo+IHRvIHByZXZl
bnQgRE1BIHRvIFJBTSBiYW5rcyB0aGF0IGRvIG5vdCBzdXBwb3J0IGZhc3QgRE1BIGN5Y2xlcy4K
ClRoYW5rcywgdGhhdCdzIGdvb2QgZW5vdWdoIGZvciBtZS4KCkxpbnV4IDIuMCBoYWQgdGhpcyBj
b21tZW50OgoKfC8qICogRE1BIHRyYW5zZmVyIG1hc2sgZm9yIEdWUCBTZXJpZXMgSUkgU0NTSSBj
b250cm9sbGVyLiAqIFNvbWUKdmVyc2lvbnMgY2FuIG9ubHkgRE1BIGludG8gdGhlIDI0IGJpdCBh
ZGRyZXNzIHNwYWNlICogKDAtPjE2TSkuIE90aGVycwpjYW4gRE1BIGludG8gdGhlIGZ1bGwgMzIg
Yml0IGFkZHJlc3MgKiBzcGFjZS4gVGhlIGRlZmF1bHQgaXMgdG8gb25seQphbGxvdyBETUEgaW50
byB0aGUgMjQgYml0ICogYWRkcmVzcyBzcGFjZS4gVGhlICJndnAxMT0weEZGRkZGRkZFIiBzZXR1
cApwYXJhbWV0ZXIgY2FuICogYmUgc3VwcGxpZWQgdG8gZm9yY2UgYW4gYWx0ZXJuYXRlICgzMiBi
aXQpIG1hc2suICovIHwKCnxXZSBub3cgaGFuZGxlIHRoYXQgKHNpbmNlIDIuNi4zNSkgdGhyb3Vn
aCBtYXNrcyBkZWZpbmVkIGluCmd2cDExX3pvcnJvX3RibFtdICh0aG91Z2ggSSBub3RlIHRoZXNl
IGRvbid0IGFjY291bnQgZm9yIHVuYWxpZ25lZAphZGRyZXNzZXMgc3VjaCBhcyBpbXBsaWVkIGJ5
IHRoZSBleGFtcGxlIGluIHRoZSBjb21tZW50LiBBcmUgdW5hbGlnbmVkCkRNQSBidWZmZXJzIHN0
aWxsIHBvc3NpYmxlIHRvZGF5PykuIFdvdWxkIHRoYXQgY292ZXIgdGhlICdBMjAwMCB3aXRoCmFj
Y2VsZXJhdG9yJyBjYXNlPwp8Cgp8fAoKSSdtIGhhcHB5IHRvIHNlbmQgYSBwYXRjaCBpZiBhbiBv
dmVycmlkZSB0byB0aGUgZGV2aWNlIGRlZmF1bHQgRE1BIG1hc2sKaXMgc3RpbGwgbmVjZXNzYXJ5
LgoKKEluY2lkZW50YWxseSAtIGRpZCB5b3UgZXZlciBwdWJsaXNoIHRoZSBtNjhrIGZ1bGwgaGlz
dG9yeSB0cmVlIGFueXdoZXJlCmluIGdpdD8pCgpDaGVlcnMsCgrCoMKgwqAgTWljaGFlbAoKCj4K
PiBHcntvZXRqZSxlZXRpbmd9cywKPgo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0Cj4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
