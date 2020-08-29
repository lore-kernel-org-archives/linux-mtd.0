Return-Path: <SRS0=KXyU=CH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E478FC433E6
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Aug 2020 02:30:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD86F20791
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Aug 2020 02:30:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CTygqOi6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJo/AfkP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD86F20791
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RMZwz5ZQGiT/dKTS3wbh9CT1xBvYeBuROLcQM+daRiU=; b=CTygqOi66PdypP5DtkhDRZQQ9
	GD9UUIJG5TjVNhGmAPgYiHXuU6u7V/yaeCEYKlw0wMsC5YQc+rzLH/Dq6pZbLuXQgCus/vG8TZIz0
	YibEK9OCBOiWFa++PF/qqnnNRpnoyheiDusxPj69vOc9H9DldcArhyJLT2VDB0cBj6YhlHfU+aj0Y
	5EQfZpYBMGfx+XMmzWzFJ0h8nh8ODkmvzKel1OVm3NiPv/JLn+5GqWv2CauG3FJ8YU6Bk2pIuZoQ+
	WoVi/C6hrwaQx43f6YJx+VPD7/qPk90+IZINUZg2dleTj38bqC6gimNa/1YO18fFzzLec30lyPaNw
	5q3PwF9SA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBqc6-0004qq-1F; Sat, 29 Aug 2020 02:29:06 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBqby-0004pV-Q9
 for linux-mtd@lists.infradead.org; Sat, 29 Aug 2020 02:28:59 +0000
Received: by mail-lj1-x243.google.com with SMTP id v12so868713ljc.10
 for <linux-mtd@lists.infradead.org>; Fri, 28 Aug 2020 19:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=c/6L03NdWGE6AQXXtSEjpAnXkROpYqS0yGikXRKdwCU=;
 b=OJo/AfkPdtvxvzEpAkA40aISAJTBhiZwUEQ1+aEscMcFvPUT90MfCXwtKI11gUuvvN
 uPAREkB/B1EcN3Xpr+fZ4iFFrRdjRs6jGGgShvlqD1AjJAOyXmjWlAhY52xReR6nM1nR
 IeTwCZbSAa7aJGs00o7b+KPMKrynXTwg6IwsWOQaRIxjh3gHsa2w3S4XV76t7nBRurc7
 MpJkTWsnvXlhcfi46H5ZQaqfNSIBz6GYgM23/CsBjwj9aLtkXRletxr36jfOvm29x4wq
 ZtJDUwF/IV6hRnvbjhXY46+an6cPH//W+eEKHrFirw7ncD2DtRVpzIiELcnhMBNLFerb
 qivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c/6L03NdWGE6AQXXtSEjpAnXkROpYqS0yGikXRKdwCU=;
 b=udLUwu0knBZ5DUPrP9wEjotygJMc5CDhn7hZu2Wi351SxQG95oOl1UfeSKgoSpcoPe
 cqKjtLvvb9cWQe3EhOmxZggyTjqk56nt/908z2lE0NBxM992Ppb8Mrt8HJDRz64yJDN2
 bPztAhn0/5OwS6bWGV6J+IpOtShnCJwK8vFiTQL/1MB5f9Wh2JuCn9gp/Sr7pgsOVKRn
 9FmzLEJzj8J9AZ2dHuFInBsy/cdA/2+4mm7Yp62qSICQwsKB7pYO2nwks5fZ7IPyO6GZ
 NJcRedgNF1WdjTQTGkdpavWegKYU7mn/UCElep/+JAtC3GTxuDadHUgrGRv1rK+rdUkj
 aJrw==
X-Gm-Message-State: AOAM531YsA8rSZKkwtT6sjHpQVRVz9HLT9Hikk+hNy1CSqk8LHSu8PWl
 TVVs8lEdcc2fn8cVbU5mZlKqcO42bKgsPnEsmZ8=
