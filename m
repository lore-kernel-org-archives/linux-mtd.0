Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0C9C25B47
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Oct 2023 11:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L979kz7GZu7rmM0iFQ4Qk1DD8WZKEFbcBETLP7GDOnA=; b=1CB6IJ442NaL5j
	o+IWsbEavZdZt99Tpcovc6N88YGTLeQLkE3jR11sajEpoT47dAhZ91xblhDCTzdWOEFyzTsEg+T3D
	lnYzxYUGysuPLtr0LRa4PeAVwr52JAMPmmBgkd7NTxn+RrefZOPA4xD+wHmWz1m1lVwCRcQIwAXYF
	jl6mlc3Iy1vfa905Ix6SBxa6X+C/AqImJ7O3pM3xtRuL4XvmkFouUbVUv+3HwWy3acKb2JKUNMyp2
	9epS6XsBobB37rYDTzaFkntWBeD+2Wn07g5qcCZjTGFsO5+o5KuCvqYxiwdIHm8tgwG4JHpCJntKe
	L4dhsVvXo4RB8PK980TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwKrb-00GIqS-2b;
	Fri, 27 Oct 2023 11:18:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwKrY-00GIpd-10
	for linux-mtd@lists.infradead.org;
	Fri, 27 Oct 2023 11:18:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B001DB81975;
	Fri, 27 Oct 2023 11:18:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AACCFC433C8;
	Fri, 27 Oct 2023 11:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698405526;
	bh=ChKI5CnRqli2HtpDxqYBsjQ7jd8800uzKWtd8Vt64oU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HLXTITAHInEv6CDg60jpeXI1TJctnEsGS/2JqotMkdQtv7TEvs3wO0dkdd/AeGMZf
	 JhZ4UmNcDRGStzoSc0uixwv36lkBkwjROEueWNEqQWLzpQgek1uCfhtKOb7VFQXe2c
	 CKdLHqfz1IN71X7/WrbsxqyCbnvV3bt3Cxh9RfKg=
Date: Fri, 27 Oct 2023 13:18:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH reworded] Revert "nvmem: add new config option"
Message-ID: <2023102731-scorebook-equator-3f11@gregkh>
References: <20231023102759.31529-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231023102759.31529-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_041848_495981_DDBBE594 
X-CRM114-Status: GOOD (  12.09  )
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

T24gTW9uLCBPY3QgMjMsIDIwMjMgYXQgMTI6Mjc6NTlQTSArMDIwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBU
aGlzIHJldmVydHMgY29tbWl0IDUxN2YxNGQ5Y2YzNTMzZDVhYjRmZGVkMTk1YWI2ZjgwYTkyZTM3
OGYuCj4gCj4gQ29uZmlnIG9wdGlvbiAibm9fb2Zfbm9kZSIgaXMgbm8gbG9uZ2VyIG5lZWRlZCBz
aW5jZSBhZGRpbmcgYSBtb3JlCj4gZXhwbGljaXQgYW5kIHRhcmdldGVkIG9wdGlvbiAiYWRkX2xl
Z2FjeV9maXhlZF9vZl9jZWxscyIuCj4gCj4gVGhhdCAibm9fb2Zfbm9kZSIgY29uZmlnIG9wdGlv
biB3YXMgbmVlZGVkICplYXJsaWVyKiB0byBoZWxwIG10ZCdzIGNhc2UuCj4gCj4gRFQgbm9kZXMg
b2YgTVREIHBhcnRpdGlvbnMgKHRoYXQgYXJlIGFsc28gTlZNRU0gZGV2aWNlcykgbWF5IGNvbnRh
aW4KPiBzdWJub2Rlcy4gVGhvc2UgU0hPVUxEIE5PVCBiZSB0cmVhdGVkIGFzIE5WTUVNIGZpeGVk
IGNlbGxzLgo+IAo+IFRvIHByZXZlbnQgTlZNRU0gY29yZSBjb2RlIGZyb20gcGFyc2luZyBzdWJu
b2RlcyBhICJub19vZl9ub2RlIiBvcHRpb24KPiB3YXMgYWRkZWQgKGFuZCBzZXQgdG8gdHJ1ZSBp
biBtdGQpIHRvIG1ha2UgZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZSgpIGluCj4gTlZNRU0gYSBuby1v
cC4gVGhhdCB3YXMgYSBiaXQgaGFja3kgYmVjYXVzZSBpdCB3YXMgbWVzc2luZyB3aXRoCj4gIm9m
X25vZGUiIHBvaW50ZXIgdG8gYWNoaWV2ZSBzb21lIHNpZGUtZWZmZWN0Lgo+IAo+IFdpdGggdGhl
IGludHJvZHVjdGlvbiBvZiAiYWRkX2xlZ2FjeV9maXhlZF9vZl9jZWxscyIgY29uZmlnIG9wdGlv
bgo+IHRoaW5ncyBnb3QgbW9yZSBleHBsaWNpdC4gTVREIHN1YnN5c3RlbSBzaW1wbHkgdGVsbHMg
TlZNRU0gd2hlbiB0byBsb29rCj4gZm9yIGZpeGVkIGNlbGxzIGFuZCB0aGVyZSBpcyBubyBuZWVk
IHRvIGhhY2sgIm9mX25vZGUiIHBvaW50ZXIgYW55bW9yZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBS
YWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gUmV2aWV3ZWQtYnk6IE1pcXVlbCBS
YXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU3Jpbml2
YXMgS2FuZGFnYXRsYSA8c3Jpbml2YXMua2FuZGFnYXRsYUBsaW5hcm8ub3JnPgo+IC0tLQo+IEdy
ZWc6IEkgcmV3b3JkZWQgdGhpcyBQQVRDSCdzIGNvbW1pdCBtZXNzYWdlLiBJdCdzIGhvcGVmdWxs
eSBjbGVhciBub3cKPiAgICAgICB0aGF0IHRoaXMgcmV2ZXJ0IGlzIE9LIG9ubHkgd2l0aCB0aGUg
ImFkZF9sZWdhY3lfZml4ZWRfb2ZfY2VsbHMiLgoKTXVjaCBuaWNlciwgbm93IGFwcGxpZWQsIHRo
YW5rcyEKCmdyZWcgay1oCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
