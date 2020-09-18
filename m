Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24E3C43466
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 18:32:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5338F206D9
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 18:32:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g0itoawi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTNJQYUP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5338F206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:In-Reply-To:
	References:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5fWU+6RwDeure1bMB7KOQJNFtq++lwss4eE7XpSXLMw=; b=g0itoawihYKTWT5jeS1JTzGHt
	Pns4BCBd1bOultRvNtSm+bQIJPmlfiJJjiGx6SQeoyw8pBE/N1AtxHVNdblUjiIWAxQYvQXFawyrw
	KKjqpVPmep/sFUgMSUeBV0ySobOXFACINpOwe2hIRSDBQIvYzo+gr78e7ydx9vGyeGkBNI3rpQBrp
	gpH3SxnZ/KY5brzMNmQ94dwwIHlD6ybti2KvCaipOjCip1SLAKqc++UpId2+iLPJvDgpAKVDbLMpC
	vRmCT0QKSugJrcZM1srVx+hTNzJ7lHL20TubK+ty/kTNutO0t4f4unvD6HTDkw7jGrNF2pvRRmmWc
	5mb2o+qQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJLAN-0005Xv-LD; Fri, 18 Sep 2020 18:31:27 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJLAJ-0005Ws-EO; Fri, 18 Sep 2020 18:31:24 +0000
Received: by mail-wm1-x343.google.com with SMTP id x23so6185866wmi.3;
 Fri, 18 Sep 2020 11:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=aq4S41RXE1vAQKwL/QYWeFUP5HTyFU3O/6rS50qdZsE=;
 b=fTNJQYUPRjCv2jqehMXxCqoGu4qw4qcHntIzB6h/UkQq6e+wiXyKftBV4EgCPvHw53
 LJzF6I7V2XJNSiiyZIQiTDyTuX+oey6c9gME8nBPQ3jpc3A+DsjTWkq16BC7SMYywtEd
 7HroLi6axJlnSoWmbbkU+JHcZOwpWdfnSyagXLieeDNXPKJYgpI2xgEshv/URf4HCyc8
 nI1WCxEBuxh7sfUEKHeng/28wAEP5EzruotnCQ5XFbizYjfuwfPyjCguXwQLaFDsWOPi
 Um2/1v0Sip/meE/W1PMmB6KHrCrQ4HlvDihF362x19MMyR26WSLNJNA1kCySf4dH60+N
 QmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=aq4S41RXE1vAQKwL/QYWeFUP5HTyFU3O/6rS50qdZsE=;
 b=OSyiJlRHLJNezlhQFgcXNed5H/rdgQM8fS2EiHBf5T1KVMpukeld48OKdMX4AZn0ff
 HDcx5CKwP0E2qcb2sj2y07+m8AZcu5FYSxBeI9LZHeIJ07hAefJA5AaPr/ZSex7bNzkj
 DRnuM3n2Bk++10n9bRQqNfoyey5fgwhnD8ch78hfw46vuNJSbodLOIZTinUAAW0UbgZu
 WiRz9DEOPfv0QOPPlWgRW82NcYJh5uMpOXAM7htZmrr9Os5b+KaN4KIzoxKun7JtYIJC
 PpixjPIxIy1m8CbLNnzpy1/eq6zFhLyLoL14r/Nx49K/fBrDDN4uO7pad3iO7aM2b3w1
 p78A==
X-Gm-Message-State: AOAM532lGPo/tzCfwmuELP9AS6fD5lbGcURzkSz5hkUzEUNo6jewgk6o
 Ybut63gXNDrV6+2dAGkVdobOkaseYKE=
X-Google-Smtp-Source: ABdhPJy3Ubjg/Kg+A3AeGariVlXaUlhZ7Hiy38mgi+9UBFB8tesMKZR+49HLkc2mbq7LGh/ZOWVzwA==
X-Received: by 2002:a7b:c3c8:: with SMTP id t8mr16894073wmj.101.1600453881837; 
 Fri, 18 Sep 2020 11:31:21 -0700 (PDT)
Received: from AnsuelXPS (93-39-149-95.ip76.fastwebnet.it. [93.39.149.95])
 by smtp.gmail.com with ESMTPSA id d9sm61650wmb.30.2020.09.18.11.31.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Sep 2020 11:31:20 -0700 (PDT)
From: <ansuelsmth@gmail.com>
To: "'Christian Lamparter'" <chunkeey@gmail.com>,
 "'Kalle Valo'" <kvalo@codeaurora.org>
References: <20200918162928.14335-1-ansuelsmth@gmail.com>
 <20200918162928.14335-2-ansuelsmth@gmail.com>
 <8f886e3d-e2ee-cbf8-a676-28ebed4977aa@gmail.com>
In-Reply-To: <8f886e3d-e2ee-cbf8-a676-28ebed4977aa@gmail.com>
Subject: R: [PATCH 2/2] dt: bindings: ath10k: Document qcom,
 ath10k-pre-calibration-data-mtd
