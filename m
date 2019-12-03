Return-Path: <SRS0=TEJX=ZZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5BEC432C0
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 19:09:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F80A206DF
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 19:09:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jsrOzoqh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RA++pnfQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F80A206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0elooJU3Fre+Lj+EhmcCvJLp5rhraexDSi60gZGRMhI=; b=jsrOzoqh5NV8B2
	pvIXUIro/ANlmHYmsfk/oIGFJ6ugHnIXbSBq/bGgINunhW266FJ5CyAHZvfPVRrwJjKEMIbheF0W4
	tF14HaDs46fMA3D1Vv7zsJHCwXhB2+8op4BkXOjKlGfja6CFf5RT3dZIUefx55tQ0ATouPgVpx0df
	NeQTIyfVXi87a32qYAuLnjaBoRv08nQOxQsoaPBj4CNXJ4xHEKgo5cEUkMbkqC///8eaacDadqp19
	NgSDCOd4d9ZQedpIE7ktdRLvBhenVxHmjpMHqfgjsPfqW4xG3b0rZV2IDTeCcsG1Wy3X52fD+YXEI
	yGBW6m8WS/rQRShKtQ/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icDXj-0001V1-9V; Tue, 03 Dec 2019 19:09:03 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icDXh-0001Ui-0d
 for linux-mtd@lists.infradead.org; Tue, 03 Dec 2019 19:09:02 +0000
Received: by mail-wr1-x443.google.com with SMTP id w15so5149194wru.4
 for <linux-mtd@lists.infradead.org>; Tue, 03 Dec 2019 11:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RgM6aRu1VoXAsJhtsKrEwRnmsLudyDcKIfYzB5q/ENA=;
 b=RA++pnfQwShG7t7eeG40JlPYoxkhxadW+dqsRuZCr/BhsDQCK9o5hB2E2bpg7qTKJ/
 9oekQYEXIUArmnqXmnVfJCY1Rr0MsY5B6JuafbGy+3RLUBtJPB73BaIqi8js28QsqL7i
 myoThZneq3PVu4p8XIUv14JEac3KKFYj0yPxTZcCE47r+uTlItCTKf/Z56R7zaIFIHAr
 XOM0QSpGFXG9CIo5HaS4BsaqPWtRALjNFrbubckDom/x57LESokOTQdg0RIUQ3EpJJ4Q
 xLiSA/iHgJXh34dm5KfLml+XMkyhQpl/X8WozhlLKc1amJKekI/i53DgwFUa4UXfO8J+
 uqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RgM6aRu1VoXAsJhtsKrEwRnmsLudyDcKIfYzB5q/ENA=;
 b=tkY0sKfDnuui950fIEkMASJ5XZOjqzqATLSyOiIhsqM28SIJjtw7hcFv9OE9u8UQfx
 tM04v2oSOvkE2yiJ0Y11MK/EPh7hfm4FrdZ9U9sRytUErkm1nwB9IApbnqJerrYORzwZ
 7TJba8H8WvpUVhyR23YJexBiHpGSkRO4kVK+3V1H05HlPJJxnBYBLxyE+o3FdX0+FYxk
 pOdWAM1ociFj2CT9pdFDhnU2aatT4x+bUc3XwmlQCeOEVcCSga0o+QMlSfx561wUPx/X
 lvLNz4QfILUIUE6EH9iuPIgibO+yXVm4rBN2tzocr5lLRh3Iq0Z+/qjMRqn8a9txr3ed
 isWA==
X-Gm-Message-State: APjAAAVf9sV9pcZhfjIZF0qQvImV7+mvyGvfD5ciisXVxihWBRn2X3ox
 L57QNVK2SIdqIcwTGahzkl6XAbbNvzETMg8nUow=
X-Google-Smtp-Source: APXvYqxGAfIQu4FpQhh634WKvpxzJjRIZ8l9v/+EYTu9HrUxNxqBPtaD1Y7gBXDf+NcLNtGGrUlJj+9hB7NeQDFgQ9E=
X-Received: by 2002:a5d:480b:: with SMTP id l11mr7069833wrq.129.1575400139644; 
 Tue, 03 Dec 2019 11:08:59 -0800 (PST)
MIME-Version: 1.0
References: <MN2PR02MB5727000CBE70BAF31F60FEE4AF420@MN2PR02MB5727.namprd02.prod.outlook.com>
 <20191203084134.tgzir4mtekpm5xbs@pengutronix.de>
 <MN2PR02MB57272E3343CA62ADBA0F97E5AF420@MN2PR02MB5727.namprd02.prod.outlook.com>
 <614898763.105471.1575364223372.JavaMail.zimbra@nod.at>
 <CALgLF9KPAk_AsecnTMmbdF5qbgqXe7HNOrNariNVbhSr6FVN2g@mail.gmail.com>
 <20191203104558.vpqav3oxsydoe4aw@pengutronix.de>
In-Reply-To: <20191203104558.vpqav3oxsydoe4aw@pengutronix.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 3 Dec 2019 20:08:48 +0100
Message-ID: <CAFLxGvywFxSrDLLGnLDW6+rMLVUA9Yoi=3sn7wdxqWMydy-w0g@mail.gmail.com>
Subject: Re: ubifs mount failure
To: Sascha Hauer <s.hauer@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_110901_080942_A10E1345 
X-CRM114-Status: GOOD (  17.54  )
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
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Richard Weinberger <richard@nod.at>,
 siva durga paladugu <siva.durga.paladugu@xililnx.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Michal Simek <michals@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 naga suresh kumar <nagasureshkumarrelli@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBEZWMgMywgMjAxOSBhdCAxMTo0NiBBTSBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVu
