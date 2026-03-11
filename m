Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E497DFD88D8
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 02:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9ZhQPxyUzlOylVcqOc5c0x3dS6NfQ0StJBDkomNp2Q=; b=DOJkhdsh7rtSb6
	pdSEfarWtq5wP873eqaiItqFRJwffuEyVgRLFkKus6ELxBUwoKxNsqEeZsd7j+AEiMZBcYVQpnN52
	71M3ZPPpsugUlzBQhyUDWS9Jx4wTQ8A6k0Xu/skhsJg4Zaug38QQJIgcQ6N2jR3LE4SbAlF4lbmXc
	VRDkeovvdczc+87z/Y68cX4eISZGelm5jvjyygW5zVkmKiGXtn504pMixsMl83SMIpQ+x4CmbER85
	s4PV5OB0R6OR5btvqzfYDf/rb0wyMGyNO8mRHz8rg0xBG8S3HVd0GScEb/93xjQs6IG7pRcGALvoy
	O3FaQ57sZviLr7ZTHWgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w08z4-0000000AWxT-2zBa;
	Wed, 11 Mar 2026 02:07:38 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w08z0-0000000AWvC-37gA
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 02:07:36 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5a1362c9a3cso5630111e87.2
        for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2026 19:07:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773194852; cv=none;
        d=google.com; s=arc-20240605;
        b=aZhnVAcNiy56WhNwZSOnYuyQX/6Mb1ULfCxpf3g2jw8uvj+YaChhj9lBFfny3I3xMM
         yJIErBcTCDkrl8Ai4/vIuwxeBY/ieuJjNZIbu3yfMr3CHOtSDF0ZYEODV1oAJ7tqEqmY
         b+Ne4izNhNlqz5cgMWzNKVSZ0lBCrGwtcTXNkI2YYNHnl7fXovym0vKr2brQjnHhuhFt
         4ApXpOiVkH0u01pZDMnkzLPz1kWupFCIoBosgjmQOyJD/sBTPWJOw6npniIf2GhxGqsq
         KbdtwLGjr/4CRx4POqSWZiVhR9hsAzHATwSK4h7q9+zAawwWCNhE43EXoAOqxTQxBfFq
         dh+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+zLBLQzKjcztDlxJqoLP6w+B6xnZmfHibV4jlBQCebA=;
        fh=LZn+/qIzfeFR3DpbN2RBGxKCrB3n8xMUuAG++GwwR/I=;
        b=j4ik46s1TyMKSfEDhsW2gv2E4MjU4bl3CrB93PKadLCrZ2KqONyWeTYK4UGh8Ctkcv
         Lu7DH5RRXJOASN+HP1pzG0w1Uvn0fdE0JXXlYAB2BVZvPv6NnWZ8O5Mm5Gvma+B98Hce
         Cs7+asHFvEy2sVkLz/pQRuTHwOFON750QQiHh9wuJorQbNDyTh1CqI4Ie2AFrPaxqZwQ
         AcLtUjBgw1I+QIFnrF2/pIqq4SxmFL5/bk2Hae26NOewLLzJXNkU0t1DZv+EdCThNNxY
         bn78DLmNsfj/5klalBkdKTdRLt7JLVDdkyd1GNDlW3GskjILdMq3/rTlwpXEo7oAonCy
         XalA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773194852; x=1773799652; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zLBLQzKjcztDlxJqoLP6w+B6xnZmfHibV4jlBQCebA=;
        b=PzEHk3NiglQgJfhJeYkTNvHoMw/lMyzRA9V2mLe1UJL/g18Kl5oed7i2cWQrfE2o9H
         NtppMWYzqXiTt1DE90qeUS5PBeXZvlJmQQefG64/dNfEKzoXkhIfErg5brmqFdlPxioj
         wfV3X9nVZs+6cC1gihkjV8Kvwed+dWT/5PQxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773194852; x=1773799652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+zLBLQzKjcztDlxJqoLP6w+B6xnZmfHibV4jlBQCebA=;
        b=qjrzleF22gLCdr0eA5vkgleu14RZVbaZRHMLdKBCUvLpRqXdsIbPr9FN89OIauXdy/
         4PzMLH4gGTCxxFzL8WX5mgW3KmHtnA1KvSkC2mVTHufzhAdZH0toWSyLZy3F4cNuK9ul
         V4eey+koeWFJ1utjOgI1R25SofXTrtF2J5qeaawVnbkCSvR4OO/f6TzB3p2CuGqyTFpk
         aZn9JeTepzwZ6Mat/RiZsK3BF+zmhQYlMFwa8kCnUkq/gSpuHxXszJrPl6Ln/HxZlxay
         ke8M/8PjIBkDHTBaQ1EPx3DIWsRwBWx/cbbfmYciMaTGXb8NZABgOdizBU5xXWC6PW/b
         otZg==
