Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35F1CFA74C
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2024 09:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCdkOw4I1rjww/NdSC9073eNndyRa9rLBz13Kf2fvGI=; b=In30xcqXazszbV
	mcKyXnAefyu4nS15XjytaYJZKj7Oc629IJRJub6zzVQt6CxVZl5Ehjrn8+KTneHxp4dd6KT0+/f6S
	QdGWpU8ulmua4ZCjoQrYN1mw8xxuIkf12104ipSxsRwWd39TM2T2mDGv90+tzTfbZ7SFJyW+htHb1
	5plgPDj2klFDN0ViZiasJdPd1gbtAvYtv8ks/QIw7k/P/34xbKMQ5j+uEj65zpIz5YJ2mvPtEmejo
	oPZzjjDB+2UgSxkdx5RvHgmPMopr3dPODGlHdvh/DwClXbMGKn7bkp5VRz4S5aTGfB2YvU533ghXC
	XYSA+zm97KKNLsPugT4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sweGU-0000000BXiw-08QZ;
	Fri, 04 Oct 2024 09:06:22 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sweFr-0000000BXWt-2GWg
	for linux-mtd@lists.infradead.org;
	Fri, 04 Oct 2024 09:05:45 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5c88e6926e5so1929695a12.3
        for <linux-mtd@lists.infradead.org>; Fri, 04 Oct 2024 02:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728032741; x=1728637541; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ulig9z8NcPhVqGwL6CNSUzcF2wRPT7yl9E653OjmFD4=;
        b=PSnV9h3Y9AKRPouEdz56PMNAg7B61uoAB9PP4CHEpOrE4yM/5FGm1vqlMawANZ3PTG
         zdFrQx5X4igQ6pm5Uh95m170cCN+8+seZPw8V62S54+J4tEuwg8t+cozdatrnd6tmU49
         geTZB96fIaC/1Ibm4YBnM61x08hboTmd3dNeH2cK7yHR43Onj4ad3CIycFPnKvmhA5Zu
         TFRhaL89TF7XTdjd+hkc2gWr2DehjGavmbZCSYO5En01fhnWB8VThIhwxdqth+bV4FH7
         p5QH3+L5+xXzQzdsr/S5M7cKbgybCSGWxkwrFnD/48+pTopdM0upEqJuNAF3jGZNfby6
         ELXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728032741; x=1728637541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ulig9z8NcPhVqGwL6CNSUzcF2wRPT7yl9E653OjmFD4=;
        b=QS587LfvzUM7LglsaDqKA+rQUBGvI+hiCA9mp9fyIn+KHfahWm7IA3YTaMlsQZrx1m
         RORG86X7OIQql6PdEJJho86Na+XzOU1iXC8UCm+cQcVy4BWn+sXMDux4uMXfX+ooC+E/
         7oxKaWcZl0X+fGMYS1oFG1jg+KoACQFDpNt9mx3fLIFyy011dXmR7a88u0ecbIyg8itx
         WOphnIkbw5rUxLZqbAC3ZDd2QEftdVszE+poLUD11HK3cRGPmmwOf6zMZ+eQLr0HfcFU
         w4i7qYVAkHFd8deaUbL/mIEvxtLZiAixh/Ki/Fu7hJO4Np8ZiYW5iWlKrz061q1Mmhvs
         jCjw==
X-Gm-Message-State: AOJu0Yz+YrpVU4TsCYbg8hQe8038bVbl0iFOrVGgc/R8VuRBfyyWCgIe
	H05t7gL4TA5QeAOqvrUg5wjwZcezZZGhZvbYidHSuSKZ05EIp9BrkJDFniR2lPL+2HjTxKzfCvu
	3G/nyMfXTpDLmU12CZz/qcBeCk80=
X-Google-Smtp-Source: AGHT+IER2GadSsBs7Lnu4hsc2+Ty7XF36iHDLYqf7DOJwYWgma0rBl9oPn28YylVLhc/vwpQKHxRm808Mk/rmsG62+A=
X-Received: by 2002:a17:907:96a4:b0:a8a:af0c:dba9 with SMTP id
 a640c23a62f3a-a991bd3f93bmr147966066b.16.1728032740760; Fri, 04 Oct 2024
 02:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240926141956.2386374-1-alvinzhou.tw@gmail.com>
 <20240926141956.2386374-2-alvinzhou.tw@gmail.com> <28ac1c39-5592-4e5c-8fce-53489e0135ee@linaro.org>
