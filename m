Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6198C5B549
	for <linux-mtd@archiver.kernel.org>; Fri, 30 May 2025 08:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jFtDCJnlDqypDzfifReLmXG1Fcc/lrT5cmk4T9Vjcu4=; b=mWh36ObfWy/jfO
	PlBVQQzjSJYvorixZ/Rg/hKPu0aONbL/V6pSShZnb27MtOivVp8p1etXN72iqqQaJqRNHrZGaDnLq
	+KsU6FlWI061wSpUz+yNRxF33Rv5Lj60Ku0IUghOPmg1cunnhb7u0m4p8u5LaTabVexeq9An7ZHfv
	gvZQ5MREtIpCzyQYJtq6cumUofGkSm5VXXjcmBeXIqamrz254Bba7WIoZ6Cs5JRSLyhDs4VKXlqnO
	4Obk/f1BqJ9vQk0HRKpaSDko2Sw6T7ZrBX7QZK4GcRsJuIlVPE+JxgNaTRmAqQch61h2fsp0rO0b3
	p8cHb2Qblli6iTq++54g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKvBL-000000000pO-2TT1;
	Fri, 30 May 2025 08:33:39 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKv5C-000000000Ab-2yxf
	for linux-mtd@lists.infradead.org;
	Fri, 30 May 2025 08:27:19 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e7c5d470a8bso1690695276.0
        for <linux-mtd@lists.infradead.org>; Fri, 30 May 2025 01:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748593637; x=1749198437; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYOli4oTQ0MFkGdltVUUX/1x4FeeDlNH5ixoZJpfc0Y=;
        b=AoQHyQ3/9ijgv7t/NOdPCUOpTE6KNjabEzdArmhvIgvJs3H2g8mSyM7wwbNps8G7l7
         EOcPVtDf8sXdXG7Kt9B6QdMO+15e9KO4tfPnHktKCR+z/7VxV8r72Vdy12ftm/3XyeHT
         89LsY8CtrV2JnmldC7JA2lWJFHhMlFe3KbqO8Vu71Mtr6dSkIWNYSM/l9gR1fk15bQDd
         IQ3SkA3Dq3c2ZFUcWwxy3aDYsXHO0YmW8bs8TA4w8qzYtI8Yi63z/Vvl8EBEPW57x1/N
         DDk6j2gCDnsmw7GtPf3wHF2CH0JYYNtLGjjIjnANNuTnP/aZo3biMcHj/afsrVO6HYvE
         CXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748593637; x=1749198437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oYOli4oTQ0MFkGdltVUUX/1x4FeeDlNH5ixoZJpfc0Y=;
        b=pR094FpbxHTPGciQ1xXukySqVyQ0pWKakhFd/YYX9B7m95Ex0PQ3gAQELGeV4FhqFi
         t05EJ97yoCbNrn12W5b0uQDTwNXEYZ8yEb2V180OxkPBObuMUelpgRa4yu3wPKz7CLh2
         52zLq2ES8qOl20LizrTv+jHwQpgm7Fh/Q8RIW3nTO8HNYXw3kFJxp1cNO0MIjDHO5Kfd
         cdpkzhltyNy+fKkcM7fqRX/sk00tpTPmW/0BDo1n/DIWnyK1KDZuGkVi38mi1ze9de6X
         mCX+yeMsXM920ZONb+BtLz7cjKSkNi6ZyiIbeOPNHCZhkNByUJilRzQlJes/YgQXaY/P
         Wyxw==
X-Forwarded-Encrypted: i=1; AJvYcCXkmY5YChNfze95gT17drff2h5yS3iq5LIqn2lOAs92cLGlbccgeFgVYbZMXgaVl8AcpdAlbxyoFHw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5XPy4LvRQMEScpS6URrDJtFDl3JUqwZhJ78WdqkjLqUOhx6mG
	HtKlpAI8pwnza+zO9ppZhRVaWCpXPwN50QHKaWiymxl0sdkRfaGTTJFtJJ8t41zE0rm5y3FnbGa
	tq0Knfdb76wRB7e8y2u3CWBg0tFubkpw=
X-Gm-Gg: ASbGncsJFNWyVwYROPYjUrhwg0bN4u8cCjxuGZqYF86trdTVaEN1W0+UfnUEnWKa6kD
	VHmxqZJvE/7GJPf0HrJEhXdTynYnu/cbUNaD1UxI5E+zty883Ywc9SCLb48H0s24t/ES5uWFnZN
	a3YQFTgKpHE3VDKQ13iYTAsPmTHlTdsyI=