X-Forwarded-Encrypted: i=1; AJvYcCX/dlkaDdkcgwDO2tymoTxBclUj+U1hBpF9u54Fwf7GdndZ0Za0muvq9b7GkcuJ8jzAwD5NSsJYbbA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyyD6QTIJTXziD8dPSWxJCbjft3gW/36YSruOLjfyOyJgxfU9f/
	HY+hE8v5ddt8prr6aEOtfvb1gLJHsT/gP9kY7I2KjU64pgUhm/HDnXe3vbxSWikHIL2hh0gQVxR
	13Sj7N9kV9nM0bxa86w+oPJOra1bj3GK0jeN2rOtc
X-Gm-Gg: ATEYQzwOgzb4PiUmBAVzfK0zBY+7ABjQLzt/PJJ9/8WYIweBaDgDaXpXlOrMeYpcBkz
	v5whnSFCIGmIekyNcjR2bpHHY1tONd2zRWVgwTqAKuCRiWB7dyRBZHLIcbxOSaBq5tMGNW0Toa8
	beiPjn8Zf3pQa2IJmvrWI3IVN1Xuq3/gLHE2APrNfVXoX95YQrew4ShXLydR47+LiE86l6N1n9x
	aiLWqbZnnjzZ5sLUUIvsKv4/AoT79uHuNr4Ia93jjOqsSTM3YZB3/DZce16PwUcgtsEbSxFu7BN
	0v/APUOrNA==
X-Received: by 2002:ac2:4427:0:b0:5a1:3134:9bac with SMTP id
 2adb3069b0e04-5a156cbd1bbmr169453e87.28.1773194852284; Tue, 10 Mar 2026
 19:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de> <20260310-b4-is_err_or_null-v1-56-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-56-bd63b656022d@avm.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 11 Mar 2026 11:07:21 +0900
X-Gm-Features: AaiRm5028PWt8n-JnveiRgn8oYMksdR_-_nk4JOkvxMfplWs-GDr7RRk-OxICyw
Message-ID: <CAGXv+5FQAVaJjqhv+Xq-ysOc4SHQn2mCNTgCAp8XocmWBWGGoA@mail.gmail.com>
Subject: Re: [PATCH 56/61] clk: Prefer IS_ERR_OR_NULL over manual NULL check
To: Philipp Hahn <phahn-oss@avm.de>
Cc: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
	bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
	dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	samba-technical@lists.samba.org, sched-ext@lists.linux.dev, 
	target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
	v9fs@lists.linux.dev, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_190734_810618_5BAE36B6 
X-CRM114-Status: GOOD (  21.31  )
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

