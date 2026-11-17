Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2D0606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 17:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=utfACUoP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WEzmYKAC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1ZfZjdYdTvF+jZRpy50NPTsaAt/GfAJkc1HSUUTSeXQ=; b=utfACUoPs0SNtgrag0f+h1oMgZ
	YhpjH0B8Se1EC9N5oLJ0tCXLL1kXncrwQ9j71K/9nHeAW2iS5tD8ZCmTkYVD74YdPMZK9CA+TOFN7
	g+SDA8R1kEDP4LTfPf24nzfJhWtEcKcvbWWQjYjJkiBgAwmIYCvzsbijpIgzxeO3pTtkSbcV3OL+z
	w8HQ8tmYFxssyRHnu3PgVih6pzfbnxD6zVtKQ0sU2IaMJCAEGsHVFV/v0WCVSgqClCvJ+0OS3nr6W
	T6Ui4GVVkggvQpWdVFIQyaamJN+MUzAYKiOYW/Ngep5axs9h8MAoPYyVxvn4+Y5qtP9R+F3Jy/bif
	rAu5o3xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMmW-00000006VfL-3i8u;
	Tue, 17 Nov 2026 17:15:44 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMmS-00000006Veo-47p5
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 17:15:42 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso87399a12.3
        for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 09:15:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794935739; cv=none;
        d=google.com; s=arc-20260327;
        b=dao4XrC5RInrVZyQ3nk1ArV6rU664ClPPFzYOQuMU6FCihQ5iEYQITfvqD4NL5lg6a
         UqIbX9rjExbURONCUrJNuUteFiLu5To5M4FvT0FdrWqc1dSdWC/zxpVFjF/JBErf3yuV
         xRGtS2pegwKwCfHx1aN3/e4+fy0W4TLDlSHteE2zT7GDMPixo1Ww7eE8oaC4F9NaJQ1n
         igvz/4dgvyz2Rvur/G5YxyJbqe0ImgNyDrIe3PaiA2+p9Z1SRS1/41VUIfOw66j7UJb6
         w1T9FpOYL7FImLKQ5D9PZnn5setyquQSGXzAMcxaXvQf4JMmKL/00KtqGJ7mYkraz9nG
         IMAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ycZWOvsMh7FrRoAyBZL4w1avdQvDxeeSgNXhZZJtJFc=;
        fh=BdJT55SgCrufVEQ1WcaxbzeoiPq5LxZ4h0BMDgZzMAM=;
        b=WfPmLspy0FwJ0LAF1KxowbXhhqS191Pe8z8lzRMPrTgazkBiZXrI35ER1KArWUP06u
         h0auJsAVlo2nVkz8ylW+WmvVm2jld8iWRdAMm9P0NtWuDWEDe5sdqEYyTR2zeX7N91JU
         e4x7EFYANdoyXnrqsD/hcm5OVp3Eyzh7dSh6x2g1/ftY9dZmG538zeaR4txQm2f9qsqs
         dZ0SK5ECqHz559sD0qAIAQE09V1pFNFR5Pxb+U/t4k8QtcHScogIcKv3gfoNg63mu/Tp
         TV2un0+KfYyeNQL5Jf7Z9Vh3VxjnEsFZZKcoXWBhTcM3qmTPc5wHf9hU2JWTyjzyNnT5
         mNvw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935739; x=1795540539; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ycZWOvsMh7FrRoAyBZL4w1avdQvDxeeSgNXhZZJtJFc=;
        b=WEzmYKAC0m+F9927rb4kKKy6152wF2Xn6qJeeO014W/FEuD5tcrGYYRC62ArRItDYA
         9L5ovhQyA6O7iG1rUntkLR5+9GdBlcHxQ7V3tUiCIUroQccOuZhZ1gFaDLtSGCy5xYWs
         lPSl9jexKWsoHEvnlk6mxrYIrq0Wr/7ijvkS/si/MENF2XO0lwyZ+B83vBXsMMJrSprS
         LFA0mG/l7GIIOLkXMzeUdRnvydAdNJ24abRkxwYctcFgSAuWplwQ5R7vwMzy4t60MvIj
         Rbv/qVfZvGHA6Rl6EoP27JoLRBTjpf04ewNhFGAGD8jJG3cvgbhrgeIif7xSZrNytVCR
         H1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935739; x=1795540539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ycZWOvsMh7FrRoAyBZL4w1avdQvDxeeSgNXhZZJtJFc=;
        b=peIuragwcI4XCeSS1Ob9Zyn8AnTyx+cehlZ9kSp0nLjSbIsMbWVmZzMpLmhu0VnWcn
         TYGnl84C7mcNOnglnX9i+kMLaNVvH4X7cufY5FZyz0yGEmCrtfDBoBGl9xDXHUelSeow
         xvBZNqxJQ67hyOMTRRF8SpSjmf+wnry/bynPI5bR6/eXjHKAyv1lr0eXNA5a6S4oRoiJ
         dR7qx4gbqIWyLG9h6iS58wlY0HQQPT3bJwnHrNbFMxGijvE9WvYvYkxHzHNcWxZena8m
         wYkCfsRQ31zDxl5jLgyJ5PU/85sl1C20T0p1asZxqDGRgD/HeW/LH9Dmw2pyJfYglNId
         O+8A==
