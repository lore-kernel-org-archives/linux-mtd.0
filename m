Return-Path: <SRS0=kP5e=RE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF71C10F03
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 17:00:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B874520857
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 17:00:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F/xO9zi9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSsmg8nf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B874520857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kY9asD5IeqGasA0z88vGIPxXxhcf2BLt2qgsYxzJc2s=; b=F/xO9zi9mKNJYT
	vZR90TrCyUpJ514uaUjx41jnwZ/KLXC7RDFesTgO3UEXQ4zeeJIPdbTyoXtnKz2dLD+G+Fb2K8Jj/
	uPhotPb7lWlZlM9B6bEluVSwH8XiZgmaTGNlo2/Huaim/Cr/10cK+BtjXcA3sH5m1U0BPXDEwVqHJ
	ekjqnIBLnkwKneJ6VT36D7nev8eEWcHcGArsVTVdX0Y3FwxnwsftSISdMCRKHU3Y5Rut5s+8s662C
	cFz7dTS24KCYUdGUsfvpRgTLxJl9/mrPB84/Z/SXl5ftBY9m06D4awCSpmnCtDmcgvkhxlY2ueSUR
	kRvTg5LdA4yCxRzH0tGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzlW8-0007SW-D1; Fri, 01 Mar 2019 17:00:12 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzlW5-0006oI-A4
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2019 17:00:11 +0000
Received: by mail-pl1-x644.google.com with SMTP id d15so11779588plr.1
 for <linux-mtd@lists.infradead.org>; Fri, 01 Mar 2019 09:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=aTGNXZtZWrszMLPUL2OK6BWeWCHlT5fsDlsF0ZKNHr8=;
 b=SSsmg8nfyaAQEbgIvMyImPoDpLuDinHeF+M2WbV8wfj9g+8nbnML5dPGAj1kbR0CL4
 W+Q95KL5adoVctnXAkYQSoPM8WnBk/MJNxdxaYo4WlHGxm6+NhTRQwocimmJ/TRC5aTo
 ZXz47K6hdaWipv+9KFcfOJAhkD7WZUvMusuW/d2wsds2xsCft11AOiDREZqHHgfKCa8K
 kgz1biqznDOa1Cte/nkHjC38v0Pks0jqRTcKZGsOBTczEHnTAmYpBo1WgMjXUYAVfzjr
 eYYScuT/YUgkSe0sFjlm/n8H5DMtseBsmwCivBJr9e+pAKaigPDqf6vfvxS10wUIKnHF
 7IuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:content-language
 :thread-index;
 bh=aTGNXZtZWrszMLPUL2OK6BWeWCHlT5fsDlsF0ZKNHr8=;
 b=PcOIZ0/ILU2SwnU4IaB2mcT98uBhwQ3pzvgWuipWdB+YnEquvI17ZdORR2vyKJimKd
 yVrdGcXOKH3nrgaDk4xL2Dd33Hlom41PmHFarHkyaJq57yyocbxZOtPXwrK9OoWPc4Cv
 lSuNGute5xiAyRxzoN3yce8TLljOoSSXmTlHZ6St9gWy1ks4Udb79WdcmQ0+qdZu4w++
 ObEHdtmNKgpAxXPIifqSlMb+UybBKDaye6hhs8egwZbVN+vjduq5XuOcPN0AsUBpc2PT
 xPOHIx0O/z1JmH6HjPQ9XpYWJkzRON3C+C1smjIZ7PtKYlZSk857v/VtOlsuamWzYfXQ
 k/Fw==
X-Gm-Message-State: APjAAAVT6aoYjfiv+j8p6rQimpe2U05WCZNQIRZzzSDVCKsvfSpA8cEv
 NdF2oIDDqpMQdsEXZ0ZrmCs=
