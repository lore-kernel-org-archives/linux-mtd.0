Return-Path: <SRS0=3D+l=5R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396FEC43331
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Apr 2020 19:49:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0597320737
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Apr 2020 19:49:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RXBkGZfz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bqg0WupP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0597320737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FEzS11SQkxw/F2SGGWxoraaSzsdTw/OwAFl7H2FOhbo=; b=RXBkGZfzgWUe01
	DX9QlYNqg1p/55gfVSYIAC+ZRQsUX3UN6T28sio5YHePtdwwkV43Sz8OH0XO49T5viMNBOKKVDttd
	XvUPD/Sv+/cDozPHC9vjNRkmhwK/0g0AThEybv65pKb51IhA1VnxSWo37q+S0W3sgLfnIsI4YIWIv
	i1wZbzzwJO3Ap2Nm3pKpjNgALVj02cVO/zQMMTczjTfcMMgx5R9P4uo4q4lov5/tRPiazK1+X20qr
	M2WV3IXNYJ0e9EHCc6JWxgokJ33sk4fNpg6vowpFzzxILCzxgKOWnwHoIw1ysNUK7k2d6x0Iq/Okl
	SdbthLzZKJgkI+g2eWtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJjMj-0004MJ-4J; Wed, 01 Apr 2020 19:49:33 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJjMg-0004Ly-V4
 for linux-mtd@lists.infradead.org; Wed, 01 Apr 2020 19:49:32 +0000
Received: by mail-ot1-x342.google.com with SMTP id m2so933909otr.1
 for <linux-mtd@lists.infradead.org>; Wed, 01 Apr 2020 12:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5ctfzD/Fn2uvtGjPXPG1fL7SLdEUv+4zLQI0g9oCkIU=;
 b=Bqg0WupPTkvXDKuXU5slS2kZxi1atj0LqztnydT5rnDrMR7eW0MbRO8SGkrIh7bntw
 aDyKaHOc4ATz05PhvHsf0U82NMA69qjqiXFsv6+e1G+lUMNT8wLIyeFntdIlWo6GZJm8
 JzxylGEMyzz+N8v+qjWEX9FmFdKeTT5STchxattm9YH8NTq8nzoShO1qhwb1ULVyympf
 /uKFh86Aof1vC0ZpUnCN4dxkJCZc3BM88d1xhKBVeaDfo2Ef7kIkJuO2L9oTaHnSRdxf
 0mzxuUDMWHB9ZjaO8Vl7Ga7aM1DeIyPofzUsZC6t1WcbrM7QjUkxXOm2chiTldDg6Avj
 jbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5ctfzD/Fn2uvtGjPXPG1fL7SLdEUv+4zLQI0g9oCkIU=;
 b=uBYsP4Pl2iDYHptpeOSDQ3/Y9o1q+So1hXMeIjpuWSkIftuMUusTyAAN7A+jVb8tmz
 VeS7vOuaDxSeD1ET/WQF51wGysus/R196/zX8smlgwdyvH0wapri4INXMMEtdKbySy2o
 nFRNP+bd6iNdIOzwpKiu9U00M1V02TK5J+iBe79fmyTGZHBQjUg4UOsLg+MCc1n+KKwS
 YbofUZM29xQt0b9FhJPnpG8NKoxq+7MrIW1cE7pv6w6P3EMvF0hB2wUc+ZAUUGPNjQdy
 RwQlo7zAa0ux1IOi9pNOLHBuGzQK7MUWCT5gYOuMcbbUnIqy9+znBkegC6d99JYRY+ut
 f+hQ==
X-Gm-Message-State: ANhLgQ0HwdvlFdAc1MrsxQFMUdDTl/GtTLrWWvVvnmR7hNdCHlCCKP54
 LpfBsyfDzJhi9LZh8q3mdlCUTW0r9uhJq5zwQPlfDKG3
