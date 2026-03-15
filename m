Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91707F3027F
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Mar 2026 23:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+hz1MYzyoDzEVXIyhnHdjTTOdwwrACW5q8UrB0ONs4=; b=peURazQ/PXiU/r
	Og+hzkg/vOm5pYsKsmgesT8aKzthuoeZJhZAru3vGmg/L2fAcTNfiUjX1e/FGSFKXabjmoKz9LuqQ
	AyCF3PgtlVPSMyNaX2xBrrvF8pUi658PgYjXYdyoAljmXisUd5YqPBAtOSxAhL+5jwgeSXsMKgMt7
	MVMtRtFdWNiUFBpJFXv/QUdWmATifMYJ07kK3wCsnKjHbDX1cXWNOWLiHODD6lzhfFFc0QUiKc+ee
	r/ZC2fnLVuCZuun7yw96XFCSTvjQM0ogSI7quk2xXBb5618pcvIM6IrkXg7uVcpOvO6rzX6Q5WlKX
	0mdHBEJwQKQGsHWHDKgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1unx-000000030gm-2avQ;
	Sun, 15 Mar 2026 23:23:29 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1unu-000000030fn-3skH
	for linux-mtd@lists.infradead.org;
	Sun, 15 Mar 2026 23:23:28 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-50906a98ffeso714361cf.0
        for <linux-mtd@lists.infradead.org>; Sun, 15 Mar 2026 16:23:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773617006; cv=none;
        d=google.com; s=arc-20240605;
        b=XGwxTBc/LoBR9nBuNdi/WdX4quZ44m4559X1YBei5qXJN54+TMDbV3ovGzvHQJ27zx
         ZfoqFA5WzfRoAbzqTEFeDk+BZriszvufxDsqYfX3whikVlYJda55TRJ7GVNGv+CMjIbX
         eBrv0TWkC9HWcAUk5EHOfdfdArRLFjV/QcRneWE+zDKyAtmcIq0q3xLbRqRkQ5DjU27r
         zj9yODI4ocZ1uygjKwgF91Y/jjWnp79HA7nflzMOpx+v5qEhxdz+4c2uUBzkfpDIDvLL
         RcFDnARdN539uReew7Fyvv3DcIf1YgQM6anSGiaV8KWAyZQVal/jprN4RbaIACBYEXNh
         UAdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OT8Iw6M557aLYwHQwbfjFt5SgiwLxQR3GJ4aDtnOQyU=;
        fh=Tv1Kr3GVRA7yis4tbez9Vq5zEuI1fHM4NyR3aDrwETw=;
        b=hGyiP/ild7oy8lHgXPeMXKDl+vc0nSRCnDr6FiPXweJiPgfbedIvQt2oSKmVUsPeOJ
         LRGyPJqu2UiAH7wqpGWtpT+VlWjdal9yvGznsXQTTz04gYupR0HIyy89hCRZ8ndwgCMq
         nX5VYdcZtdWA66L3BtCCgLuRYZ0p6gcH2ykCZ3udtmFSpmEWkjTU34bD2OrBwD0ZML2u
         SoGMbHDbi6YQQl5vEG43GwutgDOsq7EL906o//444EPuFEDhDH1z8nJFLxF1Z+lkn7n8
         8Nfpf0cb4FjOC5wcE70zC2b7Za3k7Q3Pnjj1YfwO7qNU9Qi+KUk3Qzy9cMCK+D3wSpqz
         gOlw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773617006; x=1774221806; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OT8Iw6M557aLYwHQwbfjFt5SgiwLxQR3GJ4aDtnOQyU=;
        b=oDCjL7vYxcibvucp70UdNud1iozh9buCQ/S1ubDECEGW/vvrFjBsWob87FT9WAhf9v
         2gwFr+0E4mUKuDmRKK+EJ4HAuohp59xgB9Y9HR0VF4TRajrzj2T1OchbtRKmwnlPnkZV
         Xnd8qLNDpwz5gAdGy4+cZmt3ZHeLQJyEbglZxGWEo3acJ8OHQFZzoQN9AOWGQ7qg5KmS
         5lkJ2ZCrFbJiw4zU3H1R4jaijwYU9eqMD6G67vf4emsRAzQFil0bu8y7bVpoL0Dc81qk
         ZpTwMt0hZuwHHyCXfu05ESUuAswTGzl76uSgIz0Yo55GqIvKSgV71w4vxN3x71L3rqBg
         zOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773617006; x=1774221806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OT8Iw6M557aLYwHQwbfjFt5SgiwLxQR3GJ4aDtnOQyU=;
        b=PbRRimCTuK2E1KZetBrP4IIucIpdgvYmWnh9ng9dcWX1dPX4VHXAuw3WLOlsy2g8l7
         NItAP4DgOqxIy9e94cwQDwQe4JbJK1H4AeIII/S9Iy3Z05Y+2u5mhE7zJCl4knU+OW5T
         8Hi0NFXVc0ZoS19fvocoglk+apSx2vbAMO9+dLXAWqNcr683dvHfdwAJdTKPS/H3Z8hU
         Yo2lcvoEUkmgh7q+KvdggR/hKPUXHKYceyhoYmzsyFygY6YaYA1AHPF4NYR1cyG5JWYL
         wXxRBmgls2CJcZgk6LxRSQjw94pcNzW9PbrnyMiRvPl3I+uc10LJB7J8uEHJOIKOWAkr
         NQgA==
