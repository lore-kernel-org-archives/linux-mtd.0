Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD49C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jan 2022 10:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fnv4hHhm6G8wfu/4Z3pfjV5R9bK+isgWKZkWmE9bLaY=; b=qApNPz9SkzajnK
	UujrqypSRUu5xfTK639QvKFKO2s3A3kPJQkSsCOaquWRpnbnqbMlkBk56anD+qKzue788H01iZ/j1
	Yl41brN+9Z4hfh8/chko76i6fObWFCGhQi9xf71IZytMOwYMfJdfptjzoeiDPHve4qxyqbInWg+QM
	rCEwZCFc2Bwv0r8OONGi99XndDyxyEmrw5/+LyAYI/XHVhawLFIrYAQ2bz2wVrL451VUv2fPOd/tE
	808n3J4U4GOyUbeJzqYxOWIF9yKvU5XEKI34SNyKx8UiayM4vf8CFWN8TAfYo88usBROwKd+9cdqa
	8MPRcafN3Ed9cXYEPS2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCJNO-007Vr1-E7; Tue, 25 Jan 2022 10:48:38 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCJNL-007Vp7-Ic
 for linux-mtd@lists.infradead.org; Tue, 25 Jan 2022 10:48:37 +0000
Received: by mail-lj1-x22a.google.com with SMTP id q22so7422346ljh.7
 for <linux-mtd@lists.infradead.org>; Tue, 25 Jan 2022 02:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kempniu.pl; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gu9HMdud+xkKETJLVBlwtrA+0/HcBrnYD8Y8ONHhjbw=;
 b=XqFH2feDD8JjHKuyp9SAg78+XlDrY5wAyHBaybW3XGs/mxABZasVQZRNrfJkKZPzBX
 41qMQLW4E4vL+Mu4o2jbMQl2B2PMuUHGWBXCK9xTFbDAe8UTaqPWMJz9Bd+N/n050Odg
 b2QDNR2PTuY1IxOGyaiE1MrJ/HNTJqPw6ycYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gu9HMdud+xkKETJLVBlwtrA+0/HcBrnYD8Y8ONHhjbw=;
 b=eT9pDpfRliQO/Yob7toV9FpHfCqm2JNNGSDzOMXbWsj9X5dBeVfudhwk0QXSqVppew
 VYAeQIRquU7bUvuBQV2Rne04Mya74k8AI/eMOKqjfnx3gJsyArXo1IBXilcRDhl63516
 uQJS2TumvXwEOnALVdno/7gkcbCW/RDreI29TGGZhbncIv6EO1REVxIdmbcw+0P71HDx
 Zq/QflLMBxcIjp0ElY2yh3juVfUK0vKn1SKh6fVCsL14eBN0ERHPiyO3UFhDcnoIDjmQ
 aSLDfNaZNTZ3LxH2eGXGR1kpb4+kXcFqcaaRGrHBPL1poyg3Wy9yJ/mtCcX1mR0OKfjB
 Stqw==
X-Gm-Message-State: AOAM532Nvq/K6BcRMAV7eKq/8sNvZyG3tlPg/5fK/Ib+bwZQKlD104dU
 ksGs76bqKJUAFMOjG9qrTKg12Q==
X-Google-Smtp-Source: ABdhPJzoWpgBXJdXeQDWfB/o0rRTP0iziqQCqAaon+GoLfHwtxAwJbWZVBOrVhWYeqHsaZhcJ42FPQ==
X-Received: by 2002:a05:651c:91:: with SMTP id
 17mr2512072ljq.211.1643107711256; 
 Tue, 25 Jan 2022 02:48:31 -0800 (PST)
Received: from larwa.hq.kempniu.pl ([2001:470:64df:111::221])
 by smtp.gmail.com with ESMTPSA id d16sm461896ljj.74.2022.01.25.02.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 02:48:30 -0800 (PST)
