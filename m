Return-Path: <SRS0=Ceh7=ON=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879D9C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Sep 2021 16:57:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5349561090
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Sep 2021 16:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5349561090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+PgH4n2Q9Y40NpUkfrJqffyRbe9B2ncoxSHcqdCUiRA=; b=BDBkDTzOXswpFG
	YZQDyvrMYE65iMgl9kWzT8Tsa98t22veevyWjFzCQcJCJeYWgm/steFtew57hsBWEEQAr85zWWCfr
	fSW+0MCp3WNB7eAFwI5qtT+Lsow/AgY642IQkmf47a1y8Ga2eylmHo6bVm0Jg9tHdj9PBWpPsAlAq
	yVfi0FVQ6njy/UtakT8SBCcTpU7/xXj3d/8v2ko4Pk4TmmaC6stwN6KPCpCM+ql7nqedDANY6yP7U
	jRmphhYnrR/Zt+8U3CkjhjxMbjAFNaPREu3UgdYiE43qgqTfbJellf/hY9REg/oR5TW0DrdxQ05C6
	HnNcO9AsIm/WS/fics3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTS1R-00CC65-1U; Thu, 23 Sep 2021 16:56:33 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTS1L-00CC43-Ru; Thu, 23 Sep 2021 16:56:31 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 l16-20020a9d6a90000000b0053b71f7dc83so9378134otq.7; 
 Thu, 23 Sep 2021 09:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=u0vSF2zhWmzDeHFMOpnl/4kxZUI8rXOSct9vbIB6qjw=;
 b=VcDPhuyt3NbQBx6E+yzISXt9ZvnFdCS9lTPDILyX9cH7NvxNC1e6tViAC9zrwCwLis
 0N5jW+lUaWKiVGCI8d9H8ZCs/ufrmIyecQq32D5mAAhak3/ppqE2qQ2/HozkeK6gJ7wF
 TfxAUzimx89oUjiEIf/Mdj8qdmDwdEOEHWC7SqFbg0GJj8cqQWrW0KpYA3oKoSFgi4+d
 tqYzWiE0PONPYykT9CHindPpu3xjb2g+IsHeigDE23Stp6FwExvZhtkswVz+P2JsIpgo
 TuxXfaTTktbwqKtvoO2ViZQdVroFqC8oZRk/R9kxeARDAFZWQdK/UZmXEmU9Hf5tStzF
 dLBg==
X-Gm-Message-State: AOAM533maKLgnYhU2+kccWVJQPHFrJI0JGjHuqTStB/AnWJ2xzXu/LbA
 G7aKxme+G9JETpRbVywxyw==
X-Google-Smtp-Source: ABdhPJy45eXPbJjkYsqHzQJhRQAOOe9N9xX/SfBtgp8UFfRJplXpTQpsDPN1sx9bPSoGl3cO6Ec9WA==
X-Received: by 2002:a9d:7150:: with SMTP id y16mr5427647otj.145.1632416186429; 
 Thu, 23 Sep 2021 09:56:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l19sm1404693otj.77.2021.09.23.09.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 09:56:25 -0700 (PDT)
Received: (nullmailer pid 3164589 invoked by uid 1000);
 Thu, 23 Sep 2021 16:56:24 -0000
Date: Thu, 23 Sep 2021 11:56:24 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, dinguyen@kernel.org, p.zabel@pengutronix.de,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tn@semihalf.com, ka@semihalf.com, jam@semihalf.com,
 Joanna Brozek <jbrozek@antmicro.com>,
 Mariusz Glebocki <mglebocki@antmicro.com>,
 Tomasz Gorochowik <tgorochowik@antmicro.com>,
 Maciej Mikunda <mmikunda@antmicro.com>
Subject: Re: [PATCH 2/3] dts: socfpga: Add Mercury+ AA1 devicetree
Message-ID: <YUyxuIVcjS5h+3cT@robh.at.kernel.org>
References: <20210920124141.1166544-1-pan@semihalf.com>
 <20210920124140.u56dOOGofORjfYeTSsKGqD2HNw-7gu5UqvN2ocHwr-g@z>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210920124140.u56dOOGofORjfYeTSsKGqD2HNw-7gu5UqvN2ocHwr-g@z>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_095627_993341_807B3683 
