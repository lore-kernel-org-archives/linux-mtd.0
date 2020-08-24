Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E51DC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 10:33:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48EE7208E4
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 10:33:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D8eJdVtt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48EE7208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TgcyIPCKHiXtFIhlNFwSxtimrPty96/Tosgp4I6cNtU=; b=D8eJdVttkSmM8DQ6NLX0zyyu4
	WtLDTuZTBb2jEPVXWAU8CzKYGh/gn+A25wIw4TSmwmghZSdi6QBG5vUT3UdUKKkit2keBsunj3xNU
	+sI+j4yVMmumuwiOgIdQiFxj1Fk07d9cPjymoK7eqxuB56h2AziyVUE85UHdiHyGWbH2lmZabAZWb
	EKsQvO8GLMVd8ppPWTRyxyw4cpnWv5jZNQnnIz2X1/kf8+vcqQWcY4rIDNNtIfg99za1AurKOKGbD
	rnG29puEz3AUbJVaIiAak/fmnAA7jQmO+MNunZCrUPdPiLuhNh8ckl/sxYjzjUC0TDhjKE+mmqEzm
	q0NaDolqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA9mQ-0008O5-R5; Mon, 24 Aug 2020 10:32:46 +0000
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA9mM-0008MW-7j; Mon, 24 Aug 2020 10:32:45 +0000
Received: by mail-wr1-f67.google.com with SMTP id a5so8143617wrm.6;
 Mon, 24 Aug 2020 03:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=3kC1j2VGz3irmMnTu7OSvcIF5sgB8GN7svCyG6bNmQc=;
 b=Ctraby2AJhbipm2rdA4pqWpdeXchQYzNflBQn9Oq2M7N76rMCzCmdrYXnum/4oaOTF
 zDcoh8JnipR2j8RluaeNXIhKr2+DJSX6O/0wovZIPcaqdu056WF42OxdXsxyZtk1eYLD
 50PVTLUG9Mo3OazRJJtNSgDi9vJ9/kovX4gwpKGMRg7r9vrOib2PPnF7SCk9GsloSiiP
 9CYj7q7iUrhlfbQ+KVhH7wRd8x2ZAeWrnOJ1Km91UTplMLJAhtaJEatLqL+DmkfsWZIz
 BLKeOsn7v9UXyAOnRecJKYUzi7LP8od3z33JOQh+Rs3UFatV/GRpkMhY5Qqd7FJ725Qa
 NS/g==
X-Gm-Message-State: AOAM531oZqWSZ4Ook7rxDW0K0l1lRHk5p6L8S4r1RdPkEPXtjFgcjtck
 Hq3BOSx8Vw/4g0QvhQWZpo8=
X-Google-Smtp-Source: ABdhPJweVUT7a41DfLWZjKJnJ7ppNGMhfph8/pfsheA41o3Lgtr9MDX7LDVdL1I0kuB6ivdiZ0Q/PQ==
X-Received: by 2002:adf:e68f:: with SMTP id r15mr5135544wrm.196.1598265161023; 
 Mon, 24 Aug 2020 03:32:41 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id b1sm614772wmj.8.2020.08.24.03.32.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Aug 2020 03:32:40 -0700 (PDT)
Date: Mon, 24 Aug 2020 12:32:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bough Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH 21/22] arm64: dts: imx8qxp: Remove i.MX7 compatible from
 USDHC
Message-ID: <20200824103237.GA26120@kozik-lap>
References: <20200823161550.3981-1-krzk@kernel.org>
 <20200823161550.3981-21-krzk@kernel.org>
 <AM6PR04MB49668B0F67B02B2A33603B4880560@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <20200824091102.GA20819@kozik-lap>
 <CAA+hA=S=2SoF8egOq8h-eB9wZGDqrAw66VtW-bU9oBmzFSj9Bw@mail.gmail.com>
 <VI1PR04MB52949085DFA5D29C2858094290560@VI1PR04MB5294.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1PR04MB52949085DFA5D29C2858094290560@VI1PR04MB5294.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_063242_357118_15BEBDA7 
