Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAC910F3DCD
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2026 14:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FUtshePYb1JjTacIX08zzPUdEiJYQARUVAyJCfiEzcE=; b=r3t2nhj5ybbZ8A
	ILn/10exxKVTo4g8VNOi9RODYZiOKWB4nZjwzBGgjNuN0OVGpjKZd+4QFzLMCSzVhXep5n8ElymGq
	iKRIfeowb9Ifob55R4hEdb9cU2s1bInMxVLNqXjoV5A3wxNGXiHJTQryLbOx7qCUnjfyoC6Fst4Tm
	ORrrp2vN0smGqxM/aP+sEik+eXYTsGvRx5isFUf4XPbeULFnpaiojPzAzC8XRmLgC1XdVdxdttl13
	/QKjnHYJnjRdZxfO/She3Nr7Imhqb3q42R6h+3HZh9bs3GBCkT2ZA8+kp96+lHkHxv7d5Wy5Km1sS
	niEhCqFVb6i0WJPbAb4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DVa-0000000BPdL-0N4X;
	Mon, 30 Mar 2026 14:22:26 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DVX-0000000BPcl-0OAh
	for linux-mtd@lists.infradead.org;
	Mon, 30 Mar 2026 14:22:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AAB434E427BA;
	Mon, 30 Mar 2026 14:22:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E8B25FFA8;
	Mon, 30 Mar 2026 14:22:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7685710450520;
	Mon, 30 Mar 2026 16:22:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774880539; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=P+TOHPnqWTS0+au25Q+Iw6/W1cExbaPQRvs67MI09EA=;
	b=OcOy7g0CWYr8YyU+iP0AYmitw4QOsaWzpQNIlQqdMW0+aAynROjsjF6WkdOqyOgxXVL/q9
	f/CumuY9K0NYhFbGeuWvx+2H4b7DO1F17ET/RYj7e9E9FpgA+vmzBZyhgbjK8DzLDMz35n
	V6twMyhQkkSWcSt7I15YwqGpjqOm5X4iodNw6bx/r/hJDTH6FuyH/z0iw92N73TYc0bZe7
	T6PKjvLCT0NB2hSxIZQ03oAwvDrEOkjmfQZE2d0112/KsQAXFRmqpSWp+HjWz1zZOYttzX
	e6aPGGiRKOZxOSkLbyKVvFRxghxomo9TRh25dpM27ycM7GKotgAxQTvxo0uqRg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Eliav Farber <farbere@amazon.com>,  <tudor.ambarus@linaro.org>,
  <mwalle@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] mtd: spi-nor: winbond: Fix protection handling
In-Reply-To: <2vxzcy0l1k7g.fsf@kernel.org> (Pratyush Yadav's message of "Mon,
	30 Mar 2026 14:10:59 +0000")
References: <20260218143523.17467-1-farbere@amazon.com>
	<2vxzcy0l1k7g.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 30 Mar 2026 16:22:15 +0200
Message-ID: <87pl4l9z3c.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_072223_462957_4EEC0C7F 
X-CRM114-Status: GOOD (  11.57  )
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

Cj4+IFRoZSBkZXZpY2VzIGRvIG5vdCBjb3JyZWN0bHkgZGVzY3JpYmUgdGhlaXIgU3RhdHVzIFJl
Z2lzdGVyIGxheW91dCBhbmQKPj4gcHJvdGVjdGlvbiBjYXBhYmlsaXRpZXMgKGxvY2tpbmcgZmxh
Z3MsIFRCIGJpdCwgQlAgYml0IGNvbmZpZ3VyYXRpb24pLgo+PiBBcyBhIHJlc3VsdCwgdGhlIHNw
aS1ub3IgY29yZSByZWplY3RzIHByb3RlY3Rpb24gcmVxdWVzdHMgYW5kIGxvY2tpbmcKPj4gb3Bl
cmF0aW9ucyBmYWlsIHdpdGggLUVJTlZBTCwgZS5nLjoKPj4KPj4gICBmbGFzaF9sb2NrIC1sIC9k
ZXYvbXRkMjkKPj4gICBmbGFzaF9sb2NrOiBlcnJvciE6IGNvdWxkIG5vdCBsb2NrIGRldmljZTog
L2Rldi9tdGQyOQo+PiAgIGVycm9yIDIyIChJbnZhbGlkIGFyZ3VtZW50KQo+Pgo+PiBVcGRhdGUg
dGhlIGRldmljZSBmbGFncyB0byBtYXRjaCB0aGUgYWN0dWFsIGhhcmR3YXJlIGJlaGF2aW9yIHNv
IHRoYXQKPj4gbG9ja2luZyBhbmQgdW5sb2NraW5nIHJlZ2lvbnMgd29yayBjb3JyZWN0bHkuCj4+
Cj4+IEFsbCBjaGFuZ2VzIHdlcmUgdmFsaWRhdGVkIHVzaW5nIGZsYXNoX2xvY2sgb24gdGhlIGFm
ZmVjdGVkIGRldmljZXMuCj4KPiBBcHBsaWVkIHBhdGNoZXMgMSBhbmQgMyB0byBzcGktbm9yL25l
eHQuIFRoYW5rcyEKPgo+IFNraXBwZWQgcGF0Y2ggMiBzaW5jZSB5b3Ugc2F5IHRoYXQgeW91IGhh
dmVuJ3QgZ290IGEgZGV2aWNlIHRvIHRlc3QKPiB3aXRoLiBJIGRvbid0IGhhdmUgYSB2ZXJ5IHN0
cm9uZyBvcGluaW9uIG9uIHRoaXMsIGJ1dCBJIGRvIHRoaW5rIHdlCj4gc2hvdWxkIHRlc3QgcGF0
Y2hlcyBvbiByZWFsIGhhcmR3YXJlIGp1c3QgdG8gd2UgZ2V0IHNvbWUgc2FuaXR5IGNoZWNraW5n
Cj4gZm9yIHRoZSBwYXRjaC4KCkhvbmVzdGx5LCBJIGFtIHByZXR0eSBjb252aW5jZWQgcGF0Y2gg
MiBjYW5ub3QgbWFrZSBtb3JlIGhhcm0gYXMgdGhlCmJsb2NrIHByb3RlY3Rpb24gaXMgYWxyZWFk
eSBiYWRseSBicm9rZW4gYnkgbm90IGJlaW5nIGRlc2NyaWJlZCBhdAphbGwuIEZ1cnRoZXJtb3Jl
LCBmb3Igc2ltaWxhciBjaGlwcyBJIGhhdmUsIHRoZXNlIGJpdHMgYXJlIHJlbGV2YW50LCBzbwpJ
IHdvdWxkIHJhdGhlciBiZSBpbiBmYXZvdXIgb2YgZ29pbmcgZm9yd2FyZCB3aXRoIHBhdGNoIDIs
IGJlY2F1c2UgYXQKbW9zdCBpdCB3aWxsIGp1c3Qgbm90IGZpeCB0aGUgYmVoYXZpb3VyIGFzIGl0
IHByZXRlbmRzIGl0IGRvZXMuCgpNeSAyY3RzIDopCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
