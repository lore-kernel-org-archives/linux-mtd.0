Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A06F606A31A
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Nov 2026 00:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lMLDBVhU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Y+Dzutbl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AmLmrMgTqAy13Bya+7C/iwTMyL5gc1BClZ732r+8YbU=; b=lMLDBVhUxo1CNKpFgymFGozXg4
	ZU4COMop+Ll1CQvtBY21QKZE45Ruzn87eAbu+5L43bmWl+BRc08oF+AeJzSjAyZZ3Hr7TbPwTOTxw
	lV07S0sfwhowjPOfqIy/7o74WIHt5nRy/UxWAZ8Jq9Aa51AX41gU6MrgNAmYH4yN+vnhBGx32ZCDi
	K2FcnZUyxhcUKP57kQSy6hlGTU3ThzQq9xCT/7cQNiL4UlbpItI2sVMd5c3cBHvrkaBa6OPjEezfD
	avIsg8XwT6xR78pplc00TQVer5E/IrW5tR/UOLypJYxDwyNfcppJKwBAnUdtND9Yu+MYVc9WEzqBB
	7aQdmZiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNJWA-0000000DluI-09dn;
	Sun, 01 Nov 2026 00:33:50 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNJW3-0000000Dltr-0byM
	for linux-mtd@lists.infradead.org;
	Sun, 01 Nov 2026 00:33:46 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-677bc4704cbso1601752d50.0
        for <linux-mtd@lists.infradead.org>; Sat, 31 Oct 2026 17:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1793493221; x=1794098021; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/OyNuE+u9LVqbLjPn4c642Wjld5y0QKeGGJuFQ0QfKY=;
        b=Y+DzutblKQQxmcilfM1/CR3IMbepmUMA7gmZ0aq6ualHHOAMDTmbXeoM/j7pPr9Hi/
         Gu+fnJotD4A//Ui3o0j2HN8bV+JA2IuLmBLAibNOSagMVu+jh8h1IYMN7ak75g8kLOk/
         XzcZt06G1jgtxs7esxBA3Acue7WyHGNlhK1Io4Vsxw3fZrZSt9gThFHuM3jP1BPClLVA
         eiLExm7oSRXx2YkwMZJj8J/WOuJ2TqMxRAMQI0WYot7cy+fUwf6aUiaGPmyu5uFYxnHq
         C/yzCd2cwmJbL7NH0vBozFKzWg5JegcCKb0ZheEj1ni1k30hveBj2/av42/9Fvt9GB3C
         Qmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793493221; x=1794098021;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/OyNuE+u9LVqbLjPn4c642Wjld5y0QKeGGJuFQ0QfKY=;
        b=ixQQLbJuRfgJMFPlSnzv/haiuR1tSu37tQ+sOfgpSu+N+XXkqDMsLwYKyxkqv5mTcS
         V8QDXwGLl2Ub5ciR3z3w40u0NA0r3Ufzvy80Zro2fSP8QWej7rV06U+uDSIO1XaukhAE
         X7il4shLQhlajmiZlMEJZdzGWhegEi9sqd2WHY+RKWxTgU13vNnGGl38d7qz9XFKbG2r
         VuA+FsJpd3RWipHLZUrM3nfehPodhOugVyXZHKk2LYanaK8h555XKYLg16U3jIrGfL+O
         1UpOfYT/FDrCZpAZXD1v8J/AqKDctSCI4JDpVlxWhZl3jzHf0o55uUNZB2jPBxjQo+zd
         qSsw==
X-Forwarded-Encrypted: i=1; AKwUvBz/KpGdNVU0hLN5lhB5Jf3jLWMdnPh41tcygzLDeVdD7WuEnH1aTd8d+dSRQ9iKczlJv2Xgf0O9wFA=@lists.infradead.org
X-Gm-Message-State: APuU4Z9N/vY0q9L/thznMTg0zrfOmmBVUMgkzeu38fNwwVRD870tHnkB
	xiztK5vnBdrYMFk5iYsVpZ8wjIkm34VENlTo60No6oHx7po27tYoA9/XginCnEn1CJM=
