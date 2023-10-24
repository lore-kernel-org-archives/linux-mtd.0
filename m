Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03FCC07545
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Oct 2023 13:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BL7aLyiA6gWgi4Y65+8rBJSSrxFGZ7hul/9moxRyqXc=; b=nGzqa7yYfKpzMI
	WH1doh8fVsZ2X6koJifmvfw6VFzcr2+NTgVu+9cAdDRS/CzXlnwWofoFnFonGDuYS0g8xDovTtIjz
	sLv5IGbl+oOiapMse6z4+V+o5iHafOtXsyjr8xIqpjCGGQtQVn+9hv0kPjCjhYB0DFHrKwF0Vcwow
	+okbrXrQvf/HuvIP+V9rle9fzsTsGbBsrC0NPwUVBJZ4n5ZRxsvYGglD94ZEage23JW9Fh1YSLxS4
	QNSFDFi36UhC69MvmmawXDbVnx6cA0cVebwsMZsTEARzJDvUMfGW0wlBUy1XJj0HZDdbh5ZpjkJjC
	2FfNaFUD3mGqXNlmciPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHU0-009xGi-2u;
	Tue, 24 Oct 2023 13:30:08 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHTx-009xEn-0w
	for linux-mtd@lists.infradead.org;
	Tue, 24 Oct 2023 13:30:07 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 38FD0120037;
	Tue, 24 Oct 2023 16:30:00 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 38FD0120037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1698154200;
	bh=uDFL+UiRh0fC+fhP1qbXLp0LfogzXYMs/LCjL9ObsmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=ivDRJpEw2rF4222v+BO69JmmNfMvB7xycsx/ORGROPlPRZTsqoqnsuAxkSHzjBW+z
	 yqZ2KzG4OQUt2pTg4R6scREJrMc9JsGuvN1g+6AJrU9GgfjHFN246AvJr9c2Ol6yWH
	 NUOz8tisI+z98dS3X7eq/PgTT8SfPWI3U2taQEauakdD77pVajFGlWZeIzhHKS4L65
	 HZgThlEAN1eZFNgcfqXHdiM0svb4m20YisB0RZbEGg29b7nsRTjOOzPm9vCsFg32IG
	 AkdgsRKjWd1GyAglsZsJ6+SrFSYnAZ+9Bof9zAZno9vXTIwY1VA4yzTAUOcdXMUhxF
	 xek566jBdQO5A==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 24 Oct 2023 16:29:58 +0300 (MSK)
Received: from [192.168.1.146] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Tue, 24 Oct 2023 16:29:58 +0300
Message-ID: <b6b5b413-0fbe-4ce2-9d44-451b16555eb3@salutedevices.com>
Date: Tue, 24 Oct 2023 16:29:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] jffs2: make cleanmarker support option
To: Richard Weinberger <richard@nod.at>
CC: David Woodhouse <dwmw2@infradead.org>, Christian Brauner
	<brauner@kernel.org>, Dave Chinner <dchinner@redhat.com>, Yu Zhe
	<yuzhe@nfschina.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-mtd
	<linux-mtd@lists.infradead.org>, kernel <kernel@sberdevices.ru>
References: <20231019073838.17586-1-mmkurbanov@salutedevices.com>
 <20231019073838.17586-3-mmkurbanov@salutedevices.com>
 <1258129392.18842.1697703134703.JavaMail.zimbra@nod.at>
 <3951ac21-a0a4-47b5-be94-edb0140c69a5@salutedevices.com>
 <406915015.32119.1698083084288.JavaMail.zimbra@nod.at>
