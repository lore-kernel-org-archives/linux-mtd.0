Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCA9C88CB2
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Aug 2023 01:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MmsH17d64f46Y3D+4Ri0nexXjZuPe+Po/It3db2PIWs=; b=qO/f8fPyK3ROwW
	T9jivY4n8p85X54+tpJ3guUFDpBBfza1kn03l2Zt8sy3pmKkOT17wRF+s9EH/fZNVI2ybYFCPPQy8
	1egp1CSt8tPwd+tKBIL+PtrpGm5y8CdH4mcsg0s766AMD3Tm5b2stmmS3I6X3rhBhbCgT96bTxB3k
	yaZXKAj3+zNJ6GP+sqJa+p/uRLAHzs98F+1PRbY8V6o+4bMWtSHFNsoWTcv0n9uUW4emoZtW2g4Ax
	w8//RxnXBYaw8z/HZzkOeC78I6yUdKpbyl1diVKNRbfvuH12jMji6iZv/2WJf+ApwPrJeOARkIdeB
	FDuX8d3Ac3nywUGbxHCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZLfH-0044bs-0H;
	Fri, 25 Aug 2023 01:31:07 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZLfC-0044aA-0F;
	Fri, 25 Aug 2023 01:31:03 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-68a4bcf8a97so371282b3a.1;
        Thu, 24 Aug 2023 18:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692927057; x=1693531857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z7ELdHtTL5wYh7Mk37fDEn5rWUjAm0EdSJQg/6HWPPQ=;
        b=Tmlz4s2OgK58rZBzZOqQBOTKsewJsSbr0lEcw148TWgipwzPC4h3leu6DHGlT2r85/
         Uip0aLw7OTRJ61MyT/fB+2M0fG4g6LWvilyhBIrARSkzuGacd0puWelGLD8sQFEorTQR
         iWM9dveRRwtXAAMgsQ1/wPN9YLRbtznx8UH3GB/Gc6Kl2jKJWnRhPY+VLZrWbWEKV9yS
         nafEaqYDFpVR5/DPJmFBDt9xOQCxtCGGHTqymDFSbzyjxleu1nAu7M/vlGloF4CFWAV1
         1Mn9tQCCGOF3Z8ZylRnT1zAlhIOy4YB5/0u2bxeQjx03+CoamjdoA+ECCtWPkVPf8KF0
         7rAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692927057; x=1693531857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7ELdHtTL5wYh7Mk37fDEn5rWUjAm0EdSJQg/6HWPPQ=;
        b=Zc+YBHX1eKrC8JwDcKTvkCZpxXZWAiAH75ViqF7QSlINKyb38aLuclLQM3PqRF1Ujo
         RzRGlHrQbTJFx7jE5FMHC7j6yXS02GkyeMi8FRd9S39HP8VilfaW7KHOiYwo8GzEnvxp
         dxDkPifyohEJeaMedQbdN3zqww9+y7Uv83SFux8UbfTwCoka+aEDzY+XCwVVs+sPchuR
         UZlxt1ePl2w+7VilFlOdQUn02YD5JOsVbBGq+uuQsSGTRn20djpXmTKiu6/7NYRp6qH1
         W43gio7D9yGktBc0/QQDRl+2MoZ76cIP4SvX4Z8yDVnlsLvohc3AHNpGuJ35IjOOVZhl
         xdnA==
X-Gm-Message-State: AOJu0YwIL7BJHX/nBko+ziP2u2UiDXQ/KFzjwhD1WBVtE9mNBIgKcPIl
	KHPWRfbRMc/A3yIgNxyYNU0=
X-Google-Smtp-Source: AGHT+IGkdO3IAVMt9b8NA6cgzJYFAF5G39z8+OmHSySwOLhyKezYRWYjT2VqAbDb9GTS6Db8Rjs5TA==
X-Received: by 2002:a05:6a00:1a13:b0:68a:49bc:9be3 with SMTP id g19-20020a056a001a1300b0068a49bc9be3mr14483212pfv.29.1692927057420;
        Thu, 24 Aug 2023 18:30:57 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cd10:2fec:7ce0:fe0a? ([2001:df0:0:200c:cd10:2fec:7ce0:fe0a])
        by smtp.gmail.com with ESMTPSA id y19-20020aa78553000000b00682af93093dsm367550pfn.45.2023.08.24.18.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 18:30:57 -0700 (PDT)
