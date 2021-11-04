Return-Path: <SRS0=xf6T=PX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7143FC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Nov 2021 17:11:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 368FD6103B
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Nov 2021 17:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 368FD6103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=N9WC0XynTidUKIdMZQsQynYLcsCETkx0n/3v/oswQbc=; b=0KtPsHj74+rCEJ5H+7lbIvvKhr
	nabXR0zS49ZyDwLCLHVxy2U5pqqNkf97lEq8hPqUqiav1tlHf8cARI9YoGY93K2IAp3OuMG7dnb29
	5LVsSpeH4ykYlzOV+XUl69J4bJt+V4PzdRFm1kU6RMLOh0nwV72w3wyUvJiECevabMhpMErCIszkf
	ie92x4pofcLU/pjMQB6He76+9UwjJIl+Xn+mfNBQ0YUzcQsx3DsDyohEp5Rb/gbnIE4I226UQuMeY
	tGfqlGwaJ5x8N/0qhtEWeOexGIqLd9KIEoIw2gD/wuUM6t0nekrZRK+CupAUgTaC+FbVT4xi0cP1D
	Dlw9ZR8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1migGM-009bMF-Ry; Thu, 04 Nov 2021 17:10:54 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1migGJ-009bJr-FF
 for linux-mtd@lists.infradead.org; Thu, 04 Nov 2021 17:10:53 +0000
Received: by mail-oi1-x229.google.com with SMTP id bk26so9030503oib.11
 for <linux-mtd@lists.infradead.org>; Thu, 04 Nov 2021 10:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SevfzmLSoiSwyaqVR0wq8id+v0W8G6ODuu7UIBW98Ck=;
 b=FI/9ZNYr6/fAExz91u+4IwEk/Sxb4E3n6n+OTpB6yV1R775Z6Rzn9wDuRKyhtHW7Yh
 l0iXs/DRJdBCFSmFd1drvVOSND9tg7xbhdWhPlV+E7agORgDq700oVfwOrZafut+uTjL
 wZsxQZh6zgZB+DNENjftVxGc9YpUsDAGiRyi//LUZnHzRHIRnbOFxBpPg8XrR9F7ikSf
 UDIo8ruFN9iOwT6B1ti3FGya6rHDXaX1OIjfzbF69TkBR2jACv9yQMF30HkEsRnr62o1
 dHzC2TUCo67saJOtouCkKq8r/H4VDxeLV8YfMGOr2rul3DM4MH9og7FmH1N3/1TnIjKp
 FZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SevfzmLSoiSwyaqVR0wq8id+v0W8G6ODuu7UIBW98Ck=;
 b=2N+eTQZWTMCS8TwGOZVIscHhnyLJJry9ooWYBfCW2h08fhvIpB2qnxMQsam2qx2Usk
 y/bQJ+5cqu489HhPWQfoS33n7tfT2pR1puVhRcEA3r48FP2xwWqgltv7TSO1mBAtNQJx
 Tm74pt/9HiUgTvvR9uJw5YYsFRK2k912iCyVfp774GEBjs6t7m2OUNjM+TMGbJzcKDvs
 M8/Rcahu6/p+fHKn1imjEGC7nizgYzECgkHeNfMLw3rgFqp5WnWy5E0lwLvpj/JgQ3oW
 P9wmmcnw2Dg9q+syRTjHt9sUBaFFpY/1RkMQaAjezDn8upiKVp4SoRZbSWBRAnqxDiVT
 LuZg==
X-Gm-Message-State: AOAM5331BGZINJ0qx0q+Jb9ZMiHUcw6JKJtacgRKWYp+ZEEHD73rZNJw
 CpdmtDu5S4MSDk0larQCtrUKBg==
X-Google-Smtp-Source: ABdhPJwKmmjP4pd9sA9tjR2/ScYq3sGmtX9vWhgQjNflbjsCxPsKiictYttp6KRG05oAopieT+rW4g==
X-Received: by 2002:aca:3fd7:: with SMTP id
 m206mr16918071oia.162.1636045850000; 
 Thu, 04 Nov 2021 10:10:50 -0700 (PDT)
Received: from [192.168.1.30] ([207.135.234.126])
 by smtp.gmail.com with ESMTPSA id a13sm1599171oiy.9.2021.11.04.10.10.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 10:10:49 -0700 (PDT)