X-Gm-Gg: AYBFou31IK0oQ4j7AGwFBh/lYX/9sD7+y15FVnp3zhqHN/gxCWYj2LoMdEJb68bLToZ
	f2Tw4qq0KCyxtYGXpL2+nqOKKFNN0g6ZJXqEkYCIcKTwQ3CwIENklq0FDcB4ECFuxITVf4aY25L
	NS0WfAQlidcFqsgFEGe/WDWAyVMKsKEGVxrvlwaFqgIvr7ruFQSRVjaQUaR4xteXQo1xCupsl9s
	pQU2k8GzCVzXHlOm2TYPwDHBnVS/5Z77BBL8LAIZdoQ3TtxdJ03K1MpM9Ga7fGFdk8X3aALJnko
	P1rtb46VFuZ8IYGKYHDakY3r08mxTigObNEkVFaocMX6WNU51gXvJL1/9Ph361MG1WSApvV1fAm
	APSeiw59iJ/lrDTxkeCm8xz8JgXt5q0ySDib6uVU4bmehJR0DP1VZecPKhDj2VNKvUM3/nw94aG
	7lKB4vtLSdrPR/FulwXbUsj7aBUaV7f6SWk9KYYMDNidMEq4PwvtgOR2dGfaKDwdOlHjGLoH+OW
	050t6LV27mz2f5NMdepcaMcNWaKdbeSB3Tw8keqjSDXNq/9jcs1p3nKdgYUhoMuM0jSZTLKlkiY
	+19ik2Wxo5gotRw0Zj5bAKI9MxPlCm3PHRg90JrW3/HwmVBY6+9CFPq9rLx765Sk0VzEJEcPUaZ
	/5g0VfUZocOu+OimkH1JQBgz47tqzn1hU0fdEGsEFDQRHxQipZ2vcWjktxWOcX1xdIZHMUtKbzu
	txYBhF2OWUttOh/40WGo8=
X-Received: by 2002:a05:690e:140e:b0:675:3d40:3c34 with SMTP id 956f58d0204a3-67bb3041657mr1552875d50.68.1793493220725;
        Sat, 31 Oct 2026 17:33:40 -0700 (PDT)
Received: from ?IPv6:2600:1700:6476:1430:6f84:fe3e:51d2:f3cd? ([2600:1700:6476:1430:6f84:fe3e:51d2:f3cd])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b7198c65sm28593177b3.36.2026.10.31.17.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 17:33:39 -0700 (PDT)
Message-ID: <39d08fa0b0e45c61dbb4f57ccc911d1235ff9b5f.camel@dubeyko.com>
Subject: Re: [PATCH v2 13/34] hfsplus: don't set SB_RDONLY when creating the
 attributes tree
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
 Jan Kara <jack@suse.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, linux-mm@kvack.org, 
	ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev,
 linux-btrfs@vger.kernel.org, 	gfs2@lists.linux.dev,
 linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-xfs@vger.kernel.org
Date: Sat, 31 Oct 2026 17:33:37 -0700
In-Reply-To: <20261029-work-fs-sb_rdonly-v2-13-2f44f64f0b66@kernel.org>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
	 <20261029-work-fs-sb_rdonly-v2-13-2f44f64f0b66@kernel.org>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.60.1 (by Flathub.org) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_173343_476545_5E047142 