Message-ID: <3956e2a4-c545-1212-e95f-3cf61a60d6a4@gmail.com>
Date: Fri, 25 Aug 2023 13:30:32 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: (subset) [PATCH 00/17] -Wmissing-prototype warning fixes
Content-Language: en-US
To: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>,
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
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
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <169292577153.789945.11297239773543112051.b4-ty@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_183102_120763_261B9D3B 
X-CRM114-Status: GOOD (  16.72  )
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

SGkgTWFydGluLCBBcm5kLAoKT24gMjUvMDgvMjMgMTM6MTIsIE1hcnRpbiBLLiBQZXRlcnNlbiB3
cm90ZToKPiBPbiBUaHUsIDEwIEF1ZyAyMDIzIDE2OjE5OjE4ICswMjAwLCBBcm5kIEJlcmdtYW5u
IHdyb3RlOgo+Cj4+IE1vc3Qgb2YgdGhlIHBhdGNoZXMgSSBzZW50IHNvIGZhciBmb3IgdGhlIC1X
bWlzc2luZy1wcm90b3R5cGUgd2FybmluZ3MKPj4gaGF2ZSBtYWRlIGl0IGludG8gbGludXgtbmV4
dCBub3cuIFRoZXJlIGFyZSBhIGZldyB0aGF0IEknbSByZXNlbmRpbmcKPj4gbm93IGFzIG5vYm9k
eSBoYXMgcGlja2VkIHRoZW0gdXAsIGFuZCB0aGVuIGEgbnVtYmVyIG9mIGZpeGVzIHRoYXQgSQo+
PiBmb3VuZCB3aGlsZSB0ZXN0LWJ1aWxkaW5nIGFjcm9zcyBhbGwgYXJjaGl0ZWN0dXJlcyByYXRo
ZXIgdGhhbiBqdXN0IHRoZQo+PiBvbmVzIEkgdXN1YWxseSB0ZXN0Lgo+Pgo+PiBUaGUgZmlyc3Qg
MTUgcGF0Y2hlcyBpbiB0aGlzIHNlcmllcyBzaG91bGQgYmUgdW5jb250cm92ZXJzaWFsLCBzbwo+
PiBJIGV4cGVjdCB0aGF0IGVpdGhlciBhIHN1YnN5c3RlbSBtYWludGFpbmVyIG9yIEFuZHJldyBN
b3J0b24gY2FuCj4+IGFwcGx5IHRoZXNlIGRpcmVjdGx5Lgo+Pgo+PiBbLi4uXQo+IEFwcGxpZWQg
dG8gNi42L3Njc2ktcXVldWUsIHRoYW5rcyEKPgo+IFswNy8xN10gc2NzaTogcWxvZ2ljcHRpOiBt
YXJrIHFsb2dpY3B0aV9pbmZvKCkgc3RhdGljCj4gICAgICAgICAgaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9ta3Avc2NzaS9jLzcxY2M0ODYzMzVjNAo+IFsxMS8xN10gc2NzaTogZ3ZwMTE6IHJlbW92
ZSB1bnVzZWQgZ3ZwMTFfc2V0dXAoKSBmdW5jdGlvbgo+ICAgICAgICAgIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvbWtwL3Njc2kvYy9iZmFhNGEwY2UxYmIKCkkgc29tZWhvdyBtaXNzZWQgdGhhdCBv
bmUgLi4uCgpUaGUgZ3ZwMTFfc2V0dXAoKSBmdW5jdGlvbiB3YXMgcHJvYmFibHkgYSByZWxpYyBm
cm9tIHRoZSB0aW1lcyBiZWZvcmUgCm1vZHVsZSBwYXJhbWV0ZXJzLgoKU2luY2UgZ3ZwMTFfeGZl
cl9tYXNrIGFwcGVhcnMgdG8gYmUgcmVxdWlyZWQgZm9yIHNvbWUgQW1pZ2Egc3lzdGVtcyB0byAK
c2V0IHRoZSBETUEgbWFzaywgSSdkIGJlc3Qgc2VuZCBhIHBhdGNoIHRvIGFkZCBzdWNoIGEgbW9k
dWxlIHBhcmFtZXRlciAuLi4KCkRvIHlvdSBrbm93IGFueSBkZXRhaWxzIGFyb3VuZCB0aGUgdXNl
IG9mIERNQSBtYXNrcyBmb3IgQW1pZ2EgV0QzM0M5MyAKZHJpdmVycywgR2VlcnQ/CgpDaGVlcnMs
CgogwqDCoMKgIE1pY2hhZWwKCgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