Content-Language: en-US
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
In-Reply-To: <406915015.32119.1698083084288.JavaMail.zimbra@nod.at>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 180842 [Oct 24 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/10/24 11:32:00 #22275184
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_063006_009357_8CA1E036 
X-CRM114-Status: GOOD (  14.75  )
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

CgpPbiAyMy4xMC4yMDIzIDIwOjQ0LCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4gLS0tLS0g
VXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBWb246ICJNYXJ0aW4gS3VyYmFub3YiIDxtbWt1
cmJhbm92QHNhbHV0ZWRldmljZXMuY29tPgo+PiBJZiB5b3UgZGlzYWJsZSB0aGUgY2xlYW5tYXJr
ZXIsIHRoZSBmb3VuZCBjbGVhbiBibG9jayAoZmlsbGVkIHdpdGggMHhmZikKPj4gd2lsbCBiZSBl
cmFzZWQgYWdhaW4gKHNlZSBmcy9qZmZzMi9zY2FuLmMjTDE2MikuCj4+IEluIG15IG9waW5pb24s
IGl0IGlzIGJldHRlciB0byBwZXJmb3JtIHRoZSBibG9jayBlcmFzdXJlIGFnYWluIHRoYW4gdG8K
Pj4gbm90IHdvcmsgd2l0aCBzdWNoIGEgbmFuZCBmbGFzaCBhdCBhbGwuCj4gCj4gRG9lc24ndCB0
aGlzIGNhc2UgbWFueSByZS1lcmFzZXMgYXQgZWFjaCBtb3VudCB0aW1lPwoKWW91IGFyZSByaWdo
dC4gRGF2aWQgcHJvcG9zZWQgdGhlIGdvb2Qgc29sdXRpb24uCgo+IEJUVzogSSB0cmllZCB5b3Vy
IHBhdGNoIGluIG5hbmRzaW0sIGpmZnMyIHdhcyB1bmhhcHB5Lgo+IFsgICA1Ni4xNDczNjFdIGpm
ZnMyOiBub3RpY2U6ICg0NDApIGpmZnMyX2J1aWxkX3hhdHRyX3N1YnN5c3RlbTogY29tcGxldGUg
YnVpbGRpbmcgeGF0dHIgc3Vic3lzdGVtLCAwIG9mIHhkYXR1bSAoMCB1bmNoZWNrZWQsIDAgb3Jw
aGFuKSBhbmQgMCBvZiB4cmVmICgwIGRlYWQsIDAgb3JwaGFuKSBmb3VuZC4KPiBbICAgNTYuMjAw
NDM4XSBuYW5kOiBuYW5kX2RvX3dyaXRlX29wczogYXR0ZW1wdCB0byB3cml0ZSBub24gcGFnZSBh
bGlnbmVkIGRhdGEKPiBbICAgNTYuMjAxMDkwXSBqZmZzMjogV3JpdGUgY2xlYW4gbWFya2VyIHRv
IGJsb2NrIGF0IDB4MDAxZjgwMDAgZmFpbGVkOiAtMjIKPiAKPiBEbyB5b3UgaGF2ZSBhbiBpZGVh
PwoKQWNjb3JkaW5nIHRvIHRoaXMgY29kZSBmcm9tIHRoZSBmdW5jdGlvbiBqZmZzMl9tYXJrX2Vy
YXNlZF9ibG9jaygpOgoKYGBgCmlmIChqZmZzMl9jbGVhbm1hcmtlcl9vb2IoYykgfHwgYy0+Y2xl
YW5tYXJrZXJfc2l6ZSA9PSAwKSB7CgogICAgaWYgKGpmZnMyX2NsZWFubWFya2VyX29vYihjKSkg
ewogICAgICAgIGlmIChqZmZzMl93cml0ZV9uYW5kX2NsZWFubWFya2VyKGMsIGplYikpCiAgICAg
ICAgICAgIGdvdG8gZmlsZWJhZDsKICAgIH0KfSBlbHNlIHsKCiAgICBzdHJ1Y3Qga3ZlYyB2ZWNz
WzFdOwogICAgc3RydWN0IGpmZnMyX3Vua25vd25fbm9kZSBtYXJrZXIgPSB7CiAgICAgICAgLm1h
Z2ljID0gY3B1X3RvX2plMTYoSkZGUzJfTUFHSUNfQklUTUFTSyksCiAgICAgICAgLm5vZGV0eXBl
ID0gY3B1X3RvX2plMTYoSkZGUzJfTk9ERVRZUEVfQ0xFQU5NQVJLRVIpLAogICAgICAgIC50b3Rs
ZW4gPSBjcHVfdG9famUzMihjLT5jbGVhbm1hcmtlcl9zaXplKQogICAgfTsKYGBgCgp0aGUgImlm
IiBicmFuY2ggc2hvdWxkIGJlIGV4ZWN1dGVkIGJlY2F1c2UgImNsZWFubWFya2VyX3NpemUiIGlz
IHNldCB0bwowIGZvciBOQU5EIGZsYXNoOgoKYGBgCmludCBqZmZzMl9uYW5kX2ZsYXNoX3NldHVw
KHN0cnVjdCBqZmZzMl9zYl9pbmZvICpjKQp7CiAgICBpZiAoIWMtPm10ZC0+b29ic2l6ZSkKICAg
ICAgICByZXR1cm4gMDsKCiAgICAvKiBDbGVhbm1hcmtlciBpcyBvdXQtb2YtYmFuZCwgc28gaW5s
aW5lIHNpemUgemVybyAqLwogICAgYy0+Y2xlYW5tYXJrZXJfc2l6ZSA9IDA7CmBgYAoKSW4geW91
ciBjYXNlLCB0aGUgImVsc2UiIGJyYW5jaCB3YXMgZXhlY3V0ZWQuIEkgYXNzdW1lIHRoYXQgIm9v
YnNpemUiIGlzCmVxdWFsIHRvIDAuIEluIHRoaXMgc2NlbmFyaW8sIEpGRlMyIHdpbGwgbm90IG1v
dW50IHdpdGhvdXQKYXBwbHlpbmcgbXkgcGF0Y2guCgotLSAKQmVzdCBSZWdhcmRzLApNYXJ0aW4g
S3VyYmFub3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
