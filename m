Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A25C4363D
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 21:12:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 986462071E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 21:12:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CIh40jvz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="FabrGy9I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 986462071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lJDUo+RJsKxWPPrmBRtGqREk1jgkEwQ6bJbySEo48vQ=; b=CIh40jvzSagqgUUkCaBAAXJwT
	Jv9U124wa93i3359HUVtIJbsqKSohVA5mNIYTLiAg9KiVdedgS1XVO9WzEEk5x2w5yBeYLe5zYtY5
	h6ZR7QKF0xCzWf5VUCClFr+jxutYkAJL4HZUTzTUr6v7N/X7EpXY0VzNfxnm1pMalg8VM/t28rQmr
	RKnojha7ZIjms5zkdMkt9bRjBBUKojT/191bo0doTQzVNhSvgWPPw+7MEswHUxIZ0gpSjuewNir0Z
	cW30Kxqt4BFiNibMT29Ov9+f+plAcUzePKVCxphLzQzWemx0luT/oAUWRf4DkmFgCDdXSdWrq9Xe3
	Kzarx9nYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNjNb-0007TI-8t; Wed, 30 Sep 2020 21:11:15 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNjNY-0007Sc-LM
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 21:11:13 +0000
Received: by mail-ej1-x643.google.com with SMTP id qp15so3977763ejb.3
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2020 14:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NOk8c2APRYC30UPRAFHZ43REyMt6GV6fXQhIWNvFDgg=;
 b=FabrGy9IuFyWiliExAguoclEsEauU9gRTELnKIQdlsOf7hvYSfdm63GTuSTenjuRMC
 6x6UyqUApJsDpzU+yIAkGQNXLz3NDAgTLSdgQ0RnT20pbrD5HDjaI7lGsyG+ppEematD
 1+THko9mee0t3jZqlvW5BSuIezwc8yKbqq5FQmYsT/c+LGiYv/LI+sjJroX2uYcqlNFu
 reSCo1poeCyGdLu3UV1Q0/MWR/V0wbfHmJhwiwnp/X3WDzVerDpWyvx7kFj/uhqbtYHK
 dYlp9IUIRSkS47SHRHOII4ixUHwLw89dY1zBK4Xid1AA/s0goko7oK8VHmj1uvjyJA+F
 Wntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NOk8c2APRYC30UPRAFHZ43REyMt6GV6fXQhIWNvFDgg=;
 b=NowGuibw4b9QafC1rlWvWWlW4TaLk310LHnnn3uRRJNwOtpW3G9doiIjnF3wCc9l1N
 bXDCzAauCsub7+v5qcDaIsDTSS531V635GTtm+iSXE7CSvUe8Jp8c+Cw/9P2kWbWwNQa
 XD7cENPNv/FtOqRTJ86d/D9V09oRNpBN1jcjDC1zZRUmrditdNNaZdRAYmFRKx9SVo3Y
 ZAAfMAnLDwvgsvQfgl+ULl3uj9WLDaqp+JdWJHT7EwX4IZOmQQb36vsViMziI5KQSthl
 1QJV5TFlAGZ7q+/qQaYj+qeLVbS0exk2aoiyLM4vy/HpP0v9UjRaMf67FZpG2dohyfVH
 ennA==
X-Gm-Message-State: AOAM533/wzX2F2zCn4IaH9Hs4eJtSDNdoCK9kQnf+yI4Mzlyhu3muaB9
 5UtK2Eixf3BJIQjsCKfVxKWTQhUeMmuApEZxPHCNFQ==
X-Google-Smtp-Source: ABdhPJxQsB31I9zoUXjTlYNVI1WvPMwYEGQGlHAwZDAxOzXWh7mtbCLtKvFkHMJYFECJN4PKTpunKW9XxNtEYYlph/E=
X-Received: by 2002:a17:906:c447:: with SMTP id
 ck7mr4739798ejb.358.1601500269817; 
 Wed, 30 Sep 2020 14:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200930210824.GA12277@embeddedor>