X-CRM114-Status: GOOD (  25.77  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCAyMDI2LTEwLTI5IGF0IDE3OjA3ICswMTAwLCBDaHJpc3RpYW4gQnJhdW5lciB3cm90
ZToKPiBoZnNfYnRyZWVfb3BlbigpIHNldHMgU0JfUkRPTkxZIHdoZW4gdGhlIG1hcCByZWNvcmQg
b2YgYSBiLXRyZWUKPiBkb2Vzbid0Cj4gbWFyayB0aGUgaGVhZGVyIG5vZGUgYXMgdXNlZC4gVGhh
dCdzIGZpbmUgd2hpbGUgbW91bnRpbmcuIEJ1dAo+IGhmc3BsdXNfY3JlYXRlX2F0dHJpYnV0ZXNf
ZmlsZSgpIGNhbGxzIGl0IHRvbyB3aGVuIHRoZSBmaXJzdCBleHRlbmRlZAo+IGF0dHJpYnV0ZSBp
cyBzZXQgb24gYSBmaWxlc3lzdGVtIHRoYXQgaGFzIG5vIGF0dHJpYnV0ZXMgZmlsZSB5ZXQuCj4g
VGhhdAo+IHJ1bnMgb24gdGhlIGxpdmUgZmlsZXN5c3RlbSB3aXRob3V0IHNfdW1vdW50IGFuZCBh
IGZpbGVzeXN0ZW0gbXVzdAo+IG5vdAo+IGNoYW5nZSBTQl9SRE9OTFkgYmVoaW5kIHRoZSBWRlMn
IGJhY2suCj4gCj4gaGZzcGx1c19jcmVhdGVfYXR0cmlidXRlc19maWxlKCkgb3BlbnMgYSB0cmVl
IGl0IGhhcyBqdXN0IGNyZWF0ZWQKPiBpdHNlbGYKPiB3aXRoIHRoZSBoZWFkZXIgbm9kZSBtYXJr
ZWQgYXMgdXNlZCwgc28gdGhlcmUncyBub3RoaW5nIHRvIGNoZWNrCj4gdGhlcmUuCj4gTW92ZSB0
aGUgY2hlY2sgaW50byBoZnNwbHVzX2ZpbGxfc3VwZXIoKSBhbmQgZG8gaXQgZm9yIGV2ZXJ5IHRy
ZWUgaXQKPiBvcGVucy4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLgo+IAo+IFN1Z2dlc3RlZC1ieTog
VmlhY2hlc2xhdiBEdWJleWtvIDxzbGF2YUBkdWJleWtvLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RpYW4gQnJhdW5lciAoQW11dGFibGUpIDxicmF1bmVyQGtlcm5lbC5vcmc+Cj4gLS0tCj4g
wqBmcy9oZnNwbHVzL2J0cmVlLmPCoMKgwqDCoMKgIHwgNDIgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tCj4gLS0tCj4gwqBmcy9oZnNwbHVzL2hmc3BsdXNfZnMuaCB8wqAg
MSArCj4gwqBmcy9oZnNwbHVzL3N1cGVyLmPCoMKgwqDCoMKgIHzCoCA1ICsrKysrCj4gwqAzIGZp
bGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9mcy9oZnNwbHVzL2J0cmVlLmMgYi9mcy9oZnNwbHVzL2J0cmVlLmMKPiBpbmRleCBi
ZDRkYmRiYzhmOTguLjRhNjc1NjkwNTBlMyAxMDA2NDQKPiAtLS0gYS9mcy9oZnNwbHVzL2J0cmVl
LmMKPiArKysgYi9mcy9oZnNwbHVzL2J0cmVlLmMKPiBAQCAtMjcwLDcgKzI3MCw2IEBAIHN0cnVj
dCBoZnNfYnRyZWUgKmhmc19idHJlZV9vcGVuKHN0cnVjdAo+IHN1cGVyX2Jsb2NrICpzYiwgdTMy
IGlkKQo+IMKgCXN0cnVjdCBoZnNfYnRyZWUgKnRyZWU7Cj4gwqAJc3RydWN0IGhmc19idHJlZV9o
ZWFkZXJfcmVjICpoZWFkOwo+IMKgCXN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nOwo+IC0J
c3RydWN0IGhmc19ibm9kZSAqbm9kZTsKPiDCoAlzdHJ1Y3QgaW5vZGUgKmlub2RlOwo+IMKgCXN0
cnVjdCBwYWdlICpwYWdlOwo+IMKgCXVuc2lnbmVkIGludCBzaXplOwo+IEBAIC0zODEsMTkgKzM4
MCw2IEBAIHN0cnVjdCBoZnNfYnRyZWUgKmhmc19idHJlZV9vcGVuKHN0cnVjdAo+IHN1cGVyX2Js
b2NrICpzYiwgdTMyIGlkKQo+IMKgCWt1bm1hcF9sb2NhbChoZWFkKTsKPiDCoAlwdXRfcGFnZShw
YWdlKTsKPiDCoAo+IC0Jbm9kZSA9IGhmc19ibm9kZV9maW5kKHRyZWUsIEhGU1BMVVNfVFJFRV9I
RUFEKTsKPiAtCWlmIChJU19FUlIobm9kZSkpCj4gLQkJZ290byBmcmVlX2lub2RlOwo+IC0KPiAt
CWlmICghaGZzX2JtYXBfdGVzdF9iaXQobm9kZSwgMCkpIHsKPiAtCQlwcl93YXJuKCIoJXMpOiAl
cyAoY25pZCAweCV4KSBtYXAgcmVjb3JkIGludmFsaWQgb3IKPiBiaXRtYXAgY29ycnVwdGlvbiBk
ZXRlY3RlZCwgZm9yY2luZyByZWFkLW9ubHkuXG4iLAo+IC0JCQkJc2ItPnNfaWQsIGhmc19idHJl
ZV9uYW1lKGlkKSwgaWQpOwo+IC0JCXByX3dhcm4oIlJ1biBmc2NrLmhmc3BsdXMgdG8gcmVwYWly
LlxuIik7Cj4gLQkJc2ItPnNfZmxhZ3MgfD0gU0JfUkRPTkxZOwo+IC0JfQo+IC0KPiAtCWhmc19i
bm9kZV9wdXQobm9kZSk7Cj4gLQo+IMKgCXJldHVybiB0cmVlOwo+IMKgCj4gwqAgZmFpbF9wYWdl
Ogo+IEBAIC00MDcsNiArMzkzLDM0IEBAIHN0cnVjdCBoZnNfYnRyZWUgKmhmc19idHJlZV9vcGVu
KHN0cnVjdAo+IHN1cGVyX2Jsb2NrICpzYiwgdTMyIGlkKQo+IMKgCXJldHVybiBOVUxMOwo+IMKg
fQo+IMKgCj4gKy8qCj4gKyAqIENoZWNrIHRoZSBtYXAgcmVjb3JkIG9mIGEgYi10cmVlIGF0IG1v
dW50LiBoZnNfYnRyZWVfb3BlbigpIGNhbid0Cj4gZG8gaXQKPiArICogYmVjYXVzZSBoZnNwbHVz
X2NyZWF0ZV9hdHRyaWJ1dGVzX2ZpbGUoKSBjYWxscyBpdCBvbiB0aGUgbGl2ZQo+IGZpbGVzeXN0
ZW0KPiArICogd2hlcmUgU0JfUkRPTkxZIG11c3Qgbm90IGJlIHNldC4KPiArICovCj4gK2ludCBo
ZnNwbHVzX2J0cmVlX2NoZWNrX21hcChzdHJ1Y3QgaGZzX2J0cmVlICp0cmVlKQo+ICt7Cj4gKwlz
dHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiID0gdHJlZS0+c2I7Cj4gKwlzdHJ1Y3QgaGZzX2Jub2RlICpu
b2RlOwo+ICsKPiArCW5vZGUgPSBoZnNfYm5vZGVfZmluZCh0cmVlLCBIRlNQTFVTX1RSRUVfSEVB
RCk7Cj4gKwlpZiAoSVNfRVJSKG5vZGUpKSB7Cj4gKwkJcHJfZXJyKCJmYWlsZWQgdG8gbG9hZCAl
cyBoZWFkZXIgbm9kZVxuIiwKPiArCQnCoMKgwqDCoMKgwqAgaGZzX2J0cmVlX25hbWUodHJlZS0+
Y25pZCkpOwo+ICsJCXJldHVybiBQVFJfRVJSKG5vZGUpOwo+ICsJfQo+ICsKPiArCWlmICghaGZz
X2JtYXBfdGVzdF9iaXQobm9kZSwgMCkpIHsKPiArCQlwcl93YXJuKCIoJXMpOiAlcyAoY25pZCAw
eCV4KSBtYXAgcmVjb3JkIGludmFsaWQgb3IKPiBiaXRtYXAgY29ycnVwdGlvbiBkZXRlY3RlZCwg
Zm9yY2luZyByZWFkLW9ubHkuXG4iLAo+ICsJCQkJc2ItPnNfaWQsIGhmc19idHJlZV9uYW1lKHRy
ZWUtCj4gPmNuaWQpLCB0cmVlLT5jbmlkKTsKPiArCQlwcl93YXJuKCJSdW4gZnNjay5oZnNwbHVz
IHRvIHJlcGFpci5cbiIpOwo+ICsJCXNiLT5zX2ZsYWdzIHw9IFNCX1JET05MWTsKPiArCX0KPiAr
Cj4gKwloZnNfYm5vZGVfcHV0KG5vZGUpOwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gwqAvKiBS
ZWxlYXNlIHJlc291cmNlcyB1c2VkIGJ5IGEgYnRyZWUgKi8KPiDCoHZvaWQgaGZzX2J0cmVlX2Ns
b3NlKHN0cnVjdCBoZnNfYnRyZWUgKnRyZWUpCj4gwqB7Cj4gZGlmZiAtLWdpdCBhL2ZzL2hmc3Bs
dXMvaGZzcGx1c19mcy5oIGIvZnMvaGZzcGx1cy9oZnNwbHVzX2ZzLmgKPiBpbmRleCA2ZjI0MGY4
N2Y4ZmYuLjU4Yzc4MGIwOWI2ZiAxMDA2NDQKPiAtLS0gYS9mcy9oZnNwbHVzL2hmc3BsdXNfZnMu
aAo+ICsrKyBiL2ZzL2hmc3BsdXMvaGZzcGx1c19mcy5oCj4gQEAgLTM2Miw2ICszNjIsNyBAQCBp
bnQgaGZzcGx1c19ibG9ja19mcmVlKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsCj4gdTMyIG9mZnNl
dCwgdTMyIGNvdW50KTsKPiDCoHUzMiBoZnNwbHVzX2NhbGNfYnRyZWVfY2x1bXBfc2l6ZSh1MzIg
YmxvY2tfc2l6ZSwgdTMyIG5vZGVfc2l6ZSwgdTY0Cj4gc2VjdG9ycywKPiDCoAkJCQnCoCBpbnQg
ZmlsZV9pZCk7Cj4gwqBzdHJ1Y3QgaGZzX2J0cmVlICpoZnNfYnRyZWVfb3BlbihzdHJ1Y3Qgc3Vw
ZXJfYmxvY2sgKnNiLCB1MzIgaWQpOwo+ICtpbnQgaGZzcGx1c19idHJlZV9jaGVja19tYXAoc3Ry
dWN0IGhmc19idHJlZSAqdHJlZSk7Cj4gwqB2b2lkIGhmc19idHJlZV9jbG9zZShzdHJ1Y3QgaGZz
X2J0cmVlICp0cmVlKTsKPiDCoGludCBoZnNfYnRyZWVfd3JpdGUoc3RydWN0IGhmc19idHJlZSAq
dHJlZSk7Cj4gwqBpbnQgaGZzX2JtYXBfcmVzZXJ2ZShzdHJ1Y3QgaGZzX2J0cmVlICp0cmVlLCB1
MzIgcnN2ZF9ub2Rlcyk7Cj4gZGlmZiAtLWdpdCBhL2ZzL2hmc3BsdXMvc3VwZXIuYyBiL2ZzL2hm
c3BsdXMvc3VwZXIuYwo+IGluZGV4IGZmN2Q2YjMzMzZhNi4uNTMyZjIzNTAyZGYzIDEwMDY0NAo+
IC0tLSBhL2ZzL2hmc3BsdXMvc3VwZXIuYwo+ICsrKyBiL2ZzL2hmc3BsdXMvc3VwZXIuYwo+IEBA
IC01NjQsNiArNTY0LDExIEBAIHN0YXRpYyBpbnQgaGZzcGx1c19maWxsX3N1cGVyKHN0cnVjdCBz
dXBlcl9ibG9jawo+ICpzYiwgc3RydWN0IGZzX2NvbnRleHQgKmZjKQo+IMKgCX0KPiDCoAlzYi0+
c194YXR0ciA9IGhmc3BsdXNfeGF0dHJfaGFuZGxlcnM7Cj4gwqAKPiArCWlmIChoZnNwbHVzX2J0
cmVlX2NoZWNrX21hcChzYmktPmV4dF90cmVlKSB8fAo+ICsJwqDCoMKgIGhmc3BsdXNfYnRyZWVf
Y2hlY2tfbWFwKHNiaS0+Y2F0X3RyZWUpIHx8Cj4gKwnCoMKgwqAgKHNiaS0+YXR0cl90cmVlICYm
IGhmc3BsdXNfYnRyZWVfY2hlY2tfbWFwKHNiaS0KPiA+YXR0cl90cmVlKSkpCj4gKwkJZ290byBv
dXRfY2xvc2VfYXR0cl90cmVlOwo+ICsKPiDCoAlpbm9kZSA9IGhmc3BsdXNfaWdldChzYiwgSEZT
UExVU19BTExPQ19DTklEKTsKPiDCoAlpZiAoSVNfRVJSKGlub2RlKSkgewo+IMKgCQlwcl9lcnIo
ImZhaWxlZCB0byBsb2FkIGFsbG9jYXRpb24gZmlsZVxuIik7CgoKTG9va3MgZ29vZC4KClJldmll
d2VkLWJ5OiBWaWFjaGVzbGF2IER1YmV5a28gPHNsYXZhQGR1YmV5a28uY29tPgoKVGhhbmtzLApT
bGF2YS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