X-Google-Smtp-Source: ADFU+vs0whiOBNTIMXQK+xjYlZnzQR7u3Eg95nZ/ciywfPV0uwW9BTpsqlxz5JtEP2rXMOQ+tsempeYIZf9VsS4Dvr8=
X-Received: by 2002:a4a:2c55:: with SMTP id o82mr18642798ooo.33.1585770569783; 
 Wed, 01 Apr 2020 12:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAP6exY+LQ4Cz3Wq3P=MP78HhHCovMYDfwhpVuASp17h3s2sgMw@mail.gmail.com>
 <CAP6exYJ_jzrB0D=RLXMNeegu4BwQq8raXVOMugkqzX2ZP_JSqw@mail.gmail.com>
 <20200327155608.GM2564@lahna.fi.intel.com> <20200327171907.7a7ffc73@xps13>
 <20200327164802.GN2564@lahna.fi.intel.com> <20200327175238.784cf47c@xps13>
 <CAP6exYJ4-pBBZKA0z8TKPqh_0tKzJadjXEBZk9dc9ij8BJ9Xew@mail.gmail.com>
 <20200327171619.GO2564@lahna.fi.intel.com>
 <CAP6exYJWWT2SFLjPCdjAEEjmZYwqYuTxd_aRaf=xEELmXqfMpA@mail.gmail.com>
 <CAP6exY+p-Chi2R4Y1H8UvcbE6rvEpMiK3UaX2OyBq=ZO6uULpg@mail.gmail.com>
 <20200330060859.GR2564@lahna.fi.intel.com> <20200330092722.2ff41863@xps13>
 <CAP6exY+F2VoEZkwcYp38HNt7NyZucQrdQ8MqQyTQ62U12pAcSw@mail.gmail.com>
 <20200401094148.1786d48a@xps13>
 <CAP6exYJYT23SiRcJUyzVzN6o_pYkakOPs5hPwWYTsjXmk3WXMg@mail.gmail.com>