X-Google-Smtp-Source: APXvYqwpbZEI2rK7mN5XRKEDbxdhi8vayufxK8A3TbZL47w6frJOiJqZsbRJDW9blODUHfYutEgSDw==
X-Received: by 2002:a17:902:2903:: with SMTP id
 g3mr6357893plb.222.1551459608471; 
 Fri, 01 Mar 2019 09:00:08 -0800 (PST)
Received: from ikegamiPC (M106072039032.v4.enabler.ne.jp. [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id n1sm54935115pfi.123.2019.03.01.09.00.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 Mar 2019 09:00:07 -0800 (PST)
From: "Tokunori Ikegami" <ikegami.t@gmail.com>
To: "'Vignesh Raghavendra'" <vigneshr@ti.com>,
 "'Boris Brezillon'" <boris.brezillon@collabora.com>,
 "'liujian \(CE\)'" <liujian56@huawei.com>
References: <1551189648-58073-1-git-send-email-liujian56@huawei.com>
 <016001d4cf71$865e7b60$931b7220$@gmail.com>
 <4F88C5DDA1E80143B232E89585ACE27D0264F137@DGGEMM528-MBX.china.huawei.com>
 <20190228164228.734ede80@collabora.com>
 <005a01d4d03e$39b0e0f0$ad12a2d0$@yahoo.co.jp>
 <4b3bc01a-3632-5dde-f683-94744ee7179d@ti.com>
In-Reply-To: <4b3bc01a-3632-5dde-f683-94744ee7179d@ti.com>
Subject: RE: [PATCH v3] cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer
Date: Sat, 2 Mar 2019 01:59:41 +0900
Message-ID: <000501d4d050$38eca160$aac5e420$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Content-Language: ja
Thread-Index: AQHOptjmAmqem5WpXlLpfOi8uScBsQIgzkq5Atg5CjYCPRAs9gF4c9/ZAXvgv0ulsf4HgA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_090009_391188_1427E171 
X-CRM114-Status: GOOD (  22.01  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: 'Tokunori Ikegami' <ikegami.t@gmail.com>, keescook@chromium.org,
 bbrezillon@kernel.org, ikegami@allied-telesis.co.jp, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PiBbLi4uXQo+ID4+Pj4+IEluIGZ1bmN0aW9uIGRvX3dyaXRlX2J1ZmZlcigpLCBpbiB0aGUgZm9y
IGxvb3AsIHRoZXJlIGlzIGEgY2FzZQo+ID4+Pj4+IGNoaXBfcmVhZHkoKSByZXR1cm5zIDEgd2hp
bGUgY2hpcF9nb29kKCkgcmV0dXJucyAwLCBzbyBpdCBuZXZlciBicmVhawo+ID4+Pj4+IHRoZSBs
b29wLgo+ID4+Pj4+IFRvIGZpeCB0aGlzLCBjaGlwX2dvb2QoKSBpcyBlbm91Z2ggYW5kIGl0IHNo
b3VsZCB0aW1lb3V0IGlmIGl0IHN0YXkKPiA+Pj4+PiBiYWQgZm9yIGEgd2hpbGUuCj4gPj4+Pj4K
PiA+Pj4+PiBGaXhlczogZGZlYWUxMDczNTgzKCJtdGQ6IGNmaV9jbWRzZXRfMDAwMjogQ2hhbmdl
IHdyaXRlIGJ1ZmZlciB0bwo+ID4+Pj4+IGNoZWNrIGNvcnJlY3QgdmFsdWUiKQo+ID4+Pj4+IFNp
Z25lZC1vZmYtYnk6IFlpIEh1YWlqaWUgPHlpaHVhaWppZUBodWF3ZWkuY29tPgo+ID4+Pj4+IFNp
Z25lZC1vZmYtYnk6IExpdSBKaWFuIDxsaXVqaWFuNTZAaHVhd2VpLmNvbT4KPiA+Pj4+PiBSZXZp
ZXdlZC1ieTogVG9rdW5vcmkgSWtlZ2FtaSA8aWtlZ2FtaV90b0B5YWhvby5jby5qcD4KPiA+Pj4+
PiAtLS0KPiA+Pj4+PiB2Mi0+djM6Cj4gPj4+Pj4gRm9sbG93IFZpZ25lc2gncyBhZHZpY2U6Cj4g
Pj4+Pj4gYWRkIG9uZSBtb3JlIGNoZWNrIGZvciBjaGVja19nb29kKCkgZXZlbiB3aGVuIHRpbWVf
YWZ0ZXIoKSByZXR1cm5zCj4gPj4gdHJ1ZS4KPiA+Pj4+Pgo+ID4+Pj4+ICBkcml2ZXJzL210ZC9j
aGlwcy9jZmlfY21kc2V0XzAwMDIuYyB8IDIgKy0KPiA+Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPj4+Pj4KPiA+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMKPiA+Pj4+PiBiL2RyaXZlcnMvbXRk
L2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4gPj4+Pj4gaW5kZXggNzI0MjhiNi4uM2RhMjM3NiAx
MDA2NDQKPiA+Pj4+PiAtLS0gYS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYwo+
ID4+Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4gPj4+Pj4g
QEAgLTE4NzYsNyArMTg3Niw3IEBAIHN0YXRpYyBpbnQgX194aXByYW0gZG9fd3JpdGVfYnVmZmVy
KHN0cnVjdAo+ID4+Pj4+IG1hcF9pbmZvICptYXAsIHN0cnVjdCBmbGNoaXAgKmNoaXAsCj4gPj4+
Pj4gIAkJCWNvbnRpbnVlOwo+ID4+Pj4+ICAJCX0KPiA+Pj4+Pgo+ID4+Pj4+IC0JCWlmICh0aW1l
X2FmdGVyKGppZmZpZXMsIHRpbWVvKSAmJiAhY2hpcF9yZWFkeShtYXAsIGFkcikpCj4gPj4+Pj4g
KwkJaWYgKHRpbWVfYWZ0ZXIoamlmZmllcywgdGltZW8pICYmICFjaGlwX2dvb2QobWFwLCBhZHIs
Cj4gPj4+Pj4gZGF0dW0pKQo+ID4+Pj4KPiA+Pj4+ICAgSnVzdCBhbm90aGVyIGlkZWEgdG8gdW5k
ZXJzdGFuZCBlYXNpbHkuCj4gPj4+Pgo+ID4+Pj4gICAgIHVuc2lnbmVkIGxvbmcgbm93ID0gamlm
ZmllczsKPiA+Pj4+Cj4gPj4+PiAgICAgaWYgKGNoaXBfZ29vZChtYXAsIGFkciwgZGF0dW0pKSB7
Cj4gPj4+PiAgICAgICAgIHhpcF9lbmFibGUobWFwLCBjaGlwLCBhZHIpOwo+ID4+Pj4gICAgICAg
ICBnb3RvIG9wX2RvbmU7Cj4gPj4+PiAgICAgfQo+ID4+Pj4KPiA+Pj4+ICAgICBpZiAodGltZV9h
ZnRlcihub3csIHRpbWVvKSB7Cj4gPj4+PiAgICAgICAgIGJyZWFrOwo+ID4+Pj4gICAgIH0KPiA+
Pj4+Cj4gPj4+Cj4gPj4+IFRoYW5rIHlvdX4uIEl0IGlzIG1vcmUgZWFzaWVyIHRvIHVuZGVyc3Rh
bmTvvIEKPiA+Pj4gSWYgdGhlcmUgYXJlIG5vIG90aGVyIGNvbW1lbnRzLCBJIHdpbGwgc2VuZCBu
ZXcgcGF0Y2ggYWdhaW4gKToKPiA+Pgo+ID4+IEV4Y2VwdCB0aGlzIHZlcnNpb24gbm8gbG9uZ2Vy
IGRvZXMgd2hhdCBWaWduZXNoIHN1Z2dlc3RlZC4gU2VlIGhvdyB5b3UKPiA+PiBubyBsb25nZXIg
dGVzdCBpZiBjaGlwX2dvb2QoKSBpcyB0cnVlIGlmIHRpbWVfYWZ0ZXIoKSByZXR1cm5zIHRydWUu
IFNvLAo+ID4+IGltYWdpbmUgdGhlIHRocmVhZCBlbnRlcmluZyB0aGlzIGZ1bmN0aW9uIGlzIHBy
ZWVtcHRlZCBqdXN0IGFmdGVyIHRoZQo+ID4+IGZpcnN0IGNoaXBfZ29vZCgpIHRlc3QsIGFuZCBy
ZXN1bWVkIGEgZmV3IG1zIGxhdGVyLiB0aW1lX2FmdGVyKCkgd2lsbAo+ID4+IHJldHVybiB0cnVl
LCBidXQgY2hpcF9nb29kKCkgbWlnaHQgYWxzbyByZXR1cm4gdHJ1ZSwgYW5kIHlvdSBpZ25vcmUg
aXQuCj4gPgo+ID4gSSB0aGluayB0aGF0IHRoZSBmb2xsb3dpbmcgMyB2ZXJzaW9ucyB3aWxsIGJl
IHdvcmtlZCBmb3IgdGltZV9hZnRlcigpCj4gYXMgYSBzYW1lIHJlc3VsdCBhbmQgZm9sbG93IHRo
ZSBWaWduZXNoLXNhbiBzdWdnZXN0aW9uLgo+ID4KPiAKPiBBcyBCb3JpcyBleHBsYWluZWQgYWJv
dmUgdmVyc2lvbiAzIGRvZXMgbm90IHJlYWxseSBmb2xsb3cgbXkKPiBzdWdnZXN0aW9uLi4uIFBs
ZWFzZSBzZWUgYmVsb3cKPiAKPiA+IDEuIE9yaWdpbmFsIFZpZ25lc2gtc2FuIHN1Z2dlc3Rpb24K
PiA+Cj4gPiAJaWYgKGNoaXBfZ29vZChtYXAsIGFkciwgZGF0dW0pKSB7Cj4gPiAJCXhpcF9lbmFi
bGUobWFwLCBjaGlwLCBhZHIpOwo+ID4gCQlnb3RvIG9wX2RvbmU7Cj4gPiAJfQo+ID4KPiA+IAlp
ZiAodGltZV9hZnRlcihqaWZmaWVzLCB0aW1lbykpIHsKPiA+IAkJLyogVGVzdCBjaGlwX2dvb2Qo
KSBpZiBUUlVFIGluY29ycmVjdGx5IGFnYWluIHNvIHdyaXRlCj4gZmFpbHVyZSBieSB0aW1lX2Fm
dGVyKCkgY2FuIGJlIGF2b2lkZWQuICovCj4gPiAJCWlmIChjaGlwX2dvb2QobWFwLCBhZHIsIGRh
dHVtKSkgewo+ID4gCQkJeGlwX2VuYWJsZShtYXAsIGNoaXAsIGFkcik7Cj4gPiAJCQlnb3RvIG9w
X2RvbmU7Cj4gPiAJCX0KPiA+IAkJYnJlYWs7Cj4gPiAJfQo+ID4KPiAKPiAKPiBSaWdodCwgaGVy
ZSB3ZSBjaGVjayBjaGlwX2dvb2QoKSBvbmNlIF9ldmVuIHdoZW4gdGltZV9hZnRlcigpIGlzIHRy
dWVfCj4gdG8gYXZvaWQgX3NwdXJpb3VzXyB0aW1lb3V0Cj4gCj4gPiAyLiBMaXVqaWFuLXNhbiB2
MyBwYXRjaAo+ID4KPiA+IAkvKiBUZXN0IGNoaXBfZ29vZCgpIGlmIEZBTFNFIGNvcnJlY3RseSBz
byB3cml0ZSBmYWlsdXJlIGJ5Cj4gdGltZV9hZnRlcigpIGNhbiBiZSBhdm9pZGVkLiAqLwo+ID4g
CWlmICh0aW1lX2FmdGVyKGppZmZpZXMsIHRpbWVvKSAmJiAhY2hpcF9nb29kKG1hcCwgYWRyKSkK
PiA+IAkJYnJlYWs7Cj4gPgo+ID4gCWlmIChjaGlwX2dvb2QobWFwLCBhZHIsIGRhdHVtKSkgewo+
ID4gCQl4aXBfZW5hYmxlKG1hcCwgY2hpcCwgYWRyKTsKPiA+IAkJZ290byBvcF9kb25lOwo+ID4g
CX0KPiA+Cj4gCj4gVGhpcyBpcyBhIGJldHRlciB2ZXJzaW9uIG9mIDEKPiAKPiA+IDMuIE15IGlk
ZWEKPiA+Cj4gPiAJLyogU2F2ZSBjdXJyZW50IGppZmZpZXMgdmFsdWUgYmVmb3JlIGNoaXBfZ29v
ZCgpIHRvIGF2b2lkIHdyaXRlCj4gZmFpbHVyZSBieSB0aW1lX2FmdGVyKCkgd2l0aG91dCB0ZXN0
aW5nIGNoaXBfZ29vZCgpIGFnYWluLiAqLwo+ID4gCXVuc2lnbmVkIGxvbmcgbm93ID0gamlmZmll
czsKPiA+Cj4gPiAJaWYgKGNoaXBfZ29vZChtYXAsIGFkciwgZGF0dW0pKSB7Cj4gPiAJCXhpcF9l
bmFibGUobWFwLCBjaGlwLCBhZHIpOwo+ID4gCQlnb3RvIG9wX2RvbmU7Cj4gPiAJfQo+ID4KPiAK
PiBXaGF0IGlmIHRocmVhZCBnZXRzIHByZS1lbXB0ZWQgYXQgdGhpcyBwb2ludCBhbmQgaXMgcmUt
c2NoZWR1bGVkIGV4YWN0bHkKPiBhZnRlciB0aW1lbyBqaWZmaWVzIGhhdmUgZWxhcHNlZD8gQmVs
b3cgY2hlY2sgd291bGQgYmUgdHJ1ZSBhbmQgZXhpdCBsb29wCgogIEkgdGhpbmsgdGhhdCB0aGUg
amlmZmllcyB2YWx1ZSBub3cgaXMgc2F2ZSBiZWZvcmUgY2hpcF9nb29kKCkgc28gYmVsb3cgY2hl
Y2sgd291bGQgYmUgZmFsc2UgYW5kIG5vdCBleGl0IGxvb3AuCgpSZWdhcmRzLApJa2VnYW1pCgo+
IAo+ID4gCWlmICh0aW1lX2FmdGVyKG5vdywgdGltZW8pKQo+ID4gCQlicmVhazsKPiA+Cj4gCj4g
U28sIGNvZGUgZG9lcyBub3QgY2hlY2sgZm9yIGNoZWNrIGNoaXBfZ29vZCgpIGFmdGVyIHRpbWVv
b3V0IGhhcwo+IGVsYXBzZWQuIEJ1dCBjaGlwX2dvb2QoKSBtaWdodCBiZSB0cnVlIGF0IHRoaXMg
cG9pbnQuIFRoZXJlZm9yZSBsZWFkaW5nCj4gdG8gc3B1cmlvdXMgdGltZW91dC4gIFNvIHRoaXMg
dmVyc2lvbiBpcyBzdGlsbCBub3QgcmlnaHQuCj4gCj4gPiAgICAgICAgICAgTm90ZTogU29tZSBi
cmFja2V0cyBoYXZlIGJlZW4gZml4ZWQgZnJvbSB0aGUgcHJldmlvdXMgbWFpbC4KPiA+Cj4gCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