X-CRM114-Status: GOOD (  17.98  )
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

T24gTW9uLCBTZXAgMjAsIDIwMjEgYXQgMDI6NDE6NDBQTSArMDIwMCwgUGF3ZcWCIEFuaWtpZWwg
d3JvdGU6Cj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBNZXJjdXJ5KyBBQTEgbW9kdWxlIGZvciBBcnJp
YSAxMCBTb0MgRlBHQS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXdlxYIgQW5pa2llbCA8cGFuQHNl
bWloYWxmLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKb2FubmEgQnJvemVrIDxqYnJvemVrQGFudG1p
Y3JvLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNYXJpdXN6IEdsZWJvY2tpIDxtZ2xlYm9ja2lAYW50
bWljcm8uY29tPgo+IFNpZ25lZC1vZmYtYnk6IFRvbWFzeiBHb3JvY2hvd2lrIDx0Z29yb2Nob3dp
a0BhbnRtaWNyby5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWFjaWVqIE1pa3VuZGEgPG1taWt1bmRh
QGFudG1pY3JvLmNvbT4KPiAtLS0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUgICAgICAg
ICAgICAgICAgICAgIHwgICAxICsKPiAgLi4uL2Jvb3QvZHRzL3NvY2ZwZ2FfYXJyaWExMF9tZXJj
dXJ5X2FhMS5kdHMgIHwgMTI3ICsrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQs
IDEyOCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9ib290L2R0
cy9zb2NmcGdhX2FycmlhMTBfbWVyY3VyeV9hYTEuZHRzCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtL2Jvb3QvZHRzL01ha2VmaWxlIGIvYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUKPiBpbmRl
eCA3ZTA5MzQxODA3MjQuLjBhNzgwOWViMzc5NSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290
L2R0cy9NYWtlZmlsZQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxlCj4gQEAgLTEw
NzgsNiArMTA3OCw3IEBAIGR0Yi0kKENPTkZJR19BUkNIX0lOVEVMX1NPQ0ZQR0EpICs9IFwKPiAg
CXNvY2ZwZ2FfYXJyaWExMF9zb2Nka19uYW5kLmR0YiBcCj4gIAlzb2NmcGdhX2FycmlhMTBfc29j
ZGtfcXNwaS5kdGIgXAo+ICAJc29jZnBnYV9hcnJpYTEwX3NvY2RrX3NkbW1jLmR0YiBcCj4gKwlz
b2NmcGdhX2FycmlhMTBfbWVyY3VyeV9hYTEuZHRiIFwKPiAgCXNvY2ZwZ2FfY3ljbG9uZTVfY2hh
bWVsZW9uOTYuZHRiIFwKPiAgCXNvY2ZwZ2FfY3ljbG9uZTVfbWN2ZXZrLmR0YiBcCj4gIAlzb2Nm
cGdhX2N5Y2xvbmU1X3NvY2RrLmR0YiBcCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRz
L3NvY2ZwZ2FfYXJyaWExMF9tZXJjdXJ5X2FhMS5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9zb2Nm
cGdhX2FycmlhMTBfbWVyY3VyeV9hYTEuZHRzCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwMDAuLmMxM2YxNmFmYTcyZgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNo
L2FybS9ib290L2R0cy9zb2NmcGdhX2FycmlhMTBfbWVyY3VyeV9hYTEuZHRzCj4gQEAgLTAsMCAr
MSwxMjcgQEAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiArL2R0cy12
MS87Cj4gKwo+ICsjaW5jbHVkZSAic29jZnBnYV9hcnJpYTEwLmR0c2kiCj4gKwo+ICsvIHsKPiAr
Cj4gKwltb2RlbCA9ICJFbmNsdXN0cmEgTWVyY3VyeSBBQTEiOwo+ICsJY29tcGF0aWJsZSA9ICJh
bHRyLHNvY2ZwZ2EtYXJyaWExMCIsICJhbHRyLHNvY2ZwZ2EiOwo+ICsKPiArCWFsaWFzZXMgewo+
ICsJCWV0aGVybmV0MCA9ICZnbWFjMDsKPiArCQlzZXJpYWwxID0gJnVhcnQxOwo+ICsJfTsKPiAr
Cj4gKwltZW1vcnkgewoKbWVtb3J5QDAKCj4gKwkJbmFtZSA9ICJtZW1vcnkiOwo+ICsJCWRldmlj
ZV90eXBlID0gIm1lbW9yeSI7Cj4gKwkJcmVnID0gPDB4MCAweDgwMDAwMDAwPjsgLyogMkdCICov
Cj4gKwl9Owo+ICsKPiArCWNob3NlbiB7Cj4gKwkJc3Rkb3V0LXBhdGggPSAic2VyaWFsMToxMTUy
MDBuOCI7Cj4gKwl9Owo+ICt9Owo+ICsKPiArJm9zYzEgewo+ICsJY2xvY2stZnJlcXVlbmN5ID0g
PDMzMzMwMDAwPjsKPiArfTsKPiArCj4gKyZ1c2IwIHsKPiArCXN0YXR1cyA9ICJva2F5IjsKPiAr
CWRyX21vZGUgPSAiaG9zdCI7Cj4gK307Cj4gKwo+ICsvKiBGb2xsb3dpbmcgbWFwcGluZ3MgYXJl
IHRha2VuIGZyb20gYXJyaWExMCBzb2NkayBkdHMgKi8KPiArJm1tYyB7Cj4gKwlzdGF0dXMgPSAi
b2theSI7Cj4gKwljYXAtc2QtaGlnaHNwZWVkOwo+ICsJYnJva2VuLWNkOwo+ICsJYnVzLXdpZHRo
ID0gPDQ+Owo+ICt9Owo+ICsKPiArJmVjY21nciB7Cj4gKwlzZG1tY2EtZWNjQGZmOGMyYzAwIHsK
PiArCQljb21wYXRpYmxlID0gImFsdHIsc29jZnBnYS1zZG1tYy1lY2MiOwo+ICsJCXJlZyA9IDww
eGZmOGMyYzAwIDB4NDAwPjsKPiArCQlhbHRyLGVjYy1wYXJlbnQgPSA8Jm1tYz47Cj4gKwkJaW50
ZXJydXB0cyA9IDwxNSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKPiArCQkJICAgICA8NDcgSVJRX1RZ
UEVfTEVWRUxfSElHSD4sCj4gKwkJCSAgICAgPDE2IElSUV9UWVBFX0xFVkVMX0hJR0g+LAo+ICsJ
CQkgICAgIDw0OCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiArCX07Cj4gK307Cj4gKwo+ICsmZ21h
YzAgewo+ICsJcGh5LW1vZGUgPSAicmdtaWkiOwo+ICsJcGh5LWFkZHIgPSA8MHhmZmZmZmZmZj47
IC8qIHByb2JlIGZvciBwaHkgYWRkciAqLwo+ICsKPiArCW1heC1mcmFtZS1zaXplID0gPDM4MDA+
Owo+ICsJc3RhdHVzID0gIm9rYXkiOwo+ICsKPiArCXBoeS1oYW5kbGUgPSA8JnBoeTM+Owo+ICsK
PiArCW1kaW8wIHsKCidtZGlvJyBkb2Vzbid0IHdvcms/Cgo+ICsJCSNhZGRyZXNzLWNlbGxzID0g
PDE+Owo+ICsJCSNzaXplLWNlbGxzID0gPDA+Owo+ICsJCWNvbXBhdGlibGUgPSAic25wcyxkd21h
Yy1tZGlvIjsKPiArCQlwaHkzOiBldGhlcm5ldC1waHlAMyB7Cj4gKwkJCXR4ZDAtc2tldy1wcyA9
IDwwPjsgLyogLTQyMHBzICovCj4gKwkJCXR4ZDEtc2tldy1wcyA9IDwwPjsgLyogLTQyMHBzICov
Cj4gKwkJCXR4ZDItc2tldy1wcyA9IDwwPjsgLyogLTQyMHBzICovCj4gKwkJCXR4ZDMtc2tldy1w
cyA9IDwwPjsgLyogLTQyMHBzICovCj4gKwkJCXJ4ZDAtc2tldy1wcyA9IDw0MjA+OyAvKiAwcHMg
Ki8KPiArCQkJcnhkMS1za2V3LXBzID0gPDQyMD47IC8qIDBwcyAqLwo+ICsJCQlyeGQyLXNrZXct
cHMgPSA8NDIwPjsgLyogMHBzICovCj4gKwkJCXJ4ZDMtc2tldy1wcyA9IDw0MjA+OyAvKiAwcHMg
Ki8KPiArCQkJdHhlbi1za2V3LXBzID0gPDA+OyAvKiAtNDIwcHMgKi8KPiArCQkJdHhjLXNrZXct
cHMgPSA8MTg2MD47IC8qIDk2MHBzICovCj4gKwkJCXJ4ZHYtc2tldy1wcyA9IDw0MjA+OyAvKiAw
cHMgKi8KPiArCQkJcnhjLXNrZXctcHMgPSA8MTY4MD47IC8qIDc4MHBzICovCj4gKwkJCXJlZyA9
IDwzPjsKPiArCQl9Owo+ICsJfTsKPiArfTsKPiArCj4gKyZpMmMxIHsKPiArCXN0YXR1cyA9ICJv
a2F5IjsKPiArCWlzbDEyMDIyOiBpc2wxMjAyMkA2ZiB7Cj4gKwkJc3RhdHVzID0gIm9rYXkiOwo+
ICsJCWNvbXBhdGlibGUgPSAiaXNpbCxpc2wxMjAyMiI7Cj4gKwkJcmVnID0gPDB4NmY+Owo+ICsJ
fTsKPiArfTsKPiArCj4gKyZ1YXJ0MSB7Cj4gKwlzdGF0dXMgPSAib2theSI7Cj4gK307Cj4gKwo+
ICsmcXNwaSB7Cj4gKwlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICsKPiArCWZsYXNoMDogbjI1cTAw
QDAgewoKZmxhc2hAMAoKPiArCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArCQkjc2l6ZS1jZWxs
cyA9IDwxPjsKPiArCQljb21wYXRpYmxlID0gIm4yNXEwMCI7Cj4gKwkJcmVnID0gPDA+Owo+ICsJ
CXNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAwMDAwPjsKPiArCQljZG5zLHBhZ2Utc2l6ZSA9IDwy
NTY+Owo+ICsJCWNkbnMsYmxvY2stc2l6ZSA9IDwxNj47Cj4gKwkJbTI1cCxmYXN0LXJlYWQ7Cj4g
KwkJY2RucyxyZWFkLWRlbGF5ID0gPDQ+Owo+ICsJCWNkbnMsdHNoc2wtbnMgPSA8MjAwPjsKPiAr
CQljZG5zLHRzZDJkLW5zID0gPDI1NT47Cj4gKwkJY2Rucyx0Y2hzaC1ucyA9IDwyMD47Cj4gKwkJ
Y2Rucyx0c2xjaC1ucyA9IDwyMD47Cj4gKwo+ICsJCXBhcnQwOiBxc3BpLWJvb3RAMCB7CgpQdXQg
dGhlc2UgdW5kZXIgYSAncGFydGl0aW9ucycgbm9kZS4KCj4gKwkJCWxhYmVsID0gIkZsYXNoIDAg
UmF3IERhdGEiOwo+ICsJCQlyZWcgPSA8MHgwIDB4MDEzNDAwMDA+Owo+ICsJCX07Cj4gKwkJcGFy
dDE6IHFzcGktcm9vdGZzQDEzMjAwMDAgewo+ICsJCQlsYWJlbCA9ICJGbGFzaCAxIGpmZnMyIEZp
bGVzeXN0ZW0iOwo+ICsJCQlyZWcgPSA8MHgwMTM0MDAwMCAweDJjYzAwMDA+Owo+ICsJCX07Cj4g
Kwl9Owo+ICt9Owo+IC0tIAo+IDIuMjUuMQo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdAo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
