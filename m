Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9903FD4605
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Feb 2026 01:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TqrhcXdvqZW/s+l2Ht4Vt8Hs4xH9jB0SG+is/NyvZpY=; b=y+9r4N/iy7jlnS
	73sMwm4Pbw/TE1iNaeWRUtxXZsxfj+NDPCxZXUGxCilwfAvnht5zhEWBkAEB61P31E5vaNyHdFSXc
	nQhy8c+Wbu3xpSga9CEkORDItyB91xHL/6ObV8753S5i2hCd5Uk6gQFBq5DkfiXqBLC7qP8tIuw+p
	9I6KtUuM6kogs7Olaph5y9J6Q/fgnvOyD87QiFYkw4JdQs5dKs+voGykFVKxwlBEU0mUmB0RKyaRy
	k79bGDbZM3yTK+Zcsi5vALoGUVJLH6AM1fhZxca1wN7oNrYh4ZBa7iOeQN7kK5r33Taz/t7grfGUu
	qWYnuD2P5jEw3ZMEUckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQO5-00000005CU1-3t4v;
	Thu, 26 Feb 2026 01:41:57 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQO2-00000005CTc-0d0X
	for linux-mtd@lists.infradead.org;
	Thu, 26 Feb 2026 01:41:56 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3590c295150so72651a91.1
        for <linux-mtd@lists.infradead.org>; Wed, 25 Feb 2026 17:41:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772070113; cv=none;
        d=google.com; s=arc-20240605;
        b=fUHFxbRWON0jl7V15J5UoK6Tbb7K12PBUvxsCOe2xVQmJkcijUYud1IlYLlNWXSw18
         WaSBNxSuVSmqx4WGtrdJld/zo8vP4kDtltEaHgcpmm3q+OKLiS7GtFz23XKDxKFsHIb8
         qGK/GIO02N/GVNVs/oy53YHKtarRwF5v0OPS2vA0XBd35H8t1i6zs4xPrluulz2dDCfN
         Oui7DmMKw4QnQNAo9bxZaPwQzpfG7Rz/eRWRXMggvRoJ03gALjZEu/1cHnlTWRzOM+qv
         vFR3adXK0IAh0KrUQauwZ4gPaMbjAjeEb53rjRMVdwntt7iVuZTp7KnOLgFm7E5ak+mx
         nrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rqXDxR6r3K3O/MS1HryN8hRV89OcJSerUknDb4iUGVU=;
        fh=5KwncA1qUERxT9xo7LIyvPHbNq2IZ3hH/nxpkV8lLBc=;
        b=VScQeDW3aPelva4b70eGoJI9elQpSCX2yDNs89R/npg0zEWuO1J7hMsmJ7m7hLK1Hf
         cK8XVi4lf43Tuk2nPXpxYYFZrTlE/x7Nlg9YldQ0nrqmGl/Fqy955TTAOYJf6sC3AVrI
         OWZK9BhIjs3k3OP/QONjzta5rydmojaYGqOQRkZ3eltMrRlGvsVaXocsPXWlvXY0v0xP
         NQI3uDSDRUdUytp2uAhsBT6+gQ3qB/TGkHE59tQ8l6F41pkbsFug9UWBQMCb/xWuwrvv
         X++mIGzVrNnUo1GgogamdbEYqSBzRCiAZ8/EhW1+35qcg+NIVfuCMB2dfMYvxbkBtGCu
         7iDw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772070113; x=1772674913; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqXDxR6r3K3O/MS1HryN8hRV89OcJSerUknDb4iUGVU=;
        b=MfbRaKkaKsr1kc5MYnZ5J3OOPe2AePjh+6uoHyeQrRRRZSoI7AV9IrFWjXjppIfmbR
         FBIIDyHOJFPuonXoW/VNT+0skRYJTNjF8kT+sKAGeMUUJXu1SUM6800RkP9xTzqZkY9U
         XhbV4K4hEAxMGioM0Dg4Ki6ouI61bkeQd2ASdg0zhRkHwMl3u6FE17XJ8Dv3BfTbLqS8
         mvh6/+I6BYrghM6aUK61uSszlqxpsFKXsFennUC7ZTqo9GyeioSsNcWSa2e2edPC/zmZ
         69NVpd0osd/Zs0mbzl4Py/D1DBv/f4foifbLDmJFibmuvgAopekh94WTLMN1t+gFcpHM
         hmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772070113; x=1772674913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rqXDxR6r3K3O/MS1HryN8hRV89OcJSerUknDb4iUGVU=;
        b=s8vB/3d1wljchVPFz6k+k7wTs5ZSkEqahJS+z3HEIUdx5kIbSCmICrxR7oR5gHKl59
         QniAYJprbQjXFwC5Z5PyciG30HnF3yANSUE7KmjRfkqNZvPV6uLdSlhhTUZ73opmsaDK
         9dedQZus0bbnafpoQZPAg+TTdqe8juiMA7+1Q16JzafUv12bryidPXX8LfhLgCq9AXJd
         XuAsoBB6i1vBjnYBpjlurCQK8e2/XEsLMQWSshRy1nDssSi6/MCwoU0iME/aNMqou7a9
         RZugE7qVK2VG7I8TTTCwp0MZaQgJMQi64kGv2UCL0ubu4X+K6/flJT29ClY0sDCVtxfV
         yLtA==