X-CRM114-Status: GOOD (  21.82  )
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
Cc: "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 Anson Huang <anson.huang@nxp.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dl-linux-imx <linux-imx@nxp.com>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Dong Aisheng <dongas86@gmail.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Aisheng Dong <aisheng.dong@nxp.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBBdWcgMjQsIDIwMjAgYXQgMTA6MzE6MzFBTSArMDAwMCwgQm91Z2ggQ2hlbiB3cm90
ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBEb25nIEFpc2hlbmcg
W21haWx0bzpkb25nYXM4NkBnbWFpbC5jb21dCj4gPiBTZW50OiAyMDIw5bm0OOaciDI05pelIDE3
OjQ1Cj4gPiBUbzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgo+ID4gQ2M6
IEFpc2hlbmcgRG9uZyA8YWlzaGVuZy5kb25nQG54cC5jb20+OyBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZzsKPiA+IGxpbnV4LXNlcmlhbEB2Z2VyLmtlcm5lbC5vcmc7IEFuc29uIEh1YW5nIDxh
bnNvbi5odWFuZ0BueHAuY29tPjsKPiA+IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBGYWJp
byBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+OyBMaW51cwo+ID4gV2FsbGVpaiA8bGludXMu
d2FsbGVpakBsaW5hcm8ub3JnPjsgbGludXgtcG1Admdlci5rZXJuZWwub3JnOwo+ID4gbGludXgt
bW1jQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsKPiA+IGxp
bnV4LXB3bUB2Z2VyLmtlcm5lbC5vcmc7IEJhcnRvc3ogR29sYXN6ZXdza2kKPiA+IDxiZ29sYXN6
ZXdza2lAYmF5bGlicmUuY29tPjsgUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47Cj4g
PiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsgZGwtbGludXgtaW14IDxsaW51eC1pbXhA
bnhwLmNvbT47IFBlbmd1dHJvbml4Cj4gPiBLZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4
LmRlPjsgVGhpZXJyeSBSZWRpbmcKPiA+IDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+OyBTaGF3
biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+OyBTYXNjaGEKPiA+IEhhdWVyIDxzLmhhdWVyQHBl
bmd1dHJvbml4LmRlPjsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOwo+ID4g
bGludXgtd2F0Y2hkb2dAdmdlci5rZXJuZWwub3JnOyBCb3VnaCBDaGVuIDxoYWliby5jaGVuQG54
cC5jb20+Cj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDIxLzIyXSBhcm02NDogZHRzOiBpbXg4cXhw
OiBSZW1vdmUgaS5NWDcgY29tcGF0aWJsZQo+ID4gZnJvbSBVU0RIQwo+ID4gCj4gPiBPbiBNb24s
IEF1ZyAyNCwgMjAyMCBhdCA1OjE1IFBNIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVs
Lm9yZz4KPiA+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBNb24sIEF1ZyAyNCwgMjAyMCBhdCAwOTow
MDoxOUFNICswMDAwLCBBaXNoZW5nIERvbmcgd3JvdGU6Cj4gPiA+ID4gPiBGcm9tOiBLcnp5c3p0
b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4gPiA+ID4gPiBTZW50OiBNb25kYXksIEF1
Z3VzdCAyNCwgMjAyMCAxMjoxNiBBTQo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSBVU0RIQyBvbiBp
Lk1YIDhRWFAgaGFzIGl0cyBvd24gY29tcGF0aWJsZSBkZXNjcmliZWQgaW4KPiA+ID4gPiA+IGJp
bmRpbmdzIGFuZCB1c2VkIGluIHRoZSBkcml2ZXIgKHdpdGggaXRzIG93biBxdWlya3MpLiAgUmVt
b3ZlCj4gPiA+ID4gPiBhZGRpdGlvbmFsIGZzbCxpbXg3ZC11c2RoYyBjb21wYXRpYmxlIHRvIGZp
eCBkdGJzX2NoZWNrIHdhcm5pbmdzIGxpa2U6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gICBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLWFpX21sLmR0LnlhbWw6Cj4gPiBtbWNANWIw
MTAwMDA6Cj4gPiA+ID4gPiAgICAgY29tcGF0aWJsZTogWydmc2wsaW14OHF4cC11c2RoYycsICdm
c2wsaW14N2QtdXNkaGMnXSBpcyB0b28gbG9uZwo+ID4gPiA+ID4gICAgIEZyb20gc2NoZW1hOgo+
ID4gPiA+ID4gL29jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9mc2wtaW14LWVz
ZGhjLnlhbWwKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2lteDhxeHAtYWlfbWwuZHQueWFtbDoKPiA+IG1tY0A1YjAxMDAwMDoKPiA+ID4gPiA+ICAg
ICBjb21wYXRpYmxlOiBBZGRpdGlvbmFsIGl0ZW1zIGFyZSBub3QgYWxsb3dlZAo+ID4gPiA+ID4g
KCdmc2wsaW14N2QtdXNkaGMnIHdhcwo+ID4gPiA+ID4gdW5leHBlY3RlZCkKPiA+ID4gPiA+Cj4g
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5v
cmc+Cj4gPiA+ID4KPiA+ID4gPiBGb3IgUGF0Y2ggMTktMjIsIEkgdGhpbmsgd2Ugc2hvdWxkIGZp
eCBkdCBiaW5kaW5nIGRvYy4KPiA+ID4KPiA+ID4gQXJlIHlvdSBzdXJlIHRoYXQgdGhlc2UgVVNE
SEMgY29udHJvbGxlcnMgYXJlIGNvbXBhdGlibGUgd2l0aCBpLk1YIDdEPwo+ID4gPiBDb3VsZCB0
aGV5IHJlYWxseSBydW4gd2l0aCBmc2wsaW14N2QtdXNkaGMgY29tcGF0aWJsZT8KPiA+IAo+ID4g
QUZBSUsgdVNESEMgb24gUVhQIGlzIGRlcml2ZWQgZnJvbSB0aGUgZm9ybWVyIHBsYXRmb3JtcyB3
aXRoIGFkZGluZyBhIGZldwo+ID4gbW9yZSBuZXcgZmVhdHVyZXMuIGUuZy4gSFM0MDBFUy9DTURR
Lgo+ID4gTGV0IG1lIGxvb3AgaW4gdVNESEMgZHJpdmVyIG93bmVyIEhhaWJvIENoZW4gdG8gZG91
YmxlIGNvbmZpcm0uCj4gCj4gWWVzLCB1c2RoYyBvZiBpbXg4cXhwIGNhbiB3b3JrIGJ5IHVzaW5n
IHRoZSBjb21wYXRpYmxlICJmc2wsIGlteDdkLXVzZGhjIiwgYnV0IHdpbGwgbm90IHN1cHBvcnQg
SFM0MDBFUy9Db21tYW5kIFF1ZXVlIGFueSBtb3JlLiBBbHNvIGlteDhxeHAgc3VwcG9ydCBBdXRv
IENNRDIzLCBidXQgaW14N2Qgbm90Lgo+IEFuZCBpbXg4cXhwIG5lZWQgdG8gcmUtY29uZmlnIHRo
ZSBjbG9jayByYXRlIGFmdGVyIHN5c3RlbSBQTSwgaW14N2QgZG8gbm90IG5lZWQgdG8gZG8gdGhp
cy4KClRoZW4gd2UgY2FuIGxlYXZlIHRoZSBjb21wYXRpYmxlIGluIERUUyBhbmQgSSB3aWxsIGNv
cnJlY3QgdGhlIGRldmljZQp0cmVlIHNjaGVtYS4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