Subject: Re: [PATCH v5 00/14] last set for add_disk() error handling
To: Luis Chamberlain <mcgrof@kernel.org>, martin.petersen@oracle.com
Cc: miquel.raynal@bootlin.com, hare@suse.de, jack@suse.cz, hch@lst.de,
 song@kernel.org, dave.jiang@intel.com, richard@nod.at,
 vishal.l.verma@intel.com, penguin-kernel@i-love.sakura.ne.jp, tj@kernel.org,
 ira.weiny@intel.com, vigneshr@ti.com, dan.j.williams@intel.com,
 ming.lei@redhat.com, efremov@linux.com, linux-raid@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org
References: <20211103230437.1639990-1-mcgrof@kernel.org>
 <163602655191.22491.10844091970007142957.b4-ty@kernel.dk>
 <4764286a-99b4-39f7-ce5c-9e88cee1a538@kernel.dk>
 <YYQTYctDjaxU2tkQ@bombadil.infradead.org>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <377b472e-b788-df12-f9cd-7fc7b0887dc0@kernel.dk>
Date: Thu, 4 Nov 2021 11:10:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YYQTYctDjaxU2tkQ@bombadil.infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_101051_608415_B9C42B6B 
X-CRM114-Status: GOOD (  21.37  )
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

T24gMTEvNC8yMSAxMTowNyBBTSwgTHVpcyBDaGFtYmVybGFpbiB3cm90ZToKPiBPbiBUaHUsIE5v
diAwNCwgMjAyMSBhdCAwNjo1MzozNEFNIC0wNjAwLCBKZW5zIEF4Ym9lIHdyb3RlOgo+PiBPbiAx
MS80LzIxIDU6NDkgQU0sIEplbnMgQXhib2Ugd3JvdGU6Cj4+PiBPbiBXZWQsIDMgTm92IDIwMjEg
MTY6MDQ6MjMgLTA3MDAsIEx1aXMgQ2hhbWJlcmxhaW4gd3JvdGU6Cj4+Pj4gSmVucywKPj4+Pgo+
Pj4+IGFzIHJlcXVlc3RlZCwgSSd2ZSBmb2xkZWQgYWxsIHBlbmRpbmcgY2hhbmdlcyBpbnRvIHRo
aXMgc2VyaWVzLiBUaGlzCj4+Pj4gdjUgcGVncyBvbiBDaHJpc3RvcGgncyByZXZpZXdlZC1ieSB0
YWdzIGFuZCBzaW5jZSBJIHdhcyByZXNwaW5uaW5nIEkKPj4+PiBtb2RpZmllZCB0aGUgYXRhcHJv
YmUgYW5kIGZsb3BweSBkcml2ZXIgY2hhbmdlcyBhcyBoZSBzdWdnZXN0ZWQuCj4+Pj4KPj4+PiBJ
IHRoaW5rIHRoaXMgaXMgaXQuIFRoZSB3b3JsZCBvZiBmbG9wcHkgaGFzIGJlZW4gZXhjaXRpbmcg
Zm9yIHY1LjE2Lgo+Pj4+Cj4+Pj4gWy4uLl0KPj4+Cj4+PiBBcHBsaWVkLCB0aGFua3MhCj4+Pgo+
Pj4gWzAxLzE0XSBudmRpbW0vYnR0OiB1c2UgZ290byBlcnJvciBsYWJlbHMgb24gYnR0X2Jsa19p
bml0KCkKPj4+ICAgICAgICAgY29tbWl0OiAyNzYyZmYwNmFhNDllM2ExM2ZiNGI3NzkxMjBmNGY4
YzEyYzM5ZmQxCj4+PiBbMDIvMTRdIG52ZGltbS9idHQ6IGFkZCBlcnJvciBoYW5kbGluZyBzdXBw
b3J0IGZvciBhZGRfZGlzaygpCj4+PiAgICAgICAgIGNvbW1pdDogMTZiZTc5NzRmZjVkMGE1Y2Q5
ZjM0NTU3MWMzZWFjMWMzZjZiYTZkZQo+Pj4gWzAzLzE0XSBudmRpbW0vYmxrOiBhdm9pZCBjYWxs
aW5nIGRlbF9nZW5kaXNrKCkgb24gZWFybHkgZmFpbHVyZXMKPj4+ICAgICAgICAgY29tbWl0OiBi
NzQyMWFmY2VjMGM3N2FiNTg2MzM1ODdkZGMyOWQ1M2U2ZWI5NWFmCj4+PiBbMDQvMTRdIG52ZGlt
bS9ibGs6IGFkZCBlcnJvciBoYW5kbGluZyBzdXBwb3J0IGZvciBhZGRfZGlzaygpCj4+PiAgICAg
ICAgIGNvbW1pdDogZGMxMDRmNGJiMmQwYTY1MmRlZTAxMGU0N2JjODljMWFkMmFiMzdjOQo+Pj4g
WzA1LzE0XSBudmRpbW0vcG1lbTogY2xlYW51cCB0aGUgZGlzayBpZiBwbWVtX3JlbGVhc2VfZGlz
aygpIGlzIHlldCBhc3NpZ25lZAo+Pj4gICAgICAgICBjb21taXQ6IGFjY2Y1OGFmYjY4OWY4MWRh
YWRkZTI0MDgwZWExMTY0YWQyZGI3NWYKPj4+IFswNi8xNF0gbnZkaW1tL3BtZW06IHVzZSBhZGRf
ZGlzaygpIGVycm9yIGhhbmRsaW5nCj4+PiAgICAgICAgIGNvbW1pdDogNWExOTJjY2MzMmUyOTgx
ZjcyMTM0M2M3NTBiOGNmYjRjM2Y0MTAwNwo+Pj4gWzA3LzE0XSB6MnJhbTogYWRkIGVycm9yIGhh
bmRsaW5nIHN1cHBvcnQgZm9yIGFkZF9kaXNrKCkKPj4+ICAgICAgICAgY29tbWl0OiAxNTczMzc1
NGNjZjM1YzQ5ZDJmMzZhN2FjNTFhZGM4Yjk3NWMxYzc4Cj4+PiBbMDgvMTRdIGJsb2NrL3N1bnZk
YzogYWRkIGVycm9yIGhhbmRsaW5nIHN1cHBvcnQgZm9yIGFkZF9kaXNrKCkKPj4+ICAgICAgICAg
Y29tbWl0OiBmNTgzZWFlZjBhZjM5Yjc5MmQ3NGUzOTcyMWI1YmE0YjY5NDhhMjcwCj4+PiBbMDkv
MTRdIG10ZC91YmkvYmxvY2s6IGFkZCBlcnJvciBoYW5kbGluZyBzdXBwb3J0IGZvciBhZGRfZGlz
aygpCj4+PiAgICAgICAgIGNvbW1pdDogZWQ3MzkxOTEyNGIyZTQ4NDkwYWRiYmU0OGZmZTg4NWEy
YTRjNmZlZQo+Pj4gWzEwLzE0XSBhdGFmbG9wOiByZW1vdmUgYXRhZmxvcF9wcm9iZV9sb2NrIG11
dGV4Cj4+PiAgICAgICAgIGNvbW1pdDogNGRkYjg1ZDM2NjEzYzQ1YmRlMDBkMzY4YmY5ZjM1N2Jk
MDcwOGEwYwo+Pj4gWzExLzE0XSBibG9jazogdXBkYXRlIF9fcmVnaXN0ZXJfYmxrZGV2KCkgcHJv
YmUgZG9jdW1lbnRhdGlvbgo+Pj4gICAgICAgICBjb21taXQ6IDI2ZTA2ZjViMTM2NzFkMTk0ZDY3
YWU4ZTJiNjZmNTI0YWIxNzQxNTMKPj4+IFsxMi8xNF0gYXRhZmxvcDogYWRkcmVzcyBhZGRfZGlz
aygpIGVycm9yIGhhbmRsaW5nIG9uIHByb2JlCj4+PiAgICAgICAgIGNvbW1pdDogNDZhN2RiNDky
ZTdhMjc0MDhiYzE2NGNiZTY0MjQ2ODNlNzk1MjliMAo+Pj4gWzEzLzE0XSBmbG9wcHk6IGFkZHJl
c3MgYWRkX2Rpc2soKSBlcnJvciBoYW5kbGluZyBvbiBwcm9iZQo+Pj4gICAgICAgICBjb21taXQ6
IGVjMjhmY2M2Y2ZjZDQxOGQyMDAzOGFkMmM0OTJlODdiZjNhOWYwMjYKPj4+IFsxNC8xNF0gYmxv
Y2s6IGFkZCBfX211c3RfY2hlY2sgZm9yICphZGRfZGlzayooKSBjYWxsZXJzCj4+PiAgICAgICAg
IGNvbW1pdDogMTY5ODcxMmQ4NWVjMmYxMjhmYzdlN2M1ZGMyMDE4YjVlZDJiN2NmNgo+Pgo+PiBy
aXZlcnMvc2NzaS9zZC5jOiBJbiBmdW5jdGlvbiDigJhzZF9wcm9iZeKAmToKPj4gZHJpdmVycy9z
Y3NpL3NkLmM6MzU3Mzo5OiB3YXJuaW5nOiBpZ25vcmluZyByZXR1cm4gdmFsdWUgb2Yg4oCYZGV2
aWNlX2FkZF9kaXNr4oCZIGRlY2xhcmVkIHdpdGggYXR0cmlidXRlIOKAmHdhcm5fdW51c2VkX3Jl
c3VsdOKAmSBbLVd1bnVzZWQtcmVzdWx0XQo+PiAgMzU3MyB8ICAgICAgICAgZGV2aWNlX2FkZF9k
aXNrKGRldiwgZ2QsIE5VTEwpOwo+PiAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+Cj4+IGRyaXZlcnMvc2NzaS9zci5jOiBJbiBmdW5jdGlvbiDigJhzcl9wcm9i
ZeKAmToKPj4gZHJpdmVycy9zY3NpL3NyLmM6NzMxOjk6IHdhcm5pbmc6IGlnbm9yaW5nIHJldHVy
biB2YWx1ZSBvZiDigJhkZXZpY2VfYWRkX2Rpc2vigJkgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUg
4oCYd2Fybl91bnVzZWRfcmVzdWx04oCZIFstV3VudXNlZC1yZXN1bHRdCj4+ICAgNzMxIHwgICAg
ICAgICBkZXZpY2VfYWRkX2Rpc2soJnNkZXYtPnNkZXZfZ2VuZGV2LCBkaXNrLCBOVUxMKTsKPj4g
ICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+Cj4+Cj4+Cj4+IERyb3BwaW5nIHRoZSBsYXN0IHR3byBwYXRjaGVzLi4uCj4gCj4gTWFy
dGluIEsgUGV0ZXJzb24gaGFzIHRoZSByZXNwZWN0aXZlIHBhdGNoZXMgbmVlZGVkIHF1ZXVlZCB1
cCBvbiBoaXMgdHJlZQo+IGZvciB2NS4xNjoKPiAKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9ta3Avc2NzaS5naXQvY29tbWl0Lz9oPTUuMTYvc2NzaS1z
dGFnaW5nJmlkPWU5ZDY1OGMyMTc1Yjk1YThmMDkxYjEyZGRlZmIyNzE2ODNhZWFjZDkKPiBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9ta3Avc2NzaS5naXQv
Y29tbWl0Lz9oPTUuMTYvc2NzaS1zdGFnaW5nJmlkPTJhN2E4OTFmNGM0MDY4MjI4MDFlY2Q2NzZi
MDc2YzY0ZGUwNzJjOWUKPiAKPiBXb3VsZCB0aGUgbGFzdCBwYXRjaCBiZSBzZW50IG9uY2UgdGhh
dCBnZXRzIHRvIExpbnVzPwoKQnV0IHRoYXQgZGVwZW5kZW5jeSB3YXNuJ3QgY2xlYXIgaW4gdGhl
IHBhdGNoZXMgcG9zdGVkLCBhbmQgaXQgbGVhdmVzIG1lCndvbmRlcmluZyBpZiB0aGVyZSBhcmUg
b3RoZXJzPyBJIG9idmlvdXNseSBjYW4ndCBxdWV1ZSB1cCBhIHBhdGNoIHRoYXQKYWRkcyBhIG11
c3RfY2hlY2sgdG8gYSBmdW5jdGlvbiwgd2hlbiB3ZSBzdGlsbCBoYXZlIGNhbGxlcnMgdGhhdCBk
b24ndApwcm9wZXJseSBjaGVjayBpdC4KClRoYXQgc2hvdWxkIGhhdmUgYmVlbiBtYWRlIGNsZWFy
LCBhbmQgdGhhdCBsYXN0IHBhdGNoIG5ldmVyIHNob3VsZCd2ZQpiZWVuIHBhcnQgb2YgdGhlIHNl
cmllcy4gUGxlYXNlIHNlbmQgaXQgb25jZSBMaW51cydzIHRyZWUgaGFzIGFsbApjYWxsZXJzIGNo
ZWNraW5nIHRoZSByZXN1bHQuCgo+IEFsc28gY3VyaW91cyB3aHkgZHJvcCB0aGUgbGFzdCB0d28g
cGF0Y2hlcyBpbnN0ZWFkIGp1c3QgdGhlIGxhc3Qgb25lIGZvcgo+IG5vdz8KClNvcnJ5LCBtZWFu
dCBqdXN0IHRoZSBsYXN0IG9uZS4KCi0tIApKZW5zIEF4Ym9lCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