Z3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gT24gVHVlLCBEZWMgMDMsIDIwMTkgYXQgMDQ6MDY6MTJQ
TSArMDUzMCwgbmFnYSBzdXJlc2gga3VtYXIgd3JvdGU6Cj4gPiBIaSBSaWNoYXJkLAo+ID4KPiA+
IE9uIFR1ZSwgRGVjIDMsIDIwMTkgYXQgMjo0MCBQTSBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hh
cmRAbm9kLmF0PiB3cm90ZToKPiA+ID4KPiA+ID4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAt
LS0tLQo+ID4gPiA+IFZvbjogIk5hZ2EgU3VyZXNoa3VtYXIgUmVsbGkiIDxuYWdhc3VyZUB4aWxp
bnguY29tPgo+ID4gPiA+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjQvc291
cmNlL2ZzL3ViaWZzL3NiLmMjTDE2NAo+ID4gPiA+IHdlIGFyZSB0cnlpbmcgdG8gYWxsb2NhdGUg
NDMyNTM3NiAofjRNQikKPiA+ID4KPiA+ID4gNE1pQj8gSXMgLT5taW5faW9fc2l6ZSB0aGF0IGxh
cmdlPwo+ID4gaWYgeW91IHNlZSBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRl
c3Qvc291cmNlL2ZzL3ViaWZzL3NiLmMjTDE2NAo+ID4gVGhlIHNpemUgaXMgYWN0dWFsbHkgQUxJ
R04odG1wLCBjLT5taW5faW9fc2l6ZSkuCj4gPiBIZXJlIHRtcCBpcyBvZiA0MzI1Mzc2IEJ5dGVz
IGFuZCBtaW5faW9fc2l6ZSBpcyAxNjM4NCBCeXRlcwo+Cj4gJ3RtcCcgY29udGFpbnMgYm9ndXMg
dmFsdWVzLiBUcnkgdGhpczoKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS04PC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4KPiBGcm9tIDM0ZjY4N2ZjZTE4OTA4NWY1NTcw
NmI0Y2RkY2IyODhhMDhmNGVlMDYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gRnJvbTogU2Fz
Y2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgo+IERhdGU6IFR1ZSwgMyBEZWMgMjAx
OSAxMTo0MToyMCArMDEwMAo+IFN1YmplY3Q6IFtQQVRDSF0gdWJpZnM6IEZpeCB3cm9uZyBtZW1v
cnkgYWxsb2NhdGlvbgo+Cj4gSW4gY3JlYXRlX2RlZmF1bHRfZmlsZXN5c3RlbSgpIHdoZW4gd2Ug
YWxsb2NhdGUgdGhlIGlkeCBub2RlIHdlIG11c3QgdXNlCj4gdGhlIGlkeF9ub2RlX3NpemUgd2Ug
Y2FsY3VsYXRlZCBqdXN0IG9uZSBsaW5lIGJlZm9yZSwgbm90IHRtcCwgd2hpY2gKPiBjb250YWlu
cyBjb21wbGV0ZWx5IG90aGVyIGRhdGEuCj4KPiBGaXhlczogYzRkZTZkN2U0MzE5ICgidWJpZnM6
IFJlZmFjdG9yIGNyZWF0ZV9kZWZhdWx0X2ZpbGVzeXN0ZW0oKSIpCj4gUmVwb3J0ZWQtYnk6IE5h
Z2EgU3VyZXNoa3VtYXIgUmVsbGkgPG5hZ2FzdXJlQHhpbGlueC5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+ICBmcy91Ymlm
cy9zYi5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPgo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9zYi5jIGIvZnMvdWJpZnMvc2IuYwo+IGlu
ZGV4IGE1NTFlYjNlOWI4OS4uNjY4MWMxOGU1MmI4IDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL3Ni
LmMKPiArKysgYi9mcy91Ymlmcy9zYi5jCj4gQEAgLTE2MSw3ICsxNjEsNyBAQCBzdGF0aWMgaW50
IGNyZWF0ZV9kZWZhdWx0X2ZpbGVzeXN0ZW0oc3RydWN0IHViaWZzX2luZm8gKmMpCj4gICAgICAg
ICBzdXAgPSBremFsbG9jKEFMSUdOKFVCSUZTX1NCX05PREVfU1osIGMtPm1pbl9pb19zaXplKSwg
R0ZQX0tFUk5FTCk7Cj4gICAgICAgICBtc3QgPSBremFsbG9jKGMtPm1zdF9ub2RlX2Fsc3osIEdG
UF9LRVJORUwpOwo+ICAgICAgICAgaWR4X25vZGVfc2l6ZSA9IHViaWZzX2lkeF9ub2RlX3N6KGMs
IDEpOwo+IC0gICAgICAgaWR4ID0ga3phbGxvYyhBTElHTih0bXAsIGMtPm1pbl9pb19zaXplKSwg
R0ZQX0tFUk5FTCk7Cj4gKyAgICAgICBpZHggPSBremFsbG9jKEFMSUdOKGlkeF9ub2RlX3NpemUs
IGMtPm1pbl9pb19zaXplKSwgR0ZQX0tFUk5FTCk7Cj4gICAgICAgICBpbm8gPSBremFsbG9jKEFM
SUdOKFVCSUZTX0lOT19OT0RFX1NaLCBjLT5taW5faW9fc2l6ZSksIEdGUF9LRVJORUwpOwo+ICAg
ICAgICAgY3MgPSBremFsbG9jKEFMSUdOKFVCSUZTX0NTX05PREVfU1osIGMtPm1pbl9pb19zaXpl
KSwgR0ZQX0tFUk5FTCk7CgpPaCwgbG9va3MgZ29vZCEgVGhhbmtzIGZvciBmaXhpbmcsIFNhc2No
YSEKClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
