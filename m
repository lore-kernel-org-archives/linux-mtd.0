Return-Path: <SRS0=wdd2=GW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED538C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jan 2021 15:51:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4E3D22211
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jan 2021 15:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4E3D22211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OQXSiuoOWb6RJuChwVKCGJcEqZaD+5iOlhqhaI8/v0A=; b=KHlp+pPsVBmmzHU2xWNBgwMk9
	dD5MsZ7OB6uR1GH/cvs+ZTV/wVK9lnJrw1Xf11UfAdCUnOIZTM8b+GKwmhDBuFgZhEM36G+gXi5tJ
	IqhuB8NZdcFRfyl9UnuYhQN0E3ECN3+/eFdTPi3k6kFZjrsc/KB4mW99fttGl/rt4Klf3dWQocBxM
	FDOJCeAuKI+gDiB2dslFvsU60023mTqMcEBYYoV0oXRO66GU6lPvUW+ERh2k/h6keMJIzP9JX4+sF
	FCeRNHpXpYDj23kFLr71fp/Klm+d8I5L3FM4Ow2gj9OwuwhhZnAqsWj9R/cl5BxBsIiHMbEuzT1Bm
	ZRBY4HMBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1tGS-00053o-Km; Tue, 19 Jan 2021 15:49:52 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1tGP-00052u-SZ
 for linux-mtd@lists.infradead.org; Tue, 19 Jan 2021 15:49:50 +0000
Received: by mail-io1-xd35.google.com with SMTP id u17so40518147iow.1
 for <linux-mtd@lists.infradead.org>; Tue, 19 Jan 2021 07:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hIpriwXl3zmZUpuunNoIwO+z6DAxghi4lzMyGFl/QxM=;
 b=XVBXqr9J+XCU/wutNkoQGL/bywKx8LkKiPPRvEFLKDP4k6B0LHtQosMk3rqTDDzdfk
 WgAa+m9ONAzgcCLbm9NHc5cExA0TdkS525vp60hPJM4/al1Yg4kW7W6+rgB3k1O+hx55
 r+5w0VlexWdWmJgz7BYaFEVbX8vtL19vwlnvh7s0UbH2U4OccGMQNMCIwB2LpIYcl2Kw
 JTlfDmIcQgSQpbrYrtTDI6HQsg8RADhuKqwyVu1dkTUsEzzjefwaaNKHnEmRGuyjCK3z
 mBjYBOQQbrOyNadsHmj8oH3t8whP/0cngNQGuh81B6EU+osmTOK9v7tfsvswvWuH1KSm
 Uktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hIpriwXl3zmZUpuunNoIwO+z6DAxghi4lzMyGFl/QxM=;
 b=BLu01Gf9ZyvRUP06+CkbuHls6QmJGf5ojDST2j4QrQlL9KaJJfVdWiGmK4/3rlMPjZ
 LZXPrSs4aHZKsZRYPdqxvPbl/lKXMhmRRaKYgmLI4NsuSk8ZwEbXNGjBhLZQLR7RQ5dk
 uzdmbA3SyhUfSc6wJZZgXJpot0JzF4G2l5yhC8nhN96o/1pTJ7KnUai5ROAMRUsTlb2Y
 YPPpbHyYPrhC2U/eA2eGtBuIFtjrwXit3fAtxRvGf+qorNHXN/zddDPRjJZPgCDrol6X
 51nKHBFe2ZT6maYp+KD9TDVNsQ4yvFQAbs9lVsKClDRr2gdlzBSHdgYTHarWs/rJlWXP
 iDig==
X-Gm-Message-State: AOAM532bv9hrFkqTSNyP2i/zheDipj4JZqTUEOp+KeqVqfwhK8z0hurK
 v2/8fJME5jVZMstGIg4aECeLN4+JOuJEq+cAi70=
X-Google-Smtp-Source: ABdhPJwyQFNDbccIRNY3NNjfTozn5ITh0IyaJi53MNoVuDBrWPmeWhn/NxRRY0tQeje+KE33aD14Y0/FTw/8l60Tuvk=
X-Received: by 2002:a92:c26f:: with SMTP id h15mr3933796ild.65.1611071387640; 
 Tue, 19 Jan 2021 07:49:47 -0800 (PST)