In-Reply-To: <20200930210824.GA12277@embeddedor>
From: Jann Horn <jannh@google.com>
Date: Wed, 30 Sep 2020 23:10:43 +0200
Message-ID: <CAG48ez3X3aZwfde3_2Sc+gdtUGRHfzan6oNFiffAvNzFDSsFDw@mail.gmail.com>
Subject: Re: [PATCH][next] mtd: rawnand: Replace one-element array with
 flexible-array member
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_171112_734440_DCD8AD1A 
X-CRM114-Status: GOOD (  17.43  )
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
Cc: Lucas Stach <dev@lynxeye.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 kernel list <linux-kernel@vger.kernel.org>, Stefan Agner <stefan@agner.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-hardening@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBTZXAgMzAsIDIwMjAgYXQgMTE6MDIgUE0gR3VzdGF2byBBLiBSLiBTaWx2YQo8Z3Vz
dGF2b2Fyc0BrZXJuZWwub3JnPiB3cm90ZToKPiBUaGVyZSBpcyBhIHJlZ3VsYXIgbmVlZCBpbiB0
aGUga2VybmVsIHRvIHByb3ZpZGUgYSB3YXkgdG8gZGVjbGFyZSBoYXZpbmcKPiBhIGR5bmFtaWNh
bGx5IHNpemVkIHNldCBvZiB0cmFpbGluZyBlbGVtZW50cyBpbiBhIHN0cnVjdHVyZS4gS2VybmVs
IGNvZGUKPiBzaG91bGQgYWx3YXlzIHVzZSDigJxmbGV4aWJsZSBhcnJheSBtZW1iZXJz4oCdWzFd
IGZvciB0aGVzZSBjYXNlcy4gVGhlIG9sZGVyCj4gc3R5bGUgb2Ygb25lLWVsZW1lbnQgb3IgemVy
by1sZW5ndGggYXJyYXlzIHNob3VsZCBubyBsb25nZXIgYmUgdXNlZFsyXS4KCkJ1dCB0aGlzIGlz
IG5vdCBzdWNoIGEgY2FzZSwgcmlnaHQ/IElzbid0IHRoaXMgYSB0cnVlIGZpeGVkLXNpemUKYXJy
YXk/IEl0IHNvdW5kcyBsaWtlIHlvdSdyZSBqdXN0IGNoYW5naW5nIGl0IGJlY2F1c2UgaXQKcGF0
dGVybi1tYXRjaGVkIG9uICJhcnJheSBvZiBsZW5ndGggMSBhdCB0aGUgZW5kIG9mIGEgc3RydWN0
Ii4KCj4gUmVmYWN0b3IgdGhlIGNvZGUgYWNjb3JkaW5nIHRvIHRoZSB1c2Ugb2YgYSBmbGV4aWJs
ZS1hcnJheSBtZW1iZXIKPiBpbnN0ZWFkIG9mIGEgb25lLWVsZW1lbnQgYXJyYXkuIEFsc28sIG1h
a2UgdXNlIG9mIHRoZSBzdHJ1Y3Rfc2l6ZSgpCj4gaGVscGVyIHRvIGNhbGN1bGF0ZSB0aGUgc2l6
ZSBvZiB0aGUgYWxsb2NhdGlvbiBmb3IgX25hbmRfLiBJbiBvcmRlcgo+IHRvIGtlZXAgdGhlIGNv
ZGUgYXMgbWFpbnRhaW5hYmxlIGFzIHBvc3NpYmxlIGFuZCB0byBrZWVwIF9jc18gYXMgYW4KPiBh
cnJheSwgYWRkIGEgbmV3IG1hY3JvIENTX04gdG8gYWlkIGluIHRoZSBhbGxvY2F0aW9uIHNpemUg
Y2FsY3VsYXRpb24sCj4gaW4gY2FzZSB0aGVyZSBpcyBhIG5lZWQgZm9yIG1vcmUgQ2hpcCBTZWxl
Y3QgSURzIGluIHRoZSBmdXR1cmUuIEluIHRoZQo+IG1lYW50aW1lLCB0aGUgbWFjcm8gaXMgc2V0
IHRvIDEuIFRoaXMgYWxzbyBhdm9pZHMgaGF2aW5nIHRvIHVzZSBhIG1hZ2ljCj4gbnVtYmVyICcx
JyBhcyB0aGUgbGFzdCBhcmd1bWVudCBmb3Igc3RydWN0X3NpemUoKS4KWy4uLl0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvdGVncmFfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvdGVncmFfbmFuZC5jClsuLi5dCj4gKy8qIE51bWJlciBvZiBDaGlwIFNlbGVjdHMuIEN1
cnJlbnRseSwgb25seSBvbmUuICovCj4gKyNkZWZpbmUgQ1NfTiAgICAgICAgICAgICAgICAgICAx
Cj4gKwo+ICBzdHJ1Y3QgdGVncmFfbmFuZF9jb250cm9sbGVyIHsKPiAgICAgICAgIHN0cnVjdCBu
YW5kX2NvbnRyb2xsZXIgY29udHJvbGxlcjsKPiAgICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldjsK
PiBAQCAtMTgzLDcgKzE4Niw3IEBAIHN0cnVjdCB0ZWdyYV9uYW5kX2NoaXAgewo+ICAgICAgICAg
dTMyIGNvbmZpZzsKPiAgICAgICAgIHUzMiBjb25maWdfZWNjOwo+ICAgICAgICAgdTMyIGJjaF9j
b25maWc7Cj4gLSAgICAgICBpbnQgY3NbMV07Cj4gKyAgICAgICBpbnQgY3NbXTsKPiAgfTsKWy4u
Ll0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
