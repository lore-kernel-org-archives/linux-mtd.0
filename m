Return-Path: <SRS0=FaK6=3Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18FEEC2D0B1
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2020 14:10:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE3B02084E
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2020 14:10:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="flGkU+ro";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ncentric-com.20150623.gappssmtp.com header.i=@ncentric-com.20150623.gappssmtp.com header.b="05hWzYrF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE3B02084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ncentric.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=75ucY581FxLPxhATQ6bi2yCdFkWfbH7AMLuGS6tu0GE=; b=flGkU+roahDHL+H8JIZe7GUPn
	Vk9BMxa0vgRMM6m7mVhS5BBPy0aU9Bp/YJc9lXwZbKEZzWwHuUI9rBPVAz8pcd6MYCDxvnjjIJfwE
	CaC3Bq0YGWR9spwCCX5pyaDN1ApW4nJ6/hF3iOP2X3aw7KQQuw4/7bbCLggsuoXLneUp6rUBe4Sj2
	4HihbQ1Y2SXzbVIHgcmkO7MnuLqp7EWN4PH1alnBpjmYyx2R0o4pr3eLaQ/Vg5Epc8GE+93opOxQF
	T1NBB7hfijeAGz3ISfr1ArZBSJzAsoPFhwG0dAa+I6fw2TYkj3wbZe6343OUR59IfNTflhlM2M65V
	cBraR2mjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyyuC-000172-FF; Tue, 04 Feb 2020 14:10:20 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyyu8-00016T-I8
 for linux-mtd@lists.infradead.org; Tue, 04 Feb 2020 14:10:18 +0000
Received: by mail-wm1-x344.google.com with SMTP id b17so3863486wmb.0
 for <linux-mtd@lists.infradead.org>; Tue, 04 Feb 2020 06:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ncentric-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Tqm9/lEzc4Qe6R5N4k2hwynjsuc/0cK9RgSp4EXpE+Q=;
 b=05hWzYrFdJDLALhhUB1oHoZwfZr1Mk4hjDq4QTDfr2lMYcWn5GqFTncqRXNbK4I56H
 1AxEXfiulOoZIBEDlFmcb/uWUG9zfobJNqWaZ+yZ9J9eYy8rSkSIG5nilradGiDNoMjA
 hYUeOHOCUugXeH7HPD9Hw3/x+W7Z7dAD3btLnknBs2jaZ1Tl/qU+JJQXFu5Kd2C+C11T
 S2D8JEGaKbUu6Xq7muNVtPlPZ0SWlN0yiy+kSXJ0ZjdixA8Twfg2zdYLpUHEncNz7sEO
 ZMQL8rX54h0pBNfK9W5SttnA3eKWPFq4QLT5fHT9x3h9bjbWipFS8V63Op8Ro39Wj33j
 JgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Tqm9/lEzc4Qe6R5N4k2hwynjsuc/0cK9RgSp4EXpE+Q=;
 b=S64lIL5aCrxyP1ZI6ydob6mw0PwVywEHKoFdda4qxdRaqHrrfyLQ7VYuvq1btDyYZA
 JaLnRkukGg7Fmm6fzYyfhFJTq546bGUJwX0hmnPEP9S0Zy3zuvuBMuBDWc3ZY16VGYq8
 pPksI709sWAe1CJWVUfalRE93cPSFp0on5L9R2I6azQyjOs3CZO3OJCUawl8Y7n9uy2V
 vs8tXsmuk+TPskVx3+bWms8Eufe98F7kmMejwWb2tAWgW+eE7hbq1JU9C9tefUeP8gsb
 VREae1iaSBXgAlzSKvb8GCVVFY6XjK3AdIx12M3OJFXAxTNEJcTaMtBxC3XbLZ+4ryQO
 37oA==
X-Gm-Message-State: APjAAAV+R9Hq+/GW/47WSiknZ7VT16sNfptBaBGCZFjnsEvdoJyOvfk6
 2ITBy5FEoEKJmEUpXD/zIMMB9Q==
X-Google-Smtp-Source: APXvYqzsBFhHB05njTfNo+iqTSANYj1mZUPMxJx/Utf38c/5AtC2X66b2vxyvz6qHHn5nd04vQHOyA==
X-Received: by 2002:a1c:1d09:: with SMTP id d9mr6304627wmd.91.1580825414253;
 Tue, 04 Feb 2020 06:10:14 -0800 (PST)
Received: from [10.202.0.7] (d5152e8e2.static.telenet.be. [81.82.232.226])
 by smtp.gmail.com with ESMTPSA id y131sm4154894wmc.13.2020.02.04.06.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2020 06:10:13 -0800 (PST)