X-Forwarded-Encrypted: i=1; AL+hErFDQFsuEsjgiKkDqqr55Bt5rIuKG9GCH0gvGh9MJudqlbRySESpluxLbixqWi1PHXMkB5MdxaBX50o=@lists.infradead.org
X-Gm-Message-State: APuU4Z+qVeJFpsv4wG8TGae3jCppJH16YH5OUyPqMipCMt3sPu6nEzyh
	ZaQvzuNq3uOUu2hsHy1GiENWSzKQR/umf0B0jpSMiDdgys//MBEqWXa1ytckuxYmkY3Zbu5S3hg
	EzJ+tfhXWfi2U+tnNGgO4+QwhDBPvQEejYCmQr/E=
X-Gm-Gg: AYBFou3BpZsDdBxvHH/JE3EspBKvaZjcC3VjhYwinSweY000ZqBf3KkiLccGiiEj8Jo
	UKA40zWOV5dS/XD6OlxJC/y8wKlQ8ClcIa/dBsSYccivgdE408C3elITKq+iEtqjqgNdRYZ6t/u
	UP0rEqaadthnfpD6bsoLaN5zYPo6JAVdcQK/OBW3WoEv5nkSfZAiaYRSXRMSR93eFKWOmX2/8Hx
	p3TfKyvSItdPUiTtN8+QDTvQEFFi+31PMqrIYve0tZNkZFN7RHmfsBgxtBji78Q/XwAD2HQMZQ2
	///SAyLQ9zPdaTcOnygtrg4z2iuN9XGw7dTXkREaQ10tIEy/e0OxEmVlOzhDVsgFidZ0mr9hg+G
	5qZnvflr35WAXP6FzvC0GimgovCtsl+36vI788q7Aosd55zFhmeYjd7E/nRhRczZVkD9LRktCT5
	vc1XO3vrTYEEs+enLgZqXyW8K5ClSnJEDKaaDe9eXI67pPlotWss8Ivgd3aLrzDVgNS3WjO3Utr
	8ZPgPXE97QWpo7wLuP1Srogj916Kg==
X-Received: by 2002:a05:6402:42cb:b0:6b1:d439:5c5 with SMTP id
 4fb4d7f45d1cf-6b7c088fadfmr11109937a12.3.1794935738608; Tue, 17 Nov 2026
 09:15:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
 <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-50-556b1d7c6221@gmail.com>
 <edb4f1ae93fff1bea9380dc7fb1d2c8f2570bb67.camel@crapouillou.net>