MIME-Version: 1.0
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
 <20200929230124.31491-5-miquel.raynal@bootlin.com>
 <CAHCN7xLHAd8B_OgR2_vPFZZJ95mwNGR29dmqFeKhhSU9_y_imA@mail.gmail.com>
 <20210111112027.7cbda0ba@xps13> <20210112153534.5ba93cde@xps13>
 <CAHCN7xJCn8TD+T8pi5P=QMU=uZJ_LN1_wOEQON-noagf2H9+nw@mail.gmail.com>
 <CAHCN7xL-uzvKqBiYq6R3=-8wNT-V9DZX5ca2ZQ9Y_Wahh0_rAA@mail.gmail.com>
 <20210114164224.5d21c170@xps13>
 <CAHCN7xKYSPzW-Qbeqzqvey+=V9KiYcsy8uxJeW=2WRXUwAq0JA@mail.gmail.com>
 <CAHCN7x+pHusxQj+r0SN4KPD=ZgGg5fdLHZxasu54pPf0k4dVjA@mail.gmail.com>
 <20210115171736.1c837c29@xps13>
 <CAHCN7xKWBcuF0h5+brHndZCD5dFbbcxxZZxEPXRPVK7kZGbM1Q@mail.gmail.com>
 <20210119125634.6d4c5c1e@xps13>
 <CAHCN7xJUCsOvmtkYgWU7+_H4jMDJe7fNnpJuuRov+Qu7qh+xGg@mail.gmail.com>
 <20210119153521.7d5de79d@xps13>
In-Reply-To: <20210119153521.7d5de79d@xps13>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 19 Jan 2021 09:49:36 -0600
Message-ID: <CAHCN7xKtSwEDEXwU=df0FYzL0ivrWser0-kioW2BSrfU+XQFWQ@mail.gmail.com>
Subject: Re: [PATCH 04/20] mtd: nand: ecc-bch: Stop exporting the private
 structure
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_104949_927163_64E9EF03 
X-CRM114-Status: GOOD (  18.22  )
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

