Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773C0C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Apr 2022 06:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s7MPrJRPUvn2WdYSy7GKikFTbcMPdTT08ImM3WrPbkI=; b=3W6Fj9C42Uogt5
	nHGgfrz2qIW0efBfcmNu1eqInXZQ+voL7oSvH19RgPB6DEhBBDRLoKGWfdcMkBkLUbHhMGFC16DQK
	y54VzDIZqWOZateTVBnwRZekq2eNv8zqwkAgAy2YvHMTJVgXVwFT0ae4AtTP6L/tQaD6kUi3PYHtZ
	ndct0AJ1R5c4xU4Vioe4rdTEfa17dML0pHss+jn9fh9ji0xByK5pjlvjcVj3ina2cd/Gj/Ls4j1f0
	mOXRht/Pdvykuv+A0Rn0OPVren1aJeNcvFTxdITL9eCkUzHb9qtceg7+e66N+0g+9xqdg2ud30m65
	s+88uFl5ocEw9rOxZRGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngKoI-00FmG7-TQ; Mon, 18 Apr 2022 06:24:30 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngKoG-00FmEa-9T
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2022 06:24:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650263068; x=1681799068;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tNRYDpEsRiA6xjeaEbDZJT5OooHO5zK9cBV4KUdNxW0=;
 b=HW7akKZw5kt2pGn4nSHh+gZfKh2a8HSjDtLc/JcKdbVSPPIMRiQQYLgJ
 i6c54B0jksli4Y9bdUDTsj3JM4+K9mVh4I8TVVbPQa3XMC9VQ0QTbcxBL
 NxMElDdlyRyrxSe0rrxaPVEUfS2gz2B9Pv4jJcpa/bruCJ23ww7Fu7tAc o=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 17 Apr 2022 23:24:27 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2022 23:24:26 -0700
Received: from [10.201.2.159] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sun, 17 Apr
 2022 23:24:22 -0700
Message-ID: <b45374be-117c-1da8-1cfc-3a505e5cf167@quicinc.com>
Date: Mon, 18 Apr 2022 11:54:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH V3] mtd: rawnand: qcom: fix memory corruption that causes
 panic
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <konrad.dybcio@somainline.org>,
 <quic_srichara@quicinc.com>, <stable@vger.kernel.org>
References: <1650259141-20923-1-git-send-email-quic_mdalam@quicinc.com>
 <20220418053024.GA7431@thinkpad>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20220418053024.GA7431@thinkpad>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_232428_397643_F0AD1657 