X-Forwarded-Encrypted: i=1; AJvYcCUzVDYT3GUovAiPCgqYK2NQcqxQNeVcIFB5eG5UEqUiUinuqbOBK6A/rIVaRil2lE30yFjB2M+Z/jE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwkPLxYIZMjCtAVc1gRmhV/klnmYGIMTrKgRpKtgFO99L42H8b+
	Q/jBpYNCpMFDzi2wOKcNQzWpqWD2/Nz+Otg5nrKz2JcXs3Q1yoxTYrFV4vYX571QXtfyTFGnsj7
	++litITJ6Y/hv3ee7ONz+sGz4yRZ7x5I=
X-Gm-Gg: ATEYQzwUY98lIFMHbWJcLF/ThMk9891z9KxSbRNgXanChshnqd5mRviZw2momeP7MCt
	KulYgn8qSQvAWqLfe3E0RsIQmTc4E2IqDynxamEy5R6G5bZAcrzIafCAw9sMZYzRLNXy27i502M
	hu4YmKsl//Xs+VjpEeZYSkRIgKeUKzXueEATIyuD2ZL6U5WMQNqt7iCGiTSnc7qfKF7rjdzBXeO
	ZHnCT/r0XuxExpyg6KNsJpgZKjKEZlK9tRs2w5ngzLKVTVPUQXIL882R8n15i5cPfKtzmjlTp64
	LycqAVM=
X-Received: by 2002:a17:90b:2e4d:b0:356:2bdb:a375 with SMTP id
 98e67ed59e1d1-3593daf4e60mr634315a91.14.1772070112551; Wed, 25 Feb 2026
 17:41:52 -0800 (PST)
MIME-Version: 1.0
References: <20260225015705.1113199-1-linchengming884@gmail.com>
 <20260225015705.1113199-2-linchengming884@gmail.com> <87ldggq2pb.fsf@bootlin.com>
In-Reply-To: <87ldggq2pb.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Thu, 26 Feb 2026 09:39:54 +0800
X-Gm-Features: AaiRm52FXOgLSZXxD4WwgpVru-DPSpst1rXFD2wx0GOw_KFmuGibYim2rg84h_0
Message-ID: <CAAyq3SYx9jza9Qba5G2AY6Zbg6=3MLcoPgKEkwe_Srv-GWHHmQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: mtd: spinand: Add randomizer
 enable/disable properties
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, 
	Pablo Martin-Gomez <pmartin-gomez@freebox.fr>, Tianling Shen <cnsztl@gmail.com>, 
	Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvinzhou@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_174154_222517_315E42E8 