X-Forwarded-Encrypted: i=1; AJvYcCVm+GFFx5b+mafO2MyHafZrOvQOAiYpBmo+9/8hXVtMnRpO7td8KkdD7rS/CLn5CQOoFHvKdSjA+Js=@lists.infradead.org
X-Gm-Message-State: AOJu0YwUeoLVHGX8KpBy1gorDXeZia3sqpBe8bwZbWb0d+hYw/l42nw4
	wTg1BN5rmDbcDbaOdLdfw5D4t7YBb1tYV2I2YO6YaBwY4vHCbrXdTyGnwi42riNfSnYMiXnr4Ko
	kNyuysZGNOxmJk4PYi58r7r/AGG88ioYvAqiNzlfd
X-Gm-Gg: ATEYQzyYNB6hDLLIqxdD0PzSnPME51PF6NkJPBgw9P+mJ0pBd+CIiKAhap0RyWn6NHi
	upXOy11GTx9qxdcZz2EBudqQt8WsGcZS+Wh+qQWvStxX/N+btyFHoYMxj2epm5cTIMmTeUKhtq2
	qCaVCwocAdKho6JI7UBQ/i+MpEuZSfrpxSXypv5RBdo+5QHyQCZeNo2l458J73PpHtegdpmjPMW
	aFDCBraSzh++LTbnJpHFUyMDaQcOM+WDl53CKwZW2IGS0408bcSQjW1fOfnuUymY7j8CQfiSTQ8
	6aUv4K5JV7q+aiAM
X-Received: by 2002:a05:622a:1822:b0:509:1d4b:f86f with SMTP id
 d75a77b69052e-509694fc2a0mr18649221cf.14.1773617005021; Sun, 15 Mar 2026
 16:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773346620.git.ljs@kernel.org> <c5bb61cf789df1ecb32facc29df9749987c7ddfc.1773346620.git.ljs@kernel.org>
In-Reply-To: <c5bb61cf789df1ecb32facc29df9749987c7ddfc.1773346620.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 15 Mar 2026 16:23:14 -0700
X-Gm-Features: AaiRm50msQxab5MfkpLsIIibDHC-kfdIQCyqr3kXogsNup53_Z_U3j15wVPbEHM
Message-ID: <CAJuCfpGd702=Xop3X5Aop9rrScdiAOQEEooTu1gcJqR9pmO5GA@mail.gmail.com>
Subject: Re: [PATCH 02/15] mm: add documentation for the mmap_prepare file
 operation callback
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Bodo Stroesser <bostroesser@gmail.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	Ryan Roberts <ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_162327_012322_981F6159 
X-CRM114-Status: GOOD (  39.59  )
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

