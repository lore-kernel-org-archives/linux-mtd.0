Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB3B4C43464
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 18:10:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5343020872
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 18:10:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zUGw8U75";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lW1Ctf+6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5343020872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:In-Reply-To:
	References:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ea/0ZvxsBY9bUS8pprx4xTcjRzTTNAFoet1lTuOUhaY=; b=zUGw8U75qS985dm6LwGvAc85k
	hXfbO+JWY9ogNbTOXj6cijrA25CZqb68NN3whAzX7AfODUjrzLc+XKvpJ6RVbfLTRzyWa/8PCc+Us
	ws3uVr+1h+VqynzWZcAJP7Nm6SZ82vzeHuBGz5G6EamOZl02s1BOzJMOeDhkfQlDhMNxLOL3vr/VZ
	TMBW4aGAjU3flSfeNhmrMtdJ0P9KJYpt9ZRpyFjnsnOfXzfjLJhZO+eCzSLrnG6Rhr5gv8mKmHkH1
	shGxSq8+e0eSNYopRmt+9XVXL2UM0RKN8NbUiLDV3Cd6suxLHXmCAW9u1y//hnw8yUqluNBw3vUaQ
	peXvBJg7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJKoi-0003Ym-VD; Fri, 18 Sep 2020 18:09:05 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJKof-0003Xn-LM; Fri, 18 Sep 2020 18:09:02 +0000
Received: by mail-wr1-x441.google.com with SMTP id z4so6513286wrr.4;
 Fri, 18 Sep 2020 11:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=V7TYn/alxMmRQm9PDXJHaR4ciP91a3Wj/zuAejX1JHE=;
 b=lW1Ctf+6Zej2YzB4z4tRElKnEwvo5EJamrq3WGSeVLT6ftRjxdKk1Zrmy6wY/fOyUy
 wVEUb7eRA6dSNDxbSkEzuc/QhA1T/zI9tyelDqluu+4/ITx9gRsMtDDpxjBROJyy2ka8
 pccjObn1Q9H1MBCQmiG0AnvhV3IM1SSwGO922KkdWRL06FkfWGc9aejb+0mfGxJVpaq2
 fPHoEvpdazaPD/cFWojd+eIIUsw9n9MQWuW8vJn+0JxisWJwz6Vwoi2tD+mQbWCERgAn
 oOauTZEkZafbPmy4ml2QhNglV7Xm+Pvs0aUOnNpqvf3v5rSk5f0nxNWnkjGAI0j/tMP5
 EhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=V7TYn/alxMmRQm9PDXJHaR4ciP91a3Wj/zuAejX1JHE=;
 b=JJ/Q5X3D6n/7C4sh6Ib/j11fK0oMkQM+Z0CiYkAreVp2zgxHROtVHG7RVUUGz4HvRj
 OGdubaAInRpLFos+D3atm8NrSnTgb87lR2qnOACdKJDETkh1IpOdvKT1cksewL2YbAYQ
 DlKVtA3HJcHUrc4sN8cT2e+FfhEdVMjS7rTEQW3UXPupJ2VkZ3eGNyvziaFDs9MnRO2K
 9MJw3jAUjVE2vrdw5iIJNcMRsMaCpoSesPbh83UNoSAmq3myBOn3YawpqU+YyM2mpZWE
 2Ge96D4y/LQn2mvlz84wz6dQsYG0OJU81/Z4W7xg9IVX0wHAwWMpug+unqJzCLqfR3Gj
 wS/A==
X-Gm-Message-State: AOAM532t3EG+AbSttYXNs+814ZL9If1LurLeP9+ySQNc3naqeVOjVOrW
 h9guWEod31MKlo4QX9hqAd/GULT9OeE=
X-Google-Smtp-Source: ABdhPJz6xIijTdoGDOaGOtsRHj23XUIM8Dl2BFmzbpi6A43qDBLuSRluS8Vjuej5WASj7gRAQ+sSnA==
X-Received: by 2002:a05:6000:1184:: with SMTP id
 g4mr38640530wrx.20.1600452540424; 
 Fri, 18 Sep 2020 11:09:00 -0700 (PDT)
Received: from AnsuelXPS (host-95-248-206-89.retail.telecomitalia.it.
 [95.248.206.89])
 by smtp.gmail.com with ESMTPSA id c14sm6380766wrv.12.2020.09.18.11.08.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Sep 2020 11:08:58 -0700 (PDT)
From: <ansuelsmth@gmail.com>
To: "'Christian Lamparter'" <chunkeey@gmail.com>,
 "'Kalle Valo'" <kvalo@codeaurora.org>
References: <20200918162928.14335-1-ansuelsmth@gmail.com>
 <20200918162928.14335-2-ansuelsmth@gmail.com>
 <8f886e3d-e2ee-cbf8-a676-28ebed4977aa@gmail.com>
In-Reply-To: <8f886e3d-e2ee-cbf8-a676-28ebed4977aa@gmail.com>
Subject: R: [PATCH 2/2] dt: bindings: ath10k: Document qcom,
 ath10k-pre-calibration-data-mtd
Date: Fri, 18 Sep 2020 20:08:55 +0200
Message-ID: <018e01d68de6$c72edce0$558c96a0$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJEWVdigiv7VEZfce04PgG7d9c+lQHuGaaaAYeoZCCod2yTQA==
Content-Language: it
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_140901_742786_1A157909 
X-CRM114-Status: GOOD (  11.46  )
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
Pm52bWVtIGRyb3BwZWQ/Cj4gCj4gQ2hlZXJzLAo+IENocmlzdGlhbgoKQ2FuIHlvdSBnaXZlIG1l
IHNvbWUgZXhhbXBsZSB3aGVyZSB0aGlzIGlzIHVzZWQ/IEkgY2FuJ3QgZmluZCBhbnkgcmVmZXJl
bmNlLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