X-CRM114-Status: GOOD (  24.28  )
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

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8
IDIwMjblubQy5pyIMjXml6XpgLHkuIkg5LiL5Y2IMTE6MTDlr6vpgZPvvJoKPgo+IEhlbGxvIENo
ZW5nIE1pbmcsCj4KPiBPbiAyNS8wMi8yMDI2IGF0IDA5OjU3OjAzICswOCwgQ2hlbmcgTWluZyBM
aW4gPGxpbmNoZW5nbWluZzg4NEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBGcm9tOiBDaGVuZyBN
aW5nIExpbiA8Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+ID4KPiA+IEFkZCAibmFuZC1yYW5k
b21pemVyLWVuYWJsZSIgYW5kICJuYW5kLXJhbmRvbWl6ZXItZGlzYWJsZSIgYm9vbGVhbgo+ID4g
cHJvcGVydGllcy4KPiA+Cj4gPiBUaGVzZSBwcm9wZXJ0aWVzIGFsbG93IGVuYWJsaW5nIG9yIGRp
c2FibGluZyB0aGUgcmFuZG9taXplciBmZWF0dXJlCj4gPiB2aWEgdGhlIGRldmljZSB0cmVlLgo+
ID4KPiA+IEFjY29yZGluZyB0byBKRURFQyBzdGFuZGFyZCBKRVNEMjItQTExN0UsIG5vIHNpbmds
ZSBkYXRhIHBhdHRlcm4KPiA+IHJlcHJlc2VudHMgYSB1bml2ZXJzYWwgd29yc3QtY2FzZSBmb3Ig
YWxsIE5BTkQgZmxhc2ggZmFpbHVyZSBtZWNoYW5pc21zLgo+ID4gRGlmZmVyZW50IHBhdHRlcm5z
LCBzdWNoIGFzIGZ1bGx5IHByb2dyYW1tZWQsIGNoZWNrZXJib2FyZCwgb3IgbW9zdGx5Cj4gPiBl
cmFzZWQsIGNhbiBkaXNwcm9wb3J0aW9uYXRlbHkgc3RyZXNzIHNwZWNpZmljIGNlbGxzIChlLmcu
LCBwcm9ncmFtbWVkLAo+ID4gZXJhc2VkLCBvciB0aG9zZSBpbmZsdWVuY2VkIGJ5IGFkamFjZW50
IHN0YXRlcykuCj4gPgo+ID4gR2l2ZW4gdGhhdCBubyBmaXhlZCBwYXR0ZXJuIGNhbiBjb3ZlciBh
bGwgc2NlbmFyaW9zLCB0aGUgdXNlIG9mIGEKPiA+IHJhbmRvbWl6ZWQgZGF0YSBwYXR0ZXJuIGlz
IGEgcHJhY3RpY2FsIGFuZCBlZmZlY3RpdmUgbWl0aWdhdGlvbiBzdHJhdGVneS4KPiA+IE91ciBo
YXJkd2FyZSBpbXBsZW1lbnRzIGEgcmFuZG9taXplciBmZWF0dXJlIHRoYXQgc2NyYW1ibGVzIHVz
ZXIgZGF0YQo+ID4gYmVmb3JlIGl0IGlzIHdyaXR0ZW4gdG8gdGhlIGZsYXNoIGFuZCByZXN0b3Jl
cyB0aGUgb3JpZ2luYWwgZGF0YSB1cG9uIHJlYWQuCj4gPgo+ID4gVGhpcyBlbnN1cmVzIHRoZSBk
YXRhIHN0b3JlZCBvbiB0aGUgbWVkaWEgaXMgbW9yZSBldmVubHkgZGlzdHJpYnV0ZWQsCj4gPiB0
aHVzIHJlZHVjaW5nIHBhdHRlcm4tZGVwZW5kZW50IGRlZ3JhZGF0aW9uLiBUaGlzIGlzIGVzcGVj
aWFsbHkgY3J1Y2lhbAo+ID4gZm9yIHByZXZlbnRpbmcgZXJyb3JzIGNhdXNlZCBieSB1bmJhbGFu
Y2VkIGRhdGEgKGUuZy4sIGFsbCB6ZXJvcyBvcgo+ID4gYWxsIG9uZXMpIGluIGJsb2NrcyB3aXRo
IGhpZ2ggcHJvZ3JhbS9lcmFzZSAoUC9FKSBjeWNsZSBjb3VudHMuCj4gPiBVbHRpbWF0ZWx5LCB0
aGUgcmFuZG9taXplciBpbXByb3ZlcyB0aGUgbG9uZy10ZXJtIHJlbGlhYmlsaXR5IGFuZAo+ID4g
ZW5kdXJhbmNlIG9mIHRoZSBmbGFzaCBkZXZpY2UuCj4gPgo+ID4gUGxlYXNlIHJlZmVyIHRvIHRo
ZSBmb2xsb3dpbmcgbGluayBmb3IgcmFuZG9taXplciBmZWF0dXJlOgo+ID4gTGluazoKPiA+IGh0
dHBzOi8vd3d3Lm14aWMuY29tLnR3L0xpc3RzL0FwcGxpY2F0aW9uTm90ZS9BdHRhY2htZW50cy8y
MTUxL0FOMTA1MVYxLVRoZSUyMEludHJvZHVjdGlvbiUyMG9mJTIwUmFuZG9taXplciUyMEZlYXR1
cmUlMjBvbiUyME1YMzB4RnhHMjhBRF9NWDM1eEZ4RzI0QUQuCj4KPiBUaGlzIGxpbmsgYnJpbmdz
IG1lIHRvIGEgIldlIGhhdmUgbW92ZWQgdG8gb3VyIG5ldyBob21lIiBwYWdlLgoKSSBhcG9sb2dp
emUgZm9yIHRoZSBicm9rZW4gbGluay4gSSB3aWxsIGZpbmQgdGhlIHVwZGF0ZWQsIGFjdGl2ZSBs
aW5rCmZvciB0aGUgQXBwbGljYXRpb24gTm90ZS4KCj4KPiBBbnlob3csIHRoaXMgTGluayBkb2Vz
IG5vdCBtYWtlIG11Y2ggc2Vuc2UgaW4gdGhlIGJpbmRpbmcuIElmIHRoaXMgaXMgYQo+IHZlcnkg
Z2VuZXJpYyBBTiwgd2h5IG5vdCwgYnV0IG1heWJlIEknZCBtb3ZlIGl0IHRvIHRoZSBTUEkgTkFO
RCBwYXRjaGVzLAo+IGFzIHRoZSBuYW1lIGltcGxpZXMgdGhhdCBpdCBpcyBhIGJpdCBzcGVjaWZp
YyB0byBNYWNyb25peCBjaGlwcy4KCllvdSBhcmUgcmlnaHQgYWJvdXQgdGhlIHBsYWNlbWVudC4g
U2luY2UgdGhlIHJhbmRvbWl6ZXIgZmVhdHVyZSBhbmQgdGhpcwpBTiBhcmUgaW5kZWVkIHNwZWNp
ZmljIHRvIE1hY3Jvbml4IGNoaXBzLCBJIGFncmVlIGl0IG1ha2VzIG11Y2ggbW9yZSBzZW5zZQpp
biB0aGUgZHJpdmVyIHBhdGNoLiBJIHdpbGwgcmVtb3ZlIHRoZSBsaW5rIGZyb20gdGhlIGR0LWJp
bmRpbmcgY29tbWl0Cm1lc3NhZ2UgYW5kIG1vdmUgdGhlIHVwZGF0ZWQgbGluayB0byB0aGUgU1BJ
IE5BTkQgcGF0Y2hlcyBpbiB0aGUgbmV4dAp2ZXJzaW9uLgoKPgo+ID4gU2lnbmVkLW9mZi1ieTog
Q2hlbmcgTWluZyBMaW4gPGNoZW5nbWluZ2xpbkBteGljLmNvbS50dz4KPgo+IE90aGVyd2lzZSBi
b3RoIHRoZSBiaW5kaW5nIGFuZCBjb2RlIGxvb2sgb2sgZnJvbSBteSBQb1YuIFNvIGJlc2lkZXMg
dGhlCj4gTGluayB0aGF0IG11c3QgYmUgbW92ZWQgYW5kIGZpeGVkLCBJJ2xsIHdhaXQgZm9yIGJp
bmRpbmcgYXBwcm92YWwuCj4KPiBUaGFua3MsCj4gTWlxdcOobAoKVGhhbmtzLApDaGVuZyBNaW5n
IExpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
