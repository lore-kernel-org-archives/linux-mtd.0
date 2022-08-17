Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EF6C25B08
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Aug 2022 08:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drHdky1ab5vS/KncgIOy290xqHTqDx74TFP1zBTsSHE=; b=4i66+emU5vGnnX
	+EOcRlmgMSrwjwGH3tWVTGgUVR/DBRKWU7yzw1/3tgnlnta6ASGVyW7H6SBGCB3OnPOzKNSx06CpQ
	RCxEiG6pt6y6LgG3TIuyrT+DVG/nCfkxABGOF8XhPH1YN4A9Ib72yHw82srWyIxhNy5HMj6x2KfAI
	a5SMqPfPY0wp4ul4wiA1oXmOJlG+kj5C765g8Lf8gFuBfsUWA56E3HeesrFIjGCEIfUPyiw2x7CLJ
	jItwAWpMxC409kMuJ91nxbFhoHVcaQIPqAGNtS4ix0QDTEidYgeYl6HKgZPxz8Sn7BbhwyYQcJP43
	AnnGIHavXIwHsQqzaETA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOEfn-00FbKv-1w; Wed, 17 Aug 2022 08:45:11 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOEfh-00Fb6O-KT
	for linux-mtd@lists.infradead.org; Wed, 17 Aug 2022 08:45:09 +0000
Received: by mail-wr1-x432.google.com with SMTP id r16so6176139wrm.6
        for <linux-mtd@lists.infradead.org>; Wed, 17 Aug 2022 01:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=kd42aySVbpZFSpcfHHVkY7NPeQJt3LS1TsDiYLJVxXo=;
        b=HRtblAfEMpXetk49nTtSp/cZFUf4gydkmQ90itmyjNa74g1h+D+09SyYz90hDfiJrc
         EWRBzK/Dw++Qn2kKsAvRjfXtI3LpyQHWc328PgxgQ4ZpRdjtJk7gfc3frbYAyAckV4rc
         MFg5lEcrXhs7LQVy14PhL4NFP4nMgJICEEeLePOTwZNfAyMCdbVdB9QtTJChuZzcLUZP
         zyPeqkCyzvFAPFVeyqU70OOoQLk8lVj/jIweEnKIRJ0RJiiQUKtRqlMpfu8sEGIDAPcy
         Yi0yaQr4IeFrh1jP1pwhnAlPc7qwz3qVzOUdOCwYgGNcIIK7u7+OWnBcYd7bsi3k8eKg
         ZIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=kd42aySVbpZFSpcfHHVkY7NPeQJt3LS1TsDiYLJVxXo=;
        b=fGqMc9Yk0WRzs/PTj4yeLhmFPgbdtSwyjcug7EBYzEq/Zz5QVffPqOxfl0ZlK2Rn8O
         SoLnwnEWqGApvPDVb4CUQrpFBytf1MsKai4aoIcBVyKMtkEpAOuBzI7P9S/y6tD429Xq
         GJ6BVCSxxkULXEpJtuAxxvvrjY93FD1ciB3Neiwvg2CKfsANPCdqq0S8hUiKsMIKAhgJ
         V3diCHLOMT1scHexduhymTEPlbCqPag/MowNZO8u7+yTG+LCBv6ZCfYM4NGsma6wAE/Z
         o8XZuFW3Vhc6+tvo4Rk85jhx7nii8bxYeth2gPzEmF/QHxPO0FnMATWmPlArVux/bgo3
         s6dQ==
X-Gm-Message-State: ACgBeo1k25SSkynw4tFnuK7IGJ4xvoLyQ0bvC6/gqnvzVZTl9Qp84a3a
	2ntM65YxsoWluKuDkNA/sXGTjA==