In-Reply-To: <edb4f1ae93fff1bea9380dc7fb1d2c8f2570bb67.camel@crapouillou.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 10:15:24 -0700
X-Gm-Features: AclHuK9KT8grAZrRLLebF-am9hX1f-i-TowuArJi-sKzS1G3iCSB2RVcRvk6uKs
Message-ID: <CADvTj4qJXb5sUQbDrAj5uY+VDYcP9HOGHuy4j3iA0dQEDF3amw@mail.gmail.com>
Subject: Re: [PATCH v4 50/58] mtd: rawnand: ingenic: retain chip state across removal
To: Paul Cercueil <paul@crapouillou.net>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mips@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_091541_086568_E9EBBC78 
X-CRM114-Status: GOOD (  23.89  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBOb3YgMTcsIDIwMjYgYXQgMzoyOeKAr0FNIFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3Jh
cG91aWxsb3UubmV0PiB3cm90ZToKPgo+IEhpIEphbWVzLAo+Cj4gSSB0cmllZCB0byBhcHBseSBv
biB0b3Agb2YgbXRkL25leHQgYnV0IGl0IGRvZXMgbm90IGFwcGx5IGNsZWFubHkuCj4gU28gd2hh
dCBiYXNlIGFyZSB5b3UgdXNpbmc/CgpGb3IgdjQsIEkgdXNlZCBOQU5EIG5leHQgYXQKMzBkYWFm
M2U3ODk3YjRhOGQ5YjcyZTViMGM4NmRkNmUyYTRkN2Q4NSwgcGx1cyB0aGUgc2VwYXJhdGVseSBw
b3N0ZWQKZml4ZXMgbGlzdGVkIGFzIHByZXJlcXVpc2l0ZS1wYXRjaC1pZCBlbnRyaWVzIGluIHRo
ZSBjb3ZlciBsZXR0ZXIuClRoZSBJbmdlbmljIHBhdGNoIGFsc28gZGVwZW5kcyBvbiB0aGUgZWFy
bGllciBjb3JlIGNoYW5nZXMgaW4gdGhlCnNlcmllcy4KCldpdGggcmVsZWFzZWQgYjQsIHNoYXph
bSAtSCB1c2VzIHRoZSBkZWNsYXJlZCBiYXNlIGFuZCByZXRyaWV2ZXMgdGhvc2UKcHJlcmVxdWlz
aXRlcyBiZWZvcmUgYXBwbHlpbmcgdGhlIHNlcmllcy4gUHJvdmlkZWQgdGhhdCBiYXNlIGNvbW1p
dCBpcwphdmFpbGFibGUgbG9jYWxseSwgdGhpcyByZWNvbnN0cnVjdHMgdGhlIHRyZWUgZm9yIHJl
dmlldzoKCmI0IHNoYXphbSAtSCAtdiA0IFwKICAyMDI2MTExMy1zdWJtaXQtcmF3bmFuZC1yZXRh
aW5lZC1oYW5kbGUtbGlmZXRpbWUtdjEtdjQtMC01NTZiMWQ3YzYyMjFAZ21haWwuY29tCmdpdCBz
d2l0Y2ggLWMgbmFuZC1saWZldGltZS12NC1yZXZpZXcgRkVUQ0hfSEVBRAoKRm9yIGI0IDAuMTct
ZGV2LCBhZGQgLS1tZXJnZS1iYXNlIF9zcGVjaWZpZWQsIHNpbmNlIGl0cyBkZWZhdWx0IGJhc2UK
c2VsZWN0aW9uIGNoYW5nZWQuCgpJIHZlcmlmaWVkIHRoYXQgYWxsIDE2IHByZXJlcXVpc2l0ZXMg
YW5kIDU4IHBhdGNoZXMgYXBwbHkgY2xlYW5seSBvbgp0aGF0IGJhc2UsIGFuZCB0aGUgcmVzdWx0
aW5nIHRyZWUgbWF0Y2hlcyB0aGUgc2VudCB2NC4KCj4KPiBMZSB2ZW5kcmVkaSAxMyBub3ZlbWJy
ZSAyMDI2IMOgIDExOjE1IC0wNzAwLCBKYW1lcyBIaWxsaWFyZCBhIMOpY3JpdCA6Cj4gPiBVbnJl
Z2lzdGVyIGFuZCBkaXNjb25uZWN0IGFsbCBjaGlwcyBiZWZvcmUgcmVsZWFzaW5nIHRoZSBFQ0Mg
cHJvdmlkZXIuCj4gPiBSZXRhaW4gZWFjaCBjaGlwIGFuZCBpdHMgc2hhcmVkIGNvbnRyb2xsZXIg
dW50aWwgdGhlIGZpbmFsIE1URCBwdXQsCj4gPiB3aGlsZSByZWxlYXNpbmcgaGFyZHdhcmUgcmVz
b3VyY2VzIGR1cmluZyBkZXZpY2UgcmVtb3ZhbC4KPiA+Cj4gPiBSdW4gTkFORCBjbGVhbnVwIGR1
cmluZyBkaXNjb25uZWN0aW9uOyB0aGUgZmluYWwgY29yZS1vd25lZCBwdXQgb25seQo+ID4gcmVs
ZWFzZXMgcmV0YWluZWQgYWxsb2NhdGlvbiBhbmQgbGF5b3V0IGRhdGEuCj4gPgo+ID4gQ2M6IEhh
cnZleSBIdW50IDxoYXJ2ZXlodW50bmV4dXNAZ21haWwuY29tPgo+ID4gQ2M6IGxpbnV4LW1pcHNA
dmdlci5rZXJuZWwub3JnCj4gPiBDYzogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5u
ZXQ+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdt
YWlsLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvaW5nZW5p
Y19uYW5kX2Rydi5jIHwgMzkgKysrKysrKysrKysrKysrKystLS0tLS0tCj4gPiAtCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfbmFuZF9kcnYu
Ywo+ID4gYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfbmFuZF9kcnYuYwo+
ID4gaW5kZXggYmRkYTA2YWUwZDcyLi4yODE4ZmZlNzY3OTYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfbmFuZF9kcnYuYwo+ID4gKysrIGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX25hbmRfZHJ2LmMKPiA+IEBAIC0zNjgs
NyArMzY4LDcgQEAgc3RhdGljIGludCBpbmdlbmljX25hbmRfaW5pdF9jaGlwKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UKPiA+ICpwZGV2LAo+ID4gICAgICAgaWYgKElTX0VSUihjcy0+YmFzZSkpCj4g
PiAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGNzLT5iYXNlKTsKPiA+Cj4gPiAtICAgICBu
YW5kID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpuYW5kKSwgR0ZQX0tFUk5FTCk7Cj4gPiAr
ICAgICBuYW5kID0ga3phbGxvY19vYmooKm5hbmQpOwo+ID4gICAgICAgaWYgKCFuYW5kKQo+ID4g
ICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiA+Cj4gPiBAQCAtMzc3LDcgKzM3Nyw3IEBA
IHN0YXRpYyBpbnQgaW5nZW5pY19uYW5kX2luaXRfY2hpcChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
Cj4gPiAqcGRldiwKPiA+ICAgICAgIGlmIChJU19FUlIobmFuZC0+YnVzeV9ncGlvKSkgewo+ID4g
ICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKG5hbmQtPmJ1c3lfZ3Bpbyk7Cj4gPiAgICAgICAg
ICAgICAgIGRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJlcXVlc3QgYnVzeSBHUElPOiAlZFxuIiwg
cmV0KTsKPiA+IC0gICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ICsgICAgICAgICAgICAgZ290
byBmcmVlX2NoaXA7Cj4gPiAgICAgICB9Cj4gPgo+ID4gICAgICAgbmFuZC0+d3BfZ3BpbyA9IGRl
dm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKGRldiwgIndwIiwgR1BJT0RfT1VUX0xPVyk7Cj4gPiBAQCAt
Mzg1LDE1ICszODUsMTcgQEAgc3RhdGljIGludCBpbmdlbmljX25hbmRfaW5pdF9jaGlwKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UKPiA+ICpwZGV2LAo+ID4gICAgICAgaWYgKElTX0VSUihuYW5kLT53
cF9ncGlvKSkgewo+ID4gICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKG5hbmQtPndwX2dwaW8p
Owo+ID4gICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImZhaWxlZCB0byByZXF1ZXN0IFdQIEdQ
SU86ICVkXG4iLCByZXQpOwo+ID4gLSAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKyAgICAg
ICAgICAgICBnb3RvIGZyZWVfY2hpcDsKPiA+ICAgICAgIH0KPiA+Cj4gPiAgICAgICBjaGlwID0g
Jm5hbmQtPmNoaXA7Cj4gPiAgICAgICBtdGQgPSBuYW5kX3RvX210ZChjaGlwKTsKPiA+ICAgICAg
IG10ZC0+bmFtZSA9IGRldm1fa2FzcHJpbnRmKGRldiwgR0ZQX0tFUk5FTCwgIiVzLiVkIiwgZGV2
X25hbWUoZGV2KSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNzLT5iYW5r
KTsKPiA+IC0gICAgIGlmICghbXRkLT5uYW1lKQo+ID4gLSAgICAgICAgICAgICByZXR1cm4gLUVO
T01FTTsKPiA+ICsgICAgIGlmICghbXRkLT5uYW1lKSB7Cj4gPiArICAgICAgICAgICAgIHJldCA9
IC1FTk9NRU07Cj4gPiArICAgICAgICAgICAgIGdvdG8gZnJlZV9jaGlwOwo+ID4gKyAgICAgfQo+
ID4gICAgICAgbXRkLT5wYXJlbnRfZGV2ID0gZGV2Owo+ID4KPiA+ICAgICAgIGNoaXAtPm9wdGlv
bnMgPSBOQU5EX05PX1NVQlBBR0VfV1JJVEU7Cj4gPiBAQCAtNDA0LDE3ICs0MDYsMjcgQEAgc3Rh
dGljIGludCBpbmdlbmljX25hbmRfaW5pdF9jaGlwKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UKPiA+
ICpwZGV2LAo+ID4gICAgICAgY2hpcC0+Y29udHJvbGxlci0+b3BzID0gJmluZ2VuaWNfbmFuZF9j
b250cm9sbGVyX29wczsKPiA+ICAgICAgIHJldCA9IG5hbmRfc2NhbihjaGlwLCAxKTsKPiA+ICAg
ICAgIGlmIChyZXQpCj4gPiAtICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiArICAgICAgICAg
ICAgIGdvdG8gZnJlZV9jaGlwOwo+Cj4gQmxhbmsgbGluZSBoZXJlCj4KPiA+ICsgICAgIHJldCA9
IG5hbmRfc2V0X2xpZmV0aW1lKGNoaXAsIHRvX2luZ2VuaWNfbmFuZChuYW5kX3RvX210ZChjaGlw
KSkpOwo+Cj4gVGhpcyBpcyBxdWl0ZSBjb252b2x1dGVkLCBqdXN0IGRvIG5hbmRfc2V0X2xpZmV0
aW1lKGNoaXAsIG5hbmQpOwo+Cj4gPiArICAgICBpZiAocmV0KSB7Cj4gPiArICAgICAgICAgICAg
IG5hbmRfY2xlYW51cChjaGlwKTsKPiA+ICsgICAgICAgICAgICAgZ290byBmcmVlX2NoaXA7Cj4g
PiArICAgICB9Cj4gPgo+ID4gICAgICAgcmV0ID0gbXRkX2RldmljZV9yZWdpc3RlcihtdGQsIE5V
TEwsIDApOwo+ID4gICAgICAgaWYgKHJldCkgewo+ID4gLSAgICAgICAgICAgICBuYW5kX2NsZWFu
dXAoY2hpcCk7Cj4gPiArICAgICAgICAgICAgIG5hbmRfZGlzY29ubmVjdChjaGlwKTsKPiA+ICsg
ICAgICAgICAgICAgbXRkX3B1dF9tYXN0ZXIobXRkKTsKPiA+ICAgICAgICAgICAgICAgcmV0dXJu
IHJldDsKPiA+ICAgICAgIH0KPiA+Cj4gPiAgICAgICBsaXN0X2FkZF90YWlsKCZuYW5kLT5jaGlw
X2xpc3QsICZuZmMtPmNoaXBzKTsKPiA+Cj4gPiAgICAgICByZXR1cm4gMDsKPiA+ICsKPiA+ICtm
cmVlX2NoaXA6Cj4gPiArICAgICBrZnJlZShuYW5kKTsKPiA+ICsgICAgIHJldHVybiByZXQ7Cj4g
PiAgfQo+ID4KPiA+ICBzdGF0aWMgdm9pZCBpbmdlbmljX25hbmRfY2xlYW51cF9jaGlwcyhzdHJ1
Y3QgaW5nZW5pY19uZmMgKm5mYykKPiA+IEBAIC00MjksOCArNDQxLDkgQEAgc3RhdGljIHZvaWQg
aW5nZW5pY19uYW5kX2NsZWFudXBfY2hpcHMoc3RydWN0IGluZ2VuaWNfbmZjCj4gPiAqbmZjKQo+
ID4gICAgICAgICAgICAgICBjaGlwID0gJmluZ2VuaWNfY2hpcC0+Y2hpcDsKPiA+ICAgICAgICAg
ICAgICAgcmV0ID0gbXRkX2RldmljZV91bnJlZ2lzdGVyKG5hbmRfdG9fbXRkKGNoaXApKTsKPiA+
ICAgICAgICAgICAgICAgV0FSTl9PTihyZXQpOwo+ID4gLSAgICAgICAgICAgICBuYW5kX2NsZWFu
dXAoY2hpcCk7Cj4gPiArICAgICAgICAgICAgIG5hbmRfZGlzY29ubmVjdChjaGlwKTsKPiA+ICAg
ICAgICAgICAgICAgbGlzdF9kZWwoJmluZ2VuaWNfY2hpcC0+Y2hpcF9saXN0KTsKPiA+ICsgICAg
ICAgICAgICAgbXRkX3B1dF9tYXN0ZXIobmFuZF90b19tdGQoY2hpcCkpOwo+ID4gICAgICAgfQo+
ID4gIH0KPiA+Cj4gPiBAQCAtNDc0LDkgKzQ4NywxMiBAQCBzdGF0aWMgaW50IGluZ2VuaWNfbmFu
ZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlCj4gPiAqcGRldikKPiA+ICAgICAgICAgICAg
ICAgcmV0dXJuIC1FTk9ERVY7Cj4gPiAgICAgICB9Cj4gPgo+ID4gLSAgICAgbmZjID0gZGV2bV9r
emFsbG9jKGRldiwgc3RydWN0X3NpemUobmZjLCBjcywgbnVtX2JhbmtzKSwgR0ZQX0tFUk5FTCk7
Cj4gPiArICAgICBuZmMgPSBremFsbG9jKHN0cnVjdF9zaXplKG5mYywgY3MsIG51bV9iYW5rcyks
IEdGUF9LRVJORUwpOwo+ID4gICAgICAgaWYgKCFuZmMpCj4gPiAgICAgICAgICAgICAgIHJldHVy
biAtRU5PTUVNOwo+Cj4gQmxhbmsgbGluZSBoZXJlLgo+Cj4gQ2hlZXJzLAo+IC1QYXVsCj4KPiA+
ICsgICAgIHJldCA9IGRldm1fbmFuZF9jb250cm9sbGVyX2luaXQoZGV2LCAmbmZjLT5jb250cm9s
bGVyLCBuZmMpOwo+ID4gKyAgICAgaWYgKHJldCkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIHJl
dDsKPiA+Cj4gPiAgICAgICBuZmMtPnNvY19pbmZvID0gZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRl
dik7Cj4gPiAgICAgICBpZiAoIW5mYy0+c29jX2luZm8pCj4gPiBAQCAtNDkzLDcgKzUwOSw2IEBA
IHN0YXRpYyBpbnQgaW5nZW5pY19uYW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UKPiA+
ICpwZGV2KQo+ID4gICAgICAgbmZjLT5kZXYgPSBkZXY7Cj4gPiAgICAgICBuZmMtPm51bV9iYW5r
cyA9IG51bV9iYW5rczsKPiA+Cj4gPiAtICAgICBuYW5kX2NvbnRyb2xsZXJfaW5pdCgmbmZjLT5j
b250cm9sbGVyKTsKPiA+ICAgICAgIElOSVRfTElTVF9IRUFEKCZuZmMtPmNoaXBzKTsKPiA+Cj4g
PiAgICAgICByZXQgPSBpbmdlbmljX25hbmRfaW5pdF9jaGlwcyhuZmMsIHBkZXYpOwo+ID4gQEAg
LTUxMSwxMCArNTI2LDEwIEBAIHN0YXRpYyB2b2lkIGluZ2VuaWNfbmFuZF9yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZQo+ID4gKnBkZXYpCj4gPiAgewo+ID4gICAgICAgc3RydWN0IGluZ2Vu
aWNfbmZjICpuZmMgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKPiA+Cj4gPiArICAgICBp
bmdlbmljX25hbmRfY2xlYW51cF9jaGlwcyhuZmMpOwo+ID4gKwo+ID4gICAgICAgaWYgKG5mYy0+
ZWNjKQo+ID4gICAgICAgICAgICAgICBpbmdlbmljX2VjY19yZWxlYXNlKG5mYy0+ZWNjKTsKPiA+
IC0KPiA+IC0gICAgIGluZ2VuaWNfbmFuZF9jbGVhbnVwX2NoaXBzKG5mYyk7Cj4gPiAgfQo+ID4K
PiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGp6X3NvY19pbmZvIGp6NDc0MF9zb2NfaW5mbyA9IHsK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
