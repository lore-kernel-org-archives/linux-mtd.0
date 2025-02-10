Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAB7C0219E
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 21:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=puI9DZQVy/1MSJ8ebO2LM6o3bImLKPNaLU6gdhjfsu4=; b=smEn3WVDxyX4VU
	152s5F62E5BiS5tVYLRU3Ibuqi5VKBUpwWwRKgC3Sei3JH1aL115ztdUcb7egJSkdbC04hjACh6p3
	XwiOD8QIPr2mOhA04befxw44aA3qggHJnzNv3ZLWEL8oAtQr6ChPMPIPqi13sD10whGc8vHhkkmTa
	VyETfIxG9TNIg6lKBLUaq/Pls3ngaWk/mGF5bFVS50nDUT6lpQwCs0pvTYEB9+FsjZ6oP6yz9nXyX
	2D5RFcMCMWyjMNLU780+UE9HmOwjxcUWpx/zMyL0BPOaeYi8j497AVft2hQVeNXqyCLo3cX2/wQcd
	719WIR8GzRXBWUPDw/og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbkr-00000001ZlY-17EB;
	Mon, 10 Feb 2025 21:55:49 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thajI-00000001PBp-3kux
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 20:50:10 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso2530236f8f.3
        for <linux-mtd@lists.infradead.org>; Mon, 10 Feb 2025 12:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739220607; x=1739825407; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2dJefyF8Ntih0gd63NWW8Bntajol0MzpM/Fx+CJZc70=;
        b=k/0xiHCcjild0cuTP3lgHz4/ZeIh1osGbR+TyZCe3NOz2NHbbbUWdfBsTwRtsILb+s
         F3QhViYs8tCBENGCoywp2RklzCDnbnrUHuW4+eFtju0q2qgcJfz61aezzLm3qlp962Tg
         4O0WDAjgLRL7Yel1aZnQOn+E/xOLcuf3asDXA3Jj67ipmd8YJUiQF6LZCdVL/24qoOXZ
         ZpTdq0ILCR4BHFEFGsQVkhYuhhPbjnfOa8iK7XGTsvouUl8W5V+zwowQAATRnB895LLw
         gG+86D9XsMu/pUwagF7Z6VxRTfVunxG8PWGvdzkXxxDBripbxZ62ljTJv1ooEXgXNJzz
         OxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739220607; x=1739825407;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2dJefyF8Ntih0gd63NWW8Bntajol0MzpM/Fx+CJZc70=;
        b=q0ndOngPmhugXqI426poe16iqbZsog86RFhN8n5lrH8eG5pZsy5jYyGnoCDAAd856h
         tQSW3Rqiw9cmbrQ+3xXuGovgTNBk1SiZeS8//KII35F7OBsl1F67CJLEHc6M6nPqNW8q
         l5cOnOh+Cb37raBX+HJdCHFEymi4osy6hqeBlGwMA6qJEGf2eMdgreuHdnIMi3gNFEsc
         DClOD/7m/60mfCYQ4FukEx8SbHxfIkZqDX7P5oJ9LeBNor5tLn+XeF3ApEGAM3td2mML
         b8UUyqAvKJHBxTVQcPXAUzeGVutuP6gwKsV2P9VgYAtep7/LhBPMJvMxt0l9OXUXRwry
         lhAA==
X-Forwarded-Encrypted: i=1; AJvYcCXbK8jHEH108Sw2YkfH5pbc8E86fw056xw8qTYarbIpo26RvXrgULnm7qyQVYXgtRtV1bZK55OSsHs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOd+Rk8IP7I+eAveePiS7uQv/wgEa5BwsKSMchHGJNgCpMi6EY
	EAHIb5jwp3ZiVgmlOEdJnlVlVmT3mXJf9YLonS7Q5WtXBUrb0myt
X-Gm-Gg: ASbGncszpXZf4uf4gUIdPJS50sl+zwUD+LukeEHeGY3/24u3OtaoEoI2mYwi0M390ae
	BK0MFt9vqkBbamGofSfaI4c4noYFAmYOx6EbbJU+N2Bmqo371RzzM1cnxNq+T3U6FC+nJO8eDzL
	ilQ0SfnybFThyRbZWu6EoJJbVC/jDRJeT4D8xWekf/GcIqkPaxT6nFIaTeutle8oiSSmmjnCNjk
	miai6UfBILIWN3eZEqQS+kXU7UMvBbBVtSg6oWoqxmDObBAeHZUma161uRG3DA6IDPWN0XnOWyW
	keDzk9cSnM25WZ6QrjX6MerXaqCJ0F06HXoJVaPK8F4ereo=