X-Google-Smtp-Source: AGHT+IFsqOwz2hH/6SkMcb4g5Yt5gM++f/aIIg84Ru4n0ZJdf4J+GaGTDN2HUDMjHnisBhrlGkZG3VMjpTsxTu67sqE=
X-Received: by 2002:a05:690c:ed4:b0:70e:2168:7330 with SMTP id
 00721157ae682-70f97ebe21cmr35975617b3.19.1748593637073; Fri, 30 May 2025
 01:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250530034713.4165309-1-dregan@broadcom.com>
In-Reply-To: <20250530034713.4165309-1-dregan@broadcom.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Fri, 30 May 2025 10:27:05 +0200
X-Gm-Features: AX0GCFu20_wlEHN11fGmhScteajc3WuMgALK6hLnwRgWbt4ITw7IMg-Z42znGps
Message-ID: <CAOiHx=nzNZiOiBKUVqpTA5S8uY+ZNdPpLpEQGGDN9jP2-4Lj8Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: brcmnand: fix mtd corrected bits stat
To: David Regan <dregan@broadcom.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com, william.zhang@broadcom.com, 
	anand.gore@broadcom.com, florian.fainelli@broadcom.com, 
	kamal.dasu@broadcom.com, dan.beygelman@broadcom.com, 
	Miquel Raynal <miquel.raynal@bootlin.com>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
	rafal@milecki.pl, computersforpeace@gmail.com, frieder.schrempf@kontron.de, 
	vigneshr@ti.com, richard@nod.at, bbrezillon@kernel.org, kdasu.kdev@gmail.com, 
	jaimeliao.tw@gmail.com, kilobyte@angband.pl, dgcbueu@gmail.com, 
	dregan@mail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_012718_756264_17073C0B 
X-CRM114-Status: GOOD (  17.14  )
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