In-Reply-To: <28ac1c39-5592-4e5c-8fce-53489e0135ee@linaro.org>
From: Alvin Zhou <alvinzhou.tw@gmail.com>
Date: Fri, 4 Oct 2024 17:05:21 +0800
Message-ID: <CAPhrvRQirexA9QJzBSqjfmPnbnF62-hzg-neQ-cZX2hnkP_Zwg@mail.gmail.com>
Subject: Re: [PATCH v10 1/6] mtd: spi-nor: add Octal DTR support for Macronix flash
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pratyush@kernel.org, mwalle@kernel.org, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	broonie@kernel.org, chengminglin@mxic.com.tw, leoyu@mxic.com.tw, 
	AlvinZhou <alvinzhou@mxic.com.tw>, JaimeLiao <jaimeliao@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_020543_607102_16DF0A95 
X-CRM114-Status: GOOD (  34.74  )
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

SGkgVHVkb3IsCgpUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+IOaWvCAy
MDI05bm0MTDmnIgy5pelIOmAseS4iSDkuIvljYgzOjE25a+r6YGT77yaCj4KPgo+Cj4gT24gMjYu
MDkuMjAyNCAxNzoxOSwgQWx2aW5aaG91IHdyb3RlOgo+ID4gRnJvbTogQWx2aW5aaG91IDxhbHZp
bnpob3VAbXhpYy5jb20udHc+Cj4gPgo+ID4gQ3JlYXRlIE1hY3Jvbml4IHNwZWNpZnkgbWV0aG9k
IGZvciBlbmFibGUgT2N0YWwgRFRSIG1vZGUgYW5kCj4gPiBzZXQgMjAgZHVtbXkgY3ljbGVzIHRv
IGFsbG93IHJ1bm5pbmcgYXQgdGhlIG1heGltdW0gc3VwcG9ydGVkCj4gPiBmcmVxdWVuY3kgZm9y
IE1hY3Jvbml4IE9jdGFsIGZsYXNoLgo+ID4KPiA+IFVzZSBudW1iZXIgb2YgZHVtbXkgY3ljbGVz
IHdoaWNoIGlzIHBhcnNlIGJ5IFNGRFAgdGhlbiBjb252ZXJ0Cj4gPiBpdCB0byBiaXQgcGF0dGVy
biBhbmQgc2V0IGluIENSMiByZWdpc3Rlci4KPiA+IFNldCBDUjIgcmVnaXN0ZXIgZm9yIGVuYWJs
ZSBvY3RhbCBEVFIgbW9kZS4KPiA+Cj4gPiBVc2UgUmVhZCBJRCB0byBjb25maXJtIHRoYXQgZW5h
YmxpbmcvZGlzYWJsaW5nIG9jdGFsIERUUiBtb2RlCj4gPiB3YXMgc3VjY2Vzc2Z1bC4KPiA+Cj4g
PiBNYWNyb25peCBJRCBmb3JtYXQgaXMgQS1BLUItQi1DLUMgaW4gb2N0YWwgRFRSIG1vZGUuCj4g
PiBUbyBlbnN1cmUgdGhlIHN1Y2Nlc3NmdWwgZW5hYmxlbWVudCBvZiBvY3RhbCBEVFIgbW9kZSwg
Y29uZmlybQo+ID4gdGhhdCB0aGUgNi1ieXRlIGRhdGEgaXMgZW50aXJlbHkgY29ycmVjdC4KPiA+
Cj4gPiBDby1kZXZlbG9wZWQtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGluYXJv
Lm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGlu
YXJvLm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6IEphaW1lTGlhbyA8amFpbWVsaWFvQG14aWMuY29t
LnR3Pgo+ID4gU2lnbmVkLW9mZi1ieTogQWx2aW5aaG91IDxhbHZpbnpob3VAbXhpYy5jb20udHc+
Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMgfCA5MSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDkxIGluc2Vy
dGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25p
eC5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25peC5jCj4gPiBpbmRleCBlYTZiZTk1ZTc1
YTUuLmYwMzk4MTlhNTI1MiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFj
cm9uaXguYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25peC5jCj4gPiBAQCAt
OCw2ICs4LDI0IEBACj4gPgo+ID4gICNpbmNsdWRlICJjb3JlLmgiCj4gPgo+ID4gKyNkZWZpbmUg
TVhJQ19OT1JfT1BfUkRfQ1IyICAgMHg3MSAgICAgICAgICAgIC8qIFJlYWQgY29uZmlndXJhdGlv
biByZWdpc3RlciAyIG9wY29kZSAqLwo+ID4gKyNkZWZpbmUgTVhJQ19OT1JfT1BfV1JfQ1IyICAg
MHg3MiAgICAgICAgICAgIC8qIFdyaXRlIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXIgMiBvcGNvZGUg
Ki8KPiA+ICsjZGVmaW5lIE1YSUNfTk9SX0FERFJfQ1IyX01PREUgICAgICAgMHgwMDAwMDAwMCAg
ICAgIC8qIENSMiBhZGRyZXNzIGZvciBzZXR0aW5nIHNwaS9zb3BpL2RvcGkgbW9kZSAqLwo+ID4g
KyNkZWZpbmUgTVhJQ19OT1JfQUREUl9DUjJfREMgMHgwMDAwMDMwMCAgICAgIC8qIENSMiBhZGRy
ZXNzIGZvciBzZXR0aW5nIGR1bW15IGN5Y2xlcyAqLwo+ID4gKyNkZWZpbmUgTVhJQ19OT1JfUkVH
X0RPUElfRU4gMHgyICAgICAgICAgICAgIC8qIEVuYWJsZSBPY3RhbCBEVFIgKi8KPiA+ICsjZGVm
aW5lIE1YSUNfTk9SX1JFR19TUElfRU4gIDB4MCAgICAgICAgICAgICAvKiBFbmFibGUgU1BJICov
Cj4gPiArCj4gPiArLyogQ29udmVydCBkdW1teSBjeWNsZXMgdG8gYml0IHBhdHRlcm4gKi8KPiA+
ICsjZGVmaW5lIE1YSUNfTk9SX1JFR19EQyhwKSBcCj4gPiArICAgICAoKDIwIC0gKHApKSA+PiAx
KQo+Cj4gVGhpcyBpcyB1bmZvcnR1bmF0ZSBhcyB3ZSBjb252ZXJ0IGR1bW15IGN5Y2xlcyB0byBi
eXRlcyBpbiBtdGQgYW5kIHRoZW4KPiB3ZSBjb252ZXJ0IGJhY2sgZnJvbSBieXRlcyB0byBjeWNs
ZXMgaW4gc3BpLiBJIGhhZCBhbiBhdHRlbXB0IGZpeGluZwo+IHRoaXMgaW4gdGhlIHBhc3QsIGJ1
dCBjb3VsZG4ndCBhbGxvY2F0ZSBtb3JlIHRpbWUgZm9yIHNwaW5uaW5nIGFub3RoZXIKPiB2ZXJz
aW9uIGZvciB0aGUgcGF0Y2ggc2V0Lgo+Cj4gSSB3b24ndCBibG9jayB0aGUgcGF0Y2ggc2V0IGZv
ciB0aGlzLCBidXQgaWYgc29tZW9uZSBjYXJlcyB0byBmaXggaXQsCj4gd291bGQgYmUgZ3JlYXQg
dG8gdGFrZSBvdmVyLgo+Cj4gPiArCj4gPiArLyogTWFjcm9uaXggd3JpdGUgQ1IyIG9wZXJhdGlv
bnMgKi8KPgo+IEknbGwgZHJvcCB0aGlzIGNvbW1lbnQgd2hlbiBhcHBseWluZywgYXMgSSBjYW4g
YWxyZWFkeSBzZWUgd2hhdCB0aGUKPiBtYWNybyBpcyBkb2luZyBmcm9tIGl0cyBuYW1lLgoKR290
IGl0LCBJIHdpbGwgcGF5IGF0dGVudGlvbiB0byBpdCwgdGhhbmtzIQoKPgo+ID4gKyNkZWZpbmUg
TVhJQ19OT1JfV1JfQ1IyKGFkZHIsIG5kYXRhLCBidWYpICAgICAgICAgICAgICAgICAgICBcCj4g
PiArICAgICBTUElfTUVNX09QKFNQSV9NRU1fT1BfQ01EKE1YSUNfTk9SX09QX1dSX0NSMiwgMCks
ICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgICAgU1BJX01FTV9PUF9BRERSKDQsIGFkZHIsIDAp
LCAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgICBTUElfTUVNX09QX05PX0RV
TU1ZLCAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgICAgIFNQSV9N
RU1fT1BfREFUQV9PVVQobmRhdGEsIGJ1ZiwgMCkpCj4gPiArCj4gPiAgc3RhdGljIGludAo+ID4g
IG14MjVsMjU2MzVfcG9zdF9iZnB0X2ZpeHVwcyhzdHJ1Y3Qgc3BpX25vciAqbm9yLAo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qgc2ZkcF9wYXJhbWV0ZXJfaGVhZGVy
ICpiZnB0X2hlYWRlciwKPiA+IEBAIC0xODUsNiArMjAzLDc4IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgZmxhc2hfaW5mbyBtYWNyb25peF9ub3JfcGFydHNbXSA9IHsKPiA+ICAgICAgIH0KPiA+ICB9
Owo+ID4KPiA+ICtzdGF0aWMgaW50IG1hY3Jvbml4X25vcl9vY3RhbF9kdHJfZW4oc3RydWN0IHNw
aV9ub3IgKm5vcikKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3Qgc3BpX21lbV9vcCBvcDsKPiA+ICsg
ICAgIHU4ICpidWYgPSBub3ItPmJvdW5jZWJ1ZiwgaTsKPiA+ICsgICAgIGludCByZXQ7Cj4gPiAr
Cj4gPiArICAgICAvKiBVc2UgZHVtbXkgY3ljbGVzIHdoaWNoIGlzIHBhcnNlIGJ5IFNGRFAgYW5k
IGNvbnZlcnQgdG8gYml0IHBhdHRlcm4uICovCj4gPiArICAgICBidWZbMF0gPSBNWElDX05PUl9S
RUdfREMobm9yLT5wYXJhbXMtPnJlYWRzW1NOT1JfQ01EX1JFQURfOF84XzhfRFRSXS5udW1fd2Fp
dF9zdGF0ZXMpOwo+ID4gKyAgICAgb3AgPSAoc3RydWN0IHNwaV9tZW1fb3ApTVhJQ19OT1JfV1Jf
Q1IyKE1YSUNfTk9SX0FERFJfQ1IyX0RDLCAxLCBidWYpOwo+ID4gKyAgICAgcmV0ID0gc3BpX25v
cl93cml0ZV9hbnlfdm9sYXRpbGVfcmVnKG5vciwgJm9wLCBub3ItPnJlZ19wcm90byk7Cj4gPiAr
ICAgICBpZiAocmV0KQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKwo+ID4gKyAg
ICAgLyogU2V0IHRoZSBvY3RhbCBhbmQgRFRSIGVuYWJsZSBiaXRzLiAqLwo+ID4gKyAgICAgYnVm
WzBdID0gTVhJQ19OT1JfUkVHX0RPUElfRU47Cj4gPiArICAgICBvcCA9IChzdHJ1Y3Qgc3BpX21l
bV9vcClNWElDX05PUl9XUl9DUjIoTVhJQ19OT1JfQUREUl9DUjJfTU9ERSwgMSwgYnVmKTsKPiA+
ICsgICAgIHJldCA9IHNwaV9ub3Jfd3JpdGVfYW55X3ZvbGF0aWxlX3JlZyhub3IsICZvcCwgbm9y
LT5yZWdfcHJvdG8pOwo+ID4gKyAgICAgaWYgKHJldCkKPiA+ICsgICAgICAgICAgICAgcmV0dXJu
IHJldDsKPiA+ICsKPiA+ICsgICAgIC8qIFJlYWQgZmxhc2ggSUQgdG8gbWFrZSBzdXJlIHRoZSBz
d2l0Y2ggd2FzIHN1Y2Nlc3NmdWwuICovCj4gPiArICAgICByZXQgPSBzcGlfbm9yX3JlYWRfaWQo
bm9yLCA0LCA0LCBidWYsIFNOT1JfUFJPVE9fOF84XzhfRFRSKTsKPgo+IGNhbiB3ZSB1c2Ugbm9y
LT5hZGRyX25ieXRlcyBmb3IgdGhlIHNlY29uZCBhcmd1bWVudD8gUGxlYXNlIHRlc3QgYW5kCj4g
Y29uZmlybS4gTm8gbmVlZCB0byByZXNlbmQgZm9yIHRoaXMsIGp1c3QgY29uZmlybSBhbmQgSSBj
YW4gYW1lbmQgd2hlbgo+IGFwcGx5aW5nLgoKVGhlIGZvbGxvd2luZyBpcyB0aGUgcHJvY2VzcyBv
ZiBzcGlfbm9yX3NjYW4oKQppbnQgc3BpX25vcl9zY2FuKC4uLikKewouLi4uLi4KcmV0ID0gc3Bp
X25vcl9pbml0X3BhcmFtcyhub3IpOwouLi4uLi4KcmV0ID0gc3BpX25vcl9zZXR1cChub3IsIGh3
Y2Fwcyk7Ci4uLi4uLgp9CkZpcnN0LCB3aXRoaW4gdGhlIHNwaV9ub3JfcGFyc2Vfc2ZkcCgpIGZ1
bmN0aW9uIGluc2lkZQpzcGlfbm9yX2luaXRfcGFyYW1zKCk6IG5vci0+cGFyYW1zLT5hZGRyX25i
eXRlcyBpcyBzZXQgYmFzZWQgb24gdGhlClNGRFAsIHdoaWxlIG5vci0+YWRkcl9uYnl0ZXMgaXMg
bm90IGF2YWlsYWJsZS4gVGhlcmVmb3JlLCB0aGUgc2Vjb25kCmFyZ3VtZW50IGNhbm5vdCB1c2Ug
bm9yLT5hZGRyX25ieXRlcyBidXQgY2FuIHVzZQpub3ItPnBhcmFtcy0+YWRkcl9uYnl0ZXMuIEFk
ZGl0aW9uYWxseSwgRm9yIE1hY3Jvbml4IE9jdGFsIE5PUiBGbGFzaAppbiBPY3RhbCBERFIgbW9k
ZSwgYm90aCB0aGUgYWRkcmVzcyBhbmQgZHVtbXkgY3ljbGVzIGFyZSBmaXhlZCBhdCA0CmluIFJF
QURJRCwgc28gc2V0dGluZyB0aGUgc2Vjb25kIGFuZCB0aGlyZCBhcmd1bWVudCB0byA0IGlzIGFs
c28gdmFsaWQuCk1vcmVvdmVyLCBub3ItPmFkZHJfbmJ5dGVzIGlzIHNldCB3aXRoaW4gdGhlIHNw
aV9ub3Jfc2V0dXAoKSBmdW5jdGlvbi4KCj4KPiBXaGF0IGFib3V0IHRoZSB0aGlyZCBhcmd1bWVu
dCwgdGhlIG51bWJlciBvZiBkdW1teSBuYnl0ZXMuIENhbiB3ZSBnZXQKPiB0aGUgY3ljbGVzIG5l
ZWRlZCBmb3IgUkVBRElEIGZyb20gc29tZXdoZXJlIGluIFNGRFA/CgpDdXJyZW50bHksIHRoZSBT
RkRQIGRvZXMgbm90IHByb3ZpZGUgdGhlIG51bWJlciBvZiBkdW1teSBjeWNsZXMgZm9yIHRoZQpS
RUFESUQuCgo+Cj4gTG9va3MgZ29vZC4KClRoYW5rcywKQWx2aW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