X-Google-Smtp-Source: AGHT+IFIiQmFF40j4k+DZN1cv4CpJRfjsukU/nNRgBxij1fWcbwCzmkxQC0FA+Nto3thlx1zvIp20g==
X-Received: by 2002:a5d:6da6:0:b0:38d:e0d2:55c6 with SMTP id ffacd0b85a97d-38de0d256bdmr3397519f8f.17.1739220606489;
        Mon, 10 Feb 2025 12:50:06 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd02e2a90sm9105954f8f.98.2025.02.10.12.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:50:06 -0800 (PST)
Message-ID: <67aa667e.5d0a0220.10ff3e.24a6@mx.google.com>
X-Google-Original-Message-ID: <Z6pmezDoznGIoXH0@Ansuel-XPS.>
Date: Mon, 10 Feb 2025 21:50:03 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Robert Marko <robimarko@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: qcom: fix broken config in
 qcom_param_page_type_exec
References: <20250209140941.16627-1-ansuelsmth@gmail.com>
 <20250210170950.zxgm5hjeb2a4evfn@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250210170950.zxgm5hjeb2a4evfn@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_125008_940280_4F1B06B3 
X-CRM114-Status: GOOD (  28.81  )
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

T24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMTA6Mzk6NTBQTSArMDUzMCwgTWFuaXZhbm5hbiBTYWRo
YXNpdmFtIHdyb3RlOgo+IE9uIFN1biwgRmViIDA5LCAyMDI1IGF0IDAzOjA5OjM4UE0gKzAxMDAs
IENocmlzdGlhbiBNYXJhbmdpIHdyb3RlOgo+ID4gRml4IGJyb2tlbiBjb25maWcgaW4gcWNvbV9w
YXJhbV9wYWdlX3R5cGVfZXhlYyBjYXVzZWQgYnkgY29weS1wYXN0ZSBlcnJvcgo+ID4gZnJvbSBj
b21taXQgMGMwODA4MGZkNzFjICgibXRkOiByYXduYW5kOiBxY29tOiB1c2UgRklFTERfUFJFUCBh
bmQgR0VOTUFTSyIpCj4gPiAKPiA+IEluIHFjb21fcGFyYW1fcGFnZV90eXBlX2V4ZWMgdGhlIHZh
bHVlIG5lZWRzIHRvIGJlIHNldCB0bwo+ID4gbmFuZGMtPnJlZ3MtPmNmZzAgaW5zdGVhZCBvZiBo
b3N0LT5jZmcwLiBUaGlzIHdyb25nIGNvbmZpZ3VyYXRpb24gY2F1c2VkCj4gPiB0aGUgUWNvbSBO
QU5EQyBkcml2ZXIgdG8gbWFsZnVuY3Rpb24gb24gYW55IGRldmljZSB0aGF0IG1ha2VzIHVzZSBv
ZiBpdAo+ID4gKElQUTgwNngsIElQUTQweHgsIElQUTgwN3gsIElQUTYweHgpIHdpdGggdGhlIGZv
bGxvd2luZyBlcnJvcjoKPiA+IAo+IAo+IEknbSB3b25kZXJpbmcgd2hldGhlciB0aGUgb2ZmZW5k
aW5nIGNvbW1pdCB3YXMgcmVhbGx5IHRlc3RlZCBvciBub3QgOigKPgoKV2VsbGxsbGxsbC4uLi4u
IEl0IHdhcyBidXQgaXQgd2Fzbid0LiBUaGUgc2VyaWVzIHdoZXJlIHRoaXMgd2FzCmludHJvZHVj
ZWQgd2FzIHRvIHB1c2ggdGhlIG5ldyBRY29tIFFQSUMgZHJpdmVyIGRyaXZlbiBieSBhIGRlZGlj
YXRlZApTUEkgY29udHJvbGxlci4gVGhhdCBwYXJ0IHdvcmtzIGFuZCB3YXMgcHJvYmFibHkgd2hl
cmUgdGhpcyB3YXMgdGVzdGVkLgpXaGF0IHdhcyBub3QgdGVzdGVkIGlzIGlmIHRoZXNlIGNoYW5n
ZXMgYWZmZWN0ZWQgU05BTkQgZHJpdmVyIGZvciBvdGhlcgpkZXZpY2VzLiBTYWRkbHkgaXQncyBh
bHdheXMgZGlmZmljdWx0IHRvIHRlc3QgdGhlc2UgY2hhbmdlcyB0aGF0IGFmZmVjdHMKbG9ycyBv
ZiBkZXZpY2VzLCBpbiBPcGVuV3J0IHdlIGFyZSB3b3JraW5nIG9uIGltcGxlbWVudGluZyBzb21l
IGtpbmQgb2YgdGVzdGJlZAp0byB0ZXN0IGltYWdlcyBvbiByZWFsIGRldmljZXMuIChpdCdzIGN1
cnJlbnRseSBvbmx5IGFuIGlkZWEgYW5kIHdlIGFyZQpmYXIgZnJvbSBoYXZpbmcgaXQgYnV0IGl0
J3Mgc29tZXRoaW5nIEkgd291bGQgbG92ZSB0byBoYXZlIGl0IHNvIHdlCmNvdWxkIGNhdGNoIHRo
ZXNlIGtpbmQgb2YgcmVncmVzc2lvbiBmYXN0ZXIgdGhhbiBnZXR0aW5nIElzc3VlIHNwYW1tZWQK
d2l0aCBkZXZpY2VzIGdldHRpbmcgYnJpY2tlZCkKCj4gPiBbICAgIDAuODg1MzY5XSBuYW5kOiBk
ZXZpY2UgZm91bmQsIE1hbnVmYWN0dXJlciBJRDogMHgyYywgQ2hpcCBJRDogMHhhYQo+ID4gWyAg
ICAwLjg4NTkwOV0gbmFuZDogTWljcm9uIE5BTkQgMjU2TWlCIDEsOFYgOC1iaXQKPiA+IFsgICAg
MC44OTI0OTldIG5hbmQ6IDI1NiBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBz
aXplOiAyMDQ4LCBPT0Igc2l6ZTogNjQKPiA+IFsgICAgMC44OTY4MjNdIG5hbmQ6IEVDQyAoc3Rl
cCwgc3RyZW5ndGgpID0gKDUxMiwgOCkgZG9lcyBub3QgZml0IGluIE9PQgo+ID4gWyAgICAwLjg5
NjgzNl0gcWNvbS1uYW5kYyA3OWIwMDAwLm5hbmQtY29udHJvbGxlcjogTm8gdmFsaWQgRUNDIHNl
dHRpbmdzIHBvc3NpYmxlCj4gPiBbICAgIDAuOTEwOTk2XSBiYW0tZG1hLWVuZ2luZSA3OTg0MDAw
LmRtYS1jb250cm9sbGVyOiBDYW5ub3QgZnJlZSBidXN5IGNoYW5uZWwKPiA+IFsgICAgMC45MTgw
NzBdIHFjb20tbmFuZGM6IHByb2JlIG9mIDc5YjAwMDAubmFuZC1jb250cm9sbGVyIGZhaWxlZCB3
aXRoIGVycm9yIC0yOAo+ID4gCj4gPiBSZXN0b3JlIG9yaWdpbmFsIGNvbmZpZ3VyYXRpb24gZml4
IHRoZSBwcm9ibGVtIGFuZCBtYWtlcyB0aGUgZHJpdmVyIHdvcmsKPiA+IGFnYWluLgo+ID4gCj4g
PiBBbHNvIHJlc3RvcmUgdGhlIHdyb25nbHkgZHJvcHBlZCBjcHVfdG9fbGUzMiB0byBjb3JyZWN0
bHkgc3VwcG9ydCBCRQo+ID4gc3lzdGVtcy4KPiA+IAo+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmcKPiA+IEZpeGVzOiAwYzA4MDgwZmQ3MWMgKCJtdGQ6IHJhd25hbmQ6IHFjb206IHVzZSBG
SUVMRF9QUkVQIGFuZCBHRU5NQVNLIikKPiA+IFRlc3RlZC1ieTogUm9iZXJ0IE1hcmtvIDxyb2Jp
bWFya29AZ21haWwuY29tPiAjIElQUTgwNzQgYW5kIElQUTYwMTgKPiA+IFNpZ25lZC1vZmYtYnk6
IENocmlzdGlhbiBNYXJhbmdpIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4KPiAKPiBSZXZpZXdlZC1i
eTogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9y
Zz4KPiAKPiBUaGFua3MgZm9yIHRoZSBmaXghCj4gCj4gLSBNYW5pCj4gCj4gPiAtLS0KPiA+IENo
YW5nZXMgdjI6Cj4gPiAtIEZpeCBzbWF0Y2ggd2FybmluZyAoYWRkIG1pc3NpbmcgY3B1X3RvX2xl
MzIgdGhhdCB3YXMgYWxzbyBkcm9wcGVkCj4gPiAgIGZyb20gdGhlIEZJRUxEX1BSRVAgcGF0Y2gp
Cj4gPiAKPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgfCAyNCArKysrKysr
KysrKystLS0tLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwg
MTIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9xY29tX25hbmRjLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiA+IGlu
ZGV4IGQyZDJhZWVlNDJhNy4uNjcyMGI1NDc4OTJiIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9x
Y29tX25hbmRjLmMKPiA+IEBAIC0xODgxLDE4ICsxODgxLDE4IEBAIHN0YXRpYyBpbnQgcWNvbV9w
YXJhbV9wYWdlX3R5cGVfZXhlYyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCAgY29uc3Qgc3RydWN0
IG5hbmRfCj4gPiAgCW5hbmRjLT5yZWdzLT5hZGRyMCA9IDA7Cj4gPiAgCW5hbmRjLT5yZWdzLT5h
ZGRyMSA9IDA7Cj4gPiAgCj4gPiAtCWhvc3QtPmNmZzAgPSBGSUVMRF9QUkVQKENXX1BFUl9QQUdF
X01BU0ssIDApIHwKPiA+IC0JCSAgICAgRklFTERfUFJFUChVRF9TSVpFX0JZVEVTX01BU0ssIDUx
MikgfAo+ID4gLQkJICAgICBGSUVMRF9QUkVQKE5VTV9BRERSX0NZQ0xFU19NQVNLLCA1KSB8Cj4g
PiAtCQkgICAgIEZJRUxEX1BSRVAoU1BBUkVfU0laRV9CWVRFU19NQVNLLCAwKTsKPiA+IC0KPiA+
IC0JaG9zdC0+Y2ZnMSA9IEZJRUxEX1BSRVAoTkFORF9SRUNPVkVSWV9DWUNMRVNfTUFTSywgNykg
fAo+ID4gLQkJICAgICBGSUVMRF9QUkVQKEJBRF9CTE9DS19CWVRFX05VTV9NQVNLLCAxNykgfAo+
ID4gLQkJICAgICBGSUVMRF9QUkVQKENTX0FDVElWRV9CU1ksIDApIHwKPiA+IC0JCSAgICAgRklF
TERfUFJFUChCQURfQkxPQ0tfSU5fU1BBUkVfQVJFQSwgMSkgfAo+ID4gLQkJICAgICBGSUVMRF9Q
UkVQKFdSX1JEX0JTWV9HQVBfTUFTSywgMikgfAo+ID4gLQkJICAgICBGSUVMRF9QUkVQKFdJREVf
RkxBU0gsIDApIHwKPiA+IC0JCSAgICAgRklFTERfUFJFUChERVYwX0NGRzFfRUNDX0RJU0FCTEUs
IDEpOwo+ID4gKwluYW5kYy0+cmVncy0+Y2ZnMCA9IGNwdV90b19sZTMyKEZJRUxEX1BSRVAoQ1df
UEVSX1BBR0VfTUFTSywgMCkgfAo+ID4gKwkJCQkJRklFTERfUFJFUChVRF9TSVpFX0JZVEVTX01B
U0ssIDUxMikgfAo+ID4gKwkJCQkJRklFTERfUFJFUChOVU1fQUREUl9DWUNMRVNfTUFTSywgNSkg
fAo+ID4gKwkJCQkJRklFTERfUFJFUChTUEFSRV9TSVpFX0JZVEVTX01BU0ssIDApKTsKPiA+ICsK
PiA+ICsJbmFuZGMtPnJlZ3MtPmNmZzEgPSBjcHVfdG9fbGUzMihGSUVMRF9QUkVQKE5BTkRfUkVD
T1ZFUllfQ1lDTEVTX01BU0ssIDcpIHwKPiA+ICsJCQkJCUZJRUxEX1BSRVAoQkFEX0JMT0NLX0JZ
VEVfTlVNX01BU0ssIDE3KSB8Cj4gPiArCQkJCQlGSUVMRF9QUkVQKENTX0FDVElWRV9CU1ksIDAp
IHwKPiA+ICsJCQkJCUZJRUxEX1BSRVAoQkFEX0JMT0NLX0lOX1NQQVJFX0FSRUEsIDEpIHwKPiA+
ICsJCQkJCUZJRUxEX1BSRVAoV1JfUkRfQlNZX0dBUF9NQVNLLCAyKSB8Cj4gPiArCQkJCQlGSUVM
RF9QUkVQKFdJREVfRkxBU0gsIDApIHwKPiA+ICsJCQkJCUZJRUxEX1BSRVAoREVWMF9DRkcxX0VD
Q19ESVNBQkxFLCAxKSk7Cj4gPiAgCj4gPiAgCWlmICghbmFuZGMtPnByb3BzLT5xcGljX3ZlcnNp
b24yKQo+ID4gIAkJbmFuZGMtPnJlZ3MtPmVjY19idWZfY2ZnID0gY3B1X3RvX2xlMzIoRUNDX0NG
R19FQ0NfRElTQUJMRSk7Cj4gPiAtLSAKPiA+IDIuNDcuMQo+ID4gCj4gCj4gLS0gCj4g4K6u4K6j
4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKLS0gCglBbnN1
ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