X-Google-Smtp-Source: ABdhPJydBdlj5FAjRjKL6dpnvXtDJ4TKe/O1abYtAKcw3INPwm/o43FGjAgY7MBZ/rMLHnyss2NjjMnntmtHaDp4xTM=
X-Received: by 2002:a2e:968c:: with SMTP id q12mr630765lji.51.1598668132159;
 Fri, 28 Aug 2020 19:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200821070537.30317-1-jameslouisebond@gmail.com>
 <20200827144600.2ec7c4ab@xps13>
In-Reply-To: <20200827144600.2ec7c4ab@xps13>
From: James Bond <jameslouisebond@gmail.com>
Date: Fri, 28 Aug 2020 21:28:40 -0500
Message-ID: <CAPKyc-si2e2-9RDgLBO4Ox0wX5fr+NjSM_Noih_Pay+trNzndQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: ck804xrom: fix missing pci device put in error paths
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_222858_901347_1AA5F57C 
X-CRM114-Status: GOOD (  21.87  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Ryan Jackson <rjackson@lnxi.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdcOobCwKVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLgpJIGhhdmUganVzdCByZWNoZWNr
ZWQgdGhpcyBmdW5jdGlvbiBhbmQgZmluZCB0aGF0ICJwZGV2IiBjdXJyZW50bHkgaXMKYWxyZWFk
eSBwdXQKaW5zaWRlIGNrODA0eHJvbV9jbGVhbnVwLCBzbyBteSBwcmV2aW91cyBwYXRjaCBpcyBt
ZWFuaW5nbGVzcy4uLgpUaGUgY3VycmVudCBjYWxsaW5nIG9yZGVyIGlzIGxpa2U6Cgp3aW5kb3ct
PnBkZXYgPSBwY2lfZGV2X2dldChwZGV2KTsKLi4uCiAgICBjazgwNHhyb21fY2xlYW51cCh3aW5k
b3cpCiAgICAgICAgICAgICAtPgogICAgICAgICAgICAgICAgICBwY2lfZGV2X3B1dCh3aW5kb3ct
PnBkZXYpOwpBbmQgc29ycnkgZm9yIGJvdGhlcmluZyB5b3UuClRoYW5rcywKSmFtZXMKCk9uIFRo
dSwgQXVnIDI3LCAyMDIwIGF0IDc6NDYgQU0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gd3JvdGU6Cj4KPiBIaSBKYW1lcywKPgo+IEphbWVzIEJvbmQgPGphbWVzbG91
aXNlYm9uZEBnbWFpbC5jb20+IHdyb3RlIG9uIEZyaSwgMjEgQXVnIDIwMjAKPiAwMjowNTozNiAt
MDUwMDoKPgo+ID4gcGNpX2Rldl9nZXQgaW5jcmVhc2VzIHRoZSByZWZjb3VudCBvZiAicGRldiIu
Cj4gPiBJbiB0aGUgZXJyb3IgcGF0aHMsIHBjaV9kZXZfcHV0IHNob3VsZCBiZSBjYWxsZWQKPiA+
IHRvIGhhbmRsZSB0aGUgInBkZXYiIGFuZCBkZWNyZWFzZSB0aGUgY29ycmVzcG9uZGluZyByZWZj
b3VudC4KPiA+Cj4gPiBGaXhlczogOTBhZmZmYzhiZDc5ICgiW01URF0gW01BUFNdIFN1cHBvcnQg
Zm9yIEJJT1MgZmxhc2ggY2hpcHMgb24gdGhlIG52aWRpYSBjazgwNCBzb3V0aGJyaWRnZSIpCj4g
PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBCb25kIDxqYW1lc2xvdWlzZWJvbmRAZ21haWwuY29tPgo+
ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvbWFwcy9jazgwNHhyb20uYyB8IDMgKysrCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9tYXBzL2NrODA0eHJvbS5jIGIvZHJpdmVycy9tdGQvbWFwcy9jazgwNHhyb20uYwo+ID4g
aW5kZXggNDYwNDk0MjEyZjZhLi4xNmFmOGI1ZWU2NTMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L210ZC9tYXBzL2NrODA0eHJvbS5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9tYXBzL2NrODA0eHJv
bS5jCj4gPiBAQCAtMTk1LDYgKzE5NSw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGNrODA0eHJvbV9p
bml0X29uZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKPiA+ICAgICAgIGlmICghd2luZG93LT52aXJ0
KSB7Cj4gPiAgICAgICAgICAgICAgIHByaW50ayhLRVJOX0VSUiBNT0RfTkFNRSAiOiBpb3JlbWFw
KCUwOGx4LCAlMDhseCkgZmFpbGVkXG4iLAo+ID4gICAgICAgICAgICAgICAgICAgICAgIHdpbmRv
dy0+cGh5cywgd2luZG93LT5zaXplKTsKPiA+ICsgICAgICAgICAgICAgcGNpX2Rldl9wdXQocGRl
dik7Cj4gPiAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gICAgICAgfQo+ID4KPiA+IEBAIC0y
MjIsNiArMjIzLDcgQEAgc3RhdGljIGludCBfX2luaXQgY2s4MDR4cm9tX2luaXRfb25lKHN0cnVj
dCBwY2lfZGV2ICpwZGV2LAo+ID4KPiA+ICAgICAgICAgICAgICAgaWYgKCFtYXApIHsKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICBwcmludGsoS0VSTl9FUlIgTU9EX05BTUUgIjoga21hbGxvYyBm
YWlsZWQiKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBwY2lfZGV2X3B1dChwZGV2KTsKPiA+
ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+ICAgICAgICAgICAgICAgfQo+ID4g
ICAgICAgICAgICAgICBtZW1zZXQobWFwLCAwLCBzaXplb2YoKm1hcCkpOwo+ID4gQEAgLTI5NSw2
ICsyOTcsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBjazgwNHhyb21faW5pdF9vbmUoc3RydWN0IHBj
aV9kZXYgKnBkZXYsCj4gPiAgICAgICAgICAgICAgIGlmIChtdGRfZGV2aWNlX3JlZ2lzdGVyKG1h
cC0+bXRkLCBOVUxMLCAwKSkgewo+ID4gICAgICAgICAgICAgICAgICAgICAgIG1hcF9kZXN0cm95
KG1hcC0+bXRkKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBtYXAtPm10ZCA9IE5VTEw7Cj4g
PiArICAgICAgICAgICAgICAgICAgICAgcGNpX2Rldl9wdXQocGRldik7Cj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiAgICAgICAgICAgICAgIH0KPiA+Cj4KPiBJIHN1cHBv
c2UgaW4gdGhlc2UgdGhyZWUgY2FzZXMsIHRoZSB3aW5kb3ctPm1hcHMgbGlzdCB3aWxsIGJlIGVt
cHR5IGFuZAo+IHlvdSB3aWxsIGVuZCB1cCByZXR1cm5pbmcgLUVOT0RFViBhbmQgdGhlIGJvdHRv
bSBvZiB0aGUgZnVuY3Rpb24/IElmCj4geWVzLCBpdCB3b3VkbCBwcm9iYWJseSBiZSBiZXR0ZXIg
dG8gbW92ZSB0aGVzZSBwY2lfZGV2X3B1dCgpIGNhbGxzIHRvCj4gdGhpcyBsb2NhdGlvbi4KPgo+
IE90aGVyd2lzZSwgaXQgbWlnaHQgYml0IGludGVyZXN0aW5nIHRvIGNsZWFuIHVwIGEgbGl0dGxl
IGJpdCB0aGUgZXJyb3IKPiBwYXRoIGFuZCBwZXJoYXBzIGhhdmUgYSBkaXN0aW5jdCBzdWNjZXNz
IHZzLiBmYWlsdXJlIHBhdGguCj4KPgo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