X-CRM114-Status: GOOD (  20.84  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck9uIDQvMTgvMjAyMiAxMTowMCBBTSwgTWFuaXZhbm5hbiBTYWRoYXNpdmFtIHdyb3RlOgo+IE9u
IE1vbiwgQXByIDE4LCAyMDIyIGF0IDEwOjQ5OjAxQU0gKzA1MzAsIE1kIFNhZHJlIEFsYW0gd3Jv
dGU6Cj4+IFRoaXMgcGF0Y2ggZml4ZXMgYSBtZW1vcnkgY29ycnVwdGlvbiB0aGF0IG9jY3VycmVk
IGluIHRoZQo+PiBuYW5kX3NjYW4oKSBwYXRoIGZvciBIeW5peCBuYW5kIGRldmljZS4KPj4KPj4g
T24gYm9vdCwgZm9yIEh5bml4IG5hbmQgZGV2aWNlIHdpbGwgcGFuaWMgYXQgYSB3ZWlyZCBwbGFj
ZToKPj4gfCBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2Ug
YXQgdmlydHVhbAo+PiAgICBhZGRyZXNzIDAwMDAwMDcwCj4+IHwgWzAwMDAwMDcwXSAqcGdkPTAw
MDAwMDAwCj4+IHwgSW50ZXJuYWwgZXJyb3I6IE9vcHM6IDUgWyMxXSBQUkVFTVBUIFNNUCBBUk0K
Pj4gfCBNb2R1bGVzIGxpbmtlZCBpbjoKPj4gfCBDUFU6IDAgUElEOiAxIENvbW06IHN3YXBwZXIv
MCBOb3QgdGFpbnRlZCA1LjE3LjAtMDE0NzMtZzEzYWUxNzY5Y2ZiMAo+PiAgICAjMzgKPj4gfCBI
YXJkd2FyZSBuYW1lOiBHZW5lcmljIERUIGJhc2VkIHN5c3RlbQo+PiB8IFBDIGlzIGF0IG5hbmRj
X3NldF9yZWcrMHg4LzB4MWMKPj4gfCBMUiBpcyBhdCBxY29tX25hbmRjX2NvbW1hbmQrMHgyMGMv
MHg1ZDAKPj4gfCBwYyA6IFs8YzA4OGI3NGM+XSAgICBsciA6IFs8YzA4OGQ5Yzg+XSAgICBwc3I6
IDAwMDAwMTEzCj4+IHwgc3AgOiBjMTRhZGM1MCAgaXAgOiBjMTRlZTIwOCAgZnAgOiBjMGNjOTcw
Ywo+PiB8IHIxMDogMDAwMDAwYTMgIHI5IDogMDAwMDAwMDAgIHI4IDogMDAwMDAwNDAKPj4gfCBy
NyA6IGMxNmY2YTAwICByNiA6IDAwMDAwMDkwICByNSA6IDAwMDAwMDA0ICByNCA6YzE0ZWUwNDAK
Pj4gfCByMyA6IDAwMDAwMDAwICByMiA6IDAwMDAwMDBiICByMSA6IDAwMDAwMDAwICByMCA6YzE0
ZWUwNDAKPj4gfCBGbGFnczogbnpjdiAgSVJRcyBvbiAgRklRcyBvbiAgTW9kZSBTVkNfMzIgIElT
QSBBUk0gU2VnbWVudCBub25lCj4+IHwgQ29udHJvbDogMTBjNTM4N2QgIFRhYmxlOiA4MDIwNDA2
YSAgREFDOiAwMDAwMDA1MQo+PiB8IFJlZ2lzdGVyIHIwIGluZm9ybWF0aW9uOiBzbGFiIGttYWxs
b2MtMmsgc3RhcnQgYzE0ZWUwMDAgcG9pbnRlciBvZmZzZXQKPj4gICAgNjQgc2l6ZSAyMDQ4Cj4+
IHwgUHJvY2VzcyBzd2FwcGVyLzAgKHBpZDogMSwgc3RhY2sgbGltaXQgPSAweChwdHJ2YWwpKQo+
PiB8IG5hbmRjX3NldF9yZWcgZnJvbSBxY29tX25hbmRjX2NvbW1hbmQrMHgyMGMvMHg1ZDAKPj4g
fCBxY29tX25hbmRjX2NvbW1hbmQgZnJvbSBuYW5kX3JlYWRpZF9vcCsweDE5OC8weDFlOAo+PiB8
IG5hbmRfcmVhZGlkX29wIGZyb20gaHluaXhfbmFuZF9oYXNfdmFsaWRfamVkZWNpZCsweDMwLzB4
NzgKPj4gfCBoeW5peF9uYW5kX2hhc192YWxpZF9qZWRlY2lkIGZyb20gaHluaXhfbmFuZF9pbml0
KzB4YjgvMHg0NTQKPj4gfCBoeW5peF9uYW5kX2luaXQgZnJvbSBuYW5kX3NjYW5fd2l0aF9pZHMr
MHhhMzAvMHgxNGE4Cj4+IHwgbmFuZF9zY2FuX3dpdGhfaWRzIGZyb20gcWNvbV9uYW5kY19wcm9i
ZSsweDY0OC8weDdiMAo+PiB8IHFjb21fbmFuZGNfcHJvYmUgZnJvbSBwbGF0Zm9ybV9wcm9iZSsw
eDU4LzB4YWMKPj4KPj4gVGhlIHByb2JsZW0gaXMgdGhhdCB0aGUgbmFuZF9zY2FuKCkncyBxY29t
X25hbmRfYXR0YWNoX2NoaXAgY2FsbGJhY2sKPj4gaXMgdXBkYXRpbmcgdGhlIG5hbmRjLT5tYXhf
Y3dwZXJwYWdlIGZyb20gMSB0byA0LlRoaXMgY2F1c2VzIHRoZQo+PiBzZ19pbml0X3RhYmxlIG9m
IGNsZWFyX2JhbV90cmFuc2FjdGlvbigpIGluIHRoZSBkcml2ZXIncwo+PiBxY29tX25hbmRjX2Nv
bW1hbmQoKSB0byBtZW1zZXQgbXVjaCBtb3JlIHRoYW4gd2hhdCB3YXMgaW5pdGlhbGx5Cj4+IGFs
bG9jYXRlZCBieSBhbGxvY19iYW1fdHJhbnNhY3Rpb24oKS4KPj4KPj4gVGhpcyBwYXRjaCB3aWxs
IHVwZGF0ZSBuYW5kYy0+bWF4X2N3cGVycGFnZSAxIHRvIDQgYWZ0ZXIgbmFuZF9zY2FuKCkKPj4g
cmV0dXJucywgYW5kIHJlbW92ZSB1cGRhdGluZyBuYW5kYy0+bWF4X2N3cGVycGFnZSBmcm9tCj4+
IHFjb21fbmFuZF9hdHRhY2hfY2hpcCBjYWxsIGJhY2suCj4gVGhlIGFib3ZlIHN0YXRlbWVudCBp
cyBzdGlsbCB3cm9uZy4KIMKgwqAgVXBkYXRlZCBpbiBWNCBwYXRjaC4KPgo+PiBDYzogc3RhYmxl
QHZnZXIua2VybmVsLm9yZwo+PiBGaXhlczogNmEzY2VjNjRmMThjICgibXRkOiByYXduYW5kOiBx
Y29tOiBjb252ZXJ0IGRyaXZlciB0byBuYW5kX3NjYW4oKSIpCj4+IFJlcG9ydGVkLWJ5OiBLb25y
YWQgRHliY2lvIDxrb25yYWQuZHliY2lvQHNvbWFpbmxpbmUub3JnPgo+PiBTaWduZWQtb2ZmLWJ5
OiBNZCBTYWRyZSBBbGFtIDxxdWljX21kYWxhbUBxdWljaW5jLmNvbT4KPj4gU2lnbmVkLW9mZi1i
eTogU3JpY2hhcmFuIFIgPHF1aWNfc3JpY2hhcmFAcXVpY2luYy5jb20+Cj4+IC0tLQo+PiBbVjNd
Cj4+ICAgKiBVcGRhdGVkIGNvbW1pdCBtZXNzYWdlIEZpeGVzLCBDYywgUmVwb3J0ZWQtYnkKPiBN
aXNzaW5nIHRoZSBwcmV2aW91cyBjaGFuZ2Vsb2dzLgoKCiDCoCBVcGRhdGVkIGluIFY0IHBhdGNo
LgoKPgo+IFRoYW5rcywKPiBNYW5pCj4KPj4gICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25h
bmRjLmMgfCAyNCArKysrKysrKysrKysrLS0tLS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwg
MTMgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29t
X25hbmRjLmMKPj4gaW5kZXggMWE3NzU0Mi4uMDQ4YjI1NSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L3Fjb21fbmFuZGMuYwo+PiBAQCAtMjY1MSwxMCArMjY1MSwyMyBAQCBzdGF0aWMgaW50IHFjb21f
bmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+PiAgIAllY2MtPmVuZ2lu
ZV90eXBlID0gTkFORF9FQ0NfRU5HSU5FX1RZUEVfT05fSE9TVDsKPj4gICAKPj4gICAJbXRkX3Nl
dF9vb2JsYXlvdXQobXRkLCAmcWNvbV9uYW5kX29vYmxheW91dF9vcHMpOwo+PiArCS8qIEZyZWUg
dGhlIGluaXRpYWxseSBhbGxvY2F0ZWQgQkFNIHRyYW5zYWN0aW9uIGZvciByZWFkaW5nIHRoZSBP
TkZJIHBhcmFtcyAqLwo+PiArCWlmIChuYW5kYy0+cHJvcHMtPmlzX2JhbSkKPj4gKwkJZnJlZV9i
YW1fdHJhbnNhY3Rpb24obmFuZGMpOwo+PiAgIAo+PiAgIAluYW5kYy0+bWF4X2N3cGVycGFnZSA9
IG1heF90KHVuc2lnbmVkIGludCwgbmFuZGMtPm1heF9jd3BlcnBhZ2UsCj4+ICAgCQkJCSAgICAg
Y3dwZXJwYWdlKTsKPj4gICAKPj4gKwkvKiBOb3cgYWxsb2NhdGUgdGhlIEJBTSB0cmFuc2FjdGlv
biBiYXNlZCBvbiB1cGRhdGVkIG1heF9jd3BlcnBhZ2UgKi8KPj4gKwlpZiAobmFuZGMtPnByb3Bz
LT5pc19iYW0pIHsKPj4gKwkJbmFuZGMtPmJhbV90eG4gPSBhbGxvY19iYW1fdHJhbnNhY3Rpb24o
bmFuZGMpOwo+PiArCQlpZiAoIW5hbmRjLT5iYW1fdHhuKSB7Cj4+ICsJCQlkZXZfZXJyKG5hbmRj
LT5kZXYsCj4+ICsJCQkJImZhaWxlZCB0byBhbGxvY2F0ZSBiYW0gdHJhbnNhY3Rpb25cbiIpOwo+
PiArCQkJcmV0dXJuIC1FTk9NRU07Cj4+ICsJCX0KPj4gKwl9Cj4+ICsKPj4gICAJLyoKPj4gICAJ
ICogREFUQV9VRF9CWVRFUyB2YXJpZXMgYmFzZWQgb24gd2hldGhlciB0aGUgcmVhZC93cml0ZSBj
b21tYW5kIHByb3RlY3RzCj4+ICAgCSAqIHNwYXJlIGRhdGEgd2l0aCBFQ0MgdG9vLiBXZSBwcm90
ZWN0IHNwYXJlIGRhdGEgYnkgZGVmYXVsdCwgc28gd2Ugc2V0Cj4+IEBAIC0yOTU1LDE3ICsyOTY4
LDYgQEAgc3RhdGljIGludCBxY29tX25hbmRfaG9zdF9pbml0X2FuZF9yZWdpc3RlcihzdHJ1Y3Qg
cWNvbV9uYW5kX2NvbnRyb2xsZXIgKm5hbmRjLAo+PiAgIAlpZiAocmV0KQo+PiAgIAkJcmV0dXJu
IHJldDsKPj4gICAKPj4gLQlpZiAobmFuZGMtPnByb3BzLT5pc19iYW0pIHsKPj4gLQkJZnJlZV9i
YW1fdHJhbnNhY3Rpb24obmFuZGMpOwo+PiAtCQluYW5kYy0+YmFtX3R4biA9IGFsbG9jX2JhbV90
cmFuc2FjdGlvbihuYW5kYyk7Cj4+IC0JCWlmICghbmFuZGMtPmJhbV90eG4pIHsKPj4gLQkJCWRl
dl9lcnIobmFuZGMtPmRldiwKPj4gLQkJCQkiZmFpbGVkIHRvIGFsbG9jYXRlIGJhbSB0cmFuc2Fj
dGlvblxuIik7Cj4+IC0JCQluYW5kX2NsZWFudXAoY2hpcCk7Cj4+IC0JCQlyZXR1cm4gLUVOT01F
TTsKPj4gLQkJfQo+PiAtCX0KPj4gLQo+PiAgIAlyZXQgPSBtdGRfZGV2aWNlX3BhcnNlX3JlZ2lz
dGVyKG10ZCwgcHJvYmVzLCBOVUxMLCBOVUxMLCAwKTsKPj4gICAJaWYgKHJldCkKPj4gICAJCW5h
bmRfY2xlYW51cChjaGlwKTsKPj4gLS0gCj4+IDIuNy40Cj4+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