In-Reply-To: <CAP6exYJYT23SiRcJUyzVzN6o_pYkakOPs5hPwWYTsjXmk3WXMg@mail.gmail.com>
From: ron minnich <rminnich@gmail.com>
Date: Wed, 1 Apr 2020 12:49:17 -0700
Message-ID: <CAP6exYKTBTQiVvBKfrcoJhziT6E=4RE0PFVg77Yp2XLTcKButw@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd/intel-spi: Support cmdline-based partition
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200401_124931_000333_1C0D19DE 
X-CRM114-Status: GOOD (  24.48  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

anVzdCBmeWkgdGhpcyB3b3JrcyBmaW5lIGFuZCBpdCdzIGVhc3kgb24gdGhlIGV5ZXM6Cm10ZHBh
cnRzPVswMDAwOjAwOjFmLjVdOjI1MTY1ODI0KEJJT1MpLC0oc3F1YXNoZnMpCgpzbyBJJ20gcHJl
cGFyaW5nIHRoZSBwYXRjaC4KCk9uIFdlZCwgQXByIDEsIDIwMjAgYXQgODo0MiBBTSByb24gbWlu
bmljaCA8cm1pbm5pY2hAZ21haWwuY29tPiB3cm90ZToKPgo+IHllYWgsIEkgYWdyZWUgd2l0aCB5
b3UsIGFuZCBhbSB3cmFwcGluZyB1cCB0aGUgcGF0Y2ggdG8gc3VwcG9ydCB0aGUgOgo+Cj4gdGhh
bmtzIGZvciB5b3VyIGNvbW1lbnRzIQo+Cj4gcm9uCj4KPiBPbiBXZWQsIEFwciAxLCAyMDIwIGF0
IDEyOjQxIEFNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3Rl
Ogo+ID4KPiA+IEhpIHJvbiwKPiA+Cj4gPiByb24gbWlubmljaCA8cm1pbm5pY2hAZ21haWwuY29t
PiB3cm90ZSBvbiBNb24sIDMwIE1hciAyMDIwIDA4OjUzOjIyCj4gPiAtMDcwMDoKPiA+Cj4gPiA+
IE9uIE1vbiwgTWFyIDMwLCAyMDIwIGF0IDEyOjI3IEFNIE1pcXVlbCBSYXluYWwKPiA+ID4gPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiA+IFdvdWxkIGl0IGJl
IGhhcmQgdG8gc3VwcG9ydCBhbiBleHRyYSAnOicgYWZ0ZXIgdGhlIE1URCBkZXZpY2UgbmFtZT8K
PiA+ID4gPiBUaGlzIHdheSB3b3VsZCB3b3VsZCBhbGxvdyBhbnl0aGluZyBpbnNpZGUgdGhlIG9w
dGlvbmFsICcoJyAnKScgYnV0Cj4gPiA+ID4gd291bGQga2VlcCB0aGUgdHJhaWxpbmcgJzonLgo+
ID4gPiA+Cj4gPiA+ID4gdG9UYXk6Cj4gPiA+ID4gICAgICAgICBtdGRwYXJ0cz1uYW1lOnBhcnQx
LHBhcnQyCj4gPiA+ID4KPiA+ID4gPiBTbzoKPiA+ID4gPiAgICAgICAgIG10ZHBhcnRzPSgwMDAw
OjAwOjFmLjUpOjI1MTY1ODI0KEJJT1MpLC0oc3F1YXNoZnMpCj4gPiA+Cj4gPiA+Cj4gPiA+IEkg
dGhvdWdodCBhYm91dCB0aGF0ICc6JyB0b28uIEl0IGRvZXMgYWRkIGEgYml0IG1vcmUgdG8gdGhl
IGNvZGUsIGFuZAo+ID4gPiBhIGJpdCBtb3JlIGluIHRoZSB3YXkgb2YgZXJyb3IgY2FzZXMuIEkg
YWx3YXlzIHdvcnJ5LCB3aGVuIGNvZGUgaXMKPiA+ID4gZ29pbmcgaW50byBmbGFzaCwKPiA+ID4g
YWJvdXQgZXJyb3JzIHdoZXJlIHNvbWV0aGluZyBsb29rcyBjbG9zZSB0byByaWdodCBidXQgaXMg
d3JvbmcuIChzYXlzCj4gPiA+IHRoZSBwZXJzb24gd2hvIGp1c3QgdHlwZWQgaXQgaW5zdGVhZCBv
ZiBpcyBhIGZldyB0aW1lcyA6LSkKPiA+ID4KPiA+ID4gV2hhdCBpZiB3ZSBkaWQgdGhpczoKPiA+
ID4gbXRkcGFydHM9WzAwMDA6MDA6MWYuNV0yNTE2NTgyNChCSU9TKSwtKHNxdWFzaGZzKQo+ID4g
Pgo+ID4gPiBJcyB0aGUgIl0iICdlbm91Z2ggZGlmZmVyZW50JyB0aGF0IHdlIGRvIG5vdCBuZWVk
IHRoZSAnOic/Cj4gPiA+Cj4gPiA+IEkga2luZCBvZiBsaWtlIHRoZSBbXSBiZXR0ZXIgYW55d2F5
IGFzIGl0IG1ha2VzIHRoZSBtdGRpZCBzdGFuZCBvdXQgYQo+ID4gPiBiaXQgbW9yZSBmcm9tIHRo
ZSBwYXJ0IG5hbWVzPyBCdXQgaXMgaXQgZW5vdWdoIHRoYXQgd2UgZG9uJ3QgbmVlZCB0aGUKPiA+
ID4gJzonPyBXb3VsZCB5b3Ugc3RpbGwgcHJlZmVyIHRoZSAoKSBhcyBvcHBvc2VkIHRvIHRoZSBb
XT8KPiA+Cj4gPiBJIGxpa2UgdGhlIFtdIGFzIHdlbGwsIG1heWJlIG1vcmUgdGhhbiAoKSBiZWNh
dXNlIGF0IGxlYXN0IGl0IGRvZXMgbm90Cj4gPiBjb25mbGljdCB3aXRoIHRoZSBwYXJ0aXRpb24g
bmFtZXMuIEJ1dCBJIHJlYWxseSBwcmVmZXIga2VlcGluZyB0aGUgOiBpZgo+ID4gdGhlIGNvZGUg
aXMgc3RpbGwgcmVhZGFibGUuCj4gPgo+ID4gSXQgaXMgbXVjaCBlYXNpZXIgdG8gZXhwbGFpbiB0
byBwZW9wbGUgOiAiaWYgeW91IGhhdmUgYSA6IGluIHRoZSBuYW1lLAo+ID4gZW5jbG9zZSBpdCB3
aXRoIFtdIi4KPiA+Cj4gPiBUaGFua3MsCj4gPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
