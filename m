Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC96DC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 16:17:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6EFC2075F
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 16:17:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uAuwTMz0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="tNcHXoYJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6EFC2075F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3sJf26fxkJmDme73f2094NLmuhrpLDpWQgqW0R9BvE=; b=uAuwTMz03Mp521
	y5avcqTi49puhgBxS1j2ZIVr4EUrIuHZuAkoeIZXyoAdvGjt47F/Lg0xcekwWfo/68X6oWpme82cw
	ZLGKZHCXOno1F8+Q5ix1XvHbqwdZBKPxWp/MdvwWFKK+xDwtABy+u4bm1TGc4PSqITI0Tnr7vpxfw
	QXNgvKwU2iUz6ekd7u8FwFPzkp0OvHzfpzT+J/1WongG6DTDsRKlK/c+3ld7zaK7owAiIlh0Uj2k9
	AIspxiOTzB4bVs75SWqQD0CBf9ovv+wdBSrBl8KHZnYkDowu/ODt1xCwjgsPbo+sbGa7Fyalh8uNK
	CAbnhocjZqKevg9qDnXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb4wC-0002yF-SI; Tue, 19 May 2020 16:17:52 +0000
Received: from gateway22.websitewelcome.com ([192.185.47.144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb4w9-0002vj-SJ
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 16:17:51 +0000
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id DA5D111558
 for <linux-mtd@lists.infradead.org>; Tue, 19 May 2020 11:17:37 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id b4vxjY1Xj8vkBb4vxjDpRF; Tue, 19 May 2020 11:17:37 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ish2k0xRhZjINGd7KpxcexeC8FRprOGX9vtR8Yf1/4I=; b=tNcHXoYJRf/XDFhRA7ahW8/tnV
 p5bvSpzt1v5GDO2hk8QsxaPs0HUSVrgM1PiWXBCigltglMPlFbTa7FZNVf5csBR+3HZhEH/nrv6Eb
 ckyqXIQQ/w96EfvoPjnmtclPOl6Wk4BUzj2yO98ShuIB/Pw4pjD+8wwnKo3GaF5Wm/b28y/Qfnxsp
 UFiHxWkWKbt1YkMe0RNcRtO2pQd38q2PCsbVGBBjn6SViVQfg2hf8QEfkl5bFn9feM6qzwn9k4uoS
 Ec+l+TGldlHBW1Ho3ve12bWNrLOmlGYwulEC7IhbI14zUn8oi/a8ww7tsltnxBdBunKQ4Pm1xm02J
 LWgEQjWQ==;
Received: from [189.207.59.248] (port=36528 helo=[192.168.15.6])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <gustavo@embeddedor.com>)
 id 1jb4vx-000jwb-EP; Tue, 19 May 2020 11:17:37 -0500
Subject: Re: [PATCH v2 1/3] mtd: lpddr: Fix bad logic in print_drs_error
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <cover.1588016644.git.gustavo@embeddedor.com>
 <3fb0e29f5b601db8be2938a01d974b00c8788501.1588016644.git.gustavo@embeddedor.com>
 <20200427220834.17083b3d@xps13>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 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
 AP7RWS474w==
Message-ID: <c220c78e-dd5f-2bbc-e3d8-1ca1ef5fbcfe@embeddedor.com>
Date: Tue, 19 May 2020 11:22:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427220834.17083b3d@xps13>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.207.59.248
X-Source-L: No
X-Exim-ID: 1jb4vx-000jwb-EP
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.6]) [189.207.59.248]:36528
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_091750_004335_CF606EE9 
X-CRM114-Status: GOOD (  12.60  )
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
Cc: Joe Perches <joe@perches.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgYWxsLAoKRnJpZW5kbHkgcGluZzogd2hvIGNhbiB0YWtlIHRoaXM/CgpUaGFua3MKLS0KR3Vz
dGF2bwoKT24gNC8yNy8yMCAxNTowOCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBHdXN0YXZv
LAo+IAo+ICJHdXN0YXZvIEEuIFIuIFNpbHZhIiA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4gd3Jv
dGUgb24gTW9uLCAyNyBBcHIKPiAyMDIwIDE0OjUwOjM3IC0wNTAwOgo+IAo+PiBVcGRhdGUgbG9n
aWMgZm9yIGJyb2tlbiB0ZXN0LiBVc2UgYSBtb3JlIGNvbW1vbiBsb2dnaW5nIHN0eWxlLgo+Pgo+
PiBJdCBhcHBlYXJzIHRoZSBsb2dpYyBpbiB0aGlzIGZ1bmN0aW9uIGlzIGJyb2tlbiBmb3IgdGhl
Cj4+IGNvbnNlY3V0aXZlIHRlc3RzIG9mCj4+Cj4+ICAgICAgICAgaWYgKHByb2dfc3RhdHVzICYg
MHgzKQo+PiAgICAgICAgICAgICAgICAgLi4uCj4+ICAgICAgICAgZWxzZSBpZiAocHJvZ19zdGF0
dXMgJiAweDIpCj4+ICAgICAgICAgICAgICAgICAuLi4KPj4gICAgICAgICBlbHNlIChwcm9nX3N0
YXR1cyAmIDB4MSkKPj4gICAgICAgICAgICAgICAgIC4uLgo+Pgo+PiBMaWtlbHkgdGhlIGZpcnN0
IHRlc3Qgc2hvdWxkIGJlCj4+Cj4+ICAgICAgICAgaWYgKChwcm9nX3N0YXR1cyAmIDB4MykgPT0g
MHgzKQo+Pgo+PiBGb3VuZCBieSBpbnNwZWN0aW9uIG9mIGluY2x1ZGUgZmlsZXMgdXNpbmcgcHJp
bnRrLgo+Pgo+PiBGaXhlczogZWIzZGIyNzUwN2Y3ICgiW01URF0gTFBERFIgUEZPVyBkZWZpbml0
aW9uIikKPj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPj4gUmVwb3J0ZWQtYnk6IEpvZSBQ
ZXJjaGVzIDxqb2VAcGVyY2hlcy5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4g
U2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+Cj4+IC0tLQo+PiBDaGFuZ2VzIGluIHYyOgo+
PiAgLSBOb25lLgo+Pgo+PiAgaW5jbHVkZS9saW51eC9tdGQvcGZvdy5oIHwgMiArLQo+PiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L210ZC9wZm93LmggYi9pbmNsdWRlL2xpbnV4L210ZC9wZm93LmgK
Pj4gaW5kZXggMTIyZjM0MzllMWFmLi5jNjVkN2EzYmUzYzYgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1
ZGUvbGludXgvbXRkL3Bmb3cuaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L210ZC9wZm93LmgKPj4g
QEAgLTEyOCw3ICsxMjgsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcHJpbnRfZHJzX2Vycm9yKHVu
c2lnbmVkIGRzcikKPj4gIAo+PiAgCWlmICghKGRzciAmIERTUl9BVkFJTEFCTEUpKQo+PiAgCQlw
cmludGsoS0VSTl9OT1RJQ0UiRFNSLjE1OiAoMCkgRGV2aWNlIG5vdCBBdmFpbGFibGVcbiIpOwo+
PiAtCWlmIChwcm9nX3N0YXR1cyAmIDB4MDMpCj4+ICsJaWYgKChwcm9nX3N0YXR1cyAmIDB4MDMp
ID09IDB4MDMpCj4+ICAJCXByaW50ayhLRVJOX05PVElDRSJEU1IuOSw4OiAoMTEpIEF0dGVtcHQg
dG8gcHJvZ3JhbSBpbnZhbGlkICIKPj4gIAkJCQkJCSJoYWxmIHdpdGggNDFoIGNvbW1hbmRcbiIp
Owo+PiAgCWVsc2UgaWYgKHByb2dfc3RhdHVzICYgMHgwMikKPiAKPiAKPiBBY2tlZC1ieTogTWlx
dWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiAKPiAKPiBUaGFua3MsCj4g
TWlxdcOobAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