T24gVHVlLCBNYXIgMTAsIDIwMjYgYXQgOTo1N+KAr1BNIFBoaWxpcHAgSGFobiA8cGhhaG4tb3Nz
QGF2bS5kZT4gd3JvdGU6Cj4KPiBQcmVmZXIgdXNpbmcgSVNfRVJSX09SX05VTEwoKSBvdmVyIHVz
aW5nIElTX0VSUigpIGFuZCBhIG1hbnVhbCBOVUxMCj4gY2hlY2suCj4KPiBTZW1hbnRpY2ggY2hh
bmdlOiBQcmV2aW91c2x5IHRoZSBjb2RlIG9ubHkgcHJpbnRlZCB0aGUgd2FybmluZyBvbiBlcnJv
ciwKPiBidXQgbm90IHdoZW4gdGhlIHBvaW50ZXIgd2FzIE5VTEwuIE5vdyB0aGUgd2FybmluZyBp
cyBwcmludGVkIGluIGJvdGgKPiBjYXNlcyEKPgo+IENoYW5nZSBmb3VuZCB3aXRoIGNvY2NpbmVs
bGUuCj4KPiBUbzogTWljaGFlbCBUdXJxdWV0dGUgPG10dXJxdWV0dGVAYmF5bGlicmUuY29tPgo+
IFRvOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+Cj4gVG86IERhbmllbCBMZXpjYW5v
IDxkYW5pZWwubGV6Y2Fub0BrZXJuZWwub3JnPgo+IFRvOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhA
a2VybmVsLm9yZz4KPiBDYzogbGludXgtY2xrQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcCBIYWhuIDxwaGFo
bi1vc3NAYXZtLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2Nsay9jbGsuYyAgICAgICAgICAgICAgIHwg
NCArKy0tCj4gIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcHhhLmMgfCAyICstCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvY2xrL2Nsay5jIGIvZHJpdmVycy9jbGsvY2xrLmMKPiBpbmRleCA0NzA5M2Nk
YTlkZjMyMjIzYzExMjBjMzcxMDI2MTI5NjAyN2M0Y2QzLi4zNTE0NmUzODY5YTdkZDkzNzQxZDEw
YjcyMjNkNDQ4OGE5MjE2ZWQxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xrL2Nsay5jCj4gKysr
IGIvZHJpdmVycy9jbGsvY2xrLmMKPiBAQCAtNDU1OCw3ICs0NTU4LDcgQEAgdm9pZCBjbGtfdW5y
ZWdpc3RlcihzdHJ1Y3QgY2xrICpjbGspCj4gICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+
ICAgICAgICAgY29uc3Qgc3RydWN0IGNsa19vcHMgKm9wczsKPgo+IC0gICAgICAgaWYgKCFjbGsg
fHwgV0FSTl9PTl9PTkNFKElTX0VSUihjbGspKSkKPiArICAgICAgIGlmIChXQVJOX09OX09OQ0Uo
SVNfRVJSX09SX05VTEwoY2xrKSkpCj4gICAgICAgICAgICAgICAgIHJldHVybjsKPgo+ICAgICAg
ICAgY2xrX2RlYnVnX3VucmVnaXN0ZXIoY2xrLT5jb3JlKTsKPiBAQCAtNDc0NCw3ICs0NzQ0LDcg
QEAgdm9pZCBfX2Nsa19wdXQoc3RydWN0IGNsayAqY2xrKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qg
bW9kdWxlICpvd25lcjsKPgo+IC0gICAgICAgaWYgKCFjbGsgfHwgV0FSTl9PTl9PTkNFKElTX0VS
UihjbGspKSkKPiArICAgICAgIGlmIChXQVJOX09OX09OQ0UoSVNfRVJSX09SX05VTEwoY2xrKSkp
CgpjbGtfZ2V0X29wdGlvbmFsKCkgcmV0dXJucyBOVUxMIGlmIHRoZSBjbGsgaXNuJ3QgcHJlc2Vu
dC4KCkRyaXZlcnMgd291bGQganVzdCBwYXNzIHRoaXMgdG8gY2xrX3B1dCgpLiBZb3VyIGNoYW5n
ZSBoZXJlIHdvdWxkIGNhdXNlCnRoaXMgcGF0dGVybiB0byBlbWl0IGEgdmVyeSBiaWcgd2Fybmlu
Zy4KCkkgZG9uJ3QgdGhpbmsgdGhpcyBjaGFuZ2Ugc2hvdWxkIGJlIGxhbmRlZC4KCgpDaGVuWXUK
Cj4gICAgICAgICAgICAgICAgIHJldHVybjsKPgo+ICAgICAgICAgY2xrX3ByZXBhcmVfbG9jaygp
Owo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXB4YS5jIGIvZHJpdmVy
cy9jbG9ja3NvdXJjZS90aW1lci1weGEuYwo+IGluZGV4IDdhZDBlNWFkYjJmZmFjNDEyNWMzNDcx
MGZjNjdmNGI0NWYzMDMzMWQuLmY2NWZiMGI3ZmMzMThiNzY2MjI3ZTVlN2E0YzBmYjA4YmExMWM4
ZjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1weGEuYwo+ICsrKyBi
L2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcHhhLmMKPiBAQCAtMjE4LDcgKzIxOCw3IEBAIHZv
aWQgX19pbml0IHB4YV90aW1lcl9ub2R0X2luaXQoaW50IGlycSwgdm9pZCBfX2lvbWVtICpiYXNl
KQo+Cj4gICAgICAgICB0aW1lcl9iYXNlID0gYmFzZTsKPiAgICAgICAgIGNsayA9IGNsa19nZXQo
TlVMTCwgIk9TVElNRVIwIik7Cj4gLSAgICAgICBpZiAoY2xrICYmICFJU19FUlIoY2xrKSkgewo+
ICsgICAgICAgaWYgKCFJU19FUlJfT1JfTlVMTChjbGspKSB7Cj4gICAgICAgICAgICAgICAgIGNs
a19wcmVwYXJlX2VuYWJsZShjbGspOwo+ICAgICAgICAgICAgICAgICBweGFfdGltZXJfY29tbW9u
X2luaXQoaXJxLCBjbGtfZ2V0X3JhdGUoY2xrKSk7Cj4gICAgICAgICB9IGVsc2Ugewo+Cj4gLS0K
PiAyLjQzLjAKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
