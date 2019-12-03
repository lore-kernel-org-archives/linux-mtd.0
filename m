Return-Path: <SRS0=TEJX=ZZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C01AAC432C0
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 10:54:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EF3920656
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 10:54:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DYXwGeST";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t31lF0y0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EF3920656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YqmtiabGTk5f3EHrn7/D6jqu6SjSe5EuSfPcuCBhNe4=; b=DYXwGeSTAwc/F7
	8W7T7Xg8e27RAy2OCppeVCeNLnEG+K5tWGEXPgdNQxXSYaVVx5pEFZEFMGp5HzNLgCORhnfBaonTt
	XRn5nDqpLHah1BjjljRvWClmNByf+LXVYi+4DCCqLsDphhW2GXzbxhY3BexEqDAHOahMvTIMNEUV9
	mOsw/q86jwJQ2qWSsjxkzFA4J4+xn3l4MfW3/+4cMXAMAIJ8Sqqaw2YEosV2IlX42yoDLl38Yu8rF
	5FhoA2OlQNVQY2eIiuW7LOiVNErlafcCK3cFPHhn/Lb11WZHgqJ5gebPzE4Nts683nsFByFp5oVxO
	xjuC9DYCbYmt7/qf7s0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic5oV-0005tn-1Y; Tue, 03 Dec 2019 10:53:51 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic5oR-0005t0-Vx
 for linux-mtd@lists.infradead.org; Tue, 03 Dec 2019 10:53:49 +0000
Received: by mail-oi1-x243.google.com with SMTP id b8so2856179oiy.5
 for <linux-mtd@lists.infradead.org>; Tue, 03 Dec 2019 02:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Hh33m20eFdMMbq7j0e07H2jRKSTT4mxBLnwnFIeSa8c=;
 b=t31lF0y0WLFdwupPTjUdLJ33Wkx25/tF8Z0n6Hs6PM5Clydb8Qw/+82RZoHIfgjuEZ
 5Y0imTG2QyPc6C/pflui+ovcCd8mxAHpBCkO6LlQL2Ei6QhhWr9UUR1ptUjg2GKD7nrA
 Z2lFLiN2KTMJZDFDMAoP1SiO6Ie5euPSDs7/XRiSaZ8iEpSt9WTKnwDRyfRnt+B9EYaf
 9qeW8z/0rr7Ps3IuBvavpEdE7BkU8fGBSPIWRbJmrF5OLQyZReSeMMndfc/Ksx2ZVsi4
 z4VjOFPu+X0ZaHITd26Aq3J+AptA9ekOYNofnbh7vvp/Rc5eqGK1gC3HPxZGEZIxmH44
 TskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hh33m20eFdMMbq7j0e07H2jRKSTT4mxBLnwnFIeSa8c=;
 b=Er8P0F1ikI6QX9yEV+LfX2z8Kh7P4r2LJ+f95668FWQjUPISA5CsrTsTmffCDKjDl6
 0u3qPDUN9ByBKxV5NjptEgsRtSjrIutrCaPCE7It5e9bGKS+iEl2EEcI2sSEcicD7EaF
 rAFW3aYwjJPjgOBiUi3KWEeIE7qmIqdcwGEbBus7Z1v6hLXvsyZx05Latg3RL07jtWtO
 qAzHPzYxzhIcZWgzGA8XOzTkoPJBqGXpStbtFV5RGUvrrwdnXUIUwHiBtiplhjPW6Ea3
 +U9GIph9N5fwePCLD7ty5zICMYSXNtTWYqDRNn2tFSO/5ekFtcxAqnvtE3jtHqSCUIXi
 kqdA==
X-Gm-Message-State: APjAAAWNtuvPTlAbNAcMP1f/QMOEgGIk/EMkzASBAsMvnH9pRaeRa28U
 BBYfYZx07TQuqUmR5meX64MdL4UoWLyPhBN+Cdhtg5oS
X-Google-Smtp-Source: APXvYqytXVz+zSgAtVajnF9NHWzmpVpNZikwlrDKDDbBg6hGX3hIe91ZgxM7mbIAdbl3C8pnbvkQveUdPGuIDEcqSUU=
X-Received: by 2002:a54:4601:: with SMTP id p1mr2867534oip.50.1575370426070;
 Tue, 03 Dec 2019 02:53:46 -0800 (PST)