From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] mtdchar: add MEMREAD ioctl
Date: Tue, 25 Jan 2022 11:48:18 +0100
Message-Id: <20220125104822.8420-1-kernel@kempniu.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_024835_723958_7F22EFF3 
X-CRM114-Status: GOOD (  12.86  )
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

VGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBhIG5ldyBtdGRjaGFyIGlvY3RsLCBNRU1SRUFELiAgSXRz
IHB1cnBvc2UgaXMgdG8Kc2VydmUgYXMgYSByZWFkIGNvdW50ZXJwYXJ0IG9mIHRoZSBNRU1XUklU
RSBpb2N0bCwgZXhwb3NpbmcgYSBicm9hZGVyCnNldCBvZiBjYXBhYmlsaXRpZXMgZm9yIHJlYWQg
b3BlcmF0aW9ucyAoZS5nLiB1c2Ugb2YgTVREX09QU19BVVRPX09PQiwKYWNjZXNzIHRvIEVDQyBz
dGF0aXN0aWNzKSB0byB1c2VyLXNwYWNlIGFwcGxpY2F0aW9ucyBtYWtpbmcgdXNlIG9mIE1URApk
ZXZpY2VzIHZpYSAvZGV2L210ZCogY2hhcmFjdGVyIGRldmljZXMuCgpDaGFuZ2VzIGZyb20gdjI6
CgogIC0gU3F1YXNoZWQgcGF0Y2ggMS81IGludG8gcGF0Y2ggNS81IHRvIHByZXZlbnQgYnJlYWtp
bmcgYmlzZWN0YWJpbGl0eQogICAgZHVlIHRvIGFuIGluY29tcGF0aWJsZSBBQkkgY2hhbmdlIGJl
dHdlZW4gdGhvc2UgdHdvIHBhdGNoZXMuCiAgICBSZXZpc2VkIGNvbW1pdCBtZXNzYWdlcyBhY2Nv
cmRpbmdseS4KCkNoYW5nZXMgZnJvbSB2MToKCiAgLSBBZGRlZCBwYXRjaGVzIDItNSB3aGljaCBl
bmFibGUgdGhlIG5ldyBNRU1SRUFEIGlvY3RsIHRvIHJlcG9ydCBFQ0MKICAgIHN0YXRpc3RpY3Mg
Zm9yIHRoZSByZWFkIG9wZXJhdGlvbiBiYWNrIHRvIHVzZXIgc3BhY2UuICAoVGhlcmUgYXJlCiAg
ICBvYnZpb3VzbHkgZGlmZmVyZW50IHdheXMgdGhlc2UgY2hhbmdlcyBjYW4gYmUgc3BsaXQgdXAg
aW50byBzZXBhcmF0ZQogICAgY29tbWl0czsgSSB3YXMgYWltaW5nIGZvciBtYXhpbXVtIGVhc2Ug
b2YgcmV2aWV3LikKCiAgLSBUaGUgJ3JldGxlbicgYW5kICdvb2JyZXRsZW4nIGZpZWxkcyB3ZXJl
IG5vdCBzZXQgaW4gdGhlIHN0cnVjdAogICAgbXRkX3JlYWRfcmVxIHJldHVybmVkIHRvIHVzZXJz
cGFjZS4gIFRoaXMgd2FzIGRvbmUgcHJvcGVybHkgaW4KICAgIEJvcmlzJyBvcmlnaW5hbCBkcmFm
dCBwYXRjaCBbMV0sIGJ1dCBJIG1pc3NlZCBpdCBpbiBteSB2MS4KCiAgLSBJbnZhbGlkIElTX0VS
UigpIGNoZWNrcyB3ZXJlIHJlcGxhY2VkIHdpdGggTlVMTCBjaGVja3MuICBUaGlzIHdhcyBhbgog
ICAgYXJ0aWZhY3Qgb2YgY29weS1wYXN0aW5nIG10ZGNoYXJfd3JpdGVfaW9jdGwoKSBpbiB2MTog
dW5saWtlCiAgICBtZW1kdXBfdXNlcigpIHVzZWQgdGhlcmVpbiwga21hbGxvYygpIGFsd2F5cyBy
ZXR1cm5zIE5VTEwgb24gZXJyb3IuCgogIC0gTWlub3Igc3ViamVjdCBwcmVmaXggYWRqdXN0bWVu
dCBmb3IgcGF0Y2ggMS81ICgibXRkIiAtPiAibXRkY2hhciIpLgoKTWljaGHFgiBLxJlwaWXFhCAo
NCk6CiAgbXRkOiB0cmFjayBtYXhpbXVtIG51bWJlciBvZiBiaXRmbGlwcyBmb3IgZWFjaCByZWFk
IHJlcXVlc3QKICBtdGQ6IGFsd2F5cyBpbml0aWFsaXplICdzdGF0cycgaW4gc3RydWN0IG10ZF9v
b2Jfb3BzCiAgbXRkOiBhZGQgRUNDIGVycm9yIGFjY291bnRpbmcgZm9yIGVhY2ggcmVhZCByZXF1
ZXN0CiAgbXRkY2hhcjogYWRkIE1FTVJFQUQgaW9jdGwKCiBkcml2ZXJzL210ZC9kZXZpY2VzL2Rv
Y2czLmMgICAgICAgICAgICAgfCAgIDggKysKIGRyaXZlcnMvbXRkL2luZnRsY29yZS5jICAgICAg
ICAgICAgICAgICB8ICAgNiArLQogZHJpdmVycy9tdGQvbXRkY2hhci5jICAgICAgICAgICAgICAg
ICAgIHwgMTM2ICsrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9tdGQvbXRkY29yZS5j
ICAgICAgICAgICAgICAgICAgIHwgICA1ICsKIGRyaXZlcnMvbXRkL210ZHN3YXAuYyAgICAgICAg
ICAgICAgICAgICB8ICAgNiArLQogZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFz
ZS5jIHwgIDE2ICsrLQogZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmJ0LmMgIHwg
ICAyICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyAgICAgICAgfCAgMTAgKysK
IGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmJ0LmMgICAgICAgICB8ICAgOCArLQogZHJpdmVy
cy9tdGQvbmFuZC9yYXcvc21fY29tbW9uLmMgICAgICAgIHwgICAyICstCiBkcml2ZXJzL210ZC9u
YW5kL3NwaS9jb3JlLmMgICAgICAgICAgICAgfCAgMTAgKysKIGRyaXZlcnMvbXRkL25mdGxjb3Jl
LmMgICAgICAgICAgICAgICAgICB8ICAgNiArLQogZHJpdmVycy9tdGQvc21fZnRsLmMgICAgICAg
ICAgICAgICAgICAgIHwgICA0ICstCiBkcml2ZXJzL210ZC9zc2ZkYy5jICAgICAgICAgICAgICAg
ICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvbXRkL3Rlc3RzL25hbmRiaXRlcnJzLmMgICAgICAgICB8
ICAgMiArLQogZHJpdmVycy9tdGQvdGVzdHMvb29idGVzdC5jICAgICAgICAgICAgIHwgICA4ICst
CiBkcml2ZXJzL210ZC90ZXN0cy9yZWFkdGVzdC5jICAgICAgICAgICAgfCAgIDIgKy0KIGZzL2pm
ZnMyL3didWYuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNiArLQogaW5jbHVkZS9saW51
eC9tdGQvbXRkLmggICAgICAgICAgICAgICAgIHwgICA3ICsrCiBpbmNsdWRlL3VhcGkvbXRkL210
ZC1hYmkuaCAgICAgICAgICAgICAgfCAgNjQgKysrKysrKysrKy0KIDIwIGZpbGVzIGNoYW5nZWQs
IDI3NiBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkKCi0tIAoyLjM0LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