Date: Fri, 18 Sep 2020 20:31:18 +0200
Message-ID: <000001d68de9$e7916450$b6b42cf0$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJEWVdigiv7VEZfce04PgG7d9c+lQHuGaaaAYeoZCCod3HyIA==
Content-Language: it
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_143123_528653_E9C77110 
X-CRM114-Status: GOOD (  12.13  )
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, 'Bartosz Golaszewski' <bgolaszewski@baylibre.com>,
 'Srinivas Kandagatla' <srinivas.kandagatla@linaro.org>,
 'Rob Herring' <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 'Jakub Kicinski' <kuba@kernel.org>, "'David S. Miller'" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Cgo+IC0tLS0tTWVzc2FnZ2lvIG9yaWdpbmFsZS0tLS0tCj4gRGE6IENocmlzdGlhbiBMYW1wYXJ0
ZXIgPGNodW5rZWV5QGdtYWlsLmNvbT4KPiBJbnZpYXRvOiB2ZW5lcmTDrCAxOCBzZXR0ZW1icmUg
MjAyMCAxODo1NAo+IEE6IEFuc3VlbCBTbWl0aCA8YW5zdWVsc210aEBnbWFpbC5jb20+OyBLYWxs
ZSBWYWxvCj4gPGt2YWxvQGNvZGVhdXJvcmEub3JnPgo+IENjOiBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZzsgbmV0ZGV2QHZnZXIua2VybmVsLm9yZzsgbGludXgtCj4gd2lyZWxlc3NAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOwo+IGF0aDEwa0BsaXN0cy5p
bmZyYWRlYWQub3JnOyBEYXZpZCBTLiBNaWxsZXIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+OyBSb2IK
PiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBKYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJu
ZWwub3JnPjsgbGludXgtCj4gbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7IFNyaW5pdmFzIEthbmRh
Z2F0bGEKPiA8c3Jpbml2YXMua2FuZGFnYXRsYUBsaW5hcm8ub3JnPjsgQmFydG9zeiBHb2xhc3pl
d3NraQo+IDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+IE9nZ2V0dG86IFJlOiBbUEFUQ0gg
Mi8yXSBkdDogYmluZGluZ3M6IGF0aDEwazogRG9jdW1lbnQgcWNvbSwgYXRoMTBrLQo+IHByZS1j
YWxpYnJhdGlvbi1kYXRhLW10ZAo+IAo+IE9uIDIwMjAtMDktMTggMTg6MjksIEFuc3VlbCBTbWl0
aCB3cm90ZToKPiA+IERvY3VtZW50IHVzZSBvZiBxY29tLGF0aDEway1wcmUtY2FsaWJyYXRpb24t
ZGF0YS1tdGQgYmluZGluZ3MgdXNlZCB0bwo+ID4gZGVmaW5lIGZyb20gd2hlcmUgdGhlIGRyaXZl
ciB3aWxsIGxvYWQgdGhlIHByZS1jYWwgZGF0YSBpbiB0aGUgZGVmaW5lZAo+ID4gbXRkIHBhcnRp
dGlvbi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnN1ZWwgU21pdGggPGFuc3VlbHNtdGhAZ21h
aWwuY29tPgo+IAo+IFE6IERvZXNuJ3QgbXRkIG5vdyBjb21lIHdpdGggbnZtZW0gc3VwcG9ydCBm
cm9tIHRoZSBnZXQgZ28/IFNvCj4gdGhlIE1BQy1BZGRyZXNzZXMgYW5kIHByZS1jYWxkYXRhIGNv
dWxkIGJlIHNwZWNpZmllZCBhcyBhCj4gbnZtZW0tbm9kZSBpbiB0aGUgZGV2aWNldHJlZT8gSSBy
ZW1lbWJlciBzZWVpbmcgdGhhdCB0aGlzIHdhcwo+IHdvcmtlZCBvbiBvciB3YXMgdGhpcyBtdGQt
Pm52bWVtIGRyb3BwZWQ/Cj4gCj4gQ2hlZXJzLAo+IENocmlzdGlhbgoKU29ycnkgYSBsb3QgZm9y
IHRoZSBkb3VibGUgZW1haWwuLi4gSSB0aGluayBJIGZvdW5kIHdoYXQgeW91IGFyZSB0YWxraW5n
IGFib3V0LgpJdCBsb29rcyBsaWtlIHRoZSBjb2RlIHdhcyBtZXJnZWQgYnV0IG5vdCB0aGUgZG9j
dW1lbnRhdGlvbi4KV2lsbCBkbyBzb21lIHRlc3QgYW5kIGNoZWNrIGlmIHRoaXMgd29ya3MuCgpU
aGlzIHNob3VsZCBiZSB0aGUgcmVsYXRlZCBwYXRjaC4KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L2xpbnV4LW10ZC9wYXRjaC8xNTIxOTMzODk5LTM2Mi00LWdpdC1zZW5kLWVt
YWlsLWFsYmV1QGZyZWUuZnIvCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
