Return-Path: <SRS0=hgS/=GP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A0EC433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Jan 2021 16:02:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AB952168B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Jan 2021 16:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AB952168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ifm5xweTWl7D2EuChYFa6qiEEab1OKRU4hpoH+sdjXY=; b=eZ8OvysHm1fA+suKRAujJDWNJ
	6228c0rJmsBTXzyQWY5gRKyrZ1NeyPDhrwcPk0A9HQzwnm0riONoVA1c8ocuH8mzhO2RNvMAHPyuZ
	AEjBqtQ+SdHQyPZl5D0dVWjHf8wPq00TSwPJ/niAsnQ4N4huM5+kCHvKIAV0H5bGGLJsxvT9IPWc7
	288tvel/wjdbFrhZClQNyVmE5xa9ZjccnYm6hLciCzJREzN5Qsv79e7a6s/9WE07pQWwFY3wXuk3l
	3dP0iPPIz9foSiNQn3XFHfDyz/d19+WOSlXA6++ECTkty+WM5QJySxIICV49me/JsDhY7zTU28y6Y
	UzTkj4I7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzM6k-0004Yd-7Q; Tue, 12 Jan 2021 16:01:22 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzM6h-0004X3-AA
 for linux-mtd@lists.infradead.org; Tue, 12 Jan 2021 16:01:20 +0000
Received: by mail-io1-xd2e.google.com with SMTP id q137so5072131iod.9
 for <linux-mtd@lists.infradead.org>; Tue, 12 Jan 2021 08:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=H4iptpFz9x8ijlokMB7X7COj1wHjmyUOyfdacgf3XzI=;
 b=ft+I+RYLBgBfLxCnZfVpdrQ55vEqPZRTi3Kx97saG1Np5j8NHyS+6SnkjIBuaBqKp8
 EHROL5fqv+nW2RfSxWC0QAx8KRhZf8hPUnVJwR+gB7IULIfP97KE125HfNpE5tDbWqf7
 UvfDXOLhZ2uz7gZ00sCWAiguwOkHWMHSC1gyl8jYINm4uzVFimkR6sru7z+hZJ78Asjh
 6b4wmo0vF4kozsoy8Syn8EROBsfx9jaOCyGNc9eP9+4CPaGFn/nXP5Gg3x2304dbMtjn
 sh36NlDIDfvT2g7O0YIcXbcRuOd4q760pCr0t6+60IcwWo1trtXJ3ziKSn+KZpdgQN2C
 M52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=H4iptpFz9x8ijlokMB7X7COj1wHjmyUOyfdacgf3XzI=;
 b=nmJkCh141sFHcusTtIP/27AGLuDsllEDaHwS7fmx+tJnG6ZJI+nzBYUJaAOGuoY7MC
 IKqOrWploimhG2/VIbWUqeN/Ocq62VRHwwmFkDvDEFKQdIgDsrCCk1iu74ZDwq5n2qpQ
 bZc58SJM5yGHRjsgjQidiF4gz84lR5LQBSqErrCHGOLYATPhzv0HAbF1oWaLIXqIgM41
 AmBdXgUHV9lkXmgkrmal/geEEf0OtwzAivEmJix9Hb5wOVwp+w/vu9wMAreoV3gaOK6N
 HcKDVnt86u1wmWDFhacH4yBnK70kz0VYelcFVvCvb4uGTtzCWJuwb3CKwIyvUysAqNk/
 5Dfw==
X-Gm-Message-State: AOAM531J0lCuFWeYkMBH5fIeLRUWlHpx818/2y6RxUHSzy37JiXJKb9c
 Ay8ieZvvBla54GnJfqJ4X8OhbvStgp1EVaBnmmM=
X-Google-Smtp-Source: ABdhPJwu6RG/zzz1uhuU21p7AfKRzg0ukodScivw42XTEtEKfn3JzKV74YKYzntxhMEHRS9UwXkOvnlHniFVy8Zuqdc=
X-Received: by 2002:a05:6638:50c:: with SMTP id i12mr66712jar.74.1610467276750; 
 Tue, 12 Jan 2021 08:01:16 -0800 (PST)