X-Google-Smtp-Source: AA6agR5zVjKZPFz5XYQ6BzcpHd9aGYa5QzkH4q76SMTqQt6ql4sqOrJIyw6ehraB+G9tP9SoV8+nyQ==
X-Received: by 2002:adf:d1e8:0:b0:223:bca:8019 with SMTP id g8-20020adfd1e8000000b002230bca8019mr13509448wrd.562.1660725903362;
        Wed, 17 Aug 2022 01:45:03 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id j18-20020a05600c191200b003a5f54e3bbbsm1579993wmq.38.2022.08.17.01.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 01:45:02 -0700 (PDT)
Message-ID: <a34e8e37-0aad-e092-1138-45ad9ce790a2@linaro.org>
Date: Wed, 17 Aug 2022 09:45:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V4 1/2] mtd: allow getting MTD device associated with a
 specific DT node
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tom Rini <trini@konsulko.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, u-boot@lists.denx.de,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20220615194300.13358-1-zajec5@gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220615194300.13358-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_014505_731355_5A8B2ED5 
X-CRM114-Status: GOOD (  22.08  )
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

CgpPbiAxNS8wNi8yMDIyIDIwOjQyLCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4gRnJvbTogUmFm
YcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IAo+IE1URCBzdWJzeXN0ZW0gQVBJIGFs
bG93cyBpbnRlcmFjdGluZyB3aXRoIE1URCBkZXZpY2VzIChlLmcuIHJlYWRpbmcsCj4gd3JpdGlu
ZywgaGFuZGxpbmcgYmFkIGJsb2NrcykuIFNvIGZhciBhIHJhbmRvbSBkcml2ZXIgY291bGQgZ2V0
IE1URAo+IGRldmljZSBvbmx5IGJ5IGl0cyBuYW1lIChnZXRfbXRkX2RldmljZV9ubSgpKS4gVGhp
cyBjaGFuZ2UgYWxsb3dzCj4gZ2V0dGluZyB0aGVtIGFsc28gYnkgYSBEVCBub2RlLgo+IAo+IFRo
aXMgQVBJIGlzIHJlcXVpcmVkIGZvciBkcml2ZXJzIGhhbmRsaW5nIERUIGRlZmluZWQgTVREIHBh
cnRpdGlvbnMgaW4gYQo+IHNwZWNpZmljIHdheSAoZS5nLiBVLUJvb3QgKHN1YilwYXJ0aXRpb24g
d2l0aCBlbnZpcm9ubWVudCB2YXJpYWJsZXMpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBN
acWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiBBY2tlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4KPiAtLS0KCkFwcGxpZWQgYWxvbmcgd2l0aCBudm1lbSBw
cm92aWRlciB0aGFua3MsCi0tc3JpbmkKPiBWMzogRmlyc3QgaW50cm9kdWN0aW9uIG9mIG9mX2dl
dF9tdGRfZGV2aWNlX2J5X25vZGUoKQo+IFY0OiBVc2UgRVBST0JFX0RFRkVSCj4gCj4gU3Jpbml2
YXM6IGluIFYzIE1pcXVlbCBzYWlkIGl0J3MgT0sgdG8gcHVzaCB0aGlzIHBhdGNoIHRocm91Z2gg
TlZNRU0KPiAtLS0KPiAgIGRyaXZlcnMvbXRkL210ZGNvcmUuYyAgIHwgMjggKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ICAgaW5jbHVkZS9saW51eC9tdGQvbXRkLmggfCAgMSArCj4gICAy
IGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvbXRkY29yZS5jIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gaW5kZXggOWViMDY4MGRi
MzEyLi4zNjEzY2MxNDJmMjUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4g
KysrIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gQEAgLTExNTQsNiArMTE1NCwzNCBAQCBpbnQg
X19nZXRfbXRkX2RldmljZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiAgIH0KPiAgIEVYUE9SVF9T
WU1CT0xfR1BMKF9fZ2V0X210ZF9kZXZpY2UpOwo+ICAgCj4gKy8qKgo+ICsgKiBvZl9nZXRfbXRk
X2RldmljZV9ieV9ub2RlIC0gb2J0YWluIGFuIE1URCBkZXZpY2UgYXNzb2NpYXRlZCB3aXRoIGEg
Z2l2ZW4gbm9kZQo+ICsgKgo+ICsgKiBAbnA6IGRldmljZSB0cmVlIG5vZGUKPiArICovCj4gK3N0
cnVjdCBtdGRfaW5mbyAqb2ZfZ2V0X210ZF9kZXZpY2VfYnlfbm9kZShzdHJ1Y3QgZGV2aWNlX25v
ZGUgKm5wKQo+ICt7Cj4gKwlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IE5VTEw7Cj4gKwlzdHJ1Y3Qg
bXRkX2luZm8gKnRtcDsKPiArCWludCBlcnI7Cj4gKwo+ICsJbXV0ZXhfbG9jaygmbXRkX3RhYmxl
X211dGV4KTsKPiArCj4gKwllcnIgPSAtRVBST0JFX0RFRkVSOwo+ICsJbXRkX2Zvcl9lYWNoX2Rl
dmljZSh0bXApIHsKPiArCQlpZiAobXRkX2dldF9vZl9ub2RlKHRtcCkgPT0gbnApIHsKPiArCQkJ
bXRkID0gdG1wOwo+ICsJCQllcnIgPSBfX2dldF9tdGRfZGV2aWNlKG10ZCk7Cj4gKwkJCWJyZWFr
Owo+ICsJCX0KPiArCX0KPiArCj4gKwltdXRleF91bmxvY2soJm10ZF90YWJsZV9tdXRleCk7Cj4g
Kwo+ICsJcmV0dXJuIGVyciA/IEVSUl9QVFIoZXJyKSA6IG10ZDsKPiArfQo+ICtFWFBPUlRfU1lN
Qk9MX0dQTChvZl9nZXRfbXRkX2RldmljZV9ieV9ub2RlKTsKPiArCj4gICAvKioKPiAgICAqCWdl
dF9tdGRfZGV2aWNlX25tIC0gb2J0YWluIGEgdmFsaWRhdGVkIGhhbmRsZSBmb3IgYW4gTVREIGRl
dmljZSBieQo+ICAgICoJZGV2aWNlIG5hbWUKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9t
dGQvbXRkLmggYi9pbmNsdWRlL2xpbnV4L210ZC9tdGQuaAo+IGluZGV4IDk1NWFlZTE0YjBmNy4u
NmZjODQxY2VlZjMxIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbXRkL210ZC5oCj4gKysr
IGIvaW5jbHVkZS9saW51eC9tdGQvbXRkLmgKPiBAQCAtNjc3LDYgKzY3Nyw3IEBAIGV4dGVybiBp
bnQgbXRkX2RldmljZV91bnJlZ2lzdGVyKHN0cnVjdCBtdGRfaW5mbyAqbWFzdGVyKTsKPiAgIGV4
dGVybiBzdHJ1Y3QgbXRkX2luZm8gKmdldF9tdGRfZGV2aWNlKHN0cnVjdCBtdGRfaW5mbyAqbXRk
LCBpbnQgbnVtKTsKPiAgIGV4dGVybiBpbnQgX19nZXRfbXRkX2RldmljZShzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZCk7Cj4gICBleHRlcm4gdm9pZCBfX3B1dF9tdGRfZGV2aWNlKHN0cnVjdCBtdGRfaW5m
byAqbXRkKTsKPiArZXh0ZXJuIHN0cnVjdCBtdGRfaW5mbyAqb2ZfZ2V0X210ZF9kZXZpY2VfYnlf
bm9kZShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKTsKPiAgIGV4dGVybiBzdHJ1Y3QgbXRkX2luZm8g
KmdldF9tdGRfZGV2aWNlX25tKGNvbnN0IGNoYXIgKm5hbWUpOwo+ICAgZXh0ZXJuIHZvaWQgcHV0
X210ZF9kZXZpY2Uoc3RydWN0IG10ZF9pbmZvICptdGQpOwo+ICAgCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