T24gVGh1LCBNYXIgMTIsIDIwMjYgYXQgMToyN+KAr1BNIExvcmVuem8gU3RvYWtlcyAoT3JhY2xl
KSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhpcyBkb2N1bWVudGF0aW9uIG1ha2VzIGl0
IGVhc2llciBmb3IgYSBkcml2ZXIvZmlsZSBzeXN0ZW0gaW1wbGVtZW50ZXIgdG8KPiBjb3JyZWN0
bHkgdXNlIHRoaXMgY2FsbGJhY2suCj4KPiBJdCBjb3ZlcnMgdGhlIGZ1bmRhbWVudGFscywgd2hp
bHN0IGludGVudGlvbmFsbHkgbGVhdmluZyB0aGUgbGVzcyBsb3ZlbHkKPiBwb3NzaWJsZSBhY3Rp
b25zIG9uZSBtaWdodCB0YWtlIHVuZG9jdW1lbnRlZCAoZm9yIGluc3RhbmNlIC0gdGhlCj4gc3Vj
Y2Vzc19ob29rLCBlcnJvcl9ob29rIGZpZWxkcyBpbiBtbWFwX2FjdGlvbikuCj4KPiBUaGUgZG9j
dW1lbnQgYWxzbyBjb3ZlcnMgdGhlIG5ldyBWTUEgZmxhZ3MgaW1wbGVtZW50YXRpb24gd2hpY2gg
aXMgdGhlIG9ubHkKPiBvbmUgd2hpY2ggd2lsbCB3b3JrIGNvcnJlY3RseSB3aXRoIG1tYXBfcHJl
cGFyZS4KPgo+IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gU3RvYWtlcyAoT3JhY2xlKSA8bGpzQGtl
cm5lbC5vcmc+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvbW1hcF9wcmVwYXJl
LnJzdCB8IDEzMSArKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEzMSBp
bnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0
ZW1zL21tYXBfcHJlcGFyZS5yc3QKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2ZpbGVz
eXN0ZW1zL21tYXBfcHJlcGFyZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL21tYXBf
cHJlcGFyZS5yc3QKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4u
NzY5MDgyMDBmM2ExCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZmlsZXN5
c3RlbXMvbW1hcF9wcmVwYXJlLnJzdAo+IEBAIC0wLDAgKzEsMTMxIEBACj4gKy4uIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gKwo+ICs9PT09PT09PT09PT09PT09PT09PT09PT09
PT0KPiArbW1hcF9wcmVwYXJlIGNhbGxiYWNrIEhPV1RPCj4gKz09PT09PT09PT09PT09PT09PT09
PT09PT09PQo+ICsKPiArSW50cm9kdWN0aW9uCj4gKyMjIyMjIyMjIyMjIwo+ICsKPiArVGhlIGBz
dHJ1Y3QgZmlsZS0+Zl9vcC0+bW1hcCgpYCBjYWxsYmFjayBoYXMgYmVlbiBkZXByZWNhdGVkIGFz
IGl0IGlzIGJvdGggYQo+ICtzdGFiaWxpdHkgYW5kIHNlY3VyaXR5IHJpc2ssIGFuZCBkb2Vzbid0
IGFsd2F5cyBwZXJtaXQgdGhlIG1lcmdpbmcgb2YgYWRqYWNlbnQKPiArbWFwcGluZ3MgcmVzdWx0
aW5nIGluIHVubmVjZXNzYXJ5IG1lbW9yeSBmcmFnbWVudGF0aW9uLgo+ICsKPiArSXQgaGFzIGJl
ZW4gcmVwbGFjZWQgd2l0aCB0aGUgYGZpbGUtPmZfb3AtPm1tYXBfcHJlcGFyZSgpYCBjYWxsYmFj
ayB3aGljaCBzb2x2ZXMKPiArdGhlc2UgcHJvYmxlbXMuCj4gKwo+ICsjIyBIb3cgVG8gVXNlCj4g
Kwo+ICtJbiB5b3VyIGRyaXZlcidzIGBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zYCBzdHJ1Y3QsIHNw
ZWNpZnkgYW4gYG1tYXBfcHJlcGFyZWAKPiArY2FsbGJhY2sgcmF0aGVyIHRoYW4gYW4gYG1tYXBg
IG9uZSwgZS5nLiBmb3IgZXh0NDoKPiArCj4gKwo+ICsuLiBjb2RlLWJsb2NrOjogQwo+ICsKPiAr
ICAgIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgZXh0NF9maWxlX29wZXJhdGlvbnMgPSB7
Cj4gKyAgICAgICAgLi4uCj4gKyAgICAgICAgLm1tYXBfcHJlcGFyZSAgICA9IGV4dDRfZmlsZV9t
bWFwX3ByZXBhcmUsCj4gKyAgICB9Owo+ICsKPiArVGhpcyBoYXMgYSBzaWduYXR1cmUgb2YgYGlu
dCAoKm1tYXBfcHJlcGFyZSkoc3RydWN0IHZtX2FyZWFfZGVzYyAqKWAuCj4gKwo+ICtFeGFtaW5p
bmcgdGhlIGBzdHJ1Y3Qgdm1fYXJlYV9kZXNjYCB0eXBlOgo+ICsKPiArLi4gY29kZS1ibG9jazo6
IEMKPiArCj4gKyAgICBzdHJ1Y3Qgdm1fYXJlYV9kZXNjIHsKPiArICAgICAgICAvKiBJbW11dGFi
bGUgc3RhdGUuICovCj4gKyAgICAgICAgY29uc3Qgc3RydWN0IG1tX3N0cnVjdCAqY29uc3QgbW07
Cj4gKyAgICAgICAgc3RydWN0IGZpbGUgKmNvbnN0IGZpbGU7IC8qIE1heSB2YXJ5IGZyb20gdm1f
ZmlsZSBpbiBzdGFja2VkIGNhbGxlcnMuICovCj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBzdGFy
dDsKPiArICAgICAgICB1bnNpZ25lZCBsb25nIGVuZDsKPiArCj4gKyAgICAgICAgLyogTXV0YWJs
ZSBmaWVsZHMuIFBvcHVsYXRlZCB3aXRoIGluaXRpYWwgc3RhdGUuICovCj4gKyAgICAgICAgcGdv
ZmZfdCBwZ29mZjsKPiArICAgICAgICBzdHJ1Y3QgZmlsZSAqdm1fZmlsZTsKPiArICAgICAgICB2
bWFfZmxhZ3NfdCB2bWFfZmxhZ3M7Cj4gKyAgICAgICAgcGdwcm90X3QgcGFnZV9wcm90Owo+ICsK
PiArICAgICAgICAvKiBXcml0ZS1vbmx5IGZpZWxkcy4gKi8KPiArICAgICAgICBjb25zdCBzdHJ1
Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3QgKnZtX29wczsKPiArICAgICAgICB2b2lkICpwcml2YXRl
X2RhdGE7Cj4gKwo+ICsgICAgICAgIC8qIFRha2UgZnVydGhlciBhY3Rpb24/ICovCj4gKyAgICAg
ICAgc3RydWN0IG1tYXBfYWN0aW9uIGFjdGlvbjsKClNvLCBhY3Rpb24gc3RpbGwgYmVsb25ncyB0
byAvKiBXcml0ZS1vbmx5IGZpZWxkcy4gKi8gc2VjdGlvbj8gVGhpcyBpcwpuaXRwaWNreSwgYnV0
IGl0IG1pZ2h0IGJlIGJldHRlciB0byBoYXZlIHRoaXMgYXM6CgogICAgICAgIC8qIFdyaXRlLW9u
bHkgZmllbGRzLiAqLwogICAgICAgIGNvbnN0IHN0cnVjdCB2bV9vcGVyYXRpb25zX3N0cnVjdCAq
dm1fb3BzOwogICAgICAgIHZvaWQgKnByaXZhdGVfZGF0YTsKICAgICAgICBzdHJ1Y3QgbW1hcF9h
Y3Rpb24gYWN0aW9uOyAvKiBUYWtlIGZ1cnRoZXIgYWN0aW9uPyAqLwoKPiArICAgIH07Cj4gKwo+
ICtUaGlzIGlzIHN0cmFpZ2h0Zm9yd2FyZCAtIHlvdSBoYXZlIGFsbCB0aGUgZmllbGRzIHlvdSBu
ZWVkIHRvIHNldCB1cCB0aGUKPiArbWFwcGluZywgYW5kIHlvdSBjYW4gdXBkYXRlIHRoZSBtdXRh
YmxlIGFuZCB3cml0YWJsZSBmaWVsZHMsIGZvciBpbnN0YW5jZToKPiArCj4gKy4uIGNvZGUtYmxv
Y2s6OiBDdwo+ICsKPiArICAgIHN0YXRpYyBpbnQgZXh0NF9maWxlX21tYXBfcHJlcGFyZShzdHJ1
Y3Qgdm1fYXJlYV9kZXNjICpkZXNjKQo+ICsgICAgewo+ICsgICAgICAgIGludCByZXQ7Cj4gKyAg
ICAgICAgc3RydWN0IGZpbGUgKmZpbGUgPSBkZXNjLT5maWxlOwo+ICsgICAgICAgIHN0cnVjdCBp
bm9kZSAqaW5vZGUgPSBmaWxlLT5mX21hcHBpbmctPmhvc3Q7Cj4gKwo+ICsgICAgICAgIC4uLgo+
ICsKPiArICAgICAgICBmaWxlX2FjY2Vzc2VkKGZpbGUpOwo+ICsgICAgICAgIGlmIChJU19EQVgo
ZmlsZV9pbm9kZShmaWxlKSkpIHsKPiArICAgICAgICAgICAgZGVzYy0+dm1fb3BzID0gJmV4dDRf
ZGF4X3ZtX29wczsKPiArICAgICAgICAgICAgdm1hX2Rlc2Nfc2V0X2ZsYWdzKGRlc2MsIFZNQV9I
VUdFUEFHRV9CSVQpOwo+ICsgICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAgIGRlc2MtPnZt
X29wcyA9ICZleHQ0X2ZpbGVfdm1fb3BzOwo+ICsgICAgICAgIH0KPiArICAgICAgICByZXR1cm4g
MDsKPiArICAgIH0KPiArCj4gK0ltcG9ydGFudGx5LCB5b3Ugbm8gbG9uZ2VyIGhhdmUgdG8gZGFu
Y2UgYXJvdW5kIHdpdGggcmVmZXJlbmNlIGNvdW50cyBvciBsb2Nrcwo+ICt3aGVuIHVwZGF0aW5n
IHRoZXNlIGZpZWxkcyAtIF9feW91IGNhbiBzaW1wbHkgZ28gYWhlYWQgYW5kIGNoYW5nZSB0aGVt
X18uCj4gKwo+ICtFdmVyeXRoaW5nIGlzIHRha2VuIGNhcmUgb2YgYnkgdGhlIG1hcHBpbmcgY29k
ZS4KPiArCj4gK1ZNQSBGbGFncwo+ICs9PT09PT09PT0KPiArCj4gK0Fsb25nIHdpdGggYG1tYXBf
cHJlcGFyZWAsIFZNQSBmbGFncyBoYXZlIHVuZGVyZ29uZSBhbiBvdmVyaGF1bC4gV2hlcmUgYmVm
b3JlCj4gK3lvdSB3b3VsZCBpbnZva2Ugb25lIG9mIGB2bV9mbGFnc19pbml0KClgLCBgdm1fZmxh
Z3NfcmVzZXQoKWAsIGB2bV9mbGFnc19zZXQoKWAsCj4gK2B2bV9mbGFnc19jbGVhcigpYCwgYW5k
IGB2bV9mbGFnc19tb2QoKWAgdG8gbW9kaWZ5IGZsYWdzIChhbmQgdG8gaGF2ZSB0aGUKPiArbG9j
a2luZyBkb25lIGNvcnJlY3RseSBmb3IgeW91LCB0aGlzIGlzIG5vIGxvbmdlciBuZWNlc3Nhcnku
Cj4gKwo+ICtBbHNvLCB0aGUgbGVnYWN5IGFwcHJvYWNoIG9mIHNwZWNpZnlpbmcgVk1BIGZsYWdz
IHZpYSBgVk1fUkVBRGAsIGBWTV9XUklURWAsCj4gK2V0Yy4gLSBpLmUuIHVzaW5nIGEgYFZNX3h4
eGAgbWFjcm8gaGFzIGNoYW5nZWQgdG9vLgo+ICsKPiArV2hlbiBpbXBsZW1lbnRpbmcgYG1tYXBf
cHJlcGFyZSgpYCwgcmVmZXJlbmNlIGZsYWdzIGJ5IHRoZWlyIGJpdCBudW1iZXIsIGRlZmluZWQK
PiArYXMgYSBgVk1BX3h4eF9CSVRgIG1hY3JvLCBlLmcuIGBWTUFfUkVBRF9CSVRgLCBgVk1BX1dS
SVRFX0JJVGAgZXRjLiwgYW5kIHVzZSBvbmUKPiArb2YgKHdoZXJlIGBkZXNjYCBpcyBhIHBvaW50
ZXIgdG8gYHN0cnVjdCB2bWFfYXJlYV9kZXNjYCk6Cj4gKwo+ICsqIGB2bWFfZGVzY190ZXN0X2Zs
YWdzKGRlc2MsIC4uLilgIC0gU3BlY2lmeSBhIGNvbW1hLXNlcGFyYXRlZCBsaXN0IG9mIGZsYWdz
IHlvdQo+ICsgIHdpc2ggdG8gdGVzdCBmb3IgKHdoZXRoZXIgX2FueV8gYXJlIHNldCksIGUuZy4g
LSBgdm1hX2Rlc2NfdGVzdF9mbGFncyhkZXNjLAo+ICsgIFZNQV9XUklURV9CSVQsIFZNQV9NQVlX
UklURV9CSVQpYCAtIHJldHVybnMgYHRydWVgIGlmIGVpdGhlciBhcmUgc2V0LAo+ICsgIG90aGVy
d2lzZSBgZmFsc2VgLgo+ICsqIGB2bWFfZGVzY19zZXRfZmxhZ3MoZGVzYywgLi4uKWAgLSBVcGRh
dGUgdGhlIFZNQSBkZXNjcmlwdG9yIGZsYWdzIHRvIHNldAo+ICsgIGFkZGl0aW9uYWwgZmxhZ3Mg
c3BlY2lmaWVkIGJ5IGEgY29tbWEtc2VwYXJhdGVkIGxpc3QsCj4gKyAgZS5nLiAtIGB2bWFfZGVz
Y19zZXRfZmxhZ3MoZGVzYywgVk1BX1BGTk1BUF9CSVQsIFZNQV9JT19CSVQpYC4KPiArKiBgdm1h
X2Rlc2NfY2xlYXJfZmxhZ3MoZGVzYywgLi4uKWAgLSBVcGRhdGUgdGhlIFZNQSBkZXNjcmlwdG9y
IGZsYWdzIHRvIGNsZWFyCj4gKyAgZmxhZ3Mgc3BlY2lmaWVkIGJ5IGEgY29tbWEtc2VwYXJhdGVk
IGxpc3QsIGUuZy4gLSBgdm1hX2Rlc2NfY2xlYXJfZmxhZ3MoZGVzYywKPiArICBWTUFfV1JJVEVf
QklULCBWTUFfTUFZV1JJVEVfQklUKWAuCj4gKwo+ICtBY3Rpb25zCj4gKz09PT09PT0KPiArCj4g
K1lvdSBjYW4gbm93IHZlcnkgZWFzaWx5IGhhdmUgYWN0aW9ucyBiZSBwZXJmb3JtZWQgdXBvbiBh
IG1hcHBpbmcgb25jZSBzZXQgdXAgYnkKPiArdXRpbGlzaW5nIHNpbXBsZSBoZWxwZXIgZnVuY3Rp
b25zIGludm9rZWQgdXBvbiB0aGUgYHN0cnVjdCB2bV9hcmVhX2Rlc2NgCj4gK3BvaW50ZXIuIFRo
ZXNlIGFyZToKPiArCj4gKyogYG1tYXBfYWN0aW9uX3JlbWFwKClgIC0gUmVtYXBzIGEgcmFuZ2Ug
Y29uc2lzdGluZyBvbmx5IG9mIFBGTnMgZm9yIGEgc3BlY2lmaWMKPiArICByYW5nZSBzdGFydGlu
ZyBhIHZpcnR1YWwgYWRkcmVzcyBhbmQgUEZOIG51bWJlciBvZiBhIHNldCBzaXplLgo+ICsKPiAr
KiBgbW1hcF9hY3Rpb25fcmVtYXBfZnVsbCgpYCAtIFNhbWUgYXMgYG1tYXBfYWN0aW9uX3JlbWFw
KClgLCBvbmx5IHJlbWFwcyB0aGUKPiArICBlbnRpcmUgbWFwcGluZyBmcm9tIGBzdGFydF9wZm5g
IG9ud2FyZC4KPiArCj4gKyogYG1tYXBfYWN0aW9uX2lvcmVtYXAoKWAgLSBTYW1lIGFzIGBtbWFw
X2FjdGlvbl9yZW1hcCgpYCwgb25seSBwZXJmb3JtcyBhbiBJL08KPiArICByZW1hcC4KPiArCj4g
KyogYG1tYXBfYWN0aW9uX2lvcmVtYXBfZnVsbCgpYCAtIFNhbWUgYXMgYG1tYXBfYWN0aW9uX2lv
cmVtYXAoKWAsIG9ubHkgcmVtYXBzCj4gKyAgdGhlIGVudGlyZSBtYXBwaW5nIGZyb20gYHN0YXJ0
X3BmbmAgb253YXJkLgo+ICsKPiArKipOT1RFOioqIFRoZSAnYWN0aW9uJyBmaWVsZCBzaG91bGQg
bmV2ZXIgbm9ybWFsbHkgYmUgbWFuaXB1bGF0ZWQgZGlyZWN0bHksCj4gK3JhdGhlciB5b3Ugb3Vn
aHQgdG8gdXNlIG9uZSBvZiB0aGVzZSBoZWxwZXJzLgoKSSdtIGd1ZXNzaW5nIHRoZSBzdGFydCBh
bmQgc2l6ZSBwYXJhbWV0ZXJzIHBhc3NlZCB0bwptbWFwX2FjdGlvbl9yZW1hcCgpIGFuZCBzdWNo
IGFyZSByZXN0cmljdGVkIGJ5IHZtX2FyZWFfZGVzYy5zdGFydAp2bV9hcmVhX2Rlc2MuZW5kLiBJ
ZiBzbywgc2hvdWxkIHdlIGRvY3VtZW50IHRob3NlIHJlc3RyaWN0aW9ucyBhbmQKZW5mb3JjZSB0
aGVtIGluIHRoZSBjb2RlPwoKPiArICAgIHN0cnVjdCB2bV9hcmVhX2Rlc2Mgewo+ICsgICAgICAg
IC8qIEltbXV0YWJsZSBzdGF0ZS4gKi8KPiArICAgICAgICBjb25zdCBzdHJ1Y3QgbW1fc3RydWN0
ICpjb25zdCBtbTsKPiArICAgICAgICBzdHJ1Y3QgZmlsZSAqY29uc3QgZmlsZTsgLyogTWF5IHZh
cnkgZnJvbSB2bV9maWxlIGluIHN0YWNrZWQgY2FsbGVycy4gKi8KPiArICAgICAgICB1bnNpZ25l
ZCBsb25nIHN0YXJ0Owo+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgZW5kOwoKCj4gLS0KPiAyLjUz
LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