T24gVHVlLCBKYW4gMTksIDIwMjEgYXQgODozNiBBTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIEFkYW0sCj4KPiA+ID4gLS0tODwtLS0KPiA+
ID4KPiA+ID4gQXV0aG9yOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
Pgo+ID4gPiBEYXRlOiAgIFR1ZSBKYW4gMTkgMTI6Mjc6MDcgMjAyMSArMDEwMAo+ID4gPgo+ID4g
PiAgICAgd2lwOiBmaXggb21hcAo+ID4gPgo+ID4gPiAgICAgU2lnbmVkLW9mZi1ieTogTWlxdWVs
IFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+ID4KPiA+IFRoYW5rcyBmb3Ig
Zml4aW5nIHRoaXMuCj4gPgo+ID4gSSB0ZXN0ZWQgeW91ciBwYXRjaCwgYW5kIEkgbm8gbG9uZ2Vy
IGdldCBhIFBhbmljIGFuZCB0aGUgTVREIGRldmljZQo+ID4gYXBwZWFycyB0byBhcHBlYXIgY29y
cmVjdGx5Ogo+ID4KPiA+IG10ZG9vcHM6IG10ZCBkZXZpY2UgKG10ZGRldj1uYW1lL251bWJlcikg
bXVzdCBiZSBzdXBwbGllZAo+ID4gb21hcDItbmFuZCAzMDAwMDAwMC5uYW5kOiBHUElPIGxvb2t1
cCBmb3IgY29uc3VtZXIgcmIKPiA+IG9tYXAyLW5hbmQgMzAwMDAwMDAubmFuZDogdXNpbmcgZGV2
aWNlIHRyZWUgZm9yIEdQSU8gbG9va3VwCj4gPiBvZl9nZXRfbmFtZWRfZ3Bpb2RfZmxhZ3M6IHBh
cnNlZCAncmItZ3Bpb3MnIHByb3BlcnR5IG9mIG5vZGUKPiA+ICcvb2NwQDY4MDAwMDAwL2dwbWNA
NmUwMDAwMDAvbmFuZEAwLDBbMF0nIC0gc3RhdHVzICgwKQo+ID4gZ3BpbyBncGlvY2hpcDY6IFBl
cnNpc3RlbmNlIG5vdCBzdXBwb3J0ZWQgZm9yIEdQSU8gMAo+ID4gbmFuZDogZGV2aWNlIGZvdW5k
LCBNYW51ZmFjdHVyZXIgSUQ6IDB4MmMsIENoaXAgSUQ6IDB4YmMKPiA+IG5hbmQ6IE1pY3JvbiBN
VDI5RjRHMTZBQkJEQTNXCj4gPiBuYW5kOiA1MTIgTWlCLCBTTEMsIGVyYXNlIHNpemU6IDEyOCBL
aUIsIHBhZ2Ugc2l6ZTogMjA0OCwgT09CIHNpemU6IDY0Cj4gPiBuYW5kOiB1c2luZyBPTUFQX0VD
Q19CQ0g4X0NPREVfSFdfREVURUNUSU9OX1NXCj4gPiA2IGNtZGxpbmVwYXJ0IHBhcnRpdGlvbnMg
Zm91bmQgb24gTVREIGRldmljZSBvbWFwMi1uYW5kLjAKPiA+IENyZWF0aW5nIDYgTVREIHBhcnRp
dGlvbnMgb24gIm9tYXAyLW5hbmQuMCI6Cj4gPiAuLi4KPgo+IEdvb2QgdG8ga25vdy4gQ2FuIHlv
dSBqdXN0IHRlbGwgbWUgaWYgdGhlIHZhbHVlcyBvZgo+IC0gY2hpcC0+ZWNjLmJ5dGVzIHZzLiBl
bmdpbmVfY29uZi0+Y29kZV9zaXplCj4gLSBjaGlwLT5lY2Muc3RlcHMgdnMuIGVuZ2luZV9jb25m
LT5uc3RlcHMKPiBhcmUgdGhlIHNhbWUgaW4gYm90aCBjYXNlcyAoeW91ciBwYXRjaCBhbmQgbWlu
ZSk/IE90aGVyd2lzZSB5b3VyIGRhdGEKPiBtaWdodCBhcHBlYXIgY29ycnVwdGVkIHNvbWVob3cu
CgpJIGRpZG4ndCBmdWxseSB2ZXQgbXkgaGFjaywgYmV5b25kIGVsaW1pbmF0aW5nIHRoZSBLZXJu
ZWwgcGFuaWMsIHNvIEkKZmVsdCBtb3JlIGNvbWZvcnRhYmxlIGNvbXBhcmluZyB0aGUgdmFsdWVz
IHRvIGEgc3RhYmxlIHJlbGVhc2UuCkkgY29tcGFyZWQgdGhlIHZhbHVlcyBpbiA1LjEwIHRvIDUu
MTEtcmM0ICsgeW91ciBwYXRjaCwgYW5kIHRoZSBudW1iZXIKb2Ygc3RlcHMgYW5kIG9vYnJlZ2lv
bi0+bGVuZ3RoIGFyZSBpZGVudGljYWwgYmV0d2VlbiB0aGVtLgoKNS4xMC41OgogIGNoaXAtPmVj
Yy5zdGVwcyA9IDQKICBvb2JyZWdpb24tPmxlbmd0aCA9IGQKCjUuMTEtcmM0ICsgcGF0Y2g6CiAg
ZW5naW5lX2NvbmYtPm5zdGVwcyA9IDQKICBvb2JyZWdpb24tPmxlbmd0aCA9IGQKCmFkYW0KPgo+
ID4KPiA+IFdoZW4geW91IHN1Ym1pdCBhIGZvcm1hbCBwYXRjaCwgQ0MgbWUgb24gdGhlIHBhdGNo
LCBhbmQgSSdsbCByZXNwb25kCj4gPiB3aXRoIGEgJ3Rlc3RlZC1ieScKPgo+IE9mIGNvdXJzZSwg
SSdsbCBhbHNvIGFkZCBhIFJlcG9ydGVkLWJ5Lgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