SGksCgpPbiBGcmksIE1heSAzMCwgMjAyNSBhdCA1OjQ44oCvQU0gRGF2aWQgUmVnYW4gPGRyZWdh
bkBicm9hZGNvbS5jb20+IHdyb3RlOgo+Cj4gQ3VycmVudGx5IHdlIGF0dGVtcHQgdG8gZ2V0IHRo
ZSBhbW91bnQgb2YgZmxpcHBlZCBiaXRzIGZyb20gYSBoYXJkd2FyZQo+IGxvY2F0aW9uIHdoaWNo
IGlzIHJlc2V0IG9uIGV2ZXJ5IHN1YnBhZ2UuIEluc3RlYWQgb2J0YWluIHRvdGFsIGZsaXBwZWQK
PiBiaXRzIHN0YXQgZnJvbSBoYXJkd2FyZSBhY2N1bXVsYXRvci4gSW4gYWRkaXRpb24gaWRlbnRp
ZnkgdGhlIGNvcnJlY3QKPiBtYXhpbXVtIHN1YnBhZ2UgY29ycmVjdGVkIGJpdHMuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBEYXZpZCBSZWdhbiA8ZHJlZ2FuQGJyb2FkY29tLmNvbT4KPiBSZXZpZXdlZC1i
eTogV2lsbGlhbSBaaGFuZyA8d2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20+Cj4gUmV2aWV3ZWQt
Ynk6IEthbWFsIERhc3UgPGthbWFsLmRhc3VAYnJvYWRjb20uY29tPgo+IC0tLQo+ICBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIHwgNDggKysrKysrKysrKysrKysrKysr
LS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFu
ZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+IGluZGV4IDYy
YmRkYTNiZTkyZi4uNDNhYjRhZWRkYTU1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNt
bmFuZC9icmNtbmFuZC5jCj4gQEAgLTM2MSw2ICszNjEsNyBAQCBlbnVtIGJyY21uYW5kX3JlZyB7
Cj4gICAgICAgICBCUkNNTkFORF9DT1JSX0NPVU5ULAo+ICAgICAgICAgQlJDTU5BTkRfQ09SUl9F
WFRfQUREUiwKPiAgICAgICAgIEJSQ01OQU5EX0NPUlJfQUREUiwKPiArICAgICAgIEJSQ01OQU5E
X1JFQURfRVJST1JfQ09VTlQsCj4gICAgICAgICBCUkNNTkFORF9VTkNPUlJfRVhUX0FERFIsCj4g
ICAgICAgICBCUkNNTkFORF9VTkNPUlJfQUREUiwKPiAgICAgICAgIEJSQ01OQU5EX1NFTUFQSE9S
RSwKPiBAQCAtMzg5LDYgKzM5MCw3IEBAIHN0YXRpYyBjb25zdCB1MTYgYnJjbW5hbmRfcmVnc192
MjFbXSA9IHsKPiAgICAgICAgIFtCUkNNTkFORF9DT1JSX1RIUkVTSE9MRF9FWFRdICAgPSAgICAg
MCwKPiAgICAgICAgIFtCUkNNTkFORF9VTkNPUlJfQ09VTlRdICAgICAgICAgPSAgICAgMCwKPiAg
ICAgICAgIFtCUkNNTkFORF9DT1JSX0NPVU5UXSAgICAgICAgICAgPSAgICAgMCwKPiArICAgICAg
IFtCUkNNTkFORF9SRUFEX0VSUk9SX0NPVU5UXSAgICAgPSAgICAgMCwKPiAgICAgICAgIFtCUkNN
TkFORF9DT1JSX0VYVF9BRERSXSAgICAgICAgPSAgMHg2MCwKPiAgICAgICAgIFtCUkNNTkFORF9D
T1JSX0FERFJdICAgICAgICAgICAgPSAgMHg2NCwKPiAgICAgICAgIFtCUkNNTkFORF9VTkNPUlJf
RVhUX0FERFJdICAgICAgPSAgMHg2OCwKPiBAQCAtNDE5LDYgKzQyMSw3IEBAIHN0YXRpYyBjb25z
dCB1MTYgYnJjbW5hbmRfcmVnc192MzNbXSA9IHsKPiAgICAgICAgIFtCUkNNTkFORF9DT1JSX1RI
UkVTSE9MRF9FWFRdICAgPSAgICAgMCwKPiAgICAgICAgIFtCUkNNTkFORF9VTkNPUlJfQ09VTlRd
ICAgICAgICAgPSAgICAgMCwKPiAgICAgICAgIFtCUkNNTkFORF9DT1JSX0NPVU5UXSAgICAgICAg
ICAgPSAgICAgMCwKPiArICAgICAgIFtCUkNNTkFORF9SRUFEX0VSUk9SX0NPVU5UXSAgICAgPSAg
ICAgMCwKPiAgICAgICAgIFtCUkNNTkFORF9DT1JSX0VYVF9BRERSXSAgICAgICAgPSAgMHg3MCwK
PiAgICAgICAgIFtCUkNNTkFORF9DT1JSX0FERFJdICAgICAgICAgICAgPSAgMHg3NCwKPiAgICAg
ICAgIFtCUkNNTkFORF9VTkNPUlJfRVhUX0FERFJdICAgICAgPSAgMHg3OCwKPiBAQCAtNDQ5LDYg
KzQ1Miw3IEBAIHN0YXRpYyBjb25zdCB1MTYgYnJjbW5hbmRfcmVnc192NTBbXSA9IHsKPiAgICAg
ICAgIFtCUkNNTkFORF9DT1JSX1RIUkVTSE9MRF9FWFRdICAgPSAgICAgMCwKPiAgICAgICAgIFtC
UkNNTkFORF9VTkNPUlJfQ09VTlRdICAgICAgICAgPSAgICAgMCwKPiAgICAgICAgIFtCUkNNTkFO
RF9DT1JSX0NPVU5UXSAgICAgICAgICAgPSAgICAgMCwKPiArICAgICAgIFtCUkNNTkFORF9SRUFE
X0VSUk9SX0NPVU5UXSAgICAgPSAgICAgMCwKCkkgc2VlIHRoaXMgcmVnaXN0ZXIgaW4gQkNNNjMy
NjgncyBOQU5EIGNvbnRyb2xsZXIgYXQgMHg4MCwgd2hpY2ggaXMgYQp2NC54IG9uZSwgc28gSSdt
IHN1cnByaXNlZCB2NS4wIGRvZXNuJ3QgaGF2ZSBpdC4gT3IgZG9lcyBpdCBub3Qgd29yawp0aGVy
ZT8gSSBkb24ndCBrbm93IGlmIHYzLjMgYWxzbyBoYXMgaXQgb3IgaWYgdXNpbmcgdGhpcyBvbiB2
NC54IHdvdWxkCnJlcXVpcmUgYSBzZXBhcmF0ZSBicmNtbmFuZF9yZWdzIGVudHJ5LgoKQ2FuJ3Qg
cmVhbGx5IGNvbW1lbnQgb24gdGhlIHJlbWFpbmluZyBjaGFuZ2VzLgoKUmVnYXJkcywKSm9uYXMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