MIME-Version: 1.0
References: <MN2PR02MB5727000CBE70BAF31F60FEE4AF420@MN2PR02MB5727.namprd02.prod.outlook.com>
 <20191203084134.tgzir4mtekpm5xbs@pengutronix.de>
 <MN2PR02MB57272E3343CA62ADBA0F97E5AF420@MN2PR02MB5727.namprd02.prod.outlook.com>
 <614898763.105471.1575364223372.JavaMail.zimbra@nod.at>
 <CALgLF9KPAk_AsecnTMmbdF5qbgqXe7HNOrNariNVbhSr6FVN2g@mail.gmail.com>
 <20191203104558.vpqav3oxsydoe4aw@pengutronix.de>
In-Reply-To: <20191203104558.vpqav3oxsydoe4aw@pengutronix.de>
From: naga suresh kumar <nagasureshkumarrelli@gmail.com>
Date: Tue, 3 Dec 2019 16:23:34 +0530
Message-ID: <CALgLF9+H-8BdZ0BkmpcEL8B1G1cpPsC+=5oqz6ErnTOhnG7yZQ@mail.gmail.com>
Subject: Re: ubifs mount failure
To: Sascha Hauer <s.hauer@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_025348_029457_BEB87410 
X-CRM114-Status: GOOD (  18.76  )
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
Cc: Richard Weinberger <richard@nod.at>,
 linux-kernel <linux-kernel@vger.kernel.org>, Michal Simek <michals@xilinx.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>, siva.durga.paladugu@xilinx.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2FzY2hhLAoKVGVzdGVkIHRoaXMgcGF0Y2guIGFuZCBpdCB3b3JrZWQuClRoYW5rcyBmb3Ig