MIME-Version: 1.0
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
 <20200929230124.31491-5-miquel.raynal@bootlin.com>
 <CAHCN7xLHAd8B_OgR2_vPFZZJ95mwNGR29dmqFeKhhSU9_y_imA@mail.gmail.com>
 <20210111112027.7cbda0ba@xps13> <20210112153534.5ba93cde@xps13>
In-Reply-To: <20210112153534.5ba93cde@xps13>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 12 Jan 2021 10:01:04 -0600
Message-ID: <CAHCN7xJCn8TD+T8pi5P=QMU=uZJ_LN1_wOEQON-noagf2H9+nw@mail.gmail.com>
Subject: Re: [PATCH 04/20] mtd: nand: ecc-bch: Stop exporting the private
 structure
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_110119_452294_B431EB7B 
X-CRM114-Status: GOOD (  27.70  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, ycllin@mxic.com.tw,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKYW4gMTIsIDIwMjEgYXQgODozNSBBTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIEFkYW0sCj4KPiBNaXF1ZWwgUmF5bmFsIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZSBvbiBNb24sIDExIEphbiAyMDIxCj4gMTE6
MjA6MjcgKzAxMDA6Cj4KPiA+IEhpIEFkYW0sCj4gPgo+ID4gQWRhbSBGb3JkIDxhZm9yZDE3M0Bn
bWFpbC5jb20+IHdyb3RlIG9uIFNhdCwgOSBKYW4gMjAyMSAwODo0Njo0NCAtMDYwMDoKPiA+Cj4g
PiA+IE9uIFR1ZSwgU2VwIDI5LCAyMDIwIGF0IDY6MDkgUE0gTWlxdWVsIFJheW5hbCA8bWlxdWVs
LnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBUaGUgTkFORCBCQ0gg
Y29udHJvbCBzdHJ1Y3R1cmUgaGFzIG5vdGhpbmcgdG8gZG8gb3V0c2lkZSBvZiB0aGlzCj4gPiA+
ID4gZHJpdmVyLCBhbGwgdXNlcnMgb2YgdGhlIG5hbmRfYmNoX2luaXQvZnJlZSgpIGZ1bmN0aW9u
cyBqdXN0IHNhdmUgaXQKPiA+ID4gPiB0byBjaGlwLT5lY2MucHJpdiBzbyBkbyBpdCBpbiB0aGlz
IGRyaXZlciBkaXJlY3RseSBhbmQgcmV0dXJuIGEKPiA+ID4gPiByZWd1bGFyIGVycm9yIGNvZGUg
aW5zdGVhZC4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+Cj4gPiA+IFN0YXJ0aW5n
IHdpdGggdGhpcyBjb21taXQ6ICAzYzBmZTM2YWJlYmUsIHRoZSBrZXJuZWwgZWl0aGVyIGRvZXNu
J3QKPiA+ID4gYnVpbGQgb3IgcmV0dXJucyBlcnJvcnMgb24gc29tZSBvbWFwMnBsdXMgZGV2aWNl
cyB3aXRoIHRoZSBmb2xsb3dpbmcKPiA+ID4gZXJyb3I6Cj4gPiA+Cj4gPiA+ICAgICBuYW5kOiBk
ZXZpY2UgZm91bmQsIE1hbnVmYWN0dXJlciBJRDogMHgyYywgQ2hpcCBJRDogMHhiYwo+ID4gPiAg
ICAgbmFuZDogTWljcm9uIE1UMjlGNEcxNkFCQkRBM1cKPiA+ID4gICAgIG5hbmQ6IDUxMiBNaUIs
IFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXplOiAyMDQ4LCBPT0Igc2l6ZTogNjQK
PiA+ID4gICAgIG5hbmQ6IHVzaW5nIE9NQVBfRUNDX0JDSDhfQ09ERV9IV19ERVRFQ1RJT05fU1cK
PiA+ID4gICAgIEludmFsaWQgRUNDIGxheW91dAo+ID4gPiAgICAgb21hcDItbmFuZCAzMDAwMDAw
MC5uYW5kOiB1bmFibGUgdG8gdXNlIEJDSCBsaWJyYXJ5Cj4gPiA+ICAgICBvbWFwMi1uYW5kOiBw
cm9iZSBvZiAzMDAwMDAwMC5uYW5kIGZhaWxlZCB3aXRoIGVycm9yIC0yMgo+ID4gPiAgICAgODwt
LS0gY3V0IGhlcmUgLS0tCj4gPiA+Cj4gPiA+IFRoZXJlIGFyZSBmZXcgY29tbWl0cyB1c2luZyBn
aXQgYmlzZWN0IHRoYXQgaGF2ZSBidWlsZCBlcnJvcnMsIHNvIGl0Cj4gPiA+IHdhc24ndCBwb3Nz
aWJsZSBmb3IgbWUgdG8gZGV0ZXJtaW5lIHRoZSBleGFjdCBjb21taXQgdGhhdCBicm9rZSB0aGUK
PiA+ID4gRUNDLiAgSWYgdGhlIGJ1aWxkIGZhaWxlZCwgSSBtYXJrZWQgaXQgYXMgJ2JhZCcgdG8g
Z2l0IGJpc2VjdC4KPiA+Cj4gPiBJIGFtIHNvcnJ5IHRvIGhlYXIgdGhhdCwgSSByZWd1bGFybHkg
cmViYXNlIHdpdGggYSBtYWtlIHJ1biBiZXR3ZWVuIGVhY2gKPiA+IHBpY2sgYW5kIHB1c2ggbXkg
YnJhbmNoZXMgdG8gYSAwLWRheSByZXBvc2l0b3J5IHRvIGhhdmUgcm9ib3RzIGNoZWNrCj4gPiBm
b3Igc3VjaCBlcnJvcnMsIGJ1dCBzb21ldGltZXMgSSBmYWlsLgo+ID4KPiA+ID4gTmV3ZXIgY29t
bWl0cyBoYXZlIHJlbWVkaWVkIHRoZSBidWlsZCBpc3N1ZSwgYnV0IHRoZSBJbnZhbGlkIEVDQwo+
ID4gPiBsYXlvdXQgZXJyb3Igc3RpbGwgZXhpc3RzIGFzIG9mIDUuMTEtUkMyLgo+ID4KPiA+IE9r
IHNvIGxldCdzIGZvY3VzIG9uIHRoZXNlLgo+ID4KPiA+ID4gRG8geW91IGhhdmUgYW55IHN1Z2dl
c3Rpb25zIG9uIHdoYXQgSSBjYW4gZG8gdG8gcmVtZWR5IHRoaXM/ICBJIGFtCj4gPiA+IHdpbGxp
bmcgdG8gdHJ5IGFuZCB0ZXN0Lgo+ID4KPiA+IEdsYWQgdG8gaGVhciB0aGF0Lgo+ID4KPiA+IENh
biB5b3Ugc2hhcmUgdGhlIE5BTkQgY29udHJvbGxlciBEVCBub2RlIHlvdSBhcmUgdXNpbmc/Cj4g
Pgo+ID4gQWxzbywgY2FuIHlvdSBwbGVhc2UgYWRkIGEgZmV3IHByaW50aydzIGxpa2UgYmVsb3cg
YW5kIGdpdmUgbWUgdGhlCj4gPiBvdXRwdXQ/Cj4KPiBXaWxsIHlvdSBoYXZlIHRoZSB0aW1lIHRv
IGNoZWNrIHRoZXNlIHNvb24/IEkgYW0gcmVhZHkgdG8gaGVscCBhbmQKPiB3b3VsZCBsaWtlIHRv
IGZpeCBpdCBhc2FwLgoKU29ycnkgZm9yIHRoZSBkZWxheSwgSSBoYXZlIHRvIHNwbGl0IG15IHRp
bWUgd2l0aCAzIGRpZmZlcmVudApwcm9qZWN0cy4gIEkgYW0gaG9waW5nIHRvIGdldCB5b3UgZGF0
YSBsYXRlciB0b2RheS4KCmFkYW0KPgo+IENoZWVycywKPiBNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