Subject: Re: [PATCH] mtd: spi-nor: add support for GigaDevice GD25D05
From: Koen Vandeputte <koen.vandeputte@ncentric.com>
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
References: <20200106124624.28779-1-koen.vandeputte@ncentric.com>
 <1873152.psFcFxbH5H@192.168.0.113>
 <7e896e80-da33-5bd3-16bd-e62b43f5eecc@ncentric.com>
Message-ID: <6ef35a1b-cadb-95c0-8569-0518e3dee2f4@ncentric.com>
Date: Tue, 4 Feb 2020 15:10:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7e896e80-da33-5bd3-16bd-e62b43f5eecc@ncentric.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200204_061016_930365_3E5631E0 
X-CRM114-Status: GOOD (  20.70  )
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
Cc: richard@nod.at, vigneshr@ti.com, miquel.raynal@bootlin.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck9uIDE0LjAxLjIwIDEwOjEzLCBLb2VuIFZhbmRlcHV0dGUgd3JvdGU6Cj4KPiBPbiAxMS4wMS4y
MCAxNjo1MiwgVHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tIHdyb3RlOgo+PiBIaSwgS29lbiwK
Pj4KPj4gT24gTW9uZGF5LCBKYW51YXJ5IDYsIDIwMjAgMjo0NjoyNCBQTSBFRVQgS29lbiBWYW5k
ZXB1dHRlIHdyb3RlOgo+Pj4gVGVzdGVkIG9uIGEgTWlrcm9UaWsgUkI5MTJVQUctNUhQbkQgcjIK
Pj4+Cj4+PiBbwqDCoMKgIDAuNjQxNzE0XSBtMjVwODAgc3BpMC4wOiBmb3VuZCBnZDI1ZDA1LCBl
eHBlY3RlZCBtMjVwODAKPj4+IFvCoMKgwqAgMC42NDk5MTZdIG0yNXA4MCBzcGkwLjA6IGdkMjVk
MDUgKDY0IEtieXRlcykKPj4+IFvCoMKgwqAgMC42NTUxMjJdIENyZWF0aW5nIDQgTVREIHBhcnRp
dGlvbnMgb24gInNwaTAuMCI6Cj4+PiBbwqDCoMKgIDAuNjYwMTY0XSAweDAwMDAwMDAwMDAwMC0w
eDAwMDAwMDAwYzAwMCA6ICJyb3V0ZXJib290Igo+Pj4gW8KgwqDCoCAwLjY2Nzc4Ml0gMHgwMDAw
MDAwMGMwMDAtMHgwMDAwMDAwMGQwMDAgOiAiaGFyZF9jb25maWciCj4+PiBbwqDCoMKgIDAuNjc1
MDczXSAweDAwMDAwMDAwZDAwMC0weDAwMDAwMDAwZTAwMCA6ICJiaW9zIgo+Pj4gW8KgwqDCoCAw
LjY4MjYxM10gMHgwMDAwMDAwMGUwMDAtMHgwMDAwMDAwMGYwMDAgOiAic29mdF9jb25maWciCj4+
IEknbSBhZnJhaWQgdGhhdCB0aGlzIGlzIG5vdCBlbm91Z2guIFlvdSdsbCBoYXZlIHRvIHRlc3Qg
YWxsIHRoZSBmbGFncyAKPj4gdGhhdCB5b3UKPj4gYWR2ZXJ0aXNlZC4gVHlwaWNhbGx5IG9uZSBz
aG91bGQgZG8gYSByZWFkLCBlcmFzZSwgd3JpdGUsIHJlYWQtYmFjayAKPj4gdGVzdCwgYW5kCj4+
IHRoZW4gdG8gZXhlcmNpc2UgdGhlIGxvY2sgYW5kIHVubG9jayBmZWF0dXJlcy4gSWYgeW91IHdh
bnQgdG8gYmUgCj4+IGV4aGF1c3RpdmUsCj4+IHlvdSBjYW4gZm9yY2UgdGhlIGNvbnRyb2xsZXIg
dG8gZG8gdGhlIHJlYWRzIGluIHNpbmdsZSwgZHVhbCBvciBxdWFkIAo+PiBtb2RlcywKPj4gYnV0
IGlmIHlvdSBjaG9vc2UgdG8gdGVzdCBqdXN0IHRoZSBiZXN0IHN1cHBvcnRlZCByZWFkIG1vZGUs
IGl0IGlzIAo+PiBmaW5lIHRvby4KPj4gUGxlYXNlIHNwZWNpZnkgaW4gdGhlIGNvbW1pdCBtZXNz
YWdlIHdoYXQgeW91IHRlc3RlZC4KPj4KPj4gQ2hlZXJzLAo+PiB0YQo+IEhpIFR1ZG9yLAo+Cj4g
VGhhbmtzIGZvciB0aGUgZ3VpZGFuY2UgaGVyZSBhcyBpdCdzIG15IGZpcnN0IHBhdGNoIHRvd2Fy
ZHMgdGhpcyBwYXJ0IAo+IG9mIHRoZSBrZXJuZWwuCj4KPiBJJ3ZlIG5vdCBvbmx5IHdlbnQgdGhy
b3VnaCB0aGUgZGF0YXNoZWV0IG9mIHRoaXMgZGV2aWNlLCBidXQgYWxzbyB0aGUgCj4gZGF0YXNo
ZWV0IGZyb20gYW5vdGhlciB2ZXJ5IHNpbWlsYXIgR0QgY2hpcCBjYXJyeWluZyB0aGUgc2FtZSBz
cGVjcwo+IEFsbCBmZWF0dXJlcyBhcyBpbmRpY2F0ZWQgYnkgdGhlIGZsYWdzIGFyZSBjbGVhcmx5
IGRlc2NyaWJlZCBpbiBib3RoIAo+IGRhdGFzaGVldHMuIChsaWtlLCBTaW5nbGUsIER1YWwsIFF1
YWQgbW9kZXMpCj4KPiBUaGUgb25seSBkZWx0YSBpcyB0aGUgYW1vdW50IG9mIGFkdmVydGlzZWQg
YmxvY2tzLCBhbmQgc29tZSBvdGhlciBjaGlwIAo+IHBhY2thZ2UgZGV0YWlscyBvdXQtb2Ytc2Nv
cGUgZnJvbSBlbGVjdHJpY2FsIHBlcmZvcm1hbmNlLgo+Cj4gSXMgdGhpcyBjbGFyaWZpY2F0aW9u
IGVub3VnaCB0byBzZW5kIGEgVjIgd2l0aCBhIG1vZGlmaWVkIGNvbW1pdCBtc2c/Cj4KPiBQbGVh
c2UgYWR2aWNlLAo+IFRoYW5rcyBhZ2FpbiwKPgo+IEtvZW4KCkZyaWVuZGx5IHBpbmcgOi0pCgpL
b2VuCgoKPj4+IFNpZ25lZC1vZmYtYnk6IEtvZW4gVmFuZGVwdXR0ZSA8a29lbi52YW5kZXB1dHRl
QG5jZW50cmljLmNvbT4KPj4+IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3Rs
aW4uY29tPgo+Pj4gQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4+PiBD
YzogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAuY29tPgo+Pj4gQ2M6IFZp
Z25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KPj4+IC0tLQo+Pj4gwqAgZHJpdmVy
cy9tdGQvc3BpLW5vci9zcGktbm9yLmMgfCA1ICsrKysrCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
c3BpLW5vci5jIAo+Pj4gYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYwo+Pj4gaW5kZXgg
ZjRhZmUxMjNlOWRjLi5hMzRmYTQyZDQ3YTIgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL210ZC9z
cGktbm9yL3NwaS1ub3IuYwo+Pj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMK
Pj4+IEBAIC0yMzQ2LDYgKzIzNDYsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZv
IHNwaV9ub3JfaWRzW10gPSB7Cj4+PiDCoMKgwqDCoMKgIHsgIm1iODVyczFtdCIsIElORk8oMHgw
NDdmMjcsIDAsIDEyOCAqIDEwMjQsIDEsIFNQSV9OT1JfTk9fRVJBU0UpCj4+IH0sCj4+PiDCoMKg
wqDCoMKgIC8qIEdpZ2FEZXZpY2UgKi8KPj4+ICvCoMKgwqAgewo+Pj4gK8KgwqDCoMKgwqDCoMKg
ICJnZDI1ZDA1IiwgSU5GTygweGM4NDAxMCwgMCwgNjQgKiAxMDI0LMKgIDEsCj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBTRUNUXzRLIHwgU1BJX05PUl9EVUFMX1JFQUQgfAo+PiBTUElfTk9S
X1FVQURfUkVBRCB8Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTUElfTk9SX0hBU19MT0NL
IHwgU1BJX05PUl9IQVNfVEIpCj4+PiArwqDCoMKgIH0sCj4+PiDCoMKgwqDCoMKgIHsKPj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCAiZ2QyNXExNiIsIElORk8oMHhjODQwMTUsIDAsIDY0ICogMTAyNCzC
oCAzMiwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNFQ1RfNEsgfCBTUElfTk9SX0RV
QUxfUkVBRCB8Cj4+IFNQSV9OT1JfUVVBRF9SRUFEIHwKPj4KPj4KPj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