eW91ciBxdWljayByZXNwb25zZS4KCk9uIFR1ZSwgRGVjIDMsIDIwMTkgYXQgNDoxNiBQTSBTYXNj
aGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gT24gVHVlLCBEZWMg
MDMsIDIwMTkgYXQgMDQ6MDY6MTJQTSArMDUzMCwgbmFnYSBzdXJlc2gga3VtYXIgd3JvdGU6Cj4g
PiBIaSBSaWNoYXJkLAo+ID4KPiA+IE9uIFR1ZSwgRGVjIDMsIDIwMTkgYXQgMjo0MCBQTSBSaWNo
YXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PiB3cm90ZToKPiA+ID4KPiA+ID4gLS0tLS0g
VXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+ID4gPiA+IFZvbjogIk5hZ2EgU3VyZXNoa3VtYXIg
UmVsbGkiIDxuYWdhc3VyZUB4aWxpbnguY29tPgo+ID4gPiA+IGh0dHBzOi8vZWxpeGlyLmJvb3Rs
aW4uY29tL2xpbnV4L3Y1LjQvc291cmNlL2ZzL3ViaWZzL3NiLmMjTDE2NAo+ID4gPiA+IHdlIGFy
ZSB0cnlpbmcgdG8gYWxsb2NhdGUgNDMyNTM3NiAofjRNQikKPiA+ID4KPiA+ID4gNE1pQj8gSXMg
LT5taW5faW9fc2l6ZSB0aGF0IGxhcmdlPwo+ID4gaWYgeW91IHNlZSBodHRwczovL2VsaXhpci5i
b290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2ZzL3ViaWZzL3NiLmMjTDE2NAo+ID4gVGhl
IHNpemUgaXMgYWN0dWFsbHkgQUxJR04odG1wLCBjLT5taW5faW9fc2l6ZSkuCj4gPiBIZXJlIHRt
cCBpcyBvZiA0MzI1Mzc2IEJ5dGVzIGFuZCBtaW5faW9fc2l6ZSBpcyAxNjM4NCBCeXRlcwo+Cj4g
J3RtcCcgY29udGFpbnMgYm9ndXMgdmFsdWVzLiBUcnkgdGhpczoKPgo+IC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS04PC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4KPiBGcm9t
IDM0ZjY4N2ZjZTE4OTA4NWY1NTcwNmI0Y2RkY2IyODhhMDhmNGVlMDYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCj4gRnJvbTogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgo+
IERhdGU6IFR1ZSwgMyBEZWMgMjAxOSAxMTo0MToyMCArMDEwMAo+IFN1YmplY3Q6IFtQQVRDSF0g
dWJpZnM6IEZpeCB3cm9uZyBtZW1vcnkgYWxsb2NhdGlvbgo+Cj4gSW4gY3JlYXRlX2RlZmF1bHRf
ZmlsZXN5c3RlbSgpIHdoZW4gd2UgYWxsb2NhdGUgdGhlIGlkeCBub2RlIHdlIG11c3QgdXNlCj4g
dGhlIGlkeF9ub2RlX3NpemUgd2UgY2FsY3VsYXRlZCBqdXN0IG9uZSBsaW5lIGJlZm9yZSwgbm90
IHRtcCwgd2hpY2gKPiBjb250YWlucyBjb21wbGV0ZWx5IG90aGVyIGRhdGEuCj4KPiBGaXhlczog
YzRkZTZkN2U0MzE5ICgidWJpZnM6IFJlZmFjdG9yIGNyZWF0ZV9kZWZhdWx0X2ZpbGVzeXN0ZW0o
KSIpCj4gUmVwb3J0ZWQtYnk6IE5hZ2EgU3VyZXNoa3VtYXIgUmVsbGkgPG5hZ2FzdXJlQHhpbGlu
eC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4
LmRlPgo+IC0tLQo+ICBmcy91Ymlmcy9zYi5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9zYi5j
IGIvZnMvdWJpZnMvc2IuYwo+IGluZGV4IGE1NTFlYjNlOWI4OS4uNjY4MWMxOGU1MmI4IDEwMDY0
NAo+IC0tLSBhL2ZzL3ViaWZzL3NiLmMKPiArKysgYi9mcy91Ymlmcy9zYi5jCj4gQEAgLTE2MSw3
ICsxNjEsNyBAQCBzdGF0aWMgaW50IGNyZWF0ZV9kZWZhdWx0X2ZpbGVzeXN0ZW0oc3RydWN0IHVi
aWZzX2luZm8gKmMpCj4gICAgICAgICBzdXAgPSBremFsbG9jKEFMSUdOKFVCSUZTX1NCX05PREVf
U1osIGMtPm1pbl9pb19zaXplKSwgR0ZQX0tFUk5FTCk7Cj4gICAgICAgICBtc3QgPSBremFsbG9j
KGMtPm1zdF9ub2RlX2Fsc3osIEdGUF9LRVJORUwpOwo+ICAgICAgICAgaWR4X25vZGVfc2l6ZSA9
IHViaWZzX2lkeF9ub2RlX3N6KGMsIDEpOwo+IC0gICAgICAgaWR4ID0ga3phbGxvYyhBTElHTih0
bXAsIGMtPm1pbl9pb19zaXplKSwgR0ZQX0tFUk5FTCk7Cj4gKyAgICAgICBpZHggPSBremFsbG9j
KEFMSUdOKGlkeF9ub2RlX3NpemUsIGMtPm1pbl9pb19zaXplKSwgR0ZQX0tFUk5FTCk7Cj4gICAg
ICAgICBpbm8gPSBremFsbG9jKEFMSUdOKFVCSUZTX0lOT19OT0RFX1NaLCBjLT5taW5faW9fc2l6
ZSksIEdGUF9LRVJORUwpOwo+ICAgICAgICAgY3MgPSBremFsbG9jKEFMSUdOKFVCSUZTX0NTX05P
REVfU1osIGMtPm1pbl9pb19zaXplKSwgR0ZQX0tFUk5FTCk7Cj4KPiAtLQo+IDIuMjQuMAo+Cj4K
PiAtLQo+IFBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8Cj4gU3RldWVyd2FsZGVyIFN0ci4gMjEgICAgICAgICAg
ICAgICAgICAgICAgIHwgaHR0cDovL3d3dy5wZW5ndXRyb25peC5kZS8gIHwKPiAzMTEzNyBIaWxk
ZXNoZWltLCBHZXJtYW55ICAgICAgICAgICAgICAgICAgfCBQaG9uZTogKzQ5LTUxMjEtMjA2OTE3
LTAgICAgfAo+IEFtdHNnZXJpY2h0IEhpbGRlc2hlaW0sIEhSQSAyNjg2ICAgICAgICAgICB8IEZh
eDogICArNDktNTEyMS0yMDY5MTctNTU1NSB8CgpUaGFua3MsCk5hZ2EgU3VyZXNoa3VtYXIgUmVs
bGkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
